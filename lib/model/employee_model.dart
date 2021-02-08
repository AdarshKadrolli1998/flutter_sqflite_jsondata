import 'dart:convert';

List<Employee> employeeFromJson(String str) =>
    List<Employee>.from(json.decode(str).map((x) => Employee.fromJson(x)));

String employeeToJson(List<Employee>data) =>
    json.encode(List<dynamic>.from(data.map((x)=> x.toJson())));
class Employee
{
  int id;
  String email;
  String username;
  String name;
  String phone;
  Address address;

  Employee(
      {
        this.id,
        this.email,
        this.username,
        this.name,
        this.phone,
        this.address
      }
      );

  factory Employee.fromJson(Map<String,dynamic>json) => Employee(
      id: json["id"],
      email: json["email"],
      username: json["username"],
      name: json["name"],
      phone:json['phone'],
      address:  json['address'] != null ? new Address.fromJson(json['address']) : null,
  );

  Map<String,dynamic>toJson() =>
      {
        "id":id,
        "email":email,
        "username":username,
        "name":name,
        "phone":phone,
        "address": this.address
      };
}

class Address {
  String street;
  String suite;
  String city;
  String zipcode;

  Address({this.street, this.suite, this.city, this.zipcode,});

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    street: json['street'],
    suite: json['suite'],
    city: json['city'],
    zipcode: json['zipcode'],
  );

  Map<String,dynamic>toJson() =>
      {
        "street":street,
        "suite":suite,
        "city":city,
        "zipcode":zipcode,
      };
}

// class Geo {
//   String lat;
//   String lng;
//
//   Geo({this.lat, this.lng});
//
//   Geo.fromJson(Map<String, dynamic> json) {
//     lat = json['lat'];
//     lng = json['lng'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['lat'] = this.lat;
//     data['lng'] = this.lng;
//     return data;
//   }
// }