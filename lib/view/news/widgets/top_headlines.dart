import 'package:news_app/imports.dart';

class TopHeadlinesNewsScreen extends StatelessWidget {
  const TopHeadlinesNewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: newsAppTheme.appColors.background,
      body: ListView.builder(
        itemCount: 135,
        itemBuilder: (BuildContext context, int index) {
          return NewsCardWidget();
        },
      ),
    );
  }
}
