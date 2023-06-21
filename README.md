<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

The simple_lifecycle package provides a simple and intuitive way to manage the state of your Flutter application. It allows you to categorize the app's lifecycle events into two distinct states: `active` and `paused`.

The philosophy is that users are in two binary states, either active or inactive.
We use the phrasing Paused instead of inactive for distinguishing.

## Features

Categorizes app events into `active` and `paused` states.
Handles events when the app is opened for the first time or comes from the background to the foreground.
Handles events when the app is closed, not in the foreground, or transitioning between different states.
Provides easy-to-use callbacks to perform actions based on the app's activity state.

## Getting started

TODO: List prerequisites and provide or point to information on how to
start using the package.

## Usage

1. Import the necessary packages:
   ```dart
   import 'package:simple_lifecycle/simple_lifecycle.dart';
   ``` 
2. Create an instance of SimpleLifecycle and initialize it:
    ```dart
    final simpleLifecycle = SimpleLifecycle();
    ```
3. Set the desired callbacks by assigning functions to the corresponding properties:     
   ```dart
   void initState() {
    simpleLifecycle.initialize();
    super.initState();
    simpleLifecycle.onAppActive = () {
    // Handle app active event
    };
    simpleLifecycle.onAppPaused = () {
    // Handle app not active event
    };
    }
    ```
4. Clean up the SimpleLifecycle when it's no longer needed to avoid memory leaks:
    ```dart
    @override
    void dispose() {
        super.dispose();
        simplelifeCycle.dispose();
    }
    ``` 
The SimpleLifecycle class provides four optional callback properties that allow you to handle specific app lifecycle events:

- `onAppActive`: Invoked when the app is opened for the first time or restored from the background.
- `onAppPaused`: Invoked in any other case e.g. closed, background.
You can assign custom functions to these properties to perform actions based on the corresponding app lifecycle events.

Remember to call the `initialize` method to start listening for app lifecycle changes and `dispose` when you're done to clean up resources.

Feel free to customize the implementation according to your specific needs and handle the lifecycle events accordingly.  

## Additional information
:cup_with_straw:

