import 'package:annoty/app/core/constants/color/core.dart';
import 'package:annoty/app/core/theme/my_text.dart';
import 'package:annoty/app/presentation/ui/annoty_reader/widgets/annotation_card_tool.dart';
import 'package:flutter/material.dart';

class AddOutlinkDialog extends StatelessWidget {
  AddOutlinkDialog({required this.index, super.key});

  final int index;
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const MyText("Search Annotes").heading3(),
      content: Row(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              MyMinimalIconButton(
                  icon: Icons.toggle_off,
                  size: 28,
                  padding: 0,
                  color: ConstColorMain.accent.withOpacity(0.25),
                  onTap: () {}),
              MyText("text").captions(),
            ],
          ),
          const SizedBox(
            width: 12,
          ),
          Expanded(
            child: TextField(
              controller: _controller,
              decoration:
                  const InputDecoration(hintText: "🔍 Search annoty-cards"),
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Icon(Icons.cancel))
      ],
    );
  }
}
