// ===========================================================================
// app_controllers.dart  —  NEW FILE IN SESSION 04
// ---------------------------------------------------------------------------
// One place where all the app's providers live. Two pieces:
//
//   appContainer     -> the box that stores every provider's controller.
//                       main.dart hands it to UncontrolledProviderScope.
//   counterProvider  -> how widgets find the CounterController. Riverpod
//                       creates the controller the first time someone asks
//                       for it, then keeps that SAME object for the whole app.
//
// To add a new controller later: create the class, then add one more
// provider here (session 05 adds itemsProvider).
// ===========================================================================

import 'package:flutter_riverpod/flutter_riverpod.dart';
// ChangeNotifierProvider lives in `legacy.dart` in Riverpod 3. If this import
// shows an error, you are on an older flutter_riverpod: update it.
import 'package:flutter_riverpod/legacy.dart';
import 'counter_controller.dart';

ProviderContainer appContainer = ProviderContainer();

// <CounterController> = the type of controller this provider gives you.
// (ref) => CounterController() = how to create it (only done once).
final counterProvider = ChangeNotifierProvider<CounterController>(
  (ref) => CounterController(),
);
