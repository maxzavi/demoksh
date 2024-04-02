# KSH demo

KSH: type od command interpreters or "shells" in Unix/Linux SO

## Retalive path:

```cmd
../../aaa.ksh
```

## Set variables:

```cmd
export ksh_name="ksh_demo"
```

## Variables

Use variables ```${myvarible}``` or ```$myvarible````

## Echo fila and console

Echo console or file, and both: ```| tee $logfile````


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


## $# status

## sqlplus

```sql
    set timing on; --Show timing execution
    WHENEVER SQLERROR EXIT FAILURE --Error control
```




