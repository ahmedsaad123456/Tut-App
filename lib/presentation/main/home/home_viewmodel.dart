import 'dart:ffi';

import 'package:mvvm/domain/model/model.dart';
import 'package:mvvm/domain/usecase/home_usecase.dart';
import 'package:mvvm/presentation/base/base_view_mode.dart';
import 'package:mvvm/presentation/common/state_renderer/state_render.dart';
import 'package:mvvm/presentation/common/state_renderer/state_render_impl.dart';
import 'package:rxdart/rxdart.dart';

//================================================================================================================

class HomeViewModel extends BaseViewModel
    with HomeViewModelInput, HomeViewModelOutput {
  // BehaviorSubject to retain the latest HomeViewObject value
  // and emits it to new subscribers immediately upon subscription.
  // This behavior is useful for keeping the UI in sync with the latest data or state changes.
  final _dataStreamController = BehaviorSubject<HomeViewObject>();

  final HomeUseCase _homeUseCase;

  HomeViewModel(this._homeUseCase);

  //================================================================================================================
  // --  inputs
  @override
  void start() {
    _getHomeData();
  }

  //================================================================================================================

  _getHomeData() async {
    inputState.add(LoadingState(
        stateRendererType: StateRendererType.fullScreenLoadingState));
    (await _homeUseCase.execute(Void)).fold(
        (failure) => {
              // left -> failure
              inputState.add(ErrorState(
                  StateRendererType.fullScreenErrorState, failure.message))
            }, (homeObject) {
      // right -> data (success)
      // content
      inputState.add(ContentState());
      inputHomeData.add(HomeViewObject(homeObject.data.stores,
          homeObject.data.services, homeObject.data.banners));
      // navigate to main screen
    });
  }

  //================================================================================================================
  @override
  void dispose() {
    _dataStreamController.close();
    super.dispose();
  }

  //================================================================================================================

  @override
  Sink get inputHomeData => _dataStreamController.sink;

  // -- outputs
  @override
  Stream<HomeViewObject> get outputHomeData =>
      _dataStreamController.stream.map((data) => data);

  //================================================================================================================
}


//================================================================================================================

mixin HomeViewModelInput {
  Sink get inputHomeData;
}

//================================================================================================================

mixin HomeViewModelOutput {
  Stream<HomeViewObject> get outputHomeData;
}

//================================================================================================================

class HomeViewObject {
  List<Store> stores;
  List<Service> services;
  List<BannerAd> banners;

  HomeViewObject(this.stores, this.services, this.banners);
}

//================================================================================================================