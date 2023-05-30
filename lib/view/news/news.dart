import 'package:news_app/imports.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> with TickerProviderStateMixin {
  late final TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: 2);
    tabController.addListener(() {});
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        initialIndex: 0,
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: newsAppTheme.appColors.dark,
            title: tabController.index == 0
                ? const Text('Top headlines')
                : const Text('Everything'),
            centerTitle: true,
            bottom: TabBar(
              controller: tabController,
              indicatorColor: newsAppTheme.appColors.highlighting,
              tabs: const [
                Tab(icon: Icon(Icons.list_alt_outlined)),
                Tab(icon: Icon(Icons.list_outlined)),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              TopHeadlinesNewsScreen(),
              EverythingNewsScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
// /(Top Headlines и Everything)