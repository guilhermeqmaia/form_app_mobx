import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:target_test/features/login/login_store.dart';
import 'package:target_test/features/login/widget/privacy_policy_text.dart';
import 'package:target_test/shared/extensions/build_context_extensions.dart';
import 'package:target_test/shared/widgets/button.dart';
import 'package:target_test/shared/widgets/input.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final store = Modular.get<LoginStore>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Text(
            "Olá! Seja bem vindo!",
            style: TextStyle(fontSize: 28),
          ),
          Center(
            child: Container(
              width: context.screenWidth,
              margin: const EdgeInsets.symmetric(horizontal: 32),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  border: Border.all(width: 1),
                  borderRadius: BorderRadius.circular(8)),
              child: Column(
                children: [
                  const Input(label: "Usuário"),
                  const SizedBox(height: 8),
                  const Input(label: "Senha"),
                  const SizedBox(height: 16),
                  Button(
                    width: context.screenWidth / 2,
                    onPressed: () {},
                    text: "Entrar",
                  ),
                ],
              ),
            ),
          ),
          const PrivacyPolicyText(),
        ],
      ),
    );
  }
}
