import 'package:clean_coding/config/data/network/network_services_api.dart';
import 'package:clean_coding/models/user/user_model.dart';

abstract class LoginRepository{

  @override
  Future<UserModel> loginApi (dynamic data);

}