import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

extension BuildContextExtensions on BuildContext {
  double get screenWidth => MediaQuery.of(this).size.width;

  double get screenHeight => MediaQuery.of(this).size.height;

  double get bottomPadding => MediaQuery.of(this).viewInsets.bottom;

  Future<void> launch(String url) async {
    await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
  }
}
