import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  final String? label;
  final String? hint;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final Widget? leading;
  final bool? obscureText;
  final AutovalidateMode? autovalidateMode;
  final void Function(PointerDownEvent)? onTapOutside;
  final FocusNode? focusNode;
  final void Function(String)? onFieldSubmitted;
  const Input({
    Key? key,
    this.label,
    this.hint,
    this.controller,
    this.onChanged,
    this.validator,
    this.leading,
    this.obscureText,
    this.autovalidateMode,
    this.onTapOutside,
    this.focusNode,
    this.onFieldSubmitted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) ...[
          Text(
            label!,
            style: const TextStyle(fontSize: 12),
          ),
          const SizedBox(height: 4),
        ],
        TextFormField(
          controller: controller,
          focusNode: focusNode,
          onTapOutside: onTapOutside,
          onFieldSubmitted: onFieldSubmitted,
          obscureText: obscureText ?? false,
          autovalidateMode: autovalidateMode,
          onChanged: onChanged,
          validator: validator,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            prefixIcon: leading,
            hintText: hint,
          ),
        ),
      ],
    );
  }
}
