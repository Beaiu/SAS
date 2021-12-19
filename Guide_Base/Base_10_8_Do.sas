* DOグループを使用したグループ化ステートメント;
* DOグループを使用することによって、ステートメントのグループを一つの単位として実行することもできる;

* 例1;
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

    if totaltime>800 then
        do;
            testlength='Long';
            message='Run blood panel';
        end;

    else if 750<=totaltime<=800 then TestLength='Normal';
    else if totaltime<750 then TestLength='Short';
run;

* 例2;
data payroll;
    set salaries;
    select (payclass);
        when ('monthly') amt=salary;
        when ('hourly')
            do;
                amt=hrlywage*min(hrs,40);
                if hrs>40 then put 'CHECK TIMECARD';
            end;
        otherwise put 'PROBLEM OBSERVATION';
    end;
run;

* DOグループのインデントとネスト;
* 下記のステートメントで表されているように、それらの位置がネストのレベルを示すようにDOグループ内でステートメントをインデントするとよいでしょう;
do;
    ...;
    do;
        ...;
        do;
            ...;
        end;
    end;
end;

* DOステートメントの形式には、他に次の3つがある;
* 1.反復DOステートメント：インデックス変数の値に基づいて、DOとENDステートメントの間のステートメントを繰り返し実行する。WHILE句やUNTIL句を含むことができる;
* 2.DO UNTIL;
* 3.DO WHILD;