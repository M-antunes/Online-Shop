import 'package:flutter/material.dart';

class Badge extends StatelessWidget {
  final Widget child;
  final String value;
  final Color? color;

  const Badge({
    Key? key,
    required this.child,
    required this.value,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        child,
        Positioned(
          right: 8,
          top: 8,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: color ?? Theme.of(context).accentColor,
            ),
            constraints: BoxConstraints(minHeight: 18, minWidth: 18),
            child: Text(
              value,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 13),
            ),
          ),
        )
      ],
    );
  }
}
