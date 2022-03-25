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
iT2y
=meQr
-----END PGP PUBLIC KEY BLOCK-----
"@ -message "I'm encrypting this message!"

```
**Output**
```ps1
-----BEGIN PGP MESSAGE-----
Version: BCPG C# v1.8.5.0

owJ4nAHkARv+hQGMAww0WGoHf/5zAQv/cL3yJ+2/g5pPF5qi7FvrbYcxvPROGbIy
nkl4zssfrWTa/xuVmAi/94d/WkhfLrDouvYEa3Xzkbldvr3AtIN2DHQpi7khjt/0
Yyu1Q95KFlDTfXuENi2RSpLcc6fgqXxgN3y5aERwAH8J358bYksG7S9eq1SLv38+
ySkONaxWZpdf2v47FrW4It/HVGPCSfWx8CNDkqWjfMI1pA/BS7qJlDmdCYUiwe4F
537muuvj6I6hAySlT6N0VFno6+VsFfMImiqKRwMH8MiuXcBYqSOaa+Mb2hiZSwJ+
i/9xZ7K/O6QxAkZX3yUOcrsMalDBeSKXlJALVqXC7zrJoaeAtQ9SBP/AVxY3Iu/G
V92Trr4iS4jnDrcZA0c1BhH7v61IUscrIL94jsI04M1IoNUfhin2nE9rh+5hRxJB
DDNhRWiPTpUU7qGPl98jXljU315nb7KkCVXNM+8hkbPkt4kNZOAJ0iuwTGooyvJk
m1xMtS18Oh4R08vDKRV1wz49pkELjD+p0lMBlpXX51k43lxlZb9DVVrjTldB5Gxq
IsS5VYlchLkuK/OnWCr2p0HmVZhBGImrIf7lRwHcIIX+DkJdYE59XFDZNAm382gr
ScbsIvUrAaMfyCvioEJe6NM=
=/Ohf
-----END PGP MESSAGE-----


```  
