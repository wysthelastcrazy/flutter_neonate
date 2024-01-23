import 'package:flutter/material.dart';

///stateful widget的状态管理常见的方法:
/// 1、widget管理自己的状态
/// 2、父widget管理子widget的状态
/// 3、混搭管理
///如何决定使用那种管理方法,遵从一下原则:
/// 1、如果状态是用户数据,如:复选框的选择状态、滑块的位置,则该状态最好由父widget管理;
/// 2、如果所讨论的状态市有关界面外观效果的,例如:动画,那么状态最好由widget本身管理;
/// 3、如果由疑问,首选在父widget中管理状态
///

///widget自己管理状态simple
class TapboxA extends StatefulWidget {
  const TapboxA({super.key});

  @override
  State<StatefulWidget> createState() => _TapboxAState();
}

class _TapboxAState extends State<TapboxA> {
  bool _active = false;

  void _handleTap() {
    setState(() {
      _active = !_active;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
            color: _active ? Colors.lightGreen[700] : Colors.grey[600]),
        child: Center(
            child: Text(
          _active ? 'active' : 'inactive',
          style: const TextStyle(fontSize: 32, color: Colors.white),
        )),
      ),
    );
  }
}

///父widget管理widget的state
class ParentWidgetB extends StatefulWidget {
  const ParentWidgetB({super.key});

  @override
  State<StatefulWidget> createState() => _ParentWidgetBState();
}

class _ParentWidgetBState extends State<ParentWidgetB> {
  bool _active = false;

  void _handleTapboxChanged(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TapboxB(
        active: _active,
        onChanged: _handleTapboxChanged,
      ),
    );
  }
}

class TapboxB extends StatelessWidget {
  final bool active;
  final ValueChanged<bool> onChanged;

  const TapboxB({super.key, required this.active, required this.onChanged});

  void _handleTap() {
    onChanged(!active);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
            color: active ? Colors.lightGreen[700] : Colors.grey[600]),
        child: Center(
          child: Text(
            active ? 'active' : 'inactive',
            style: const TextStyle(fontSize: 32, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

///混搭管理
class ParentWidgetC extends StatefulWidget {
  const ParentWidgetC({super.key});

  @override
  State<StatefulWidget> createState() => _ParentWidgetCState();
}

class _ParentWidgetCState extends State<ParentWidgetC> {
  bool _active = false;

  void _handleTapboxChange(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TapboxC(
        active: _active,
        onChanged: _handleTapboxChange,
      ),
    );
  }
}

class TapboxC extends StatefulWidget {
  final bool active;
  final ValueChanged<bool> onChanged;

  const TapboxC({super.key, required this.active, required this.onChanged});

  @override
  State<StatefulWidget> createState() => _TapboxCState();
}

class _TapboxCState extends State<TapboxC> {
  bool _highLight = false;

  void _handleTapDown(TapDownDetails details) {
    setState(() {
      _highLight = true;
    });
  }

  void _handleTapUp(TapUpDetails details) {
    setState(() {
      _highLight = false;
    });
  }

  void _handleTapCancel() {
    setState(() {
      _highLight = false;
    });
  }

  void _handleTap() {
    widget.onChanged(!widget.active);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _handleTapDown,
      onTapUp: _handleTapUp,
      onTap: _handleTap,
      onTapCancel: _handleTapCancel,
      child: Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
            color: widget.active ? Colors.lightGreen[700] : Colors.grey[600],
            border: _highLight
                ? Border.all(color: Colors.teal[700]!, width: 10)
                : null),
        child: Center(
            child: Text(
          widget.active ? 'active' : 'inactive',
          style: const TextStyle(fontSize: 32, color: Colors.white),
        )),
      ),
    );
  }
}
