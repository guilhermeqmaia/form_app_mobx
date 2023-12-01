import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  final String label;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final Widget? leading;
  final bool? obscureText;
  final AutovalidateMode? autovalidateMode;
  const Input({
    Key? key,
    required this.label,
    this.controller,
    this.onChanged,
    this.validator,
    this.leading,
    this.obscureText,
    this.autovalidateMode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 12),
        ),
        const SizedBox(height: 4),
        TextFormField(
          controller: controller,
          obscureText: obscureText ?? false,
          autovalidateMode: autovalidateMode,
          onChanged: onChanged,
          validator: validator,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            prefixIcon: leading,
          ),
        ),
      ],
    );
  }
}
