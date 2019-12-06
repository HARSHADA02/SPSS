



data amt;
set WORK.RETV3;
Revenue= Total_Collection-Total_Sales;
proc print data=amt;
run;


%macro calc(var1, var2);

proc freq data=&var1.;
tables &var2.;
run;

%mend;
%calc( WORK.RETV3, Head);



%macro calc(var1, var2);

proc univariate data=&var1.;
var &var2.;
run;

%mend;
%calc( WORK.amt, Total_Collection);


data Job;
input Employee_ID Job_Title$15. Birth_Date$10.;
datalines;
120104 Sales Manager 11/01/2015
120105 Sales Rep     15/01/2015
120106 Sales Rep     19/01/2015
120107 Sales Manager 23/01/2015
120108 Sales Rep     09/01/2015
120109 Sales Manager 17/01/2015
120110 Sales Rep     12/01/2015
120111 Sales Rep     24/01/2015
120112 Sales Manager 29/01/2015
120113 Sales Rep     30/01/2015

run;



data Job1;
input Employee_ID First_Name$ Salary;
datalines;
120104 Tom     10000
120105 Wilson  12000
120106 Martin  15000
120119 Ricky   17000
120120 Steve   19000
120121 Marvan  21000
120122 Sachin  22000
120123 Ajay    25000
120124 Ajit    27000
120127 Andrew  28000

run;


data emp;
merge Job(in=a) Job1(in=b);
by Employee_ID;
if a=0and b=1;
proc print data=emp;
run;



proc print data=WORK.amt;
TITLE "Health Spring";
FOOTNOTE "Thank You";
run;




TITLE "Health Spring";
FOOTNOTE "Thank You";




data amt9;
input ID Name$7. Job$15.;
datalines;
1 Akshay Data Ana
2 Rohit  Sr Sci
3 Aniket SrSci
run;


/*Format */
proc format;
value tier
25-40="tier1"
41-55="tier2"
56-70="tier3";
run;


/*Date Format*/
data amt1;
set SASHELP.AIR;
format DATE DDMMYY10.;

proc print data=amt1;
run;

/*Calculations*/
data amount;
amt=5000;
rate=0.05;

do year=2010 to 2018;
amount+amt*rate;
output;
end;
run;




data Job8;
input Employee_ID First_Name$ Salary Title$;
datalines;
120104 Tom     10000 Mr.
120105 Wilson  12000 Mr.
120106 Martin  15000 Mr.
120119 Ricky   17000 Mrs.
120120 Steve   19000 Mr.
120121 Marvan  21000 Mrs.
120122 Sachin  22000 Mr.
120123 Ajay    25000 Mrs.
120124 Ajit    27000 Mr.
120127 Andrew  28000 Mrs.

run;



data funn;
set WORK.JOB8;
Name=catt("",Title, First_Name);
keep Name Employee_ID Salary;
proc print data=funn;
run;

data funn;
set WORK.JOB8;
Name=catt("",Title, First_Name);
keep Name Employee_ID Salary;
proc print data=funn;
run;
