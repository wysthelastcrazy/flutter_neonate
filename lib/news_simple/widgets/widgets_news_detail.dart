import 'package:flutter/material.dart';

///newsDetail收藏widget
class FavoriteWidget extends StatefulWidget {
  const FavoriteWidget({super.key});

  @override
  State<FavoriteWidget> createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  //是否已收藏
  bool _isFavorited = true;

  //收藏数量
  int _favoriteCount = 41;

  void _toggleFavorite() {
    ///调用setState()至关重要
    ///这告诉框架,widget的状态已经改变,应该重绘
    setState(() {
      if (_isFavorited) {
        _favoriteCount -= 1;
        _isFavorited = false;
      } else {
        _favoriteCount += 1;
        _isFavorited = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(0),
          child: IconButton(
            padding: const EdgeInsets.all(0),
            alignment: Alignment.centerRight,
            icon: (_isFavorited
                ? const Icon(Icons.star)
                : const Icon(Icons.star_border)),
            color: Colors.red[500],
            onPressed: _toggleFavorite,
          ),
        ),

        ///将文本放在sizedBox中并设置其宽度可防止出现明显的‘跳跃’,
        ///因为不同的值具有不同的宽度
        SizedBox(
          width: 18,
          child: SizedBox(
            child: Text('$_favoriteCount'),
          ),
        )
      ],
    );
  }
}
