import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'src/app.dart';

// factory AuthenticationResponseModel.fromJson(Map<String, dynamic> json) =>
//     _$AuthenticationResponseModelFromJson(json);
// Map<String, dynamic> toJson() => _$AuthenticationResponseModelToJson(this);

/// flutter pub run build_runner watch --delete-conflicting-outputs
///
Future<void> main() async {
  runApp(const ProviderScope(child: MyApp()));
}
