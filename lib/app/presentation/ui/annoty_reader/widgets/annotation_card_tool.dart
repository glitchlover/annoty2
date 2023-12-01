// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:annoty/app/core/constants/color/core.dart';
import 'package:annoty/app/core/constants/misc/is_it.dart';
import 'package:annoty/app/presentation/ui/annoty_reader/controllers/annotation_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:get/get.dart';

class AnnotationCardTool extends GetView<AnnotationCardController> {
  final int index;
  const AnnotationCardTool(this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.end, children: [
      MyMinimalIconButton(icon: Iconsax.arrow_down_1, onTap: () {}),
      const Spacer(),
      MyMinimalIconButton(
          icon: Iconsax.maximize_21, onTap: () {}),
      //TODO(later): MyMinimalIconButton(icon: Icons.comment_bank_rounded, onTap: () {}),
      MyMinimalIconButton(icon: Iconsax.tag_2, onTap: () {}),
      MyMinimalIconButton(
        icon: Iconsax.link_2,
        onTap: () => controller.toggleOutlinkCard(index),
      ),
      MyMinimalIconButton(icon: Iconsax.edit_2, onTap: () {}),
      MyMinimalIconButton(
          icon: Iconsax.trash,
          onTap: () async => await controller.deleteCard(index)),
    ]);
  }
}

class MyMinimalIconButton extends StatelessWidget {
  final IconData icon;
  final Color? color;
  final double padding;
  final double size;
  final VoidCallback onTap;

  MyMinimalIconButton({
    Key? key,
    this.size = 16,
    this.padding = 4,
    this.color,
    required this.icon,
    required this.onTap,
  }) : super(key: key) {
    color ??
        (IsIt.dark ? ConstColorMain.activeGrey : ConstColorMain.activeBlack);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: InkWell(
        onTap: onTap,
        child: Icon(
          icon,
          color: color,
          size: size,
        ),
      ),
    );
  }
}
