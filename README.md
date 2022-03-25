# PGPEncrypt-Message
Script for Windows PowerShell that will verify the recipient's PGP public key and encrypt a string using the recipient's PGP public key, AES256, and ZLib.  
  
## Requirements
This script uses **[bc-chsarp](https://github.com/bcgit/bc-csharp)**  
The PowerShell snippet below will clone, build, and add the bc-csharp library to your current PowerShell session.
```ps1
 . "$($ENV:VS160COMCOMNTOOLS)\Launch-VsDevShell.ps1"
cd $env:userprofile\Desktop
git clone https://github.com/bcgit/bc-csharp.git
cd bc-csharp
msbuild BouncyCastle.sln
Add-Type -Path .\crypto\bin\Debug\lib\net20\BouncyCastle.dll
```  
