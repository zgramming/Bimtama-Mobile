import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:bimtama/src/utils/constant.dart';

import '../../model/model/user_model.dart';

class UserState extends Equatable {
  final UserModel? item;
  final AsyncValue<bool?> onSet;
  final AsyncValue<bool?> onRemove;
  final AsyncValue<UserModel?> onLoad;
  const UserState({
    this.item,
    this.onSet = const AsyncData(null),
    this.onRemove = const AsyncData(null),
    this.onLoad = const AsyncData(null),
  });

  @override
  List<Object?> get props => [item, onSet, onRemove, onLoad];

  @override
  bool get stringify => true;

  UserState copyWith({
    UserModel? item,
    AsyncValue<bool?>? onSet,
    AsyncValue<bool?>? onRemove,
    AsyncValue<UserModel?>? onLoad,
  }) {
    return UserState(
      item: item ?? this.item,
      onSet: onSet ?? this.onSet,
      onRemove: onRemove ?? this.onRemove,
      onLoad: onLoad ?? this.onLoad,
    );
  }
}

class UserNotifier extends StateNotifier<UserState> {
  UserNotifier() : super(const UserState());

  Future<void> loadUser() async {
    try {
      state = state.copyWith(onLoad: const AsyncLoading());
      await Future.delayed(const Duration(seconds: 1));
      final sp = await SharedPreferences.getInstance();
      final encodedUser = sp.getString(keyAuthentication);
      if (encodedUser == null) {
        state = state.copyWith(
          onLoad: const AsyncData(null),
          item: null,
        );
        return;
      }

      final decodeUser = Map<String, dynamic>.from(json.decode(encodedUser));
      final user = UserModel.fromJson(decodeUser);
      setUser(user);
      state = state.copyWith(onLoad: AsyncData(user));
    } catch (e) {
      state = state.copyWith(
        onLoad: AsyncError(e.toString(), StackTrace.current),
      );
    }
  }

  Future<void> setUser(UserModel data) async {
    final sp = await SharedPreferences.getInstance();
    await sp.setString(keyAuthentication, jsonEncode(data));
    state = state.copyWith(item: data);
  }

  Future<void> unsetUser() async {
    final sp = await SharedPreferences.getInstance();
    await sp.remove(keyAuthentication);
    state = state.copyWith(item: null);
  }
}
