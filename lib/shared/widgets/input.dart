import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  final String label;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  const Input({
    Key? key,
    required this.label,
    this.controller,
    this.onChanged,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        const SizedBox(height: 4),
        TextFormField(
          controller: controller,
          onChanged: onChanged,
          validator: validator,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
          ),
        ),
      ],
    );
  }
}
