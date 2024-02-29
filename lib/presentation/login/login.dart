import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:mvvm/app/app_prefs.dart';
import 'package:mvvm/app/di.dart';
import 'package:mvvm/presentation/common/state_renderer/state_render_impl.dart';
import 'package:mvvm/presentation/login/login_viewmodel.dart';
import 'package:mvvm/presentation/resources/assets_manager.dart';
import 'package:mvvm/presentation/resources/color_manager.dart';
import 'package:mvvm/presentation/resources/routes_manager.dart';
import 'package:mvvm/presentation/resources/strings_manager.dart';
import 'package:mvvm/presentation/resources/values_manager.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final LoginViewModel _viewModel = instance<LoginViewModel>();
  final AppPreferences _appPreferences = instance<AppPreferences>();

  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  __bind() {
    _viewModel.start();

    // add listeners to trigger the changes in controllers
    _userNameController
        .addListener(() => _viewModel.setUserName(_userNameController.text));
    _passwordController
        .addListener(() => _viewModel.setPassword(_passwordController.text));


    // listen if the data is added to this stream controller
    _viewModel.isUserLoggedInSuccessfully.stream.listen((isSuccessLoggedIn) {
      // navigate to main screen

      // use this function to ensure that the current frame has finished
      // and to ensure that the UI of the current frame is completed
      SchedulerBinding.instance.addPostFrameCallback((_) {
        _appPreferences.setIsUserLoggedIn();
        Navigator.of(context).pushReplacementNamed(Routes.mainRoute);
      });
    });
  }

  @override
  void initState() {
    __bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: StreamBuilder<FlowState>(
        stream: _viewModel.outputState,
        builder: (context, snapshot) {
          return snapshot.data?.getScreenWidget(context, _getContentWidget(),
                  () {
                _viewModel.login();
              }) ??
              _getContentWidget();
        },
      ),
    );
  }

  Widget _getContentWidget() {
    return Container(
      padding: const EdgeInsets.only(top: AppPadding.p100),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const Image(image: AssetImage(ImageAssets.splashLogo)),
              const SizedBox(
                height: AppSize.s28,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: AppPadding.p28, right: AppPadding.p28),
                child: StreamBuilder<bool>(
                  // listen for outputIsUserNameValid
                  stream: _viewModel.outputIsUserNameValid,
                  builder: (context, snapshot) {
                    return TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: _userNameController,
                      decoration: InputDecoration(
                        hintText: AppStrings.userName.tr(),
                        labelText: AppStrings.userName.tr(),
                        errorText: (snapshot.data ?? true)
                            ? null
                            : AppStrings.userNameError.tr(),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: AppSize.s28,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: AppPadding.p28, right: AppPadding.p28),
                child: StreamBuilder<bool>(
                  // listen for outputIsPasswordValid
                  stream: _viewModel.outputIsPasswordValid,
                  builder: (context, snapshot) {
                    return TextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      controller: _passwordController,
                      decoration: InputDecoration(
                        hintText: AppStrings.password.tr(),
                        labelText: AppStrings.password.tr(),
                        errorText: (snapshot.data ?? true)
                            ? null
                            : AppStrings.passwordError.tr(),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: AppSize.s28,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: AppPadding.p28, right: AppPadding.p28),
                child: StreamBuilder<bool>(
                  // listen for outputIsAllInputsValid
                  stream: _viewModel.outputIsAllInputsValid,
                  builder: (context, snapshot) {
                    return SizedBox(
                      width: double.infinity,
                      height: AppSize.s40,
                      child: ElevatedButton(
                          onPressed: (snapshot.data ?? false)
                              ? () {
                                  _viewModel.login();
                                }
                              : null,
                          child: const Text(AppStrings.login).tr()),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: AppPadding.p8,
                    left: AppPadding.p28,
                    right: AppPadding.p28),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: TextButton(
                          onPressed: () {
                            Navigator.pushNamed(
                                context, Routes.forgptPasswordRoute);
                          },
                          child: Text(
                            AppStrings.forgetPassword,
                            style: Theme.of(context).textTheme.titleSmall,
                          ).tr()),
                    ),
                    Expanded(
                      child: TextButton(
                          onPressed: () {
                            Navigator.pushNamed(
                                context, Routes.registerRoute);
                          },
                          child: Text(
                            AppStrings.registerText,
                            style: Theme.of(context).textTheme.titleSmall,
                          ).tr()),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
}
