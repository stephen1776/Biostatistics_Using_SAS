/*
 * Programmer: Stephen Blatti
 * 09/07/2017
 * 5-3
 * Create a temporary SAS data set (call it BP) from the Excel workbook
 * Blood_Pressure.xlsx. Using this data set, study the distribution of 
 * the two variables SBP and DBP. What does the Kolmogorov-Smirnov
 * test tell you about these two varables? Include a request for a 
 * histogram and a Q-Q plot.
 */

/* Generated Code (IMPORT) */
/* Source File: Blood_Pressure.xlsx */
/* Source Path: /folders/myfolders/Biostatistcs by Example/problems */
/* Code generated on: 9/7/17, 8:12 PM */

%web_drop_table(WORK.BP);


FILENAME REFFILE '/folders/myfolders/Biostatistcs by Example/problems/Blood_Pressure.xlsx';

PROC IMPORT DATAFILE=REFFILE
	DBMS=XLSX
	OUT=WORK.BP;
	GETNAMES=YES;
RUN;

PROC CONTENTS DATA=WORK.BP; RUN;


%web_open_table(WORK.BP);

/*
 *
 * Task code generated by SAS Studio 3.6 
 *
 * Generated on '9/7/17, 8:15 PM' 
 * Generated by 'sasdemo' 
 * Generated on server 'LOCALHOST' 
 * Generated on SAS platform 'Linux LIN X64 2.6.32-642.6.2.el6.x86_64' 
 * Generated on SAS version '9.04.01M4P11092016' 
 * Generated on browser 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:55.0) Gecko/20100101 Firefox/55.0' 
 * Generated on web client 'http://localhost:10080/SASStudio/36/main?locale=en_US&zone=GMT-05%253A00' 
 *
 */

ods noproctitle;
ods graphics / imagemap=on;

/*** Exploring Data ***/
proc univariate data=WORK.BP;
	ods select Histogram;
	var SBP DBP;
	histogram SBP DBP;
run;

proc univariate data=WORK.BP;
	ods select Histogram GoodnessOfFit QQPlot;
	var SBP DBP;

	/*** Checking for Normality ***/
	histogram SBP DBP / normal(mu=est sigma=est);
	qqplot SBP DBP / normal(mu=est sigma=est);
run;