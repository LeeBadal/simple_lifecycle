import 'package:flutter/widgets.dart';

class SimpleLifecycle extends WidgetsBindingObserver {
  VoidCallback? onAppActive;
  VoidCallback? onAppPaused;

  void initialize() {
    WidgetsBinding.instance.addObserver(this);
  }

  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        if (onAppActive != null) onAppActive!();
        break;
      default:
        if (onAppPaused != null) onAppPaused!();
        break;
    }
  }
}
