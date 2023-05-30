import 'package:news_app/imports.dart';

class NewsCardWidget extends StatelessWidget {
  const NewsCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ExtendedImage.network(
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRQddPsNtFIca-GgGyIkzH2Lyp1mfOpCgRmb-Hc4OLtjw&s',
            width: 80,
            height: 80,
            fit: BoxFit.fill,
            cache: true,

            //cancelToken: cancellationToken,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              "Description DescriptionDescription Description Description Description DescriptionDescription Description Description",
              maxLines: 10,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          IconButton(onPressed: () {}, icon: const Icon(Icons.favorite_border))
        ],
      ),
    );
  }
}
