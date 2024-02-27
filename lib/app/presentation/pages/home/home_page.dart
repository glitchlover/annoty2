part of home;

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar().paint(),
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            AnnotySearchTool(),
            ResourceTable(), //todo - make it list later
          ],
        ),
      ),
      floatingActionButton: const MyFloatingActionButton(),
    );
  }
}
