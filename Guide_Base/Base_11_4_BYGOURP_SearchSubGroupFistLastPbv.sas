* Use case of BY GROUP;
* #BY GROUP#サブグループの最初と最後のオブザベーションの検索#FIRST.variable #LAST.variable;

* 複数BY変数を指定する場合、各変数に対するFIRST.variableは変数の新しい値が最初に表れる際に1に設定される;
* 最初のBY変数の値が変更されると、2番目のBY変数に対してもLAST.variableが1に設定される;

* 各マネージャに対するジョブタイプによって年間支払給料を計算する;
proc sort data=company.usa out=work.temp2;
    by manager jobtype;
run;
data company.budget2(keep=manager jobtype payroll);
    set work.temp2;
    by manager jobtype;
    if wagecat='S' then Yearly=wagerate*12;
    else if wagecat='H' then Yearly=wagerate*2000;
    if first.jobtype then Payroll=0;
    payroll+yearly;
    if last.jobtype;
run;
* 部門ごとの年間支払給料の一覧と合計;
proc print data=company.budget noobs;
    sum payroll;
    format payroll dollar12.2;
run;