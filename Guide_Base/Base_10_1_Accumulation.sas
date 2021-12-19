* 累積合計;
* #累積#合計ステートメント;

* 一般形式⇒variable+expression;
* プラス記号の左側にある数値変数に、プラス記号の右側にある式の結果を追加する;
* 割り当てステートメントと同様に、合計ステートメントはキーワードを含みません;
* 数値変数はDATAステップ先頭で欠損値に設定せずに、プログラム・データベクトル内の新しい値を保持する;
* 変数は最初のオブザベーションを読み込む前に自動的に0に設定される;

data clinic.stress;
    infile test;
    input ID $ 1-4 Name $ 6-25 RestHR 27-29 MaxHR 31-33 RecHR 35-37 TimeMin 39-40 TimeSec 42-43 Tolerance $ 45;
    TotalTime=(timemin*60)+timesec;
    SumSec+totaltime;
run;