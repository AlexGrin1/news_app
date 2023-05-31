import 'package:news_app/imports.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  getPage(PageControllProvider provider, BuildContext context) {
    switch (provider.currentPageIndex) {
      case 0:
        return const NewsScreen();

      case 1:
        return const FavouritesScreen();

      default:
        return const NewsScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PageControllProvider>(
      builder: (context, provider, snapshot) {
        return Scaffold(
          backgroundColor: newsAppTheme.appColors.background,
          body: SafeArea(
            child: Stack(
              children: [
                getPage(provider, context),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: BottomNavBar(
                    provider: provider,
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
