# Wiki

### Running locally
Because the image runs on the default port you will need to disable postgres locally.

```
sudo systemctl stop postgresql
```

### Connecting
If you are connecting from a application that is using a docker then you need to make sure both containers are in the same network.

In the application that is trying to conect to postgres set the database host to the name of the network.

If you are connectiong from a application that is not using docker then you need to get the ip address of your machine.