
import 'package:flutter/material.dart';

/// TapboxA Widget管理自身状态
class TapboxA extends StatefulWidget{
  const TapboxA({Key? key}) : super(key: key);

  @override
  _TapboxAState createState() => _TapboxAState();

}
class _TapboxAState extends State<TapboxA>{
  bool _active = false;

  void _handleTap(){
    setState(() {
      _active = !_active;
    });
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        child: Center(
          child: Text(
            _active ? 'Active' : 'Inactive',
            style: const TextStyle(
              fontSize: 32.0,
              color: Colors.white
            ),
          ),
        ),
        width: 200.0,
        height: 200.0,
        decoration: BoxDecoration(
          color: _active ? Colors.lightGreen[700] : Colors.grey[600]
        ),
      ),
    );
  }
}

/// 父Widget管理子Widget状态
class ParentWidgetB extends StatefulWidget{
  const ParentWidgetB({Key? key}) : super(key: key);

  @override
  _ParentWidgetBState createState() => _ParentWidgetBState();
}

class _ParentWidgetBState extends State<ParentWidgetB>{

  bool _active = false;

  void _handleTapboxChanged(bool newValue){
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
   return Container(
     child: TapboxB(
       active: _active,
       onChanged: _handleTapboxChanged,
     ),
   );
  }
}
class TapboxB extends StatelessWidget{
  final bool active;
  final ValueChanged<bool> onChanged;
  TapboxB({Key? key,this.active  = false, required this.onChanged}) : super(key: key);

  void _handleTap(){
    onChanged(!active);
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        width: 200.0,
        height: 200.0,
        decoration: BoxDecoration(
          color: active ? Colors.lightGreen[700] : Colors.grey[600]
        ),
        child: Center(
          child: Text(
            active ? 'Active' : 'Inactive',
            style: const TextStyle(fontSize: 32.0,color: Colors.white),
          ),
        ),
      ),
    );
  }
}


///混合状态管理
///
///

class ParentWidgetC extends StatefulWidget {
  const ParentWidgetC({Key? key}) : super(key: key);

  @override
  _ParentWidgetCState createState() => _ParentWidgetCState();
}

class _ParentWidgetCState extends State<ParentWidgetC> {
  bool _active = false;

  void _handleTapboxChanged(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TapboxC(
        active: _active,
        onChanged: _handleTapboxChanged,
      ),
    );
  }
}

class TapboxC extends StatefulWidget {

  final bool active;
  final ValueChanged<bool> onChanged;

  const TapboxC({Key? key, this.active = false, required this.onChanged}) : super(key: key);

  @override
  _TapboxCState createState() => _TapboxCState();

}
class _TapboxCState extends State<TapboxC>{
  bool _highlight = false;

  void _handleTapDown(TapDownDetails details){
    setState(() {
      _highlight = true;
    });
  }
  void _handleTapUp(TapUpDetails details){
    setState(() {
      _highlight = false;
    });
  }
  void _handleTapCancel(){
    setState(() {
      _highlight = false;
    });
  }
  void _handleTap(){
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
     child: Center(
       child: Text(
       widget.active ? 'Active' : 'Inactive',
       style: const TextStyle(fontSize: 32.0, color: Colors.white),
    ),
    ),
    width: 200.0,
    height: 200.0,
    decoration: BoxDecoration(
    color: widget.active ? Colors.lightGreen[700] : Colors.grey[600],
    border: _highlight
    ? Border.all(
    color: Colors.red,
    width: 10.0,
    )
        : null,
    ),
     )
   );
  }

}
