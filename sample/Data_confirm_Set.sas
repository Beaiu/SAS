libname iqvia "E:\Share\IQVIA\ONCEMR\SFDC2721768_CA\2020_12";

data iqvia.tmp;
set iqvia.emr_observation_result_202010(FIRSTOBS=2731391 obs=2731393);
*uom_desc=compress(uom_desc,'0A'X || '0D'X);
test_value_char=compress(test_value_char,'0A'X || '0D'X);
run;

proc print data=iqvia.tmp;
*proc print data=iqvia.emr_observation_result_202010(FIRSTOBS=2731391 obs=2731393);
*proc print data=iqvia.emr_observation_result_202010(obs=1);
*where not missing(uom_desc) and uom_desc<>'Inches' and uom_desc<>'Lbs'and uom_desc<>'%' and uom_desc<>'10^3/uL';
*where result_id='1091646503';
run;

proc export data=iqvia.tmp outfile="E:\Share\IQVIA\error_20211214\test2_2.csv" dbms=csv replace; 
putnames=yes;
run;