import 'dart:convert';
import 'dart:developer';

import 'package:news_app/imports.dart';

// class FavouritesScreen extends StatelessWidget {
//   const FavouritesScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: newsAppTheme.appColors.background,
//         appBar: AppBar(
//           backgroundColor: newsAppTheme.appColors.dark,
//           title: const Text('Favourites'),
//           centerTitle: true,
//         ),
//         body: Column(
//           children: [NewsCardWidget()],
//         ),
//       ),
//     );
//   }
// }

class FavouritesScreen extends StatefulWidget {
  const FavouritesScreen({super.key});

  @override
  State<FavouritesScreen> createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {
  List<Article?> favourites = [];
  bool isLoaded = false;
  @override
  void initState() {
    _loadFavourites();
    super.initState();
  }

  _loadFavourites() async {
    favourites = await localData.getLocalData();
    setState(() {
      isLoaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: newsAppTheme.appColors.background,
      appBar: AppBar(
        backgroundColor: newsAppTheme.appColors.dark,
        title: const Text('Избранное'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: isLoaded
            ? favourites.isNotEmpty
                ? ListView.builder(
                    itemCount: favourites.length,
                    itemBuilder: (BuildContext context, int index) {
                      return NewsCardWidget(
                        article: favourites[index],
                      );
                    },
                  )
                : Center(
                    child: Text(
                      "Список избранного пуст",
                      style: newsAppTheme.typography.newsTitle,
                    ),
                  )
            : LoadingWidget(),
      ),
    );
  }
}
