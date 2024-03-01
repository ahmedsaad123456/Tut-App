// to convert the response into a non nullable object(model)

import 'package:mvvm/app/extensions.dart';
import 'package:mvvm/data/responses/responses.dart';
import 'package:mvvm/domain/model/model.dart';

// convert data layer to domain layer

const EMPTY = "";
const ZERO = 0;

//================================================================================================================

extension CutomerResponseMapper on CustomerResponse? {
  Customer toDomain() {
    return Customer(
        this?.id?.orEmpty() ?? EMPTY,
        this?.name?.orEmpty() ?? EMPTY,
        this?.numOfNotifications?.orZero() ?? ZERO);
  }
}

//================================================================================================================

extension ContactsResponseMapper on ContactsResponse? {
  Contacts toDomain() {
    return Contacts(this?.email?.orEmpty() ?? EMPTY,
        this?.phone?.orEmpty() ?? EMPTY, this?.link?.orEmpty() ?? EMPTY);
  }
}

//================================================================================================================

extension AuthenticationResponseMapper on AuthenticationResponse? {
  Authentication toDomain() {
    return Authentication(
        this?.customerResponse?.toDomain(), this?.contactsResponse?.toDomain());
  }
}

//================================================================================================================

extension ForgotPasswordResponseMapper on ForgotPasswordResponse? {
  String toDomain() {
    return this?.support?.orEmpty() ?? EMPTY;
  }
}

//================================================================================================================

extension ServiecResponseMapper on ServiceResponse? {
  Service toDomain() {
    return Service(this?.id?.orZero() ?? ZERO, this?.title?.orEmpty() ?? EMPTY,
        this?.image?.orEmpty() ?? EMPTY);
  }
}

//================================================================================================================

extension StoreResponseMapper on StoresResponse? {
  Store toDomain() {
    return Store(this?.id?.orZero() ?? ZERO, this?.title?.orEmpty() ?? EMPTY,
        this?.image?.orEmpty() ?? EMPTY);
  }
}

//================================================================================================================

extension BannerResponseMapper on BannersResponse? {
  BannerAd toDomain() {
    return BannerAd(this?.id?.orZero() ?? ZERO, this?.title?.orEmpty() ?? EMPTY,
        this?.image?.orEmpty() ?? EMPTY, this?.link?.orEmpty() ?? EMPTY);
  }
}

//================================================================================================================

extension HomeResponseMapper on HomeResponse? {
  HomeObject toDomain() {
    List<Service> services = (this
                ?.data
                ?.services
                ?.map((serviceResponse) => serviceResponse.toDomain()) ??
            const Iterable.empty())
        .cast<Service>()
        .toList();

    List<BannerAd> banners = (this
                ?.data
                ?.banners
                ?.map((bannersResponse) => bannersResponse.toDomain()) ??
            const Iterable.empty())
        .cast<BannerAd>()
        .toList();

    List<Store> stores = (this
                ?.data
                ?.stores
                ?.map((storesResponse) => storesResponse.toDomain()) ??
            const Iterable.empty())
        .cast<Store>()
        .toList();

    var data = HomeData(services, stores, banners);
    return HomeObject(data);
  }
}

//================================================================================================================

extension StoreDetailsResponseMapper on StoreDetailsResponse? {
  StoreDetails toDomain() {
    return StoreDetails(
        this?.id?.orZero() ?? ZERO,
        this?.title?.orEmpty() ?? EMPTY,
        this?.image?.orEmpty() ?? EMPTY,
        this?.details?.orEmpty() ?? EMPTY,
        this?.services?.orEmpty() ?? EMPTY,
        this?.about?.orEmpty() ?? EMPTY);
  }
}

//================================================================================================================
