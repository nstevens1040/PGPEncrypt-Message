# PGPEncrypt-Message
Script for Windows PowerShell that will encrypt a string using the recipient's PGP public key, AES256, and ZLib.  
  
## Installing BouncyCastle.NetFramework
This script uses **[BouncyCastle.NetFramework](https://www.nuget.org/packages/BouncyCastle.NetFramework/)** *(also [bc-chsarp](https://github.com/bcgit/bc-csharp))*.  
  
The PowerShell snippet below will
   1. Register the **NuGet** package source *(even if you already have it)*
   2. Install the **BouncyCastle.NetFramework** package
   3. Unregister the **NuGet** package source
   4. Locate **BouncyCastle.dll** and then load the assembly into the current PowerShell session via reflection
```ps1
$i = 0; $packageSources = Get-PackageSource | ? {$_.Name -eq "nuget" }
while($packageSources.count -gt 0){$name = "nuget$($i)";$packageSources = Get-PackageSource | ? {$_.Name -eq $name};$i++}
$null = Register-PackageSource -Name $name -Location https://api.nuget.org/v3/index.json -ProviderName NuGet -Trusted
$null = Install-Package -Name BouncyCastle.NetFramework -Source $name
Unregister-PackageSource -Name $name
$dll = [IO.FileInfo]::New((get-package -Name BouncyCastle.NetFramework | % source)).Directory.EnumerateFiles("*.dll",[System.IO.SearchOption]::AllDirectories)[0].FullName
Add-Type -Path $dll
```  
## Usage
```
NAME
    PGPEncrypt-Message
    
SYNTAX
    PGPEncrypt-Message [-recipient_public_key] <string> [-message] <string>  [<CommonParameters>]
    
    
PARAMETERS
    -message <string>
        
        Required?                    true
        Position?                    1
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     false
        
    -recipient_public_key <string>
        
        Required?                    true
        Position?                    0
        Accept pipeline input?       false
        Parameter set name           (All)
        Aliases                      None
        Dynamic?                     false
        
    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see 
        about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216). 
    
    
INPUTS
    None
    
    
OUTPUTS
    System.Object
    
ALIASES
    None
    

REMARKS
    None
```
