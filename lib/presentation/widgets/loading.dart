import 'package:news_app/imports.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Stack(
        children: [
          Shimmer.fromColors(
            period: const Duration(seconds: 3),
            baseColor: newsAppTheme.appColors.dark.withOpacity(0.2),
            highlightColor: newsAppTheme.appColors.light.withOpacity(0.1),
            enabled: true,
            child: ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 135,
              itemBuilder: (BuildContext context, int index) {
                return const ContentPlaceholder();
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(height: 16.0);
              },
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: SizedBox.square(
              child: CircularProgressIndicator(
                color: newsAppTheme.appColors.light,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ContentPlaceholder extends StatelessWidget {
  const ContentPlaceholder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 96.0,
            height: 50.0,
            decoration: BoxDecoration(
              color: newsAppTheme.appColors.light,
            ),
          ),
          const SizedBox(width: 12.0),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                TitlePlaceholder(),
                TitlePlaceholder(),
                TitlePlaceholder(
                  width: 180,
                ),
                DescriptionPlaceholder(),
                DescriptionPlaceholder(),
                DescriptionPlaceholder(
                  width: 120,
                )
              ],
            ),
          ),
          const SizedBox(width: 12.0),
          const Icon(Icons.favorite_border_outlined)
        ],
      ),
    );
  }
}

class TitlePlaceholder extends StatelessWidget {
  const TitlePlaceholder({super.key, this.width});
  final double? width;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.infinity,
      height: 10.0,
      color: newsAppTheme.appColors.light,
      margin: const EdgeInsets.only(bottom: 8.0),
    );
  }
}

class DescriptionPlaceholder extends StatelessWidget {
  const DescriptionPlaceholder({super.key, this.width});
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.infinity,
      height: 3.0,
      color: newsAppTheme.appColors.background,
      margin: const EdgeInsets.only(bottom: 8.0),
    );
  }
}
