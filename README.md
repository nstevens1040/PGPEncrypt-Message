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

mQGNBGQoXNUBDADrJuDzJRUnWRrW0Y5sUhbw3p9/o3tVVfWlfKRM8bJ7cuwHWRQp
v2ZkZ7tK0S0pybCUuuOekODm6Hlqi1eUr7YL1EJU4TF3heQM00SLerVtuhP9egmc
RwACzGTWVQ75cktttySTr5pn/OnoSbRXEWY6lh9I/TinM1g9F4EjIOViR3oNfThu
LpQkUNF4JDRMumfX3e+AovqUgDPlhuVO4tdo6QSuUaj1G2Wtxv1nfYvtvtsD9aGp
tZNBIQ/yeGT7kLmFH+SuTavn0AGfIUbtOBOTopJU8qpG/bHL+QKpou6lGXzla/yK
tirSbYS3Nrr9NEO81YicUfSCqcGmTyGkUaUz7fj1ToJ7XtS/E24fU0I9cG7vRuut
4MgfEac4IY7KC/yn+xysbprLt3fCQVkGrCPf5iNF9c19aN+ApPIH5Yrxm4UWSoz3
VPmrelPmooWR266KL09KjoBHMBMRWjV2cv/AUTmzVwfiof6ikN/VCsubu+pvxiU2
IeRj7pPcQaZVUXEAEQEAAbQMY3J5cHRfa2VlcGVyiQHOBBMBCAA4FiEEOqSSMQNK
GjC093OjNCsLF6sR0MsFAmQoXNUCGwMFCwkIBwIGFQoJCAsCBBYCAwECHgECF4AA
CgkQNCsLF6sR0Mtr8QwAy2oy/aZgNSPBFMw31bh8viZ1Gvzr195K0Sw+3G9XnVy5
NHzHEHp+AgMrH5iDwl8xPqb2iQdf0D+yOBHlrpGWEUMlwG1t5P9dsGiWunGLU/No
jjqBK/d6+1w0T64pTgg/fxKsYoNozvfC23o9NULyEh1MKtmXclU6uBuz8tnaMFft
PIFBPqAGkeHB4+Jz9Df/hRNxhLQ1r4yBoTFSUYFfn8hD1J+UErmPZEj8mEMX9x7h
umc+MtNMvTYuNIDHR9j6vGGfuJpgGkPaiGFey6cg2OXF2G2hbOaptM6ON7SA1iEv
FJHi/dAyDSqcrTnwEMpBUWTFK7BIF4/JHylbrxiRQBLxMiuhkeJpkyOVdFgrsnmn
7GrCFCxY4CCTa6GToV9dv/3HNDJfb6wGOqO6dO+1ec1JNF27d1GKo3UVMMJIoKe2
95BpuutAKW59HI0zXUgSzcVbSaHZ7zp/PZuq4Cic+XxkHDvtRCOqXxgSt8Mj5MyK
b3h+OBZqTAp4J5eqqOyXuQGNBGQoXNUBDAC9znIy3R9E/ASW+nSXvb9iVN8szf9F
ROt25lumyCDYfXDgTuHsT7Wdm4AqJ4kOqOKt7ZRFTQKdMXZldfs1R4qoIDjTYdad
Mb0B/f9/fvcpTMtdc84PeO3NE+OEkPlMCjxqElLgYJpKdXbVLOy5VavVRvWPHjrD
Sm5sVl55LGEnoLMR7TI7KuiQ7JeWKlFCfxx4JadRaj2ZlhSkZCBz3hqBJ3Ezgedk
gqL0L5GMXQ3F/GuaZ+WJao5udTU4nKtmOYiLJj7+/HP8lNa78+RiPZ2g9tHCQ11h
11uaD2vEjq0KYqejrO4qC0BhEQ09T139YKWYNalf7crH87PRzExoUU8bn4a1etKy
Ep5fXTqKm0yllPj2biE1mjK52hnRwHnh+PiDD7IMciUy1VVpnzG2TZ4IUlaBh59R
CS390INsjRCmuAjWrIXR1/Wfozx1Og0cHdmlGU0H2mPZJFdi4rlx/IUyK04LpNS8
Ju6zm7L5TxZi+OWOFSKGL/JeeLA5M39IrMcAEQEAAYkBtgQYAQgAIBYhBDqkkjED
ShowtPdzozQrCxerEdDLBQJkKFzVAhsMAAoJEDQrCxerEdDLfBYMAM5VA513Nl2r
Tl65sg72iFIhnxbN8mg7PmDhO3KdynTojhiS/UFXouyAOo9bU5WesmThYS1OHCoZ
IumyQOPrJ3XvcJCRxMcP7Lj4W5LpYd0PHfIsTF5qF7sOrgbPyziS+rpYDugIxIQB
F59vOKDbphNwykQVKK3FbOt7v+6Jwei/nl6k5oLKFCojzSFK2fTvjEIpPulcmCKC
++e3XZnehKsxj0RkBkZVa+IOzoLDiUCXqqbUIIJcmyrAyQQv965JM2RN87ON6Fv0
+WE7q4AEZ5S9FzdQi0FUHko72PGVxGa9fZgtbBPpGk3mFYi589uu5w+M7x2ZYc2G
8VFWH0jwB/6X8vGEwFRVgOWKovkjeuBAIyjPbthGvM5bpeNV4HeZ1EqfSiDjenvB
oHcCoyJRRF3FjXmx4OcW6ltP7Ac5OHCRE2i6Iti2ryyaJymL95bc9BpsoZmtk7Cg
RaEUveHUDrvN6NvcJwOWQsvcA+QTHnZPuMY1sSN8WDSeC3yWedFxCg==
=2iy5
-----END PGP PUBLIC KEY BLOCK-----
"@ -message "I'm encrypting this message!"

```
**Output**
```
-----BEGIN PGP MESSAGE-----
Version: BCPG C# v1.8.10.0

owJ4nAHkARv+hQGMAzQrCxerEdDLAQwA5KLnXJT/MPZ1OjqeQTouGjSgu2jPDENS
8NAJDGA7UyddjI672VbE2PyRqWyFT9Np3mnMxfLu/32mtrSZA7YF2sZ3bc8hFgha
UAnDr0+BhGzGign9Kp/iDnoh8RIc72ooStLXwLlKiAzDqMQ8npU2B4RyhwUM0MFC
c0+NjZBEHFRG7JavJ9FPdF3W9G0KMOPQVTPZghiP/zgM/2Ji8nH5vSSldIebhvj4
M85RHUwWKDnDqjymiklrR1Necc3H6bOW6if3UeRIQrSRuyBeEZCE7EHlSZ6ysC9d
fWHUQXn2Fcd1R2TfvXnzc4//lXFrozRtiwNrSvqGR7oeB1Q42SZoaTrKi8MexgFV
BJYAjTL9Dgbxazx6gMmBDS8fjSp4fHvc21L7Tra/JmWxND3f02S0JsG5AfuCf3BS
QJ/h0mukvuclM2piLAQM/2XxDsgWG9EbzLwndJEPNzi8PpwtDcAySaiUAUtLYGE4
Ja+fjftZMiWB5sG843EhcAeHiYaswPyH0lMBIyhdFtA34MkaY3uqfZZIbqN24iwL
bFYLVMxLZ1ehVr/K6tmRMipIc1nOsZBwC5+rmg5rXDUthq1/PKWVhYTxY4MXaFl3
DLvyNnvcb1Loeq78VqRs5lE=
=hoSa
-----END PGP MESSAGE-----


```  
