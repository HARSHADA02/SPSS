/* Print Data*/
proc print data=WORK.RETV3;
run;

/* Frequency*/
proc freq data=WORK.RETV3;
tables Center*Region/crosslist;
run;
/* Where*/
proc print data=WORK.RETV3;
where Region="Mumbai" and Date like '17%';
run;

/* New Column*/
data amt;
set WORK.RETV3;
Revenue= Total_Collection-Total_Sales;
proc print data=amt;
run;

/* Means*/
proc means data=WORK.AMT;
var Revenue;
run;

/* Univariate*/
proc univariate data=WORK.AMT;
var Revenue;
run;


data car1;
set SASHELP.CARS;
where Make in('Honda', 'Hyundai');
proc print data=car1;
run;



data Audi BMW Jaguar;
set SASHELP.CARS;
if Make="Audi" then output Audi;else
if Make="BMW" then output BMW;else
if Make="Jaguar" then output Jaguar;
run;


/* OUTPUT DELIVERY SYSTEM Excel*/

ODS excel

FILE="C:\Users\User26\Desktop\Batch 2\car1.xlsx"
;

proc print data=WORK.AMT;
where Revenue > 20000;
run;

ODS EXCEL CLOSE;

/* OUTPUT DELIVERY SYSTEM PDF*/
ODS pdf

FILE="C:\Users\User26\Desktop\Batch 2\car2.pdf"
;

proc print data=WORK.AMT;

run;

ODS PDF CLOSE;

/* OUTPUT DELIVERY SYSTEM RTF*/
ODS rtf

FILE="C:\Users\User26\Desktop\Batch 2\car3.rtf"
;

proc freq data=WORK.AMT;
tables Center*Head/crosslist; 
run;

ODS RTF CLOSE;

proc sort data=WORK.AMT out=amt8;
by  Revenue; 
run;

/* Sampling*/
proc print data=WORK.AMT (obs=10);
run;




/* OUTPUT DELIVERY SYSTEM HTML*/
ODS html

FILE="C:\Users\User26\Desktop\Batch 2\car4.html"
;

proc print data=WORK.AMT (obs=10);
run;
ODS HTML CLOSE;

/* First Dot Last Dot*/
data amt9;
set WORK.EMP5;
by Center;
if first.Center=0 then Rev=0;
Rev+Revenue;
if last.Center=1;
proc print data=amt9;
run;
















