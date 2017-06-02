workflow Pause-Datawarehouse
{
	$CredentialName = "SQLDW-Cred"

    #Get the credential with the above name from the Automation Asset store
    $psCred = Get-AutomationPSCredential -Name $CredentialName
    if(!$psCred) {
        Throw "Could not find an Automation Credential Asset named '${CredentialName}'. Make sure you have created one in this Automation Account."
    }

	#Login using the above Credential
    Login-AzureRmAccount -Credential $psCred
    Get-AzureRmSubscription
    Select-AzureRmSubscription -SubscriptionName "<subscription_name>"
	
	#pausing datawarehouse
Suspend-AzureRmSqlDatabase –ResourceGroupName "<resource_group_name>" –ServerName "<server_name_without_sufix>" –DatabaseName "<database_name>"	

}
