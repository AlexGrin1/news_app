import 'package:news_app/imports.dart';

class PageControllProvider with ChangeNotifier {
  int currentPageIndex = 0;

  void changeCurrentpage(int pageIndex) {
    currentPageIndex = pageIndex;
    notifyListeners();
  }
}
