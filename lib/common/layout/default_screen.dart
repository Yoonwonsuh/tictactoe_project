import 'package:flutter/material.dart';

class DefaultScreen extends StatefulWidget {
  const DefaultScreen({Key? key, required this.title, required this.body, this.isMain})
      : super(key: key);
  final String title;
  final Widget body;
  final bool? isMain;

  @override
  State<DefaultScreen> createState() => _DefaultScreenState();
}

class _DefaultScreenState extends State<DefaultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: widget.body,
    );
  }
}
