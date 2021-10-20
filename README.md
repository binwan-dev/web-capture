# web-capture

## 依赖库&编译工具

* ffmpeg-3.4.9
* emscripten-2.0.21
* emsdk

## 支持所有常见视频编码及格式

## Linux系统编译

### 1. 安装[emsdk](https://github.com/emscripten-core/emsdk)

### 2. 编译ffmpeg
下载 [ffmpeg-3.4.9.tar.xz](http://ffmpeg.org/releases/ffmpeg-3.4.9.tar.xz)
``` shell
chmod +x ./script/build_ffmpeg-emcc.sh
./script/build_ffmpeg-emcc.sh "your ffmpeg dir path"
```
### 3. 运行 `npm run build` 编译项目

## demo运行

```
npm install

npm run server

http://localhost:3000/demo/index.html

```

## 使用

可以参考 `demo/index.html`, 示例如下

```js

 window.webCapture.capture(file, timeInput.value * 1000, (dataURL, imageInfo) => {

    const { width, height, duration } = imageInfo;

    resultContainer.innerHTML = `<img src="${dataURL}" />`

    infoContainer.innerHTML = `耗时：${Date.now() - startTime}ms<br>宽度：${width}<br>高度：${height}<br>时长：${duration / 1000000}s`;
})

```

## 本地编译

```
npm run build
```

通过 npm run build 编译项目，最终产物在 dist 目录下

## 参考文章

https://www.jianshu.com/p/d08c0cff8a77
https://juejin.im/entry/5afd7963f265da0ba3524439
http://dranger.com/ffmpeg/tutorial01.html
https://zhuanlan.zhihu.com/p/40786748
https://blog.csdn.net/shixin_0125/article/details/106937186
https://www.cnblogs.com/renhui/p/6922971.html
https://cloud.tencent.com/developer/article/1393972
https://www.jianshu.com/p/3c95b0471d3a

