# SSL

you will need to enable the SSL hack in the `wp-config.php` file, just uncomment the hack to enable it.

Next you will need to replace the stupid hard coded links inside the database. 

Assuming your wp instance is called `foo`:

```shell
# first jump into the mysql container:
$ docker exec -it wp-db-foo /bin/bash
# now log into the database
$ mysql -u root -p
# connect to your database
$ use wordpress;
# change both home and siteurl:
$ update wp_options set option_value = 'https://foo.com' where option_name in('home', 'siteurl');
```

