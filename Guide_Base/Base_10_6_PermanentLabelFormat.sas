* 永久ラベルと永久出力形式の割り当て;
* ラベルと出力形式はPROCステップでは一時的に、DATAステップでは永久的に割り当てられる;

data clinic.stress;
    infile test;
    input ID $ 1-4 Name $ 6-25 RestHR 27-29 MaxHR 31-33 RecHR 35-37 TimeMin 39-40 TimeSec 42-43 Tolerance $ 45;
    if resthr<70 then delete;
    if tolerance='D';
    drop timemin timesec;
    TotalTime=(timemin*60)+timesec;
    retain SumSec 5400;
    SumSec+totaltime;
    length TestLength $ 6;
    if totaltime>800 then TestLength='Long';
    else if 750<=totaltime<=800 then TestLength='Normal';
    else if totaltime<750 then TestLength='Short';

    label sumsec='Cumulative Total Seconds (+5,400)';
    format sumsec comma6.;
run;