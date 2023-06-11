import 'package:news_app/imports.dart';

part 'favourites_state.dart';

class FavoriteNewsCubit extends Cubit<FavoritesState> {
  final bool isFavorites;
  set isFavorites(bool value) {
    isFavorites = value;
  }

  FavoriteNewsCubit({this.isFavorites = false})
      : super(const FavoritesInitial()) {
    isFavorites
        ? emit(const FavoritesActiveState())
        : emit(const FavoritesInactiveState());
  }

  void removeFromFavourites({required Article article}) async {
    localData.removeFromStorage(key: article.title);

    emit(const FavoritesInactiveState());
  }

  void addToFavourites({required Article article}) async {
    localData.saveToStorage(key: article.title, value: article.toJson());

    emit(const FavoritesActiveState());
  }
}
