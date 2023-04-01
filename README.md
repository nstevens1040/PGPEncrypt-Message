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
=1FXx
-----END PGP PUBLIC KEY BLOCK-----
"@ -message "I'm encrypting this message!"

```
**Output**
```
-----BEGIN PGP MESSAGE-----
Version: BCPG C# v1.8.10.0

owJ4nAHkARv+hQGMA/fa6z6lTr8bAQv/WbkswWhf0zw2clAVc8LmMcN1xjXi+amr
xx/rJqLdt/VPTH3yADO6u5+v7llgQKrfRatv+Ywpmpf3vU1zPAYS1pyWd4RQaqpU
Ir36kuZCcE21R0xrltwXfcH6PNAYJko0cQvGTMfx7LjBcO/QMBe4g4K47HF0r5Nt
H9K5my/Fb2C2YOzIVLqlFMWgRMa8V5xqrBBvdhcum6jruY2IrEId9VHZl1QKjrsd
DAf8g7/5IZAl+w6ECwE/kxxRarwzGpbWU0eSOJnRcW3eHK3FvE/DuPoPOkDR1zo6
98pr2BFli+kLkAAK28ELdwaji4BuGwfxnF7d2DXO346LNoZ+lWH0nElfiPGPIzy2
q1JFm73mu2TydrvW6/Z50jglEyW61FIRlNpCS+KeJcGlPOTQhR3d2UwPes5L70U6
580mX/oTr5z5RIIBmCzEpMvdUmemizi5np/3RxUqZQPcErr5QRxsO0e6ijslKHN/
3gMIM+b+VLi51eb0B66fEvE8zOgMKAY40lMBiG64r16nrFeOhDmv0iXxbbqKv0zJ
/m0h6wFRsNlnioKZylgJQu7/GAIh/VjfYowehJjKY3N4d67SL97ZP9fziBYDa0RW
M45A5eQrcga0FQFl/cUr9Ik=
=ME04
-----END PGP MESSAGE-----


```  
