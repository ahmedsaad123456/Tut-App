// view model = contoller
import 'dart:async';

import 'package:mvvm/presentation/common/state_renderer/state_render_impl.dart';
import 'package:rxdart/rxdart.dart';

abstract class BaseViewModel extends BaseViewModelInputs
    with BaseViewModelOutputs {
  // shared variables and functions that will be used through any view model.

  final StreamController _inputStateStreamController =
      BehaviorSubject<FlowState>();

  @override
  Sink get inputState => _inputStateStreamController.sink;

  @override
  Stream<FlowState> get outputState =>
      _inputStateStreamController.stream.map((flowState) => flowState);

  @override
  void dispose() {
    _inputStateStreamController.close();
  }
}

abstract class BaseViewModelInputs {
  void start(); // will be called while init. of view model.
  void dispose(); // will be called while view model dies.

  Sink get inputState;
}

// mixin to can use this class in many classes and with keyword "with"
mixin BaseViewModelOutputs {
  Stream<FlowState> get outputState;
}
