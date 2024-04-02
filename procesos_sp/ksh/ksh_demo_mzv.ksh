##variables
export ksh_name=$1
export sp_name=$2
export log="../log/${ksh_name}_`date +%Y%m%d`.log"
export file_ctrl="../log/${ksh_name}ctrol"
export log_sp="../log/${ksh_name}tmp"
##
##functions
logger(){
    echo `date +%Y/%m/%d` `date +%H:%M:%S` $1 | tee -a $log
}
##
##main
. ../variables_entorno.ksh

logger "======================================================"
logger "Start $ksh_name"
##File control
if test -s $file_ctrl
then
    logger "Active process exists!!!"
    logger "End $ksh_name"
    exit 1
fi
echo "Do not delete!!!!" > $file_ctrl
##
##do
cat <<EOF | sqlplus -s $ORA_LOGIN/$ORA_PASSWORD@$ORACLE_SID > $log_sp
    set feedback off;
    set timing on;
    set serveroutput on size 1000000;
    WHENEVER SQLERROR EXIT FAILURE
    execute $sp_name;
    exit;
EOF
##
status_db=$?
cat $log_sp | tee -a  $log
##Error control
echo "Status: ${status_db}" | tee -a  $log
if [ ! $status_db = "0" ]
then
    rm -f $file_ctrl
    rm -f $log_sp
    logger "End with error $ksh_name !!!!"
    echo >&2 "End with error!!!!, view log file"
    exit 2   
fi
##
##clean
rm -f $file_ctrl
rm -f $log_sp
##
logger "End $ksh_name"
