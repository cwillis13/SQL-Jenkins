sqlcmd -U ${SQLSECADM} -P ${SQLSECPASS} -S ${SQLINST} -Q "execute msdb.dbo.sp_start_job @job_name='Grant Jenkins DDL_Admin'"
