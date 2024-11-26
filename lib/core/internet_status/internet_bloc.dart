import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'internet_event.dart';
import 'internet_state.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState> {
  final Connectivity _connectivity;
  StreamSubscription? _connectivitySubscription;
  bool _isFirstCheck = true;

  InternetBloc(this._connectivity) : super(InternetLoading()) {
    on<InitializeInternetBloc>(_onInitializeInternetBloc);
    on<InternetStatusChanged>(_onInternetStatusChanged);
  }

  void _onInitializeInternetBloc(
    InitializeInternetBloc event,
    Emitter<InternetState> emit,
  ) async {
    await _connectivitySubscription?.cancel();

    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen((result) {
      add(
        InternetStatusChanged(
          result.isNotEmpty ? result.first : ConnectivityResult.none,
        ),
      );
    });
  }

  void _onInternetStatusChanged(
    InternetStatusChanged event,
    Emitter<InternetState> emit,
  ) {
    _updateConnectionStatus(event.connectivityResult, emit);
  }

  void _updateConnectionStatus(
    ConnectivityResult result,
    Emitter<InternetState> emit,
  ) {
    if (_isFirstCheck) {
      _isFirstCheck = false;
      if (result == ConnectivityResult.none) {
        emit(InternetDisconnected());
      } else {
        emit(const InternetConnected(showMessage: false));
      }
    } else {
      if (result == ConnectivityResult.none) {
        emit(InternetDisconnected());
      } else {
        emit(const InternetConnected(showMessage: true));
      }
    }
  }

  @override
  Future<void> close() {
    _connectivitySubscription?.cancel();

    return super.close();
  }
}
