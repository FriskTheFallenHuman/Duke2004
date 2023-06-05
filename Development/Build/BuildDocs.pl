#!/usr/bin/perl.exe

###############################################################################
# Documentation options.

$deleteTempFiles     = 1;    # Delete temporary HTML files?
$doxygen             = 'C:\\Program Files\\doxygen\\bin\\doxygen.exe';

$doxyfileUE3         = 'UnrealEngine3.dox';

$doxyUE3Logfile      = 'latestDoxygenOutput_UE3.log';

###############################################################################
# clock/unclock variables

$timer      = 0;
$timer_op   = "";

###############################################################################
# elapsedTime
# - Returns a string describing the elapsed time between to time() calls.
# - Input arg $_[0] is the difference between the time() calls.
###############################################################################

sub elapsedTime
{
	$seconds = $_[0];
	$minutes = $seconds / 60;
	$hours = int($minutes / 60);
	$minutes = int($minutes - ($hours * 60));
	$seconds = int($seconds - ($minutes * 60));
	return $hours." hrs ".$minutes." min ".$seconds." sec";
}

###############################################################################
# clock/unclock
# - Provides simple timing; a set of clock/unclock calls delimit a timing interval.
# - Both clock and unclock print start/end timing status to the output file handle.
# - clock/unclock blocks cannot be nested.  Unmatched or nested calls cause
#   warnings to be printed out.
###############################################################################

sub clock
{
	if ($timer_op ne "")
	{
		print "Warn: new clock interrupting previous clock for $timer_op!\n";
	}

	$timer_op = $_[0];
	$timer = time;
	print "Starting [$timer_op] at ".localtime($timer)."\n";
}


sub unclock
{
	if ($_[0] ne $timer_op)
	{
		print "Warn: unclock mismatch, $_[0] vs. $timer_op!\n";
	}
	else
	{
		print "Finished [$timer_op], elapsed: ".elapsedTime(time-$timer)."\n";
	}

	$timer_op = "";
}

###############################################################################

sub BuildDocs
{
	print "Updating UnrealEngine3 DoxyGen doc . . .\n";
	system("$doxygen $doxyfileUE3 -u > $doxyUE3Logfile-update 2>&1");

	print "Building UnrealEngine3 documentation . . .\n";
	system("$doxygen $doxyfileUE3 > $doxyUE3Logfile 2>&1");

	# Copy off the compiled html files and kill temps.
	system("copy ..\\Documentation\\html\\UnrealEngine3.chm ..\\Documentation\\");

	if ( $deleteTempFiles == 1 )
	{
		system("rmdir /s /q ..\\Documentation\\html\\");
	}
}

###############################################################################
# main

clock "DOCUMENTATION";
BuildDocs;
unclock "DOCUMENTATION";
