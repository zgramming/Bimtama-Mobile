import 'package:core/core.dart';
import 'package:flutter/material.dart';

// factory AuthenticationResponseModel.fromJson(Map<String, dynamic> json) =>
//     _$AuthenticationResponseModelFromJson(json);
// Map<String, dynamic> toJson() => _$AuthenticationResponseModelToJson(this);

/// flutter pub run build_runner watch --delete-conflicting-outputs

Future<void> main() async {
  runApp(const ProviderScope(child: MyApp()));
}
