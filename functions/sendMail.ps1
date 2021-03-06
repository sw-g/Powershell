######################################################################
# Author: Michel van Son                                             #
# Date: 07-07-2014                                                   #
# Function: Function to send email                                   #
# Changes: [DD-MM-YYYY] Name - Changes                               #
######################################################################

######################################################################
# USAGE                                                              #
# This function is automatically loaded if specified in settings.xml #
# You can call sendMail() with the appropriate values                #
# VARIABLES                                                          #
# -to "emailaddress"                                                 #
# -subject "subject of email"                                        #
# -body "content of email"                                           #
######################################################################

#region configuration

# Load settings.xml
$scriptDirectory = Split-Path -parent $MyInvocation.MyCommand.path
[xml]$settings = Get-Content (Join-Path ($scriptDirectory) "..\settings.xml")

$smtpServer   = $settings.settings.Functions.sendMail.Mailserver
$from         = $settings.settings.Functions.sendMail.FromAddress

#endregion

function sendMail($to, $subject, $body)
{
	# Set up the smtp server object
	$smtpClient = new-object system.net.mail.smtpClient
	$smtpClient.host =  $smtpServer
	
	# Create the actual email
	$email = new-object Net.Mail.MailMessage
	$email.From = $from
	$email.To.Add($to)
	$email.Subject = $subject
	$email.Body = $body
		
	# Send the email and report status
	try {
	  $smtpClient.Send($email)
	  return $true
	}
	catch
	{
	  return $_.Exception.ToString()
	}
}