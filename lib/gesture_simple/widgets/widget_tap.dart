import 'package:flutter/material.dart';

/// Flutter中的手势有两个不同的层次:
/// 第一层是原始的指针指向事件, 描述了屏幕上由触摸板、鼠标、指示笔的触发的指针的位置和移动;
/// 第二层包含gestures,描述了由一个或多个指针移动组成的具有特殊语义的操作.
///
///1、Pointer(指针)
///Pointer代表的是人机界面交互的原始数据,一共由四种指针事件:
/// PointerDownEvent:指针在特定位置与屏幕接触
/// PointerMoveEvent:指针从屏幕的一个位置移动到另外一个位置
/// PointerUpEvent:指针与屏幕停止接触
/// PointerCancelEvent:指针的输入已经不再指向此应用
///使用Listener可以在组件层直接监听指针事件.一般情况下,建议使用Gesture替代.
///
///
/// 2、Gesture(手势)
/// Gesture代表的是语义操作(比如点击、拖动、缩放).通常由一系列单独的指针事件组成;
/// Gesture可以分发多种事件,对应手势的生命周期.
///
/// 点击:
///   onTapDown - 指针在发生接触的屏幕特定位置可能引发点击事件;
///   onTapUp - 触发点击事件的触点已经在某个点停止与屏幕交互;
///   onTap - 触发onTapDown的触点此时已触发了onTapUp,即产生了点击事件;
///   onTapCancel - 指针已经触发了onTapDown,但是最终不会形成一个点击事件;
/// 双击:
///   onDoubleTap - 用户在屏幕的相同微商快速点击了两次;
/// 长按:
///   onLongPress - 指针在屏幕的相同位置上保存接触持续一长段时间;
/// 纵向拖动:
///   onVerticalDragStart - 指针与屏幕产生接触并可能开始纵向移动;
///   onVerticalDragUpdate - 指针与屏幕产生接触,在纵向上发生移动并保存移动;
///   onVerticalDragEnd - 指针先前与屏幕产生了接触,一特定速度纵向移动,并且此后不会在屏幕接触上发生纵向移动
/// 横向移动:
///   onHorizontalDragStart
///   onHorizontalDragUpdate
///   onHorizontalDragEnd
/// 移动:
///   onPanStart - 指针和屏幕产生接触并可能开始横向移动或纵向移动,如果设置了onVerticalDragStart或onHorizontalDragStart,该回调方法会引发奔溃
///   onPanUpdate
///   onPanEnd
///

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        const snackBar = SnackBar(content: Text('tap'));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: Colors.lightBlue, borderRadius: BorderRadius.circular(8)),
        child: const Text('custom button'),
      ),
    );
  }
}
