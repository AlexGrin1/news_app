import 'package:intl/intl.dart';
import 'package:news_app/imports.dart';
import 'package:news_app/logic/bloc/favourites_cubit.dart';
import 'package:news_app/presentation/news/details.dart';

class NewsCardWidget extends StatefulWidget {
  const NewsCardWidget({super.key, this.article});
  final Article? article;
  @override
  State<NewsCardWidget> createState() => _NewsCardWidgetState();
}

class _NewsCardWidgetState extends State<NewsCardWidget> {
  late final FavoriteNewsCubit _favoriteCubit;
  @override
  void initState() {
    super.initState();
    _favoriteCubit = FavoriteNewsCubit(
        isFavorites: localData.isFavourites(key: widget.article!.title));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => NewsDetailScreen(
                      url: widget.article!.url,
                      title: widget.article!.title,
                    )));
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: ExtendedImage.network(
                widget.article?.urlToImage ?? '',
                width: 80,
                height: 80,
                fit: BoxFit.cover,
                cache: true,
                //cancelToken: cancellationToken,
              ),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.article?.title ?? '',
                      maxLines: 10,
                      style: newsAppTheme.typography.newsTitle,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      widget.article?.description ?? '',
                      maxLines: 10,
                      overflow: TextOverflow.ellipsis,
                      style: newsAppTheme.typography.newsDesciption,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      DateFormat(
                        'HH:mm dd.MM.yyyy',
                      ).format(
                          DateTime.parse(widget.article?.publishedAt ?? '')),
                      maxLines: 10,
                      overflow: TextOverflow.ellipsis,
                      style: newsAppTheme.typography.newsDesciption,
                    ),
                  ],
                ),
              ),
            ),
            BlocBuilder<FavoriteNewsCubit, FavoritesState>(
              bloc: _favoriteCubit,
              builder: (context, state) {
                return IconButton(
                    onPressed: () {
                      _favoriteCubit.state is FavoritesInactiveState
                          ? _favoriteCubit.addToFavourites(
                              article: widget.article!)
                          : _favoriteCubit.removeFromFavourites(
                              article: widget.article!);
                    },
                    icon: Icon(
                      _favoriteCubit.state is FavoritesActiveState
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: newsAppTheme.appColors.light,
                    ));
              },
            )
          ],
        ),
      ),
    );
  }
}
