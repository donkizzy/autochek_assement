import 'package:autochek_assessment/features/cars/data/models/car_make.dart';
import 'package:equatable/equatable.dart';

class CarMedia extends Equatable {
  final List<CarMediaList>? carMediaList;
  final Pagination? pagination;

  const CarMedia({
    this.carMediaList,
    this.pagination,
  });

  factory CarMedia.fromJson(Map<String, dynamic> json) => CarMedia(
        carMediaList: json["carMediaList"] == null
            ? []
            : List<CarMediaList>.from(json["carMediaList"]!.map((x) => CarMediaList.fromJson(x))),
        pagination: json["pagination"] == null ? null : Pagination.fromJson(json["pagination"]),
      );

  Map<String, dynamic> toJson() => {
        "carMediaList": carMediaList == null ? [] : List<dynamic>.from(carMediaList!.map((x) => x.toJson())),
        "pagination": pagination?.toJson(),
      };

  @override
  List<Object?> get props => [carMediaList, pagination];
}

class CarMediaList extends Equatable {
  final int? id;
  final String? name;
  final String? url;
  final String? createdAt;
  final String? type;

  const CarMediaList({
    this.id,
    this.name,
    this.url,
    this.createdAt,
    this.type,
  });

  factory CarMediaList.fromJson(Map<String, dynamic> json) => CarMediaList(
        id: json["id"],
        name: json["name"],
        url: json["url"],
        createdAt: json["createdAt"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "url": url,
        "createdAt": createdAt,
        "type": type,
      };

  @override
  List<Object?> get props => [id, name, url, createdAt, type];
}
