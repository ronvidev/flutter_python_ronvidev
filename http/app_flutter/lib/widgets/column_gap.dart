import 'package:flutter/material.dart';

class MyColumn extends StatelessWidget {
  const MyColumn({
    super.key,
    required this.children,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.gap = 0.0,
    this.padding = const EdgeInsets.all(8.0),
  });

  final List<Widget> children;
  final double gap;
  final MainAxisAlignment mainAxisAlignment;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    List<Widget> childrenGap = [];

    for (var i = 0; i < children.length; i++) {
      childrenGap.add(children[i]);
      if (i != children.length - 1) {
        childrenGap.add(SizedBox(height: gap));
      }
    }

    return SingleChildScrollView(
      child: Padding(
        padding: padding,
        child: Column(
          mainAxisAlignment: mainAxisAlignment,
          children: childrenGap,
        ),
      ),
    );
  }
}
