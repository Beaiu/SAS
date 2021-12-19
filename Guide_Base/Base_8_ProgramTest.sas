* プログラムのテスト;

* オブザベーションの制限;
data perm.update;
    infile invent obs=10;
    input item $ 1-13 IDnum $ 15-19 InStock 21-22 BackOrd 24-25;
    Total=instock+backord;
run;

* PUTステートメントを使用して、変数の値を調べ、ログに独自のメッセージを印字する;
* 1.文字列をPUTする;
put 'MY NOTE: The condition was met.';
* 2.データセット変数をPUTする;
  * 2.1変数の値だけがログに書き出される;
put 'MY NOTE: invalid value: ' code type;
  * 2.2変数名とその値をログに出力するためには、=を変数名に追加する;
put 'MY NOTE: invalid value: ' code= type=;
* 3.自動変数_N_や_ERROR_;
put 'MY NOTE: invalid value: ' code= _n_= _error_=;
* 4.自動変数_ALL_;
put 'MY NOTE: invalid value: ' _all_
* 条件付き処理の利用ケース⇒[Base_10_IF.sas];
data clinic.stress;
    infile test;
    input ID $ 1-4 Name $ 6-25 RestHR 27-29 MaxHR 31-33 RecHR 35-37 TimeMin 39-40 TimeSec 42-43 Tolerance $ 45;
    TotalTime=(timemin*60)+timesec;
    if totaltime>800 then TestLength='Long';
    else if 750<=totaltime<=800 then TestLength='Normal';
    else if totaltime<750 then TestLength='Short';
    else put 'NOTE: Check this Length: 'totaltime=;
run;