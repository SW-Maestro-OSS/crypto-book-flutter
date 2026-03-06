/// 네트워크 상태
enum NetworkStatus { online, offline }

/// 네트워크 연결 상태 감지 Repository
abstract interface class NetworkRepository {
  /// 네트워크 상태 변경 스트림
  Stream<NetworkStatus> get statusStream;

  /// 현재 네트워크 상태
  Future<NetworkStatus> get currentStatus;
}
