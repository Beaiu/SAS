* Use case of BY GROUP;
* #BY GROUP#グループの最初と最後のオブザベーションの検索#FIRST.variable #LAST.variable;

* SETステートメントと共にBYステートメントを使用する場合、SETステートメントに列記されるデータセットは（複数の）BY変数の値によって並べ替えられているか、適切なインデックスを持たなければなりません;
* DATAステップは各BY変数に対して、一時変数FIRST.variableとLAST.variableを作成する。variableはBY変数名、これらの値は1または0。各BYグループの最初と最後のオブザベーションを識別する;

proc sort data=company.usa out=work.temp;
    by dept;
run;
* 部門ごとの年間支払い料の計算;
data company.budget(keep=dept payroll);
    set work.temp;
    by dept;
    if wagecat='S' then Yearly=wagerate*12;
    else if wagecat='H' then Yearly=wagerate*2000;
    if first.dept then Payroll=0;
    payroll+yearly;
    if last.dept;
run;
* 部門ごとの年間支払給料の一覧と合計;
proc print data=company.budget noobs;
    sum payroll;
    format payroll dollar12.2;
run;