# Autores: Jaime Garcia Frnacisco
#          Mora Magaña Jose David Divad
# Fecha: 24/01/2021
# Descripcion: Generar esquema de respaldos

mkdir -p /u01/app/oracle/oradata/jamoproy/respaldos_scripts

cat <<'EOF' > /u01/app/oracle/oradata/jamoproy/respaldos_scripts/respaldo_nivel_0.rman
run {
    backup as backupset incremental level 0 database plus archivelog tag faltas_civicas_backup_nivel_0_1;
    delete obsolete;
}
EOF

cat <<'EOF' > /u01/app/oracle/oradata/jamoproy/respaldos_scripts/respaldo_nivel_1.rman
run {
    backup as backupset incremental level 1 database plus archivelog tag faltas_civicas_backup_nivel_1_1;
    delete obsolete;
}
EOF

cat <<'EOF' > /u01/app/oracle/oradata/jamoproy/respaldos_scripts/respaldo_full.rman
run {
    backup database plus archivelog tag faltas_civicas_full;
    delete obsolete;
}
EOF

cat <<'EOF' > /u01/app/oracle/oradata/jamoproy/respaldos_scripts/run_respaldo_niv0.sh
#!/bin/bash
ORACLE_SID=jamoproy; export ORACLE_SID
ORACLE_TERM=xterm; export ORACLE_TERM
ORACLE_HOME=/u01/app/oracle/product/18.0.0/dbhome_1; export ORACLE_HOME
PATH=/usr/sbin:$PATH; export PATH
PATH=$ORACLE_HOME/bin:$PATH; export PATH
LD_LIBRARY_PATH=$ORACLE_HOME/lib:/lib:/usr/lib; export LD_LIBRARY_PATH
CLASSPATH=$ORACLE_HOME/jlib:$ORACLE_HOME/rdbms/jlib; export CLASSPATH
rman target / @'/u01/app/oracle/oradata/jamoproy/respaldos_scripts/respaldo_nivel_0.rman'
EOF

cat <<'EOF' > /u01/app/oracle/oradata/jamoproy/respaldos_scripts/run_respaldo_niv1.sh
#!/bin/bash
ORACLE_SID=jamoproy; export ORACLE_SID
ORACLE_TERM=xterm; export ORACLE_TERM
ORACLE_HOME=/u01/app/oracle/product/18.0.0/dbhome_1; export ORACLE_HOME
PATH=/usr/sbin:$PATH; export PATH
PATH=$ORACLE_HOME/bin:$PATH; export PATH
LD_LIBRARY_PATH=$ORACLE_HOME/lib:/lib:/usr/lib; export LD_LIBRARY_PATH
CLASSPATH=$ORACLE_HOME/jlib:$ORACLE_HOME/rdbms/jlib; export CLASSPATH
rman target / @'/u01/app/oracle/oradata/jamoproy/respaldos_scripts/respaldo_nivel_1.rman'
EOF

cat <<'EOF' > /u01/app/oracle/oradata/jamoproy/respaldos_scripts/run_respaldo_full.sh
#!/bin/bash
ORACLE_SID=jamoproy; export ORACLE_SID
ORACLE_TERM=xterm; export ORACLE_TERM
ORACLE_HOME=/u01/app/oracle/product/18.0.0/dbhome_1; export ORACLE_HOME
PATH=/usr/sbin:$PATH; export PATH
PATH=$ORACLE_HOME/bin:$PATH; export PATH
LD_LIBRARY_PATH=$ORACLE_HOME/lib:/lib:/usr/lib; export LD_LIBRARY_PATH
CLASSPATH=$ORACLE_HOME/jlib:$ORACLE_HOME/rdbms/jlib; export CLASSPATH
rman target / @'/u01/app/oracle/oradata/jamoproy/respaldos_scripts/respaldo_full.rman'
EOF



chown -R oracle:oinstall /u01/app/oracle/oradata/jamoproy/respaldos_scripts
chmod -R 755 /u01/app/oracle/oradata/jamoproy/respaldos_scripts

cat <<'EOF' > /var/spool/cron/oracle
0 12 * * 7 /u01/app/oracle/oradata/jamoproy/respaldos_scripts/run_respaldo_niv0.sh
0 12 * * 1,2,3,4,5,6 /u01/app/oracle/oradata/jamoproy/respaldos_scripts/run_respaldo_niv1.sh
0 12 1 * * /u01/app/oracle/oradata/jamoproy/respaldos_scripts/run_respaldo_full.sh
EOF

chmod 600 /var/spool/cron/oracle