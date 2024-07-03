import 'package:equatable/equatable.dart';
import 'package:store/utilities/common_exports.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(AuthenticationInitial()) {
    on<SigninEvent>((event, emit) async {
      emit(AuthenticationLoading());
      ({String message, bool status}) result =
          await AuthenticationService().loginUser(
        email: event.email,
        password: event.password,
      );
      emit(result.status
          ? AuthenticationSuccess(result.message)
          : AuthenticationError(result.message));
    });

    on<SignupEvent>((event, emit) async {
      emit(AuthenticationLoading());
      ({String message, bool status}) result = await AuthenticationService()
          .signupUser(
              email: event.email,
              password: event.password,
              firstName: event.firstName,
              lastName: event.lastName,
              mobile: event.mobile,
              confirmPassword: event.confirmPassword);
      emit(result.status
          ? AuthenticationSuccess(result.message)
          : AuthenticationError(result.message));
    });

    on<SignoutEvent>((event, emit) => emit(AuthenticationInitial()));
  }
}
