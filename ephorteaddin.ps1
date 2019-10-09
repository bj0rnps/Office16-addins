   ##
   [string]$addin='Gecko.Ephorte.Outlook.Main'
   [string]$regpath='HKCU:\Software\Microsoft\Office\16.0\Outlook\Resiliency\DoNotDisableAddinList'
   [int]$value=1
   
   New-ItemProperty -Path $regpath -Name $addin -PropertyType dword -Value $value -WhatIf
