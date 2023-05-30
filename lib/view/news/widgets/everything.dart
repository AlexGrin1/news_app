import 'package:news_app/imports.dart';

class EverythingNewsScreen extends StatelessWidget {
  const EverythingNewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: newsAppTheme.appColors.background,
      body: ListView.builder(
        itemCount: 135,
        itemBuilder: (BuildContext context, int index) {
          return const NewsCardWidget();
        },
      ),
    );
  }
}
