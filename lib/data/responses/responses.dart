import 'package:json_annotation/json_annotation.dart';
part 'responses.g.dart';

//================================================================================================================


@JsonSerializable()
class BaseResponse {
  @JsonKey(name: "status")
  int? status; // it can be not matching
  @JsonKey(name: "message")
  String? message;
}

//================================================================================================================

@JsonSerializable()
class CustomerResponse {
  @JsonKey(name: "id")
  String? id; // it can be not matching
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "numOfNotifications")
  int? numOfNotifications;

  CustomerResponse({this.id, this.name, this.numOfNotifications});
  // from json
  factory CustomerResponse.fromJson(Map<String, dynamic> json) =>
      _$CustomerResponseFromJson(json);

  // to json
  Map<String, dynamic> toJson() => _$CustomerResponseToJson(this);
}


//================================================================================================================


@JsonSerializable()
class ContactsResponse {
  @JsonKey(name: "email")
  String? email; // it can be not matching
  @JsonKey(name: "phone")
  String? phone;
  @JsonKey(name: "link")
  String? link;

  ContactsResponse({this.email, this.phone, this.link});
  // from json
  factory ContactsResponse.fromJson(Map<String, dynamic> json) =>
      _$ContactsResponseFromJson(json);

  // to json
  Map<String, dynamic> toJson() => _$ContactsResponseToJson(this);
}

//================================================================================================================


@JsonSerializable()
class AuthenticationResponse extends BaseResponse {
  @JsonKey(name: "customer")
  CustomerResponse? customerResponse; // it can be not matching
  @JsonKey(name: "contacts")
  ContactsResponse? contactsResponse;

  AuthenticationResponse(this.customerResponse, this.contactsResponse);
  // from json
  factory AuthenticationResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthenticationResponseFromJson(json);

  // to json
  Map<String, dynamic> toJson() => _$AuthenticationResponseToJson(this);
}

//================================================================================================================


@JsonSerializable()
class ForgotPasswordResponse extends BaseResponse {
  @JsonKey(name: "support")
  String? support;

  ForgotPasswordResponse(this.support);

  // from json
  factory ForgotPasswordResponse.fromJson(Map<String, dynamic> json) =>
      _$ForgotPasswordResponseFromJson(json);

  // to json
  Map<String, dynamic> toJson() => _$ForgotPasswordResponseToJson(this);
}

//================================================================================================================

@JsonSerializable()
class ServiceResponse {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "title")
  String? title;
  @JsonKey(name: "image")
  String? image;

  ServiceResponse(this.id, this.title, this.image);

  // from json
  factory ServiceResponse.fromJson(Map<String, dynamic> json) =>
      _$ServiceResponseFromJson(json);

  // to json
  Map<String, dynamic> toJson() => _$ServiceResponseToJson(this);
}

//================================================================================================================

@JsonSerializable()
class StoresResponse {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "title")
  String? title;
  @JsonKey(name: "image")
  String? image;

  StoresResponse(this.id, this.title, this.image);

  // from json
  factory StoresResponse.fromJson(Map<String, dynamic> json) =>
      _$StoresResponseFromJson(json);

  // to json
  Map<String, dynamic> toJson() => _$StoresResponseToJson(this);
}

//================================================================================================================

@JsonSerializable()
class BannersResponse {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "title")
  String? title;
  @JsonKey(name: "image")
  String? image;
  @JsonKey(name: "link")
  String? link;

  BannersResponse(this.id, this.title, this.image);

  // from json
  factory BannersResponse.fromJson(Map<String, dynamic> json) =>
      _$BannersResponseFromJson(json);

  // to json
  Map<String, dynamic> toJson() => _$BannersResponseToJson(this);
}

//================================================================================================================

@JsonSerializable()
class HomeDataResponse {
  @JsonKey(name: "services")
  List<ServiceResponse>? services;
  @JsonKey(name: "stores")
  List<StoresResponse>? stores;
  @JsonKey(name: "banners")
  List<BannersResponse>? banners;

  HomeDataResponse(this.services, this.stores, this.banners);

  // from json
  factory HomeDataResponse.fromJson(Map<String, dynamic> json) =>
      _$HomeDataResponseFromJson(json);

  // to json
  Map<String, dynamic> toJson() => _$HomeDataResponseToJson(this);
}

//================================================================================================================

@JsonSerializable()
class HomeResponse extends BaseResponse {
  @JsonKey(name: "data")
  HomeDataResponse? data;

  HomeResponse(this.data);

  // from json
  factory HomeResponse.fromJson(Map<String, dynamic> json) =>
      _$HomeResponseFromJson(json);

  // to json
  Map<String, dynamic> toJson() => _$HomeResponseToJson(this);
}


//================================================================================================================

@JsonSerializable()
class StoreDetailsResponse extends BaseResponse {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'title')
  String? title;
  @JsonKey(name: 'image')
  String? image;
  @JsonKey(name: 'details')
  String? details;
  @JsonKey(name: 'services')
  String? services;
  @JsonKey(name: 'about')
  String? about;

  StoreDetailsResponse(
      this.id, this.title, this.image, this.details, this.services, this.about);

  factory StoreDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$StoreDetailsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$StoreDetailsResponseToJson(this);
}

//================================================================================================================
