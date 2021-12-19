* 条件付きでの値の割り当て;

* 演算子：=(eq)、^=(ne)、>(gt)、<(lt)、>=(ge)、<=(le)、in、&(and)、|(or)、^/-(not);

data clinic.stress;
    infile test;
    input ID $ 1-4 Name $ 6-25 RestHR 27-29 MaxHR 31-33 RecHR 35-37 TimeMin 39-40 TimeSec 42-43 Tolerance $ 45;
    TotalTime=(timemin*60)+timesec;
    retain SumSec 5400;
    SumSec+totaltime;
    if totaltime>800 then TestLength='Long';
    if test<85 and time<=20 then Status='RETEST';
    if region in ('NE','NW','SW') then Rate=fee-25;
    if target gt 300 or sales ge 50000 then Bonus=salary*.05;
    if (age^=agecheck | time^=3) & error=1 then Test=1;
    if region not in ('NE','SE') then Bonus=200;
    if not(loghours<7500) then Schedule='Quarterly';

    * ELSEステートメントは、前のIF-THEN/ELSEステートメントが偽である場合にのみ実行される;
    * IF-THENステートメントと同時にELSEステートメントを使用してリソースを節約することができる;
    if totaltime>800 then TestLength='Long';
    else if 750<=totaltime<=800 then TestLength='Normal';
    else if totaltime<750 then TestLength='Short';

    * PUTステートメントを使用して条件付きロジックをテストできる;
    else put 'NOTE: Check this Length: 'totaltime=;
run;