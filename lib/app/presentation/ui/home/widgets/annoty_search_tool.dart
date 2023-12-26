part of home;

class AnnotySearchTool extends GetView<HomeController> {
  const AnnotySearchTool({super.key});


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const AnnotySearchBar(),
            MyIconButton(icon: const Icon(Icons.tune_rounded), onPressed: () {})
          ],
        )
      ],
    );
  }
}


class AnnotySearchBar extends StatefulWidget {
  const AnnotySearchBar({super.key});

  @override
  State<AnnotySearchBar> createState() => _AnnotySearchBarState();
}

class _AnnotySearchBarState extends State<AnnotySearchBar> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        alignment: Alignment.topCenter,
        padding: EdgeInsets.symmetric(vertical: SpaceSizing.secondaryPadding),
        margin: const EdgeInsets.all(8),
        height: 35,
            decoration: MyBoxDecoration().uncontrasted(),
        child: const MyTextField(
              preffixIcon: Icon(Icons.search, color: ConstColorMain.muteGrey),
          hintText: "Search",
        )
      )
    );
  }


}