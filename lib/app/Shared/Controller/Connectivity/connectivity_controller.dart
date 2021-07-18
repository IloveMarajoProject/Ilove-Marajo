import 'package:mobx/mobx.dart';
import 'package:connectivity/connectivity.dart';

part 'connectivity_controller.g.dart';

class ConnectivityStore = _ConnectivityStore with _$ConnectivityStore;

abstract class _ConnectivityStore with Store {
  @observable
  ObservableStream<ConnectivityResult> connectivityStream =
      ObservableStream(Connectivity().onConnectivityChanged);

  void dispose() {}
}

//flutter pub run build_runner build --delete-conflicting-outputs