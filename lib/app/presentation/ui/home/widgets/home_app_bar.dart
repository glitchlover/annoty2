part of home;

class HomeAppBar {
  AppBar paint() {
    ThemeToggleController thmCtrl = Get.find<ThemeToggleController>();
    return MyAppBar(
        leading: const Leading(),
        title: const TitleWidget(),
        actions: myIconActions(thmCtrl));
  }

  List<Widget> myIconActions(ThemeToggleController thmCtrl) {
    return [
      Obx(() {
        return MyIconButton(
            onPressed: () {
              thmCtrl.toggle();
            },
            icon: Icon(thmCtrl.icon.value),
            color: ConstColorHighlight.yellow);
      }),
      MyIconButton(
          onPressed: () {},
          icon: const Icon(Icons.notifications_outlined,
              color: ConstColorHighlight.orange)),
      MyIconButton(
          onPressed: () {},
          icon:
              const Icon(Icons.face_outlined, color: ConstColorHighlight.green))
    ];
  }
}

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const MyText("Annoty").temp(
        MyTextTheme(color: ConstColorMain.accent, fontFace: "Quicksand Bold")
            .titleLarge);
  }
}

class Leading extends StatelessWidget {
  const Leading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(SpaceSizing.mainPadding),
      child: Image.asset(Assets.kAstImgIcon),
    );
  }
}
