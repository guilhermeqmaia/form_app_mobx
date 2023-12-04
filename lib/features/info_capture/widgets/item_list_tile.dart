import 'package:flutter/material.dart';
import 'package:target_test/shared/widgets/confirm_delete_dialog.dart';

class ItemListTile extends StatelessWidget {
  final String value;
  final VoidCallback onConfirm;
  const ItemListTile({
    Key? key,
    required this.value,
    required this.onConfirm,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        value,
        style: TextStyle(
          color: Colors.grey.shade700,
          fontWeight: FontWeight.bold,
        ),
      ),
      shape: RoundedRectangleBorder(
        side: const BorderSide(
          color: Colors.black,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      trailing: IconButton(
        onPressed: () async {
          showDialog(
            context: context,
            builder: (context) {
              return ConfirmDeleteDialog(
                value: value,
                onConfirm: onConfirm,
              );
            },
          );
        },
        icon: const Icon(Icons.delete),
      ),
    );
  }
}
