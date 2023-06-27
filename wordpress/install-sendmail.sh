echo "==> setting up local FQDN"
echo "127.0.0.1    localhost.localdomain $(hostname)" >> /etc/hosts
echo "==> installing sendmail..."
apt-get update && apt-get -y install sendmail
echo "==> pointing php to sendmail..."
echo 'sendmail_path="/usr/sbin/sendmail -t -i"' >> /usr/local/etc/php/conf.d/sendmail.ini
echo "==> start up sendmail MTA"
service sendmail start
echo "==> restarting apache2"
service apache2 reload
