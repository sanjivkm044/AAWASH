import 'dart:developer'; // For logging events
import 'package:bloc/bloc.dart';

class AawashBlocObserver extends BlocObserver {
  const AawashBlocObserver();

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    log('Event: ${event.toString()}');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    log('Error in ${bloc.runtimeType}: ${error.toString()}'); // Convert error to a String
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    log('Change in ${bloc.runtimeType}: ${change.toString()}');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    log('Transition in ${bloc.runtimeType}: ${transition.toString()}');
  }
}
