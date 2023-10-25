English: [README.md](README.md)

## イメージ構築方法

```bash
./build.sh
```
## 実行方法

手元で実行する
```bash
docker run --rm --platform linux/amd64 --interactive --tty qepcad <FILENAME
```

[Docker Hub](https://hub.docker.com/) からイメージを取得する
```bash
docker run --rm --platform linux/amd64 --interactive --tty kobae964/qepcad:latest <FILENAME
```
