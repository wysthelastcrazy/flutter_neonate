import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neonate/Constants.dart';
import 'package:flutter_neonate/TipRoute.dart';

class NewRoute extends StatelessWidget {
  const NewRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("提示"),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                // 打开`TipRoute`，并等待返回结果
                var result = await Navigator.pushNamed(context,MRoute.TIP_PAGE, arguments: "我是提示XXX");
                //输出`TipRoute`路由返回结果
                if (kDebugMode) {
                  print("路由返回值: $result");
                }
              },
              child: const Text("ope tips page"),
            ),
            ElevatedButton(
              onPressed: () async {
                Navigator.pushNamed(context,MRoute.TIP_PAGE_2, arguments: "hi");
              },
              child: const Text("open tips page 2"),
            ),
          ],
        )
      ),
    );
  }
}
