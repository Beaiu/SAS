* 合計変数の初期化;

* RETAINステートメント⇒RETAIN variable (initial-value>);
* 保持される変数に初期値を割り当てる;
* DATAステップの各回の実行で変数が初期化されるのを防ぐ;

data clinic.stress;
    infile test;
    input ID $ 1-4 Name $ 6-25 RestHR 27-29 MaxHR 31-33 RecHR 35-37 TimeMin 39-40 TimeSec 42-43 Tolerance $ 45;
    TotalTime=(timemin*60)+timesec;
    retain SumSec 5400;
    SumSec+totaltime;
run;