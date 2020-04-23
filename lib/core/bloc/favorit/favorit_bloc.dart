import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'favorit_event.dart';

class FavoritBloc extends Bloc<FavoritEvent, String> {
  @override
  String get initialState => 'Anda Belum Memilih';

  @override
  Stream<String> mapEventToState(
    FavoritEvent event,
  ) async* {
    if(event is SetFavoritEvent){
      yield event.favorit;
    }
  }
}
