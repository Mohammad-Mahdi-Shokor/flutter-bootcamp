import 'package:flutter_13_7/Controllers/task_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

ProviderContainer appcontainer = ProviderContainer();

final tasksProvider = ChangeNotifierProvider<TaskController>((ref) {
  return TaskController();
});
