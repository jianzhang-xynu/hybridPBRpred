#! /usr/bin/perl -w

$proID=$ARGV[0];
print $proID."\n";

if(-e "ourHybrid/"){
	;
}else{
	system "mkdir ourHybrid/";
}

open DISO,"disoRDPbind/$proID.txt";
chomp(@disopred=<DISO>);
close DISO;

@temp_disopred=split(/:/,$disopred[7]);
@diso=split(/,/,$temp_disopred[1]);



open SCR,"SCRIBER/$proID.csv";
chomp(@scrpred=<SCR>);
close SCR;

@scr=();
for($cn=3;$cn<@scrpred;$cn++){
	@temp_scriber=split(/,/,$scrpred[$cn]);
	push(@scr,$temp_scriber[6]);
}

$proLen=@diso;

@transferredDiso=();
for($cn=0;$cn<$proLen;$cn++){
	$thisdiso=0;
	if($diso[$cn] >= 0.715){
		$thisdiso=($diso[$cn]-0.715)/(0.962-0.715);
	}else{
		$thisdiso=($diso[$cn]-0.715)/(0.715-0.118);
	}
	push(@transferredDiso,$thisdiso);
}

@transferredScr=();
for($cn=0;$cn<$proLen;$cn++){
	$thisscr=0;
	if($scr[$cn] >= 0.2171){
		$thisscr=($scr[$cn]-0.2171)/(0.9501-0.2171);
	}else{
		$thisscr=($scr[$cn]-0.2171)/(0.2171-0.0075);
	}
	push(@transferredScr,$thisscr);
}

open WRITE,">hybridPBRpred/$proID.txt";
for($cn=0;$cn<$proLen;$cn++){

	$thisPred=0;
	if($transferredDiso[$cn] > 0 || $transferredScr[$cn] > 0){
		if($transferredDiso[$cn]>=$transferredScr[$cn]){$thisPred=$transferredDiso[$cn];}
		if($transferredScr[$cn]>$transferredDiso[$cn]){$thisPred=$transferredScr[$cn];}
	}else{
		$thisPred=($transferredDiso[$cn]+$transferredScr[$cn])/2;
	}
	printf WRITE ("%4.3f\n",$thisPred);
}
close WRITE;

