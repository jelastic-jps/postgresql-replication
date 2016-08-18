#!/bin/bash
#master/slave ${nodes.sqldb[1].address} ${nodes.sqldb.password} ${nodes.sqldb[0].address}
SLAVE_IP=$2
DB_PASSWORD=$3
PGSQL_DATA="/var/lib/pgsql/data/"


if [ "${1}" == "master" ]; then
echo "host replication  postgres       ${SLAVE_IP}/32    trust" >> ${PGSQL_DATA}pg_hba.conf;
sed -i "s|.*wal_level.*|wal_level = hot_standby|g" ${PGSQL_DATA}postgresql.conf;
sed -i "s|.*max_wal_senders.*|max_wal_senders = 2|g" ${PGSQL_DATA}postgresql.conf
sed -i "s|.*wal_keep_segments.*|wal_keep_segments = 32|g" ${PGSQL_DATA}postgresql.conf
sudo /etc/init.d/postgresql stop
sudo /etc/init.d/postgresql start

fi
#тушим слейв
if [ "${1}" == "slave" ]; then
    sudo /etc/init.d/postgresql stop
fi

if [ "${1}" == "master2" ]; then
PGPASSWORD=${DB_PASSWORD} psql -Uwebadmin postgres -c "SELECT pg_start_backup('label', true);"
rsync -va ${PGSQL_DATA} rsync://admin@${2}/varwwwwebroot --port=7755 --password-file=${PGSQL_DATA}lsyncd/etc/rsyncd.pass
PGPASSWORD=${DB_PASSWORD} psql -Uwebadmin postgres -c "SELECT pg_stop_backup()"

fi

#На слейве
if [ "${1}" == "slave2" ]; then
sed -i "s|.*hot_standby.*|hot_standby = on|g" ${PGSQL_DATA}postgresql.conf
cp -r /usr/pgsql-9.5/share/recovery.conf.sample ${PGSQL_DATA}recovery.conf
sed -i "s|.*standby_mode.*|standby_mode = on|g" ${PGSQL_DATA}recovery.conf
sed -i "s|.*primary_conninfo.*|primary_conninfo = 'host=${4} port=5432'|g" ${PGSQL_DATA}recovery.conf
sed -i "s|.*max_wal_senders.*|#max_wal_senders.*|g" ${PGSQL_DATA}postgresql.conf
#max_wal_senders
sudo /etc/init.d/postgresql start
fi
