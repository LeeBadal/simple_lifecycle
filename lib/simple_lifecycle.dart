import 'package:flutter/widgets.dart';

class SimpleLifecycle extends WidgetsBindingObserver {
  VoidCallback? onAppActive;
  VoidCallback? onAppPaused;

  bool appPaused = false;

  void initialize() {
    WidgetsBinding.instance.addObserver(this);
  }

  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      // If state is resumed it means app has been opened for the first time or resumed from the background
      case AppLifecycleState.resumed:
        if (appPaused) {
          appPaused = false;
          if (onAppActive != null) onAppActive!();
        }
        break;
      // Any other case means it is being moved from what we call a active state.
      default:
        if (!appPaused) {
          appPaused = true;
          if (onAppPaused != null) onAppPaused!();
        }
        break;
    }
  }
}
