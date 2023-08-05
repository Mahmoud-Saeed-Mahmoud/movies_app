import 'package:flutter_riverpod/flutter_riverpod.dart';

final pageNumberProvider = StateProvider<int>((ref) => 1);
final totalPagesProvider = StateProvider<int>((ref) => 2);
