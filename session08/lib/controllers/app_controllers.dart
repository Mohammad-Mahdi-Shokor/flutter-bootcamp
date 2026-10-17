import 'package:flutter_14_7/controllers/taskController.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

ProviderContainer appcontainer = ProviderContainer();

final taskProvider = ChangeNotifierProvider<Taskcontroller>((ref) {
  return Taskcontroller();
});
