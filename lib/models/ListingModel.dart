// create a boat listing model
class ListingModel {
  final String id;
  final String title;
  final String description;
  final String price;
  final String location;
  final String image;
  final String owner;
  final String ownerEmail;
  final String ownerPhone;
  final String ownerImage;
  final String ownerLocation;
  final String ownerBio;

  ListingModel({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.location,
    required this.image,
    required this.owner,
    required this.ownerEmail,
    required this.ownerPhone,
    required this.ownerImage,
    required this.ownerLocation,
    required this.ownerBio,
  });

  factory ListingModel.fromJson(Map<String, dynamic> json) {
    return ListingModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      price: json['price'],
      location: json['location'],
      image: json['image'],
      owner: json['owner'],
      ownerEmail: json['ownerEmail'],
      ownerPhone: json['ownerPhone'],
      ownerImage: json['ownerImage'],
      ownerLocation: json['ownerLocation'],
      ownerBio: json['ownerBio'],
    );
  }
}
