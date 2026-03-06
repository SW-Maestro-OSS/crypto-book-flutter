import 'package:connectivity_plus/connectivity_plus.dart';

/// 네트워크 연결 상태를 감지하는 DataSource
class NetworkStatusDataSource {
  final Connectivity _connectivity = Connectivity();

  /// 네트워크 연결 여부 스트림
  Stream<bool> get isConnected => _connectivity.onConnectivityChanged.map(
        (results) => results.any((r) => r != ConnectivityResult.none),
      );

  /// 현재 네트워크 연결 여부
  Future<bool> get currentlyConnected async {
    final results = await _connectivity.checkConnectivity();
    return results.any((r) => r != ConnectivityResult.none);
  }
}
