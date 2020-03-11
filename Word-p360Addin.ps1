#common#
#rember to remove diableditems list entries
[string]$addin='SI.Client.Word2007'

#Resiliency

[string]$Resiliency_key= 'HKCU:\Software\Microsoft\Office\16.0\Word\Resiliency\'
#                                   HKCU:\SOFTWARE\Microsoft\Office\16.0\Word\Resiliency
[string]$DoNotDisableAddinList_key='HKCU:\Software\Microsoft\Office\16.0\Word\Resiliency\DoNotDisableAddinList'#test this path
[int]$Resiliency_value=1

#Load behavior
[string]$loadbehavior_key='HKCU:\SOFTWARE\Microsoft\Office\Word\addins\'+$addin #test this path
[string]$addinlist_key='HKCU:\SOFTWARE\Microsoft\Office\Word\addins'
[int]$loadbehavior_value=3 







if (!(Test-Path $loadbehavior_key)){
   New-Item -Path $loadbehavior_key                                         
      
 }
 if (!(Test-Path ($Resiliency_key) )){
   New-Item -Path ($Resiliency_key )

  }


if (!(Test-Path $DoNotDisableAddinList_key)) {

New-Item -Path $DoNotDisableAddinList_key 
}

New-ItemProperty -Path $DoNotDisableAddinList_key -Name $addin -Value $Resiliency_value -Force
 
New-ItemProperty -Path ($loadbehavior_key)  -Name 'LoadBehavior' -Value $loadbehavior_value -Force



