#!usr/bin/perl
use strict;
use Scalar::Util qw(looks_like_number);

my @polishUnits = ( "", "jeden", "dwa", "trzy", "cztery", "pięć", "sześć", "siedem", "osiem", "dziewięć" );
my @polishTeens = ( "dziesięć", "jedenaście", "dwanaście", "trzynaście", "czternaście", "piętnaście", "szesnaście", "siedemnaście", "osiemnaście", "dziewiętnaście" );
my @polishTens = ( "", "", "dwadzieścia ", "trzydzieści ", "czterdzieści ", "pięćdziesiąt ", "sześćdziesiąt ", "siedemdziesiąt ", "osiemdziesiąt ", "dziewięćdziesiąt " );
my @polishHundreds = ( "", "sto ", "dwieście ", "trzysta ", "czterysta ", "pięcset ", "sześćset ", "siedemset ", "osiemset ", "dziewięćset " );
my @polishThousands = ( "", "tysiąc ", "dwa tysiące ", "trzy tysiące ", "cztery tysiące ", "pięć tysięcy ", "sześć tysięcy ", "siedem tysięcy ", "osiem tysięcy ", "dziewięć tysięcy " );

my @englishUnits = ( "", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine" );
my @englishTeens = ( "ten", "eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen", "seventeen", "eighteen", "nineteen" );
my @englishTens = ( "", "", "twenty ", "thirty ", "fourty ", "fifty ", "sixty ", "seventy ", "eighty ", "ninety " );
my @englishHundreds = ( "", "one hundred ", "two hundred ", "three hundred ", "four hundred ", "five hundred ", "six hundred ", "seven hundred ", "eight hundred ", "nine hundred " );
my @englishThousands = ( "", "one thousand ", "two thousand ", "three thousand ", "four thousand ", "five thousand ", "six thousand ", "seven thousand ", "eight thousand ", "nine thousand " );

my @germanUnits = ( "", "eins", "zwei", "drei", "vier", "fünf", "sechs", "sieben", "acht", "neun" );
my @germanTeens = ( "zehn", "elf", "zwölf", "dreizehn", "vierzehn", "fünfzehn", "sechzehn", "siebzehn", "achtzehn", "neunzehn" );
my @germanTens = ( "", "", "zwanzig", "dreizig", "vierzig", "fünfzig", "sechzig", "siebzig", "achtzig", "neunzig" );
my @germanHundreds = ( "", "einhundert", "zweihundert", "dreihundert", "vierhundert", "fünfhundert", "sechshundert", "siebenhundert", "achthundert", "neunhundert", );
my @germanThousands = ( "", "eintausend", "zweitausend", "dreitausend", "viertausend", "fünftausend", "sechstausend", "siebentausend", "achttausend", "neuntausend", );

my $usageString = "Usage: perl numbers.pl inputFile language< pl | en | de >\nFor example: perl numbers.pl example.txt en\n";

if( @ARGV < 2 ){
	print "Not enough arguments.\n".$usageString;
	exit;
}
open( my $file, "<".$ARGV[ 0 ] ) or die "Cannot open given file.\n".$usageString;
open( my $outFile, ">".$ARGV[ 1 ]."_".$ARGV[ 0 ] ) or die "Cannot create output file in this folder.";

while( <$file> ){
	chomp;
	my @words = split( /(\.| |,)/ );
	foreach my $str ( @words ){
		if( looks_like_number( $str ) && length( $str ) <= 4 ){
			my $unit = $str % 10;
			my $ten = ( $str / 10 ) % 10;
			my $hundred = ( $str / 100 ) % 10;
			my $thousand = ( $str / 1000 ) % 10;
			my $convertedNumber;

			if( $ARGV[ 1 ] eq "pl" ){
				if( $str == 0 ){ $convertedNumber = "zero"; }
				elsif( $ten != 1 ){
					$convertedNumber = $polishThousands[ $thousand ].$polishHundreds[ $hundred ].$polishTens[ $ten ].$polishUnits[ $unit ];
				}
				else{
					$convertedNumber = $polishThousands[ $thousand ].$polishHundreds[ $hundred ].$polishTeens[ $unit ];
				}
			}
			elsif( $ARGV[ 1 ] eq "en" ){
				if( $str == 0 ){ $convertedNumber = "zero"; }
				elsif( $ten != 1 ){
					$convertedNumber = $englishThousands[ $thousand ].$englishHundreds[ $hundred ].$englishTens[ $ten ].$englishUnits[ $unit ];
				}
				else{
					$convertedNumber = $englishThousands[ $thousand ].$englishHundreds[ $hundred ].$englishTeens[ $unit ];
				}
			}
			elsif( $ARGV[ 1 ] eq "de" ){
				if( $str == 0 ){ $convertedNumber = "null"; }
				elsif( $ten == 1 ){
					$convertedNumber = $germanThousands[ $thousand ].$germanHundreds[ $hundred ].$germanTeens[ $unit ];
				}
				elsif( $unit == 0 ){
					$convertedNumber = $germanThousands[ $thousand ].$germanHundreds[ $hundred ].$germanTens[ $ten ].$germanUnits[ $unit ];
				}
				elsif( $ten == 0 ){
					$convertedNumber = $germanThousands[ $thousand ].$germanHundreds[ $hundred ].$germanUnits[ $unit ];
				}
				else{
					$convertedNumber = $germanThousands[ $thousand ].$germanHundreds[ $hundred ].$germanUnits[ $unit ].'und'.$germanTens[ $ten ];
				}
			}
			else{			
				print "Language not recognised.\n".$usageString;
				close $file;
				close $outFile;
				exit;
			}
			$str = $convertedNumber;
		}
    }
	print $outFile @words;
	print @words
}
close $file;
close $outFile;
