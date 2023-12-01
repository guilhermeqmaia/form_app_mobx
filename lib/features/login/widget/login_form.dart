import 'package:flutter/material.dart';
import 'package:target_test/features/login/validator/password_validator.dart';
import 'package:target_test/features/login/validator/user_validator.dart';
import 'package:target_test/shared/extensions/build_context_extensions.dart';
import 'package:target_test/shared/widgets/button.dart';
import 'package:target_test/shared/widgets/input.dart';

class LoginForm extends StatefulWidget {
  final void Function(String user, String password) onLogin;
  const LoginForm({
    Key? key,
    required this.onLogin,
  }) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final userController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    userController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Center(
        child: Container(
          width: context.screenWidth,
          margin: const EdgeInsets.symmetric(horizontal: 32),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
              border: Border.all(width: 1),
              borderRadius: BorderRadius.circular(8)),
          child: Column(
            children: [
              Input(
                controller: userController,
                label: "Usuário",
                leading: const Icon(Icons.person, color: Colors.black),
                validator: (value) => UserValidator.validate(value),
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
              const SizedBox(height: 16),
              Input(
                controller: passwordController,
                label: "Senha",
                leading: const Icon(Icons.lock_rounded, color: Colors.black),
                obscureText: true,
                validator: (value) => PasswordValidator.validate(value),
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
              const SizedBox(height: 24),
              Button(
                width: context.screenWidth / 2,
                onPressed: () {
                  final isValid = formKey.currentState!.validate();

                  if (isValid) {
                    widget.onLogin(
                      userController.text.trim(),
                      passwordController.text.trim(),
                    );
                  }
                },
                text: "Entrar",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
