<#
.SYNOPSIS 
	Takes different types of input parameters and outputs them.  

.DESCRIPTION
	This runbook demonstrates how to use input parameters for runbooks.
	It also illustrates how to specify whether parameters are required, provide default parameter values,
	and use parameter values later in the workflow.

.PARAMETER Name
	String name entered to print as output

.PARAMETER  Number
	Int number to be used to print as output

.PARAMETER StringArray
	Array of strings used to loop through and print as output. 
	An example of valid input is: [1,'astringvalue', 2, 'anotherStringValue'] 
	
.PARAMETER Date
	DateTime selected by the user used to print as the date entered

.PARAMETER GoodBye
	Boolean True/False value used to determine whether or not to print goodbye.   

.NOTES
	Author: System Center Automation Team 
	Last Updated: 3/3/2014   
#>

workflow Use-RunbookParameterSample
{   
	# Specify input parameters here
	param (
		# Optional parameter of type String, default value "World"
    	[parameter(Mandatory=$false)]
        [string]$Name = "World",

		# Mandatory parameter of type int
        [parameter(Mandatory=$true)]
        [int]$Number,

		# Optional parameter of type string array
		# When starting a runbook through the GUI, separate array values with a comma as you would
        # in json: [1,'astringvalue']
		[parameter(Mandatory=$false)]
		[string[]]$StringArray,

		# Mandatory parameter of type DateTime
		[parameter(Mandatory=$true)]
		[DateTime]$Date,

		# Mandatory parameter of type boolean
		[parameter(Mandatory=$true)]
        [boolean]$SayGoodbye
    )
    
	# Print output based on input parameter values
    "Hello $Name"
    "You entered the number $Number"

	# Print each item in string array
	foreach ($Elem in $StringArray){
		$Elem
	}

	# Print the DateTime value
	$Date

	# Only print "Goodbye" if boolean variable has been set to true
    if($SayGoodbye)
	{
    	"Goodbye"
    }
}
