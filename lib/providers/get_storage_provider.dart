import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_storage/get_storage.dart';

final getStorageProvider = Provider<GetStorage>((ref) {
  return GetStorage();
});
