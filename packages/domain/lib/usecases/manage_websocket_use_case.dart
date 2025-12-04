import 'package:domain/repositories/websocket_repository.dart';

/// WebSocket 연결 UseCase
abstract interface class ConnectWebSocketUseCase {
  Future<void> execute();
}

/// WebSocket 해제 UseCase
abstract interface class DisconnectWebSocketUseCase {
  Future<void> execute();
}

/// WebSocket 재연결 UseCase
abstract interface class ReconnectWebSocketUseCase {
  Future<void> execute();
}

class ConnectWebSocketUseCaseImpl implements ConnectWebSocketUseCase {
  final WebSocketRepository repository;

  ConnectWebSocketUseCaseImpl({required this.repository});

  @override
  Future<void> execute() async {
    await repository.connect();
  }
}

class DisconnectWebSocketUseCaseImpl implements DisconnectWebSocketUseCase {
  final WebSocketRepository repository;

  DisconnectWebSocketUseCaseImpl({required this.repository});

  @override
  Future<void> execute() async {
    await repository.disconnect();
  }
}

class ReconnectWebSocketUseCaseImpl implements ReconnectWebSocketUseCase {
  final WebSocketRepository repository;

  ReconnectWebSocketUseCaseImpl({required this.repository});

  @override
  Future<void> execute() async {
    await repository.reconnect();
  }
}
