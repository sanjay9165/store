import 'package:store/utilities/common_exports.dart';

class AuthenticationService {
  factory AuthenticationService() => _singleton;

  static final AuthenticationService _singleton =
      AuthenticationService._internal();
  late String _baseUrl;

  AuthenticationService._internal();

  ValueNotifier<int> tabValue = ValueNotifier(0);

  Future<void> initialiseApp() async {
    await dotenv.load(fileName: ".env");
    _baseUrl = (dotenv.env['BASE_URL'] ?? "");
  }

  Future<({String message, bool status})> signupUser({
    required String firstName,
    required String lastName,
    required String mobile,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    ({String message, bool status}) record = (message: "", status: false);
    try {
      final Map<String, String> payload = {
        "first_name": firstName,
        "last_name": lastName,
        "country_code": "+91",
        "phone_no": mobile,
        "email": email,
        "password": password,
        "confirm_password": confirmPassword,
      };

      log(payload.toString());
      Response response =
          await '$_baseUrl${ApiUrls.signupUrl}'.toUri().httpPost(body: payload);
      final Map<String, dynamic> responseBody =
          response.body.castToJsonDecodeToMapOfStringDynamic();

      if (response.statusCode == 200) {
        var data = responseBody["data"];

        await LocalService().setCredentails(
            id: data["id"].toString(),
            token: data["token"],
            email: data["email"]);
        record = (message: responseBody["message"], status: true);
      } else {
        record = (message: responseBody["message"], status: false);
      }
    } catch (err) {
      record = (message: err.toString(), status: false);
      log(err.toString());
    }
    return record;
  }

  Future<({String message, bool status})> loginUser({
    required String email,
    required String password,
  }) async {
    ({String message, bool status}) record = (message: "", status: false);
    try {
      final Map<String, String> payload = {
        "email": email,
        "password": password,
      };

      log(payload.toString());
      Response response =
          await '$_baseUrl${ApiUrls.signinUrl}'.toUri().httpPost(body: payload);
      final Map<String, dynamic> responseBody =
          response.body.castToJsonDecodeToMapOfStringDynamic();

      if (response.statusCode == 200) {
        var data = responseBody["record"];

        await LocalService().setCredentails(
            id: data["id"].toString(),
            token: data["authtoken"],
            email: data["email"]);
        record = (message: responseBody["message"], status: true);
      } else {
        record = (message: responseBody["message"], status: false);
      }
    } catch (err) {
      record = (message: err.toString(), status: false);
      log(err.toString());
    }
    return record;
  }

  Future<void> signOut() async {
    try {
      String token = LocalService().getToken() ?? "";

      Response response = await '$_baseUrl${ApiUrls.logoutUrl}'
          .toUri()
          .httpGet(headers: {"Authorization": "Bearer $token"});

      log(response.body);
    } catch (err) {
      log(err.toString());
    }
  }
}
