*https://documentation.sas.com/doc/en/pgmsascdc/9.4_3.5/acreldb/n0u88501m7h5vjn1q2x29s6urjmx.htm;
libname _rs redshift 
server="idap-val-redshift-cluster-1.c74ajfehzjqi.ap-northeast-1.redshift.amazonaws.com"
port=5439 
user=***
password='***'
schema=***
database=***;

libname iqvia "E:\Share\IQVIA\ONCEMR\SFDC2721768_CA\2020_12";

data _rs.iqvia_emr_300_202010
(bulkload=yes
 bl_bucket='***'
 bl_region='ap-northeast-1'
 bl_key='***'
 bl_secret='***'
 bl_use_manifest=yes
 );
  set iqvia.emr_observation_result_202010;
* エラーデータの改行コードの削除;
*  uom_desc=compress(uom_desc,'0A'X || '0D'X);
*  test_value_char=compress(test_value_char,'0A'X || '0D'X);

run;