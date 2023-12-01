import 'package:flutter/material.dart';

class InfoCapturePage extends StatefulWidget {
  const InfoCapturePage({super.key});

  @override
  State<InfoCapturePage> createState() => _InfoCapturePageState();
}

class _InfoCapturePageState extends State<InfoCapturePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Info Capture'),
      ),
      body: Container(),
    );
  }
}
