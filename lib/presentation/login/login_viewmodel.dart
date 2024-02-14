import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mvvm/domain/usecase/login_usecase.dart';
import 'package:mvvm/presentation/base/base_view_mode.dart';
import 'package:mvvm/presentation/common/freezed_data_classes.dart';

class LoginViewModel extends BaseViewModel
    with LoginViewModelInputs, LoginViewModelOutputs {
  // broadcast stream for multiple listeners
  StreamController _userNameStreamController =
      StreamController<String>.broadcast();

  StreamController _passwordStreamController =
      StreamController<String>.broadcast();

  StreamController _isAllInputsValidStreamController =
      StreamController<void>.broadcast();
  var loginObject = LoginObject("", "");

  LoginUseCase? _loginUseCase; // todo remove ?
  LoginViewModel(this._loginUseCase);

  // inputs
  @override
  void start() {
    // TODO: implement start
  }

  @override
  void dispose() {
    _userNameStreamController.close();
    _isAllInputsValidStreamController.close();
    _passwordStreamController.close();
  }

  @override
  Sink get inputPassword => _passwordStreamController.sink;

  @override
  Sink get inputUserName => _userNameStreamController.sink;

  @override
  Sink get inputIsAllInputsValid => _isAllInputsValidStreamController.sink;

  @override
  login() async {
    // (await _loginUseCase!.execute(
    //         LoginUseCaseInput(loginObject.userName, loginObject.password)))
    //     .fold(
    //         (failure) => {
    //               // left -> failure
    //               print(failure.message)
    //             },
    //         (data) => {
    //               // right -> success (data)
    //               print(data.customer?.name)
    //             });
  }

  @override
  setPassword(String password) {
    inputPassword.add(password);
    loginObject = loginObject.copyWith(
        password: password); // data class opearation same as kotlin
    // to when the user update the password add it in login stream (isAllInputsValid)
    _validate();
  }

  @override
  setUserName(String userName) {
    inputUserName.add(userName);
    loginObject = loginObject.copyWith(userName: userName);
    _validate();
  }

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
}

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

mixin LoginViewModelOutputs {
  // two stream
  Stream<bool> get outputIsUserNameValid;

  Stream<bool> get outputIsPasswordValid;

  Stream<bool> get outputIsAllInputsValid;
}
