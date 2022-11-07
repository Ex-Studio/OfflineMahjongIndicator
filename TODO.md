# TODO

- 添加新状态-锁定状态和暂停状态（enum）使用状体管理框架来做
- 下一场下方/上方的Widget如何布局
- 长按解锁的动画（转一圈然后解锁）之后的切换动画
- 字体使用图片风格化/添加背景图片
- 下方的alert 随时间消失 一打开可以放一些说明问题
- 加一个计时器表示当前局进行的时间

```dart
ElevatedButton(
    onPressed: () {
        debugPrint("pressed");
    },
    child: Text("加本场")),
ElevatedButton(
    onPressed: () {
        debugPrint("pressed");
    },
    style: ElevatedButton.styleFrom(
        padding: EdgeInsets.all(16),
        backgroundColor: Colors.blue, // <-- Button color
        foregroundColor: Colors.red, // <-- Splash color
    ),
    child: Text("重置")),
```
