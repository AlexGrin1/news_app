import 'package:news_app/imports.dart';

class BottomNavBar extends StatefulWidget with ChangeNotifier {
  BottomNavBar({super.key, required this.provider});
  PageControllProvider provider;

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 50),
        padding: const EdgeInsets.symmetric(vertical: 10),
        height: 64,
        // width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: newsAppTheme.appColors.background,
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                      onTap: () {
                        widget.provider.changeCurrentpage(0);
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.list_alt_outlined,
                              color: widget.provider.currentPageIndex == 0
                                  ? newsAppTheme.appColors.highlighting
                                  : newsAppTheme.appColors.light),
                          Text(
                            "Новости",
                            style: TextStyle(
                                color: widget.provider.currentPageIndex == 0
                                    ? newsAppTheme.appColors.highlighting
                                    : newsAppTheme.appColors.light),
                          )
                        ],
                      )),
                  InkWell(
                      onTap: () {
                        widget.provider.changeCurrentpage(1);
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.bookmark_outline,
                            color: widget.provider.currentPageIndex == 1
                                ? newsAppTheme.appColors.highlighting
                                : newsAppTheme.appColors.light,
                          ),
                          Text(
                            "Избранное",
                            style: TextStyle(
                                color: widget.provider.currentPageIndex == 1
                                    ? newsAppTheme.appColors.highlighting
                                    : newsAppTheme.appColors.light),
                          )
                        ],
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
