* ダイレクト・アクセスを利用したオブザベーションの読み込み;
* SETステートメントでPOINTオプションを利用;

* SETステートメントが実行される前に値が与えられなければなりません;
* ダイレクト・アクセスを使用してデータを読み込む場合には、ファイルの終端条件が存在しないため、STOPステートメントを使用して無限ループを防がなければなりません;
* STOPステートメントによって、現在のDATAステップの処理をすぐに中止し、出力にオブザベーションも書き出しません;
data work.getobs5;
    obsnum=5;
    set company.usa(keep=manager payroll) point=obsnum;
    stop;
run;

* 明示的なオブザベーションの書き出し;
* OUTPUT <SAS-data-sets>;
* データセット名を指定しないで使用すると、DATAステートメントで名前を指定された全てのデータセットに現在のオブザベーションが書き出される;
data work.getobs5;
    obsnum=5;
    set company.usa(keep=manager payroll) point=obsnum;
    output;
    stop;
run;
* 下記の例で2つの一時データセットを作成する。結果としてEmptyは作成されるが、オブザベーションを含まず、FullにはCompany.usaからの全てを含む;
data empty full;
    set company.usa;
    output full;
run;
