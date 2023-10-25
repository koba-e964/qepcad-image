日本語: [README-ja.md](README-ja.md)

## How to build an image

```bash
./build.sh
```
## How to execute

Run locally
```bash
docker run --rm --platform linux/amd64 --interactive --tty qepcad <FILENAME
```

Fetch an image from [Docker Hub](https://hub.docker.com/)
```bash
docker run --rm --platform linux/amd64 --interactive --tty kobae964/qepcad:latest <FILENAME
```
