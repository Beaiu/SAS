* 変数の長さの指定;

data clinic.stress;
    infile test;
    input ID $ 1-4 Name $ 6-25 RestHR 27-29 MaxHR 31-33 RecHR 35-37 TimeMin 39-40 TimeSec 42-43 Tolerance $ 45;
    TotalTime=(timemin*60)+timesec;
    retain SumSec 5400;
    SumSec+totaltime;
    
    * コンパイル中に、割り当てステートメントで新しい文字変数が作成される時、SASはその変数に遭遇した最初の文字の値と同じ長さだけ保存するスペースのバイト数を割り当てます;
    * DATAステップ中のいずれかの場所で最初の値が参照される前に、LENGTHステートメントを使用して長さを指定することができる;
    length TestLength $ 6;

    if totaltime>800 then TestLength='Long';
    else if 750<=totaltime<=800 then TestLength='Normal';
    else if totaltime<750 then TestLength='Short';
run;