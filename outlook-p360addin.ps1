
<#start old
[string]$addin='SI.Outlook.Sidebar.Container'
[string]$keypath='HKCU:\Software\Microsoft\Office\16.0\Outlook\Resiliency'
[string]$regpath='HKCU:\Software\Microsoft\Office\16.0\Outlook\Resiliency\DoNotDisableAddinList'
[int]$value=1
New-Item -Name 'DoNotDisableAddinList' -Path $keypath
New-ItemProperty -Path $regpath -Name $addin -PropertyType dword -Value $value
#end old#>





#common
[string]$addin='SI.Outlook.Sidebar.Container'

#Resiliency

[string]$Resiliency_key= 'HKCU:\Software\Microsoft\Office\16.0\Outlook\Resiliency'
[string]$DoNotDisableAddinList_key='HKCU:\Software\Microsoft\Office\16.0\Outlook\Resiliency\DoNotDisableAddinList'
[int]$Resiliency_value=1

#Load behavior
[string]$loadbehavior_key='HKCU:\SOFTWARE\Microsoft\Office\Outlook\addins\'+$addin #test this path
[string]$addinlist_key='HKCU:\SOFTWARE\Microsoft\Office\Outlook\addins'
[int]$loadbehavior_value=3 





if (!(Test-Path $DoNotDisableAddinList_key)) {

New-Item -Path $DoNotDisableAddinList_key -Name 'DoNotDisableAddinList'
}

if (!(Test-Path $loadbehavior_key)){
   New-Item -Path $loadbehavior_key                                         
      
 }
 if (!(Test-Path ($loadbehavior_key) )){
   New-Item -Path ($loadbehavior_key )

  }

New-ItemProperty -Path $DoNotDisableAddinList_key -Name $addin -Value $Resiliency_value

New-ItemProperty -Path ($loadbehavior_key)  -Name 'LoadBehavior' -Value $loadbehavior_value


