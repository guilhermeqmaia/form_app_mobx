import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:target_test/features/login/login_store.dart';
import 'package:target_test/features/login/usecase/login_use_case.dart';
import 'package:target_test/features/login/widget/login_form.dart';
import 'package:target_test/features/login/widget/privacy_policy_text.dart';
import 'package:target_test/shared/extensions/build_context_extensions.dart';

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
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text(
                "Olá! Seja bem vindo!",
                style: TextStyle(fontSize: 28),
              ),
              LoginForm(
                onLogin: (user, password) async {
                  store.login(user, password).then((result) {
                    if (result == LoginResult.unexpectedError) {
                      context.showSnackBar(
                        "Ops! Um erro inesperado aconteceu",
                        true,
                      );
                    } else if (result == LoginResult.invalidCredentials) {
                      context.showSnackBar(
                        "Credenciais inválidas, verifique se você digitou corretamente",
                        true,
                      );
                    }
                  });
                },
              ),
              const PrivacyPolicyText(),
            ],
          ),
          Observer(
            builder: (_) {
              if (store.isLoading) {
                return Container(
                  color: Colors.black.withOpacity(0.5),
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
              return const SizedBox.shrink();
            },
          )
        ],
      ),
    );
  }
}
