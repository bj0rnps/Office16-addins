
[string]$addin='Gecko.Ephorte.Outlook.Main'

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

if ((Get-ItemProperty -Name $addin -Path $DoNotDisableAddinList_key).$addin -ne $Resiliency_value ){ 
New-ItemProperty -Path $DoNotDisableAddinList_key -Name $addin -Value $Resiliency_value -Verbose -Force
}



 if (!(Test-Path ($loadbehavior_key) )){
   New-Item -Path ($loadbehavior_key ) 
     }

 if ((Get-ItemProperty -Path $loadbehavior_key -Name 'LoadBehavior' ).loadbehavior -ne $loadbehavior_value){
   New-ItemProperty -Path ($loadbehavior_key)  -Name 'LoadBehavior' -Value $loadbehavior_value -Verbose -Force
  
  }
  





