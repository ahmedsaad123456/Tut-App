import 'dart:async';

import 'package:mvvm/domain/usecase/login_usecase.dart';
import 'package:mvvm/presentation/base/base_view_mode.dart';
import 'package:mvvm/presentation/common/freezed_data_classes.dart';
import 'package:mvvm/presentation/common/state_renderer/state_render.dart';
import 'package:mvvm/presentation/common/state_renderer/state_render_impl.dart';


//================================================================================================================

class LoginViewModel extends BaseViewModel
    with LoginViewModelInputs, LoginViewModelOutputs {
  // broadcast stream for multiple listeners
  final StreamController _userNameStreamController =
      StreamController<String>.broadcast();

  final StreamController _passwordStreamController =
      StreamController<String>.broadcast();

  final StreamController _isAllInputsValidStreamController =
      StreamController<void>.broadcast();

  final StreamController isUserLoggedInSuccessfully = StreamController<bool>();
  var loginObject = LoginObject("", "");

  final LoginUseCase _loginUseCase;
  LoginViewModel(this._loginUseCase);

  //================================================================================================================

  

  // inputs
  @override
  void start() {
    // view tells state renderer, please show the content of the screen
    inputState.add(ContentState());
  }

  //================================================================================================================

  @override
  void dispose() {
    _userNameStreamController.close();
    _isAllInputsValidStreamController.close();
    _passwordStreamController.close();
    isUserLoggedInSuccessfully.close();
  }

  //================================================================================================================

  @override
  Sink get inputPassword => _passwordStreamController.sink;

  @override
  Sink get inputUserName => _userNameStreamController.sink;

  @override
  Sink get inputIsAllInputsValid => _isAllInputsValidStreamController.sink;


  //================================================================================================================
  @override
  login() async {
    inputState.add(
        LoadingState(stateRendererType: StateRendererType.popupLoadingState));
    (await _loginUseCase.execute(
            LoginUseCaseInput(loginObject.userName, loginObject.password)))
        .fold(
            (failure) => {
                  // left -> failure
                  inputState.add(ErrorState(
                      StateRendererType.popupErrorState, failure.message)),
                },
            (data) => {
                  // right -> success (data)
                  inputState.add(ContentState()),
                  // navigation to main screen after the login
                  isUserLoggedInSuccessfully.add(true),
                });
  }

  //================================================================================================================

  @override
  setPassword(String password) {
    inputPassword.add(password);
    loginObject = loginObject.copyWith(
        password: password); // data class opearation same as kotlin
    // to when the user update the password add it in login stream (isAllInputsValid)
    // to notify the listeners of inputIsAllInputsValid stream
    _validate();
  }

  //================================================================================================================

  @override
  setUserName(String userName) {
    inputUserName.add(userName);
    loginObject = loginObject.copyWith(userName: userName);
    _validate();
  }

  //================================================================================================================

  // outputs
  @override
  Stream<bool> get outputIsPasswordValid => _passwordStreamController.stream
      .map((password) => _isPasswordValid(password));

  @override
  Stream<bool> get outputIsUserNameValid => _userNameStreamController.stream
      .map((userName) => _isUserNameValid(userName));

  @override
  Stream<bool> get outputIsAllInputsValid =>
      _isAllInputsValidStreamController.stream.map((_) => _isAllInputsValid());


  //================================================================================================================
  // private functions

  _validate() {
    inputIsAllInputsValid.add(null);
  }

  bool _isPasswordValid(String password) {
    return password.isNotEmpty;
  }

  bool _isUserNameValid(String userName) {
    return userName.isNotEmpty;
  }

  bool _isAllInputsValid() {
    return _isUserNameValid(loginObject.userName) &&
        _isPasswordValid(loginObject.password);
  }

  //================================================================================================================
}


//================================================================================================================
mixin LoginViewModelInputs {
  // three functions

  setUserName(String userName);
  setPassword(String password);
  login();

  // three sinks
  Sink get inputUserName;
  Sink get inputPassword;
  Sink get inputIsAllInputsValid;
}

//================================================================================================================
mixin LoginViewModelOutputs {
  // three stream
  Stream<bool> get outputIsUserNameValid;

  Stream<bool> get outputIsPasswordValid;

  Stream<bool> get outputIsAllInputsValid;
}
//================================================================================================================
