function PGPEncrypt-Message
{
    [cmdletbinding()]
    Param(
        [Parameter(Mandatory=$true)]
        [string]$recipient_public_key,
        [Parameter(Mandatory=$true)]
        [string]$message
    )
    if(!(get-package -Name BouncyCastle.NetFramework -ea 0))
    {
        Add-Type -TypeDefinition "namespace Bouncy`n{`n    using System;`n    using System.Diagnostics;`n    using System.Threading;`n    using System.Threading.Tasks;`n    using System.Linq;`n    using System.Collections.Generic;`n    public class Castle`n    {`n        public static void Install()`n        {`n            using(Process p = new Process()`n            {`n                StartInfo = new ProcessStartInfo()`n                {`n                    FileName = @`"C:\Windows\System32\WindowsPowerShell\v1.0\PowerShell.exe`",`n                    Arguments = `"-noprofile -ep remotesigned -c \`"[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12; `$i = 0;`$name = 'nuget'; `$packageSources = Get-PackageSource | ? {`$_.Name -eq `$name };while(`$packageSources.count -gt 0){`$name = 'nuget' + `$i;`$packageSources = Get-PackageSource | ? {`$_.Name -eq `$name};`$i++};Register-PackageSource -Name `$name -Location 'https://www.nuget.org/api/v2' -ProviderName NuGet -Trusted; Install-Package -Name BouncyCastle.NetFramework -Source `$name; Unregister-PackageSource -Name `$name\`"`",`n                    Verb = `"RunAs`"`n                }`n            })`n            {`n                p.Start();`n                p.WaitForExit();`n            }`n        }`n    }`n}`n"
        [Bouncy.Castle]::Install()
        while(!(get-package -Name BouncyCastle.NetFramework -ea 0)){}
    }
    $dll = [IO.FileInfo]::New((get-package -Name BouncyCastle.NetFramework | % source)).Directory.EnumerateFiles("*.dll",[System.IO.SearchOption]::AllDirectories)[0].FullName
    Add-Type -Path $dll
    $pgp_pub = [Org.BouncyCastle.Bcpg.OpenPgp.PgpPublicKeyRing]::new(
        [System.Convert]::FromBase64String(
            [string]::Join(
                [string]::Empty,
                @([regex]::new("(?m)^((?!(-|`r|`n|=))\S+)").Matches($recipient_public_key).ForEach({ $_.Groups[1].value }) )
            )
        )
    )
    $pub_key = $pgp_pub.GetPublicKey()
    $encryptor = [Org.BouncyCastle.Bcpg.OpenPgp.PgpEncryptedDataGenerator]::new(
        [Org.BouncyCastle.Bcpg.SymmetricKeyAlgorithmTag]::Aes256,
        $true,
        [Org.BouncyCastle.Security.SecureRandom]::new()
    )
    $lit = [Org.BouncyCastle.Bcpg.OpenPgp.PgpLiteralDataGenerator]::new()
    $com = [Org.BouncyCastle.Bcpg.OpenPgp.PgpCompressedDataGenerator]::new([Org.BouncyCastle.Bcpg.CompressionAlgorithmTag]::ZLib)
    $stream = [System.IO.MemoryStream]::new()
    $armored = [Org.BouncyCastle.Bcpg.ArmoredOutputStream]::new($stream)
    $com_stream = $com.Open($armored)
    $raw = [System.Text.Encoding]::UTF8.GetBytes($Message)
    $buff = [byte[]]::new(1024)
    $lit_out = [System.IO.MemoryStream]::new()
    $lit_stream = $lit.Open($lit_out,'b',"STREAM",[datetime]::Now,$buff)
    $lit_stream.Write($raw,0,$raw.Length)
    $lit_stream.Close()
    $lit_data = $lit_out.ToArray()
    $encryptor.AddMethod($pub_key)
    $enc_stream = $encryptor.Open($com_stream,$lit_data.Length)
    $enc_stream.Write($lit_data,0,$lit_data.Length)
    $enc_stream.Close()
    $com_stream.Close()
    $armored.Close()
    $stream.Position = 0
    $bytes = $stream.ToArray()
    return ([System.Text.Encoding]::UTF8.GetString($bytes))
}

