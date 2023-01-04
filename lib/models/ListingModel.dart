// create a boat listing model
class ListingModel {
  final int id;
  final String title;
  final String description;
  final int price;
  final double lat;
  final double lng;
  final String image;
  final String owner;
  final String ownerEmail;
  final String ownerPhone;

  ListingModel({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.lat,
    required this.lng,
    required this.image,
    required this.owner,
    required this.ownerEmail,
    required this.ownerPhone,
  });

  factory ListingModel.fromJson(Map<String, dynamic> json) {
    return ListingModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      price: json['price'],
      lat: json['lat'],
      lng: json['lng'],
      image: json['image'],
      owner: json['owners_name'],
      ownerEmail: json['owners_email'],
      ownerPhone: json['owners_phone'],
    );
  }
}
