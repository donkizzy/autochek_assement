import 'package:equatable/equatable.dart';

class CarMakes extends Equatable {
  final List<MakeList>? makeList;
  final Pagination? pagination;

  const CarMakes({
    this.makeList,
    this.pagination,
  });

  factory CarMakes.fromJson(Map<String, dynamic> json) => CarMakes(
        makeList:
            json["makeList"] == null ? [] : List<MakeList>.from(json["makeList"]!.map((x) => MakeList.fromJson(x))),
        pagination: json["pagination"] == null ? null : Pagination.fromJson(json["pagination"]),
      );

  Map<String, dynamic> toJson() => {
        "makeList": makeList == null ? [] : List<dynamic>.from(makeList!.map((x) => x.toJson())),
        "pagination": pagination?.toJson(),
      };

  @override
  List<Object?> get props => [makeList, pagination];
}

class MakeList extends Equatable {
  final int? id;
  final String? name;
  final String? imageUrl;

  const MakeList({
    this.id,
    this.name,
    this.imageUrl,
  });

  factory MakeList.fromJson(Map<String, dynamic> json) => MakeList(
        id: json["id"],
        name: json["name"],
        imageUrl: json["imageUrl"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "imageUrl": imageUrl,
      };

  @override
  List<Object?> get props => [id, name, imageUrl];
}

class Pagination extends Equatable {
  final int? total;
  final int? currentPage;
  final int? pageSize;

  const Pagination({
    this.total,
    this.currentPage,
    this.pageSize,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        total: json["total"],
        currentPage: json["currentPage"],
        pageSize: json["pageSize"],
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "currentPage": currentPage,
        "pageSize": pageSize,
      };

  @override
  List<Object?> get props => [total, currentPage, pageSize];
}
