

[string]$addin='SI.Outlook.Sidebar.Container'
[string]$keypath='HKCU:\Software\Microsoft\Office\16.0\Outlook\Resiliency'
[string]$regpath='HKCU:\Software\Microsoft\Office\16.0\Outlook\Resiliency\DoNotDisableAddinList'
[int]$value=1
New-Item -Name 'DoNotDisableAddinList' -Path $keypath
New-ItemProperty -Path $regpath -Name $addin -PropertyType dword -Value $value
