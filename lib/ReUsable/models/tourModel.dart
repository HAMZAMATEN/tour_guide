import 'package:cloud_firestore/cloud_firestore.dart';

class TourModel {
  final String? id;
  final String title;
  final String location;

  final String tourDescription;

  final String tourCategory;

  final String people;

  final String price;



  // final String tourRating;

  final String tourImage;

  final String? companyPhone;

  TourModel({
    required this.id,
    required this.title,
    required this.tourCategory,
    required this.tourDescription,
    required this.tourImage,
    required this.location,
    // required this.tourRating,
    required this.people,
    required this.price,
    this.companyPhone,
  });

  Map<String, dynamic> toJson() {
    return {
      "tourCategory": tourCategory,
      "tourDescription": tourDescription,
      "title": title,
      "location": location,
      // "tourRating": tourRating,
      'id': id,
      "tourImage": tourImage,
      "price": price,
      "people": people,
      "companyPhone": companyPhone,
    };
  }

  factory TourModel.fromJson(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final data = snapshot.data()!;
    return TourModel(
      id: data["id"],
      tourCategory: data["tourCategory"],
      tourDescription: data["tourDescription"],
      tourImage: data["tourImage"],
      title: data["title"],
      // tourRating: data["tourRating"],
      location: data["location"],
      people: data["people"],
      price: data["price"],
      companyPhone: data["companyPhone"],
    );
  }
}
