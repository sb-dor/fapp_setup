import 'package:fapp_setup/generated/l10n.dart';
import 'package:fapp_setup/injections/injections.dart';
import 'package:fapp_setup/main.dart';
import 'package:fapp_setup/services/flutter_toast_service/flutter_toast_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

part 'internet_connection_event.dart';

part 'internet_connection_state.dart';

class InternetConnectionBloc extends Bloc<InternetConnectionEvent, InternetConnectionState> {
  final _internetConnectionHelper = InternetConnection();

  InternetConnectionBloc() : super(InitialConnectionState()) {
    //
    on<CheckInternetConnection>(_checkInternetConnection);
  }

  void _checkInternetConnection(
    CheckInternetConnection event,
    Emitter<InternetConnectionState> emit,
  ) async {
    // bool result = await _internetConnectionHelper.hasInternetAccess;
    // if (result) {
    //   emit(HasInternetConnectionState());
    // } else {
    //   emit(NoInternetConnectionState());
    // }

    await emit.forEach<InternetStatus>(
      _internetConnectionHelper.onStatusChange,
      onData: (InternetStatus status) {
        switch (status) {
          case InternetStatus.connected:
            serviceLocator<FlutterToastService>().showToast(
              S.of(appConfig.navigatorKey.currentContext!).internetHasBeenConnected,
            );
            return HasInternetConnectionState();
          case InternetStatus.disconnected:
            serviceLocator<FlutterToastService>().showToast(
              S.of(appConfig.navigatorKey.currentContext!).noInternetConnection,
            );
            return NoInternetConnectionState();
        }
      },
    );
  }
}
