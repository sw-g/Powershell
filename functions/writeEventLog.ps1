######################################################################
# Author: Michel van Son                                             #
# Date: 07-07-2014                                                   #
# Function: Function to write to Eventlog                            #
# Changes: [DD-MM-YYYY] Name - Changes                               #
######################################################################

######################################################################
# USAGE                                                              #
# This function is automatically loaded if specified in settings.xml #
# You can call writeEvent() with the appropriate values              #
# VARIABLES                                                          #
# -eventId "Id of event, used for easy filtering/monitoring"         #
# -source "name of application from settings.xml or overridden"      #
# -content "content of eventlog entry"                               #
######################################################################

#region configuration

# Load settings.xml
$scriptDirectory = Split-Path -parent $MyInvocation.MyCommand.path
[xml]$settings = Get-Content (Join-Path ($scriptDirectory) "..\settings.xml")

$logName      = $settings.settings.Functions.EventLog.LogName

#endregion

function writeEvent($to, $subject, $message)
{

	try {
          return $true
	}
	catch
	{
	  $_.Exception.ToString()
	}
}