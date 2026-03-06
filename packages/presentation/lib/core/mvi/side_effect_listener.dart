import 'dart:async';
import 'package:flutter/widgets.dart';

/// Widget that subscribes to a SideEffect stream and invokes a callback
/// for each one-time event (toast, snackbar, navigation, etc.).
class SideEffectListener<SE> extends StatefulWidget {
  final Stream<SE> sideEffects;
  final void Function(BuildContext context, SE sideEffect) onSideEffect;
  final Widget child;

  const SideEffectListener({
    super.key,
    required this.sideEffects,
    required this.onSideEffect,
    required this.child,
  });

  @override
  State<SideEffectListener<SE>> createState() =>
      _SideEffectListenerState<SE>();
}

class _SideEffectListenerState<SE> extends State<SideEffectListener<SE>> {
  StreamSubscription<SE>? _subscription;

  @override
  void initState() {
    super.initState();
    _subscribe();
  }

  @override
  void didUpdateWidget(covariant SideEffectListener<SE> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.sideEffects != widget.sideEffects) {
      _subscription?.cancel();
      _subscribe();
    }
  }

  void _subscribe() {
    _subscription = widget.sideEffects.listen((sideEffect) {
      if (mounted) {
        widget.onSideEffect(context, sideEffect);
      }
    });
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
