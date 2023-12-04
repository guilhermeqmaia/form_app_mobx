import 'package:flutter/material.dart';
import 'package:target_test/shared/extensions/build_context_extensions.dart';
import 'package:target_test/shared/widgets/button.dart';

class ConfirmDeleteDialog extends StatelessWidget {
  final String value;
  final VoidCallback onConfirm;

  const ConfirmDeleteDialog({
    super.key,
    required this.value,
    required this.onConfirm,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        "Deseja excluir o texto $value",
      ),
      actions: [
        Button(
          width: context.screenWidth * 0.3,
          text: "Confirmar",
          onPressed: onConfirm,
        )
      ],
    );
  }
}
