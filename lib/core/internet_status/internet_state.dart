// core/cubits/internet_status/internet_state.dart

import 'package:equatable/equatable.dart';

abstract class InternetState extends Equatable {
  const InternetState();

  @override
  List<Object> get props => [];
}

class InternetConnected extends InternetState {
  final bool showMessage;

  const InternetConnected({required this.showMessage});

  @override
  List<Object> get props => [showMessage];
}

class InternetDisconnected extends InternetState {}

class InternetLoading extends InternetState {}
