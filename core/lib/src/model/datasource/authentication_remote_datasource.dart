import 'package:core/core.dart';

import '../model/login_response_model.dart';
import '../model/logout_response_model.dart';
import '../model/register_response_model.dart';

class LoginFormModel extends Equatable {
  const LoginFormModel({
    required this.username,
    required this.password,
    required this.token,
  });

  final String username;
  final String password;
  final String token;

  @override
  List<Object> get props => [username, password, token];

  @override
  bool get stringify => true;
}

class RegisterFormModel extends Equatable {
  const RegisterFormModel({
    required this.username,
    required this.codeGroup,
    required this.password,
    required this.token,
  });

  final String username;
  final String codeGroup;
  final String password;
  final String token;

  @override
  List<Object> get props => [username, codeGroup, password, token];

  @override
  bool get stringify => true;
}

class AuthenticationRemoteDatasource {
  final Dio dio;
  const AuthenticationRemoteDatasource({
    required this.dio,
  });

  Future<UserModel?> login(LoginFormModel form) async {
    final formData = FormData.fromMap({
      "username": form.username,
      "password": form.password,
      "token_firebase": form.token,
    });
    final request = await dio.post("/login", data: formData);
    final response = LoginResponseModel.fromJson(
      Map<String, dynamic>.from(request.data),
    );

    if (!response.success || response.data == null) {
      if (response.message is List) {
        throw ValidationFailure(response.message);
      }

      throw CommonFailure(response.message);
    }

    return UserModel(
      data: response.data!,
      token: response.token!,
    );
  }

  Future<UserModel?> register(RegisterFormModel form) async {
    final formData = FormData.fromMap({
      "username": form.username,
      "password": form.password,
      "code_group": form.codeGroup,
      "token_firebase": form.token,
    });

    final request = await dio.post("/beta/register", data: formData);
    final response = RegisterResponseModel.fromJson(request.data);

    if (!response.success || response.data == null) {
      if (response.message is List) {
        throw ValidationFailure(response.message);
      }

      throw CommonFailure(response.message);
    }

    return UserModel(
      data: response.data!,
      token: response.token!,
    );
  }

  Future<LogoutResponseModel> logout(int userId) async {
    final formData = FormData.fromMap({
      "user_id": userId,
    });
    final request = await dio.post("/logout", data: formData);
    final response = LogoutResponseModel.fromJson(
      Map<String, dynamic>.from(request.data),
    );

    if (!response.success) {
      throw CommonFailure(response.message);
    }

    return response;
  }
}
