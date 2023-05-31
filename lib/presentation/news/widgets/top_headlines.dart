import 'dart:async';

import 'package:news_app/imports.dart';

class TopHeadlinesNewsScreen extends StatefulWidget {
  const TopHeadlinesNewsScreen({super.key});

  @override
  State<TopHeadlinesNewsScreen> createState() => _TopHeadlinesNewsScreenState();
}

class _TopHeadlinesNewsScreenState extends State<TopHeadlinesNewsScreen> {
  late Future<News?> _loadData;
  @override
  void initState() {
    _loadData = _loadNews();
    super.initState();
  }

  Future<News?> _loadNews() async {
    News? response = await controller.getTopHeadlinesNews(page: 1);
    return response;
  }

  Future<News?> _reload() async {
    setState(
      () {
        _loadData = _loadNews();
      },
    );
    return await _loadNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: newsAppTheme.appColors.background,
      body: SafeArea(
        child: FutureBuilder<News?>(
          future: _loadData,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            News? news = snapshot.data;
            return RefreshIndicator(
              backgroundColor: newsAppTheme.appColors.background,
              color: newsAppTheme.appColors.highlighting,
              strokeWidth: 2,
              triggerMode: RefreshIndicatorTriggerMode.onEdge,
              onRefresh: _reload,
              child: !snapshot.hasData &&
                      snapshot.connectionState == ConnectionState.waiting
                  ? const LoadingWidget()
                  : ListView.builder(
                      itemCount: news?.articles.length,
                      itemBuilder: (BuildContext context, int index) {
                        return NewsCardWidget(
                          article: news?.articles[index],
                        );
                      },
                    ),
            );
          },
        ),
      ),
    );
  }
}
