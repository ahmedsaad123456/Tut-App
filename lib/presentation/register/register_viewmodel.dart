import 'dart:async';

import 'package:mvvm/domain/usecase/login_usecase.dart';
import 'package:mvvm/presentation/base/base_view_mode.dart';
import 'package:mvvm/presentation/common/freezed_data_classes.dart';
import 'package:mvvm/presentation/common/state_renderer/state_render.dart';
import 'package:mvvm/presentation/common/state_renderer/state_render_impl.dart';

class LoginViewModel extends BaseViewModel
    with RegisterViewModelInputs, RegisterViewModelOutputs {
  final StreamController _userNameStreamController =
      StreamController<String>.broadcast();

  final StreamController _MobileCountryCodeStreamController =
      StreamController<String>.broadcast();

  final StreamController _MobileNumberStreamController =
      StreamController<String>.broadcast();

  final StreamController _EmailStreamController =
      StreamController<String>.broadcast();

  final StreamController _passwordStreamController =
      StreamController<String>.broadcast();

  final StreamController _ProfileStreamController =
      StreamController<String>.broadcast();

  final StreamController _isAllInputsValidStreamController =
      StreamController<void>.broadcast();
  @override
  void start() {
    // view tells state renderer, please show the content of the screen
    inputState.add(ContentState());
  }

  @override
  void dispose() {
    _userNameStreamController.close();
    _EmailStreamController.close();
    _MobileCountryCodeStreamController.close();
    _MobileNumberStreamController.close();
    _isAllInputsValidStreamController.close();
    _passwordStreamController.close();
    _ProfileStreamController.close();
  }

  @override
  register() {
    // TODO: implement register
    throw UnimplementedError();
  }

  // inputs

  @override
  Sink get inputEmail => _EmailStreamController.sink;

  @override
  Sink get inputIsAllInputsValid => _isAllInputsValidStreamController.sink;

  @override
  Sink get inputMobileCountryCode => _MobileCountryCodeStreamController.sink;

  @override
  Sink get inputMobileNumber => _MobileNumberStreamController.sink;

  @override
  Sink get inputPassword => _passwordStreamController.sink;

  @override
  Sink get inputUserName => _userNameStreamController.sink;



  // outputs
  @override
  Stream<bool> get outputIsAllInputsValid => throw UnimplementedError();

  @override
  Stream<bool> get outputIsEmailValid => throw UnimplementedError();

  @override
  Stream<bool> get outputIsMobileCountryCodeValid => throw UnimplementedError();

  @override
  Stream<bool> get outputIsMobileNumberValid => throw UnimplementedError();

  @override
  Stream<bool> get outputIsPasswordValid => throw UnimplementedError();

  @override
  Stream<bool> get outputIsProfilePictureValid => throw UnimplementedError();

  @override
  Stream<bool> get outputIsUserNameValid => throw UnimplementedError();

  @override
  Sink get profilePicture => throw UnimplementedError();

  @override
  setEmail(String email) {
    throw UnimplementedError();
  }

  @override
  setMobileCountryCode(String mobileCountryCode) {
    throw UnimplementedError();
  }

  @override
  setMobileNumber(String mobileNumber) {
    throw UnimplementedError();
  }

  @override
  setPassword(String password) {
    throw UnimplementedError();
  }

  @override
  setProfilePicture(String profilePicture) {
    throw UnimplementedError();
  }

  @override
  setUserName(String userName) {
    throw UnimplementedError();


    
  }

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

  // bool _isAllInputsValid() {
  //   return _isUserNameValid(loginObject.userName) &&
  //       _isPasswordValid(loginObject.password);
  // }
}

mixin RegisterViewModelInputs {
  // seven functions

  setUserName(String userName);
  setMobileCountryCode(String mobileCountryCode);
  setMobileNumber(String mobileNumber);
  setEmail(String email);
  setPassword(String password);
  setProfilePicture(String profilePicture);
  register();

  // seven sinks

  Sink get inputUserName;
  Sink get inputMobileCountryCode;
  Sink get inputMobileNumber;
  Sink get inputEmail;
  Sink get inputPassword;
  Sink get profilePicture;
  Sink get inputIsAllInputsValid;
}

mixin RegisterViewModelOutputs {
  // seven outputs
  Stream<bool> get outputIsUserNameValid;

  Stream<bool> get outputIsMobileCountryCodeValid;

  Stream<bool> get outputIsMobileNumberValid;

  Stream<bool> get outputIsEmailValid;

  Stream<bool> get outputIsPasswordValid;

  Stream<bool> get outputIsProfilePictureValid;

  // for the button
  Stream<bool> get outputIsAllInputsValid;
}
