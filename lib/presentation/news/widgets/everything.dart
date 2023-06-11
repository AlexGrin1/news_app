import 'dart:developer';
import 'package:news_app/imports.dart';

class EverythingNewsScreen extends StatefulWidget {
  const EverythingNewsScreen({super.key});

  @override
  State<EverythingNewsScreen> createState() => _EverythingNewsScreenState();
}

class _EverythingNewsScreenState extends State<EverythingNewsScreen> {
  late Future<News?> _loadData;
  final ScrollController _scrollController = ScrollController();
  int _currentPage = 1;
  int _totalPages = 1;
  List<Article> _articles = [];

  @override
  void initState() {
    _loadData = _loadNews();
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  Future<News?> _loadNews() async {
    News? response = await controller.getEverythingNews(page: _currentPage);
    _totalPages = response?.totalResults ?? 1;
    _articles.addAll(response?.articles ?? []);
    return response;
  }

  Future<News?> _reload() async {
    setState(() {
      _currentPage = 1;
      _totalPages = 1;
      _articles = [];
      _loadData = _loadNews();
    });
    return await _loadNews();
  }

  void _scrollListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      log('_scrollListener');
      if (_currentPage < _totalPages) {
        setState(() {
          _currentPage++;
          _loadData = _loadNews();
        });
      }
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: newsAppTheme.appColors.background,
      body: SafeArea(
        child: FutureBuilder<News?>(
          future: _loadData,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            return RefreshIndicator(
              backgroundColor: newsAppTheme.appColors.background,
              color: newsAppTheme.appColors.highlighting,
              strokeWidth: 2,
              triggerMode: RefreshIndicatorTriggerMode.onEdge,
              onRefresh: _reload,
              child: !snapshot.hasData &&
                      snapshot.connectionState == ConnectionState.waiting
                  ? const LoadingWidget()
                  : Column(
                      children: [
                        Expanded(
                          child: ListView.builder(
                            controller: _scrollController,
                            itemCount: _articles.length +
                                (_currentPage < _totalPages ? 1 : 0),
                            itemBuilder: (BuildContext context, int index) {
                              if (index == _articles.length) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              } else {
                                return NewsCardWidget(
                                  article: _articles[index],
                                );
                              }
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 60,
                        )
                      ],
                    ),
            );
          },
        ),
      ),
    );
  }
}
