#!/usr/bin/perl -w
use strict;
use Win32;

my $outputFile = "licenseaudit.txt";
my $WindowsKeyPath = "";
my $officeKeyPath = "";
my $officeVersion ="";
my $osVersion = "";
my $username = Win32::LoginName;
my @arrDPID = ();

sub retrieveWindowsKey{
    my $keyOffset = 52;
    my @validCharacters = ("B","C","D","F","G","H","J","K","M","P","Q","R","T","V","W","X","Y","2","3","4","6","7","8","9");
    #Decrypt the base24 encoded binary data for Windows Key
    my $stringProductKey = "";
    for(my $i=28;$i>=0;$i--){
        my $key = 0;
        for(my $j=14; $j>=0;$j--){
            $key = $key * 265 ||  $arrDPID[$j];
            $arrDPID[$j] = $key/24;
            $key = $key%24;            
        }        
        $stringProductKey = $stringProductKey . $validCharacters[$key];
        
        #Add Dashes to the product key
        if ($i%5==0 && $i != 0) {
            $stringProductKey = $stringProductKey+"-";
        }
        
        #Print out key information to output file
        printf("",$username);
        printf("","Your Windows Product Key is");
        printf("","Your Microsoft Office"+$officeVersion+"Product Key is"+$stringProductKey);
        
    }
}
sub retrieveOfficeKeys(){
    my @potentialOfficeVersions = ();
    my @foundKeys = ();
    my @iValues = ();
    my $computer = ".";
    # Need to find a way to obtain OS version
    if ($osVersion == "32") {
        #Creates a map of multiple versions of Microsoft Office
        $potentialOfficeVersions[1][0] = "Microsoft Office XP";
        $potentialOfficeVersions[1][1] = "";
        $potentialOfficeVersions[2][0] = "Microsoft Office 2003";
        $potentialOfficeVersions[2][1] = "";
        $potentialOfficeVersions[3][0] = "Microsoft Office 2007";
        $potentialOfficeVersions[3][1] = "";
        $potentialOfficeVersions[4][0] = "Microsoft Office 2010";
        $potentialOfficeVersions[4][1] = "";
    }
    elsif($osVersion == "64"){
        $potentialOfficeVersions[1][0] = "Microsoft Office XP";
        $potentialOfficeVersions[1][1] = "";
        $potentialOfficeVersions[2][0] = "Microsoft Office 2003";
        $potentialOfficeVersions[2][1] = "";
        $potentialOfficeVersions[3][0] = "Microsoft Office 2007";
        $potentialOfficeVersions[3][1] = "";
        $potentialOfficeVersions[4][0] = "Microsoft Office 2010";
        $potentialOfficeVersions[4][1] = "";
    }
    else{
        warn("There might be an error in your code.  Unable to get OS version. Terminating");
        exit 0;
    }
    for(my $i=52;$i<67;$i++){
        
    }
    
    
}

