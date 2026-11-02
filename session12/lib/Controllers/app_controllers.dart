// ===========================================================================
// app_controllers.dart  —  CHANGED IN SESSION 12
// ---------------------------------------------------------------------------
// WHAT CHANGED vs session 11:
//   • NEW: accountProvider, for the new ProviderAccount (who is signed in).
// tasksProvider is unchanged.
// ===========================================================================

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

import 'provider_account.dart'; // NEW
import 'task_controller.dart';

ProviderContainer appcontainer = ProviderContainer();

final tasksProvider = ChangeNotifierProvider<TaskController>((ref) {
  return TaskController();
});

// NEW: the signed-in user. Read it anywhere with ref.watch(accountProvider)
// in widgets, or appcontainer.read(accountProvider) outside widgets (main).
final accountProvider = ChangeNotifierProvider<ProviderAccount>((ref) {
  return ProviderAccount();
});
