import 'package:flutter/material.dart';
import 'package:target_test/shared/extensions/build_context_extensions.dart';

class PrivacyPolicyText extends StatelessWidget {
  const PrivacyPolicyText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.launch("https://www.google.com.br/"),
      child: const Text(
        "Política de Privacidade",
        style: TextStyle(
          color: Colors.blue,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}
