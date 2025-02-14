class VenueModel {
  VenueModel({this.code, this.message, this.data});

  final String? code;
  final String? message;
  final Data? data;

  factory VenueModel.fromJson(Map<String, dynamic> json) {
    return VenueModel(
      code: json["code"],
      message: json["message"],
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": data?.toJson(),
      };
}

class Data {
  Data({
    required this.venues,
    required this.currentPage,
    required this.totalElements,
    required this.totalPages,
  });

  final List<Venue> venues;
  final int? currentPage;
  final int? totalElements;
  final int? totalPages;

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      venues: json["venues"] == null
          ? []
          : List<Venue>.from(json["venues"]!.map((x) => Venue.fromJson(x))),
      currentPage: json["currentPage"],
      totalElements: json["totalElements"],
      totalPages: json["totalPages"],
    );
  }

  Map<String, dynamic> toJson() => {
        "venues": venues.map((x) => x.toJson()).toList(),
        "currentPage": currentPage,
        "totalElements": totalElements,
        "totalPages": totalPages,
      };
}

class Venue {
  Venue({
    required this.id,
    required this.name,
    required this.address,
    required this.description,
    required this.status,
    required this.startingPrice,
    required this.venueImagePaths,
    required this.maxCapacity,
    required this.menuPrice,
    required this.amenities,
  });

  final String? id;
  final String? name;
  final String? address;
  final String? description;
  final String? status;
  final String? startingPrice;
  final List<String> venueImagePaths;
  final String? maxCapacity;
  final String? menuPrice;
  final List<dynamic> amenities;

  factory Venue.fromJson(Map<String, dynamic> json) {
    return Venue(
      id: json["id"],
      name: json["name"],
      address: json["address"],
      description: json["description"],
      status: json["status"],
      startingPrice: json["startingPrice"],
      venueImagePaths: json["venueImagePaths"] == null
          ? []
          : List<String>.from(json["venueImagePaths"]!.map((x) => x)),
      maxCapacity: json["maxCapacity"],
      menuPrice: json["menuPrice"],
      amenities: json["amenities"] == null
          ? []
          : List<dynamic>.from(json["amenities"]!.map((x) => x)),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "address": address,
        "description": description,
        "status": status,
        "startingPrice": startingPrice,
        "venueImagePaths": venueImagePaths.map((x) => x).toList(),
        "maxCapacity": maxCapacity,
        "menuPrice": menuPrice,
        "amenities": amenities.map((x) => x).toList(),
      };
}
