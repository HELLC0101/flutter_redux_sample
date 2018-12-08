Language: [中文简体](https://github.com/hyjfine/flutter_redux_sample) | [English](https://github.com/hyjfine/flutter_redux_sample/blob/master/README-EN.md)

# flutter_redux_sample
[![Build Status](https://travis-ci.org/hyjfine/flutter_redux_sample.svg?branch=master)](https://travis-ci.org/hyjfine/flutter_redux_sample)

  <img align="right" src ="http://me.wozaihui.com/hyj-doc-flutter-demo-run.gif" alt="Todo List">

  Todo List 例子，按照MVVM模块化分层，用Redux管理数据和状态。Demo示例Flutter中怎么比较合理的联网发API，获取处理数据，刷新视图。Redux在一个Flutter App中是起什么作用和怎么工作的。

### 文件结构

  <img align="left" width="375" height="327" src="http://me.wozaihui.com/hyj-doc-flutter-demo-files.jpg">

### 分支

  - master：API请求用一个静态方法完成，优点是结构简单，但无法针对API写单元测试，适合个人快速开发体验。
  - plus：Redux加入MiddleWare，Reducer利用combineReducers裁成更小粒度，方便对reducer写UT。复杂度有所提升，但在结构上更严谨，也方便利用更全面的UT保证软件在迭代中的质量。

### 库依赖

- [redux: ^3.0.0](https://github.com/brianegan/redux)
- [flutter_redux: ^0.5.2](https://github.com/brianegan/flutter_redux)
- [dio: ^1.0.4](https://github.com/flutterchina/dio)

### 运行

```
//1.拉代码
git clone git@github.com:hyjfine/flutter_redux_sample.git
//2.检查环境
flutter channel stable
//3.安装依赖
flutter packges get
//4.运行
用Android Studio或者VS code打开项目，run app        
```

### License

  MIT licensed，star & PR 👏

### 引用

感谢Redux dart的作者以及他提供的[例子](https://github.com/brianegan/flutter_architecture_samples)，详细文档可以查阅[Flutter Redux 食用总结](https://juejin.im/post/5bf95aaa51882516e1542e31)。
