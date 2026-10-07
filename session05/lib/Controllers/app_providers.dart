import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:riverpod_applicatin/Controllers/counter_controller.dart';
import 'package:riverpod_applicatin/Controllers/items_controller.dart';

ProviderContainer appContainer = ProviderContainer();

final counterProvider = ChangeNotifierProvider<CounterController>(
  (ref) => CounterController(),
);

final itemProvider = ChangeNotifierProvider<ItemsController>(
  (ref) => ItemsController(),
);
