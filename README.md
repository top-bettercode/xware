[![Docker Image](https://img.shields.io/badge/docker%20image-available-green.svg)](https://hub.docker.com/r/bestwu/xware/)

# 迅雷远程下载 xware-docker 镜像

相关：[迅雷极速版镜像](https://hub.docker.com/r/bestwu/thunderspeed/)

## 使用方法

指定一个 volume 挂在到 `/data/TDDOWNLOAD` ，xware 所有下载的东西会保存到这个 volume 中。否则下载的东西会保存到容器中。

```bash
docker run --name xware -v /data/TDDOWNLOAD:/data/TDDOWNLOAD -d bestwu/xware
```

之后，第一次运行 xware 需要绑定一下你的迅雷账号，执行

```bash
docker logs xware
```

会看到类似

```
initing...
try stopping xunlei service first...
killall: ETMDaemon: no process killed
killall: EmbedThunderManager: no process killed
killall: vod_httpserver: no process killed
setting xunlei runtime env...
port: 9000 is usable.

YOUR CONTROL PORT IS: 9000

starting xunlei service...
Connecting to 127.0.0.1:9000 (127.0.0.1:9000)
setting xunlei runtime env...
port: 9000 is usable.

YOUR CONTROL PORT IS: 9000

starting xunlei service...

getting xunlei service info...

THE ACTIVE CODE IS: vghqnv

go to http://yuancheng.xunlei.com, bind your device with the active code.
finished.
```
的内容，把 active code 复制一下，打开 http://yuancheng.xunlei.com 点击 `我的下载器` 旁边的 `添加` 把 active code 输入进去。
