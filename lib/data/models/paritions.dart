import 'dart:convert';

AllCategories allCategoriesFromJson(String str) => AllCategories.fromJson(json.decode(str));

String allCategoriesToJson(AllCategories data) => json.encode(data.toJson());

class AllCategories {
  AllCategories({
    required this.status,
    required this.data,
  });

  bool status;
  List<Datum> data;

  factory AllCategories.fromJson(Map<String, dynamic> json) => AllCategories(
    status: json["status"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    required this.categoryId,
    required this.categoryName,
    required this.categoryImage,
  });

  int categoryId;
  String categoryName;
  String categoryImage;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    categoryId: json["category_id"],
    categoryName: json["category_name"],
    categoryImage: json["category_image"],
  );

  Map<String, dynamic> toJson() => {
    "category_id": categoryId,
    "category_name": categoryName,
    "category_image": categoryImage,
  };
}
