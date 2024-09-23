
``` Env
nunit:
    deploy:
      resources:
        limits:
          cpus: '1'
          memory: 512M
          pids: 1
        reservations:
          cpus: '1'
          memory: 512M
```