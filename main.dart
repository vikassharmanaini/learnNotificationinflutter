import 'dart:convert';

import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  void initState() {
    // TODO: implement initState
    gettype(0);
    super.initState();
  }

  ScrollController _sc = ScrollController();
  int index = 0;
  List res = [];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: SafeArea(
                child: NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification scrollInfo) {
        if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
          setState(() {
            index++;
          });
          gettype(index);
        }
        return false;
      },
      child: GridView.builder(
          controller: _sc,
          itemCount: res.length,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (c, i) => Card(
                child: Column(
                  children: [
                    Expanded(
                      child: Image.network(res[i]['image']),
                    ),
                    Text("data ${res[i]['name']}")
                  ],
                ),
              )),
    ))));
  }

  gettype(i) async {
    var r = await a(i);
    res.addAll(r);
    setState(() {});
  }
}

int total = 6;
Future a(i) async {
  if (i <= total) {
    return Future.delayed(
        Duration(milliseconds: 500),
        () => List.generate(
            10,
            (index) => {
                  "image":
                      "https://s1.cdn.autoevolution.com/images/news/meet-carl-chrysler-s-animated-crash-test-dummy-30225_1.jpg",
                  "name": "${i + index} $total $i"
                }));
  }
  return [];
}
