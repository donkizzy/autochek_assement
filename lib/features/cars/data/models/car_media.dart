class CarMedia {
  final List<CarMediaList>? carMediaList;
  final Pagination? pagination;

  CarMedia({
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
}

class CarMediaList {
  final int? id;
  final String? name;
  final String? url;
  final String? createdAt;
  final String? type;

  CarMediaList({
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
}

class Pagination {
  final int? total;
  final int? currentPage;
  final int? pageSize;

  Pagination({
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
}
