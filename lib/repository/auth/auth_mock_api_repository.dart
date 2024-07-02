import 'package:clean_coding/models/user/user_model.dart';

import 'login_repository.dart';

class LoginMockApiRepository implements LoginRepository{

  @override
  Future<UserModel> loginApi (dynamic data)async{

   await Future.delayed(Duration(seconds: 2));
   final response ={'token': 'wrwdsvdfe4g'};

    return UserModel.fromJson(response);
  }

}