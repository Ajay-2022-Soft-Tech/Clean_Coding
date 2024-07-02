import 'package:clean_coding/repository/auth/login_repository.dart';
import 'package:clean_coding/utils/enums.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_event.dart';
part 'login_state.dart';


class LoginBloc extends Bloc<LoginEvents,LoginStates>{

  LoginRepository loginRepository;

  LoginBloc({required this.loginRepository}) : super(const LoginStates()){


  on<EmailChanged>(_onEmailChanged);
  on<PasswordChanged>(_onPasswordChanged);
  on<LoginApi>(_loginApi);

  }
  void _onEmailChanged(EmailChanged event, Emitter<LoginStates> emit) {
    emit(
      state.copyWith(
        email: event.email,
      ),
    );
  }

  void _onPasswordChanged(PasswordChanged event, Emitter<LoginStates> emit) {
    emit(
      state.copyWith(
        password: event.password,
      ),
    );
  }
  void _loginApi(LoginApi event, Emitter<LoginStates> emit)async {
    Map data = {"email": "eve.holt@reqres.in", "password": state.password};
    // Map data ={"email": "eve.holt@reqres.in", "password": "cityslicka"};


      emit(
        state.copyWith(postApiStatus: PostApiStatus.success),
      );
    await loginRepository.loginApi(data).then((value) {

      if(value.error.isNotEmpty){

        emit(
          state.copyWith(message: value.error.toString(),postApiStatus:PostApiStatus.error),
        );
      }
      else{
        emit(
          state.copyWith(message: 'Login Successful',postApiStatus: PostApiStatus.success),
        );
      }

    }).onError((error, stackTrace) {

    emit(
      state.copyWith(message: error.toString()),
    );
  });
  }
}

