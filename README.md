

### Lesson 11 Jenkins CI CD ###

To do this, you just bind mount to the host system daemon, using this argument when you run Docker:
:
```sh
$ docker run -d -p 8080:8080 -p 50000:50000 -v /var/run/docker.sock:/var/run/docker.sock jenkins

```

