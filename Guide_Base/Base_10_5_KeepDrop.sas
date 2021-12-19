* データのサブセット化;

* 不要なオブザベーションの削除;
* DELETEステートメントを持つIF-THENステートメントを使用;
* !PROCステップでDROP・KEEPステートメントを使用できません;
data clinic.stress;
    infile test;
    input ID $ 1-4 Name $ 6-25 RestHR 27-29 MaxHR 31-33 RecHR 35-37 TimeMin 39-40 TimeSec 42-43 Tolerance $ 45;
    
    if resthr<70 then delete;
    
    TotalTime=(timemin*60)+timesec;
    retain SumSec 5400;
    SumSec+totaltime;
    length TestLength $ 6;
    if totaltime>800 then TestLength='Long';
    else if 750<=totaltime<=800 then TestLength='Normal';
    else if totaltime<750 then TestLength='Short';
run;

* 変数の選択;
* DROP=とKEEP=オプション・ステートメントを使用;
* 例1;
data clinic.stress(drop=timemin timesec);
    infile test;
    input ID $ 1-4 Name $ 6-25 RestHR 27-29 MaxHR 31-33 RecHR 35-37 TimeMin 39-40 TimeSec 42-43 Tolerance $ 45;
    if tolerance='D';
    TotalTime=(timemin*60)+timesec;
    retain SumSec 5400;
    SumSec+totaltime;
    length TestLength $ 6;
    if totaltime>800 then TestLength='Long';
    else if 750<=totaltime<=800 then TestLength='Normal';
    else if totaltime<750 then TestLength='Short';
run;
* 例2;
data clinic.stress;
    infile test;
    input ID $ 1-4 Name $ 6-25 RestHR 27-29 MaxHR 31-33 RecHR 35-37 TimeMin 39-40 TimeSec 42-43 Tolerance $ 45;
    if tolerance='D';
    drop timemin timesec;
    TotalTime=(timemin*60)+timesec;
    retain SumSec 5400;
    SumSec+totaltime;
    length TestLength $ 6;
    if totaltime>800 then TestLength='Long';
    else if 750<=totaltime<=800 then TestLength='Normal';
    else if totaltime<750 then TestLength='Short';
run;