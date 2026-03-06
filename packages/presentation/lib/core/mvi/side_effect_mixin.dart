import 'dart:async';

/// Mixin that adds SideEffect support to Riverpod notifiers.
///
/// SideEffects are one-time events (toast, snackbar, navigation)
/// that should not be part of the persistent state.
mixin SideEffectMixin<SE> {
  final StreamController<SE> _sideEffectController =
      StreamController<SE>.broadcast();

  /// Stream of side effects for the UI to listen to.
  Stream<SE> get sideEffects => _sideEffectController.stream;

  /// Emit a one-time side effect.
  void emitSideEffect(SE sideEffect) {
    if (!_sideEffectController.isClosed) {
      _sideEffectController.add(sideEffect);
    }
  }

  /// Dispose the side effect stream. Call this in ref.onDispose.
  void disposeSideEffects() {
    _sideEffectController.close();
  }
}
