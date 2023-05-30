import 'package:news_app/imports.dart';

class FavouritesScreen extends StatelessWidget {
  const FavouritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: newsAppTheme.appColors.background,
        appBar: AppBar(
          backgroundColor: newsAppTheme.appColors.dark,
          title: const Text('Favourites'),
          centerTitle: true,
        ),
        body: Column(
          children: const [NewsCardWidget()],
        ),
      ),
    );
  }
}
