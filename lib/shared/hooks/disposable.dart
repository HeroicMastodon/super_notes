import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

abstract class Disposable {
  void dispose();
}

T useDisposable<T extends Disposable>(T disposable)  {
  return use(_DisposeHook(disposable));
}

class _DisposeHook<T extends Disposable> extends Hook<T> {
  const _DisposeHook(this.data);

  final T data;

  @override
  HookState<T, Hook<T>> createState() {
    return _DisposeHookState();
  }
}

class _DisposeHookState<T extends Disposable>
    extends HookState<T, _DisposeHook<T>> {

  @override
  void dispose() {
    hook.data.dispose();
  }

  @override
  T build(BuildContext context) {
    return hook.data;
  }

  @override
  String? get debugLabel => 'disposable<$T>';

  @override
  Object? get debugValue => hook.data;
}
