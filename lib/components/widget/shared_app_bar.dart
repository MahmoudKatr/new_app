import 'package:flutter/material.dart';

class SharedAppBar extends StatelessWidget {
  const SharedAppBar({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.blue,
      elevation: 0,
      centerTitle: true,
      title: Text(title),
    );
  }
}
