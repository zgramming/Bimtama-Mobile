import 'package:permission_handler/permission_handler.dart';

class CustomPermissionHandler {
  CustomPermissionHandler._privateConstructor();

  static final CustomPermissionHandler instance =
      CustomPermissionHandler._privateConstructor();

  Future<void> requestPermissionStorage() async {
    final permissionFile = await Permission.storage.status;

    if (permissionFile.isDenied) {
      final request = await Permission.storage.request();
      if (request.isDenied) {
        throw Exception("Izin storage tidak diberikan");
      }
    }

    if (permissionFile.isPermanentlyDenied) {
      throw Exception(
        "Izin storage tidak diberikan, silahkan ubah di pengaturan",
      );
    }
  }

  Future<void> requestPermissionNotification() async {
    final permissionNotification = await Permission.notification.status;

    if (permissionNotification.isDenied) {
      final request = await Permission.notification.request();
      if (request.isDenied) {
        throw Exception("Izin notifikasi tidak diberikan");
      }
    }

    if (permissionNotification.isPermanentlyDenied) {
      throw Exception(
        "Izin notifikasi tidak diberikan, silahkan ubah di pengaturan",
      );
    }
  }
}

final customPermissionHandler = CustomPermissionHandler.instance;
