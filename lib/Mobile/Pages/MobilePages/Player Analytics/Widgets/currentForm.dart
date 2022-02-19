// ignore_for_file: prefer_const_constructors, file_names, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class CurrentFormBox extends StatelessWidget {
  const CurrentFormBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Container(
          height: 110,
          width: 375,
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Padding(
            padding: const EdgeInsets.only(top: 5, bottom: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Current Form",
                  textAlign: TextAlign.end,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                SizedBox(height: 5),
                Container(
                  decoration: BoxDecoration(
                      color:
                          Theme.of(context).backgroundColor.withOpacity(0.4)),
                  height: 2,
                  width: 375,
                ),
                SizedBox(height: 5),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      listOfWidgets(["W", "W", "L", "W", "L"]),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget listOfWidgets(List<String> item) {
  List<Widget> list = <Widget>[];
  for (var i = 0; i < item.length; i++) {
    list.add(Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(color: formColor(item[i])),
        child: Center(
          child: Text(
            item[i],
            textAlign: TextAlign.center,
            style: TextStyle(
              //backgroundColor: formColor(item[i]),
              fontSize: 26,
            ),
          ),
        ),
      ),
    ));
  }
  return Wrap(
      spacing: 5.0, // gap between adjacent chips
      runSpacing: 2.0, // gap between lines
      children: list);
}

formColor(item) {
  if (item == "W") {
    return Color.fromARGB(255, 128, 221, 132);
  } else if (item == "L") {
    return Color.fromARGB(255, 235, 100, 90);
  } else {
    return Colors.blue;
  }
}
