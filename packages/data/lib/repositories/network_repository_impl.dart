import 'package:domain/domain.dart';
import 'package:data/datasources/network_status_data_source.dart';

class NetworkRepositoryImpl implements NetworkRepository {
  final NetworkStatusDataSource _dataSource;

  NetworkRepositoryImpl({required NetworkStatusDataSource dataSource})
      : _dataSource = dataSource;

  @override
  Stream<NetworkStatus> get statusStream => _dataSource.isConnected.map(
        (connected) =>
            connected ? NetworkStatus.online : NetworkStatus.offline,
      );

  @override
  Future<NetworkStatus> get currentStatus async {
    final connected = await _dataSource.currentlyConnected;
    return connected ? NetworkStatus.online : NetworkStatus.offline;
  }
}
