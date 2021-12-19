* Dataset Reading;
* #データセットの読み込み;
libname Men50 "C:\Users\sysadm\Desktop\temp";

data Men50.males;
  set sasuser.admit;
  where sex='M' and age>50;
run;

proc print data=Men50.males;
  title "Men Over 50";
run;