part of 'favourites_cubit.dart';

abstract class FavoritesState extends Equatable {
  const FavoritesState();
}

class FavoritesInitial extends FavoritesState {
  const FavoritesInitial();
  @override
  List<Object> get props => [];
}

class FavoritesActiveState extends FavoritesState {
  const FavoritesActiveState();

  @override
  List<Object> get props => [];
}

class FavoritesInactiveState extends FavoritesState {
  const FavoritesInactiveState();

  @override
  List<Object> get props => [];
}

class FavoritesEmptyState extends FavoritesState {
  const FavoritesEmptyState();

  @override
  List<Object> get props => [];
}
