import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:riverpod_part_one/Controllers/counter_controller.dart';

ProviderContainer appContainer = ProviderContainer();

final counterProvider = ChangeNotifierProvider<CounterController>(
  (ref) => CounterController(),
);
