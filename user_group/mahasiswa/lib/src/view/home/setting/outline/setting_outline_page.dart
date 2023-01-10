import 'package:flutter/material.dart';

class OutlinePage extends StatefulWidget {
  const OutlinePage({super.key});

  @override
  State<OutlinePage> createState() => _OutlinePageState();
}

class _OutlinePageState extends State<OutlinePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text("Outline")));
  }
}
