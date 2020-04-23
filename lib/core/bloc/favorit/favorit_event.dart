part of 'favorit_bloc.dart';

@immutable
abstract class FavoritEvent {}

class SetFavoritEvent extends FavoritEvent{
  final String favorit;

  SetFavoritEvent(this.favorit);
}
