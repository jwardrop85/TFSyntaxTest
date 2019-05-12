Configuration CISHardenTest 
{
    Param
    (
        
        [String]$SystemTimeZone="UTC"
      
    )

    Import-DscResource -ModuleName ComputerManagementDSC
    Import-DscResource -ModuleName NetworkingDSC
    Import-DscResource -ModuleName AuditPolicyDSC
    Import-DscResource -ModuleName SecurityPolicyDSC
    Import-DscResource –ModuleName PSDesiredStateConfiguration
    Node ProdNode {

        TimeZone SysTimeZone
        {
            IsSingleInstance = 'Yes'
            TimeZone = $SystemTimeZone
        }
    }
}
