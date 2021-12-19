* Dataset Process;
* #データ加工;
data lab23.drug1h(drop=placebo uric);
  * DROP/KEEPをデータセット名に記述されるどの場所にでも指定することができる;
  * DROPを使用してもこのDATAステップ内には利用可能;
  set research.cltrials(drop=triglyc);

  * 不要な変数の削除;
  drop timemin timesec;

  * データのサブセット化;
  if sex='M' then delete;
  if placebo='Yes';

  * 変数の作成と編集;
  TestDate='22MAY19999' d;

  * 合計変数の初期化;
  retain Days 30;

  * 合計の累積変数;
  days+1;

  * 変数の長さの指定;
  length Retest $ 5;

  * 条件付きステートメントの実行;
  if cholesterol>190 then retest='YES';
  else if 150<=cholesterol<=190 then retest='CHECK';
  else if cholesterol<150 then retest='NO';

  * 変数へのラベルづけ;
  label retest='Perform Cholesterol Test 2?';

  * 変数への出力形式適用;
  format enddate mmddyy10.;
run;