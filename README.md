# KSH demo

KSH: type of command interpreters or "shells" in Unix/Linux SO

## Retalive path:

```cmd
../../aaa.ksh
```

## Set variables:

```cmd
export ksh_name="ksh_demo"
```

## Variables

Use variables ```${myvarible}``` or ```$myvarible```

## Echo fila and console

Echo console or file, and both: ```| tee $logfile```


## Tee command

```| tee -a $logfile``` Add to file

```| tee $logfile``` Create new file and add to it

## Functions and parameters

```ksh
myfunction() {
  echo $1
}

myfunction "message"
```

## Error control

```exit 1``` and ```echo >&2 "End with error!!!!, view log file"```


## $? status
## sqlplus

```sql
    set timing on; --Show timing execution
    WHENEVER SQLERROR EXIT FAILURE --Error control
```

```ksh
echo "Status: ${status_db}" | tee -a  $log
if [ ! $status_db = "0" ]
then
    rm -f $file_ctrl
    rm -f $log_sp
    logger "End with error $ksh_name !!!!"
    echo >&2 "End with error!!!!, view log file"
    exit 2   
fi
```

## call ksh from ksh

```ksh
. ksh_demo_mzv.ksh "ksh_cstavg_demo" "epmm.cstavgsch('Xxxx')" 
```

Use parameters and set variables:

```ksh
export ksh_name=$1
export sp_name=$2
```



