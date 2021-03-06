/*
 * 8-4
 * Repeat prob 8-3, except request the SNK (student-newman-Keuls) multiple
 * comparison test. Because this test has a slightly higher power to detect
 * group differences, is the difference between the levels Rarely and Sometimes
 * significant at the the 0.05 level?
 */

/*
 *
 * Task code generated by SAS Studio 3.6 
 *
 * Generated on '9/17/17, 8:41 PM' 
 * Generated by 'sasdemo' 
 * Generated on server 'LOCALHOST' 
 * Generated on SAS platform 'Linux LIN X64 2.6.32-642.6.2.el6.x86_64' 
 * Generated on SAS version '9.04.01M4P11092016' 
 * Generated on browser 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:55.0) Gecko/20100101 Firefox/55.0' 
 * Generated on web client 'http://localhost:10080/SASStudio/36/main?locale=en_US&zone=GMT-05%253A00&http%3A%2F%2Flocalhost%3A10080%2FSASStudio%2F36%2F=' 
 *
 */

Title;
ods noproctitle;
ods graphics / imagemap=on;

proc glm data=WORK.DIABETES;
	class Diet_Drinks;
	model Glucose=Diet_Drinks;
	means Diet_Drinks / snk alpha=.05 hovtest=levene welch plots=none;
	lsmeans Diet_Drinks / alpha=.05;
	run;
quit;

/* 
 * Means of Rarely and Sometimes are sig diiferent at 0.05 level.
*/