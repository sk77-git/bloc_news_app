import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:bloc_news_app/modules/splash/presentation/blocs/splash_event.dart';
import 'package:bloc_news_app/modules/splash/presentation/blocs/splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashLoading()) {
    on<StartSplash>(_startSplash);
  }

  Future<void> _startSplash(
      SplashEvent event, Emitter<SplashState> emit) async {
    log("_startSplash");
    await Future.delayed(const Duration(seconds: 2));
    emit(SplashLoaded());
  }
}
