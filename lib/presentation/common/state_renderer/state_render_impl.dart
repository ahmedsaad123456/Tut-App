import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mvvm/data/mapper/mapper.dart';
import 'package:mvvm/presentation/common/state_renderer/state_render.dart';
import 'package:mvvm/presentation/resources/strings_manager.dart';

//================================================================================================================

abstract class FlowState {
  StateRendererType getStateRendererType();
  String getMessage();
}

//================================================================================================================

// loading State (POPUP , FULLSCREEN)

class LoadingState extends FlowState {
  StateRendererType stateRendererType;
  String message;

  LoadingState({required this.stateRendererType, String? message})
      : message = message ?? AppStrings.loading.tr();

  @override
  String getMessage() => message;
  @override
  StateRendererType getStateRendererType() => stateRendererType;
}

//================================================================================================================

// error state (POPUP , FULLSCREEN)

class ErrorState extends FlowState {
  StateRendererType stateRendererType;
  String message;

  ErrorState(this.stateRendererType, this.message);

  @override
  String getMessage() => message;
  @override
  StateRendererType getStateRendererType() => stateRendererType;
}

//================================================================================================================

// CONTENT STATE
class ContentState extends FlowState {
  ContentState();

  @override
  String getMessage() => EMPTY;
  @override
  StateRendererType getStateRendererType() => StateRendererType.contentState;
}

//================================================================================================================

// EMPTY state
class EmptyState extends FlowState {
  String message;

  EmptyState(this.message);

  @override
  String getMessage() => message;
  @override
  StateRendererType getStateRendererType() =>
      StateRendererType.fullScreenEmptyState;
}

//================================================================================================================

// success state
class SuccessState extends FlowState {
  String message;

  SuccessState(this.message);

  @override
  String getMessage() => message;

  @override
  StateRendererType getStateRendererType() => StateRendererType.popupSuccess;
}

//================================================================================================================

extension FlowStateExtension on FlowState {
  Widget getScreenWidget(BuildContext context, Widget contentScreenWidget,
      Function retryActionFunction) {
    switch (runtimeType) {
      //================================================================================================================

      case const (LoadingState):
        {
          if (getStateRendererType() == StateRendererType.popupLoadingState) {
            // showing popup dialog
            showPopup(context, getStateRendererType(), getMessage());
            // return the content ui of the screen
            return contentScreenWidget;
          } else //StateRendererType.FULLSCREEN_LOADING_STATE
          {
            return StateRenderer(
              retryActionFunction: retryActionFunction,
              stateRendererType: getStateRendererType(),
              message: getMessage(),
            );
          }
        }

      //================================================================================================================

      case const (ErrorState):
        {
          dismissDialog(context);
          if (getStateRendererType() == StateRendererType.popupErrorState) {
            // showing popup dialog
            showPopup(context, getStateRendererType(), getMessage());
            // return the content ui of the screen
            return contentScreenWidget;
          } else //StateRendererType.FULLSCREEN_ERROR_STATE
          {
            return StateRenderer(
              retryActionFunction: retryActionFunction,
              stateRendererType: getStateRendererType(),
              message: getMessage(),
            );
          }
        }

      //================================================================================================================

      case const (ContentState):
        {
          dismissDialog(context);
          return contentScreenWidget;
        }

      //================================================================================================================

      case const (EmptyState):
        {
          return StateRenderer(
            stateRendererType: getStateRendererType(),
            message: getMessage(),
            retryActionFunction: retryActionFunction,
          );
        }

      //================================================================================================================

      case const (SuccessState):
        {
          // i should check if we are showing loading popup to remove it before showing success popup
          dismissDialog(context);

          // show popup
          showPopup(context, StateRendererType.popupSuccess, getMessage(),
              title: AppStrings.success.tr());
          // return content ui of the screen
          return contentScreenWidget;
        }

      //================================================================================================================

      default:
        {
          return contentScreenWidget;
        }
    }
  }

  //================================================================================================================

  dismissDialog(BuildContext context) {
    if (_isThereCurrentDialogShowing(context)) {
      Navigator.of(context, rootNavigator: true).pop(true);
    }
  }

  //================================================================================================================

  _isThereCurrentDialogShowing(BuildContext context) =>
      ModalRoute.of(context)?.isCurrent != true;

  //================================================================================================================

  showPopup(
      BuildContext context, StateRendererType stateRendererType, String message,
      {String title = EMPTY}) {
    WidgetsBinding.instance.addPostFrameCallback((_) => showDialog(
        context: context,
        builder: (BuildContext context) => StateRenderer(
            stateRendererType: stateRendererType,
            message: message,
            title: title,
            retryActionFunction: () {})));
  }
}
