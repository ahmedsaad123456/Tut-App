import 'package:json_annotation/json_annotation.dart';
part 'responses.g.dart';

@JsonSerializable()
class BaseResponse {
  @JsonKey(name: "status")
  int? status; // it can be not matching
  @JsonKey(name: "message")
  String? message;
}

@JsonSerializable()
class CustomerResponse {
  @JsonKey(name: "id")
  String? id; // it can be not matching
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "numOfNotifications")
  int? numOfNotifications;

  CustomerResponse(this.id, this.name, this.numOfNotifications);
    // from json
  factory CustomerResponse.fromJson(Map<String, dynamic> json) =>
      _$CustomerResponseFromJson(json);

  // to json
  Map<String, dynamic> toJson() => _$CustomerResponseToJson(this);

}

@JsonSerializable()
class ContactsResponse {
  @JsonKey(name: "email")
  String? email; // it can be not matching
  @JsonKey(name: "phone")
  String? phone;
  @JsonKey(name: "link")
  String? link;

  ContactsResponse(this.email, this.phone, this.link);
    // from json
  factory ContactsResponse.fromJson(Map<String, dynamic> json) =>
      _$ContactsResponseFromJson(json);

  // to json
  Map<String, dynamic> toJson() => _$ContactsResponseToJson(this);

}

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
