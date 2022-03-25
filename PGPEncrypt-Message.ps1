function Verify-Fingerprint
{
    [cmdletbinding()]
    Param(
        [Parameter(Mandatory=$true)]
        [string]$recipient_public_key,
        [Parameter(Mandatory=$true)]
        [string]$known_fingerprint
    )
    Add-Type -Path "$($ENV:USERPROFILE)\source\repos\bc-csharp\crypto\bin\Debug\lib\net20\BouncyCastle.dll"
    $pgp_pub = [Org.BouncyCastle.Bcpg.OpenPgp.PgpPublicKeyRing]::new(
        [System.Convert]::FromBase64String(
            [string]::Join(
                [string]::Empty,
                @([regex]::new("(?m)^((?!(-|`r|`n|=))\S+)").Matches($recipient_public_key).ForEach({ $_.Groups[1].value }) )
            )
        )
    )
    $fingerprint = @($pgp_pub.GetPublicKey().GetFingerprint().ForEach({ $_.ToString('X2') })) -join ''
    if($fingerprint -eq $known_fingerprint)
    {
        return $true
    } else {
        return $false
    }
}
function PGPEncrypt-Message
{
    [cmdletbinding()]
    Param(
        [Parameter(Mandatory=$true)]
        [string]$recipient_public_key,
        [Parameter(Mandatory=$true)]
        [string]$message
    )
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
