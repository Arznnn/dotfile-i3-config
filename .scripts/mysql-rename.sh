#!/bin/bash
 
# Disclaimer - make backups, use at your own risk.
#
# Based on this comment: http://stackoverflow.com/a/13944924/843067
# Views and stored procedures have to be done separately.
 
OLDDB="old_db_name"
NEWDB="new_db_name"
MYSQL="mysql -u root -pyour_password "
 
$MYSQL -e "CREATE DATABASE \`$NEWDB\`;"
 
for table in `$MYSQL -B -N -e "SHOW TABLES" $OLDDB`
do 
  $MYSQL -e "RENAME TABLE \`$OLDDB\`.\`$table\` to \`$NEWDB\`.\`$table\`"
done
 
# You *might not* want to uncoment line below since
# in case of problems while renaming tables
# you will lose all database
 
#mysql -e "DROP DATABASE \`$OLDDB\`;"

## Dump database table
# mysqldump --defaults-file="/tmp/tmpDke0Oq/extraparams.cnf"  --user=root --host=localhost --protocol=tcp --port=3306 --default-character-set=utf8 --single-transaction=TRUE --skip-triggers "APG-IV"
# SELECT * FROM hoeherePflanzen_all INTO OUTFILE "/tmp/hoeherePflanzen_all.csv" FIELDS TERMINATED BY '\t' ENCLOSED BY '"' LINES TERMINATED BY '\n';
