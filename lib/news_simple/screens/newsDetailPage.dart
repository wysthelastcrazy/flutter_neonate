import 'package:flutter/material.dart';

import '../widgets/widgets_news_detail.dart';

class NewsDetailPage extends StatefulWidget {
  const NewsDetailPage({super.key});

  @override
  // ignore: no_logic_in_create_state
  State<StatefulWidget> createState() => _NewsDetailPageState();
}

class _NewsDetailPageState extends State<NewsDetailPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        _ImageSection(),
        _TitleSection(),
        _ButtonSection(),
        const _TextSection(
            content:
                'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
                'Alps. Situated 1,578 meters above sea level, it is one of the '
                'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
                'half-hour walk through pastures and pine forest, leads you to the '
                'lake, which warms to 20 degrees Celsius in the summer. Activities '
                'enjoyed here include rowing, and riding the summer toboggan run.'
                'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
                'Alps. Situated 1,578 meters above sea level, it is one of the '
                'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
                'half-hour walk through pastures and pine forest, leads you to the '
                'lake, which warms to 20 degrees Celsius in the summer. Activities '
                'enjoyed here include rowing, and riding the summer toboggan run.')
      ],
    );
  }
}

class _ImageSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/lake.jpg',
      width: 600,
      height: 240,
      fit: BoxFit.cover,
    );
  }
}

///标题行
class _TitleSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
              /**
             *1、将Column元素放到Expanded widget中可以拉伸该列,
             *以利用该行中所有剩余的闲置空间
             **/
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /**
                   * 2、将第一行文本放入Container容器中,可以增加内间距
                   * */
              Container(
                padding: const EdgeInsets.only(bottom: 8),
                child: const Text(
                  "Oescheinen Lake Campground",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                'Kandersteg, Switzerland',
                style: TextStyle(color: Colors.grey[500]),
              )
            ],
          )),
          /**
           * 标题行中的最后两项是一个红色星形图标,和文字
           */
          const FavoriteWidget()
        ],
      ),
    );
  }
}

///导航栏
class _ButtonSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;
    return Row(
      //平均分配该行剩余空间为children之间的间隔
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _ButtonItem(color: color, icon: Icons.call, label: 'call'),
        _ButtonItem(color: color, icon: Icons.near_me, label: 'route'),
        _ButtonItem(color: color, icon: Icons.share, label: 'share')
      ],
    );
  }
}

/// 导航栏item
class _ButtonItem extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String label;

  const _ButtonItem(
      {super.key,
      required this.color,
      required this.icon,
      required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
                fontSize: 12, fontWeight: FontWeight.w400, color: color),
          ),
        )
      ],
    );
  }
}

///文本区域
class _TextSection extends StatelessWidget {
  final String content;

  const _TextSection({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(32),
        child: Text(
          content,
          //设置softWrap为true后,文本将在填充满列宽后在单词边界处自动换行
          softWrap: true,
          style: const TextStyle(fontSize: 16),
        ));
  }
}
