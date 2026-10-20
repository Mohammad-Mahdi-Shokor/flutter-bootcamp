import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:session08_homework/controllers/item_controller.dart';

ProviderContainer appcontainer = ProviderContainer();

final itemProvider = ChangeNotifierProvider<ItemController>(
  (ref) => ItemController(),
);
