* SELECTグループの利用による条件付きでの値の割り当て;

* 基本的なSELECTグループ;
select (a);
    when (1) x=x*10;
    when (3,4,5) x=x*100;
    otherwise;
end;

* 例：DATAステップのSELECTグループ;
* 変数JobCodeの値に基づいて変数Groupの値を割り当てている;
data emps(keep=salary group);
    set sasuser.payrollmaster;
    length Group $ 20;
    select(jobcode);
        when ("FA1") group="Flight Attendant I";
        when ("FA2") group="Flight Attendant II";
        when ("FA3") group="Flight Attendant III";
        when ("ME1") group="Mechanic I";
        when ("ME2") group="Mechanic II";
        when ("ME3") group="Mechanic III";
        when ("NA1") group="Navigator I";
        when ("NA2") group="Navigator II";
        when ("NA3") group="Navigator III";
        when ("TA1","TA2","TA3") group="Ticket Agents";
        otherwise group="Other";
    end;
run;

* 式を持つSELECTステートメントの指定;
* すべてのSELECT-WHEN比較の結果が偽で、OTHERWISEステートメントが指定されなければ、SASはエラー・メッセージを発行し、DATAステップの実行を中止する;
select (toy);
    when ("Bear") price=35.00;
    when ("Violin") price=139.00;
    when ("Top","Whistle","Duck") price=7.99;
    otherwize put "Check unknown toy: " toy=;
end;

* 式を持たないSELECTステートメントの指定;
* Select式を指定しなければ、SASは真または偽の結果を作成するために各When式を評価する;
* 2つ以上のWHENステートメントが真のWhen式を持つならば、最初のWHENステートメントのみが使用される;
select;
    when (toy="Bear" and month in ("OCT","NOV","DEC")) price=45.00;
    when (toy="Bear" and month in ("JAN","FEB")) price=25.00;
    when (toy="Bear") price=35.00;
    otherwise;
run;