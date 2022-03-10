import 'package:flutter/material.dart';
//Jihan Rahadatul Aisy (2031710034)

class result1 extends StatelessWidget {
  const result1({
    Key? key,
    required this.listViewItem,
  }) : super(key: key);

  final List<String> listViewItem;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: listViewItem.length,
      itemBuilder: (context, index) {
        return Text(listViewItem[index]);
      },
    ));
  }
}
