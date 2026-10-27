// ===========================================================================
// app_controllers.dart  —  NEW FILE IN SESSION 08
// ---------------------------------------------------------------------------
// Same pattern as sessions 04–05: one ProviderContainer for the app, and one
// ChangeNotifierProvider per controller. Here we only need taskProvider.
// ===========================================================================

import 'taskController.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart'; // ChangeNotifierProvider (Riverpod 3)

ProviderContainer appcontainer = ProviderContainer();

final taskProvider = ChangeNotifierProvider<Taskcontroller>((ref) {
  return Taskcontroller();
});
