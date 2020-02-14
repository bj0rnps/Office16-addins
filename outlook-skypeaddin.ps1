   #common
[string]$addin='UcAddin.LyncAddin.1'#[string]$addin='SI.Outlook.Sidebar.Container'

#Resiliency

[string]$Resiliency_key= 'HKCU:\Software\Microsoft\Office\16.0\Outlook\Resiliency' #test
[string]$DoNotDisableAddinList_key='HKCU:\Software\Microsoft\Office\16.0\Outlook\Resiliency\DoNotDisableAddinList'#test
[int]$Resiliency_value=1

#Load behavior
[string]$loadbehavior_key='HKCU:\SOFTWARE\Microsoft\Office\Outlook\addins\'+$addin #test this path
[string]$addinlist_key='HKCU:\SOFTWARE\Microsoft\Office\Outlook\addins' #test
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

if (!(Test-Path  ($DoNotDisableAddinList_key+$Resiliency_key) ) ){
New-ItemProperty -Path $DoNotDisableAddinList_key -Name $addin -Value $Resiliency_value
}

if (!(Test-Path -Path ($loadbehavior_key+'LoadBehavior') )) {
New-ItemProperty -Path ($loadbehavior_key)  -Name 'LoadBehavior' -Value $loadbehavior_value
}
