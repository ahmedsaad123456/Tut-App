import 'dart:ffi';

import 'package:mvvm/domain/model/model.dart';
import 'package:mvvm/domain/usecase/store_details.dart';
import 'package:mvvm/presentation/base/base_view_mode.dart';
import 'package:mvvm/presentation/common/state_renderer/state_render.dart';
import 'package:mvvm/presentation/common/state_renderer/state_render_impl.dart';
import 'package:rxdart/rxdart.dart';


//================================================================================================================

class StoreDetailsViewModel extends BaseViewModel
    with StoreDetailsViewModelInput, StoreDetailsViewModelOutput {
  final _storeDetailsStreamController = BehaviorSubject<StoreDetails>();

  final StoreDetailsUseCase storeDetailsUseCase;

  StoreDetailsViewModel(this.storeDetailsUseCase);

  //================================================================================================================

  @override
  start() async {
    _loadData();
  }

  //================================================================================================================

  _loadData() async {
    inputState.add(LoadingState(
        stateRendererType: StateRendererType.fullScreenLoadingState));
    (await storeDetailsUseCase.execute(Void)).fold(
      (failure) {
        inputState.add(ErrorState(
            StateRendererType.fullScreenErrorState, failure.message));
      },
      (storeDetails) async {
        inputState.add(ContentState());
        inputStoreDetails.add(storeDetails);
      },
    );
  }

  //================================================================================================================

  @override
  void dispose() {
    _storeDetailsStreamController.close();
    super.dispose();
  }

  //================================================================================================================

  @override
  Sink get inputStoreDetails => _storeDetailsStreamController.sink;

  //output
  @override
  Stream<StoreDetails> get outputStoreDetails =>
      _storeDetailsStreamController.stream.map((stores) => stores);
}


//================================================================================================================

mixin StoreDetailsViewModelInput {
  Sink get inputStoreDetails;
}


//================================================================================================================

mixin StoreDetailsViewModelOutput {
  Stream<StoreDetails> get outputStoreDetails;
}

//================================================================================================================
