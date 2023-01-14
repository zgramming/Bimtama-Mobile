import 'package:core/core.dart';

class ApplicationSettingModel extends Equatable {
  const ApplicationSettingModel({
    this.hasNotification = false,
  });

  final bool hasNotification;

  @override
  List<Object> get props => [hasNotification];

  @override
  bool get stringify => true;

  ApplicationSettingModel copyWith({
    bool? hasNotification,
  }) {
    return ApplicationSettingModel(
      hasNotification: hasNotification ?? this.hasNotification,
    );
  }
}

class ApplicationSettingState extends Equatable {
  const ApplicationSettingState({
    this.item = const ApplicationSettingModel(),
  });

  final ApplicationSettingModel item;

  @override
  List<Object> get props => [item];

  @override
  bool get stringify => true;

  ApplicationSettingState copyWith({
    ApplicationSettingModel? item,
  }) {
    return ApplicationSettingState(
      item: item ?? this.item,
    );
  }
}

class ApplicationSettingNotifier
    extends StateNotifier<ApplicationSettingState> {
  ApplicationSettingNotifier() : super(const ApplicationSettingState()) {
    loadApplicationSetting();
  }

  Future<void> loadApplicationSetting() async {
    final notification =
        await Permission.notification.status == PermissionStatus.granted;
    state = state.copyWith(
      item: ApplicationSettingModel(hasNotification: notification),
    );
  }

  Future<void> changeNotification(bool value) async {
    state = state.copyWith(item: state.item.copyWith(hasNotification: value));
  }
}
