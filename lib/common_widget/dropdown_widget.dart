import 'package:flutter/material.dart';
import 'package:strongify/common_widget/show_warning.dart';
import 'package:strongify/functions/shared_pref.dart';

void showDropdownMenu(BuildContext context) async {
  final RenderBox overlay =
      Overlay.of(context).context.findRenderObject() as RenderBox;

  await showMenu(
    color: Colors.white,
    context: context,
    position: RelativeRect.fromRect(
      Rect.fromPoints(
        overlay.localToGlobal(overlay.size.topRight(Offset.zero),
            ancestor: overlay),
        overlay.localToGlobal(overlay.size.topRight(Offset.zero),
            ancestor: overlay),
      ),
      Offset.zero & overlay.size,
    ),
    items: [
      PopupMenuItem<String>(
        value: 'Option 1',
        child: TextButton(
            onPressed: () {
              showWarningDialog(context, 'Logout ?', 'Do you want to logout',
                  () {
                logout(context);
              });
            },
            child: const Text('Logout')),
      ),
    ],
  );
}
