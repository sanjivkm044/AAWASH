// core/cubits/internet_status/internet_event.dart

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';

abstract class InternetEvent extends Equatable {
  const InternetEvent();

  @override
  List<Object> get props => [];
}

class InternetStatusChanged extends InternetEvent {
  final ConnectivityResult connectivityResult;

  const InternetStatusChanged(this.connectivityResult);

  @override
  List<Object> get props => [connectivityResult];
}

class InitializeInternetBloc extends InternetEvent {}
