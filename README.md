# PGPEncrypt-Message
Script for Windows PowerShell that will encrypt a string using the recipient's PGP public key, AES256, and ZLib.  
  
This script uses **[BouncyCastle.NetFramework](https://www.nuget.org/packages/BouncyCastle.NetFramework/)** *(also [bc-chsarp](https://github.com/bcgit/bc-csharp))*.  
  
## Installation
The PowerShell snippet below will make the script available in the current PowerShell session.  
  
The first time you run **PGPEncrypt-Message** it will install BouncyCastle.NetFramework.  
```ps1
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12
iex (irm https://raw.githubusercontent.com/nstevens1040/PGPEncrypt-Message/main/PGPEncrypt-Message.ps1)
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
## Example
```ps1
PGPEncrypt-Message -recipient_public_key @"
-----BEGIN PGP PUBLIC KEY BLOCK-----

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
=W8Ss
-----END PGP PUBLIC KEY BLOCK-----
"@ -message "I'm encrypting this message!"
```
**Output**
```ps1
-----BEGIN PGP MESSAGE-----
Version: BCPG C# v1.8.5.0

owJ4nAFkApv9hQIMA2/1AUnkOVXiAQ//dFiq2EdUoF8KZ3RZJRQg8zpIr1YhaHbF
DZLpjLsCjSpmuvKcWYEPCMRp1tv9YD2vDvGv5UgZOsxJChiek1TSZVYTJiuExbyL
8qqstIsuw0TPm/O16uDTpynEeMC9MRsLF/B0BGcvzPRtkq5iGRZtHffA16Z0NJzr
/S/NVkY4DTc3/8d6Da0+X5V0AWG30dt4uMZJ63PRKk0TbIpaozDItZpHkCXQKlOT
7K8qYoCGH0zar/A0eUsLfctu+yh021/DmfKnLrz7Vz/CxnmbpE8IOjj2bJzlqEvv
I0ovTXrrAGABPN3MJ9gI04yiHs2gTX9GPpWQrKgq12g2Nkeq46w+wZ1YiqhbWHgF
pC1RvWDuWu2nVfFY0u//LMPlWgF4m+BJKtwJkM8L5JuoWFBcZ5sMNegEw5vPwRAR
5vi24Ixz7QQR9UstZbSvYuqfAsBGA88WIDmYaFo+21El0voxS80YEbXhm8bdR3BB
97f0Uyx6QFhHjC4KczZikCTw5nTl/SjmC60gsnW+oHL/n8xWCgErCSQw1A5Mr0j9
tIvowHjQLEaMNpKdiDXBuZ8H75o5PMNkBvz0L2oeX6OsSV3tscvrHT7wTugo3qWg
luzaiaN64lfFrR3ryuJzFobbRTXXPw2ElFtp/4B5f12gmecM5DoQYskqwCwhIrAG
NM/BegMRZHbSUwE7F3907LBNqTc8xWWdR9pP4f79fycH84y+JUz/vrzmTmJFBBBA
egBXH45a/AQ/Ay1q8gMFjFcHcDGaHZQXvNe0hwLPM4l+SNWVTHn8yd0cuxLiWKUp
oQ==
=ZuGm
-----END PGP MESSAGE-----

```  
