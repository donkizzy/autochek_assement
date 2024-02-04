import 'package:autochek_assessment/features/cars/data/models/car_make.dart';
import 'package:equatable/equatable.dart';

class CarInventory extends Equatable {
  final List<CarInventoryResult>? result;
  final Pagination? pagination;

  const CarInventory({
    this.result,
    this.pagination,
  });

  factory CarInventory.fromJson(Map<String, dynamic> json) => CarInventory(
        result: json["result"] == null
            ? []
            : List<CarInventoryResult>.from(json["result"]!.map((x) => CarInventoryResult.fromJson(x))),
        pagination: json["pagination"] == null ? null : Pagination.fromJson(json["pagination"]),
      );

  Map<String, dynamic> toJson() => {
        "result": result == null ? [] : List<dynamic>.from(result!.map((x) => x.toJson())),
        "pagination": pagination?.toJson(),
      };

  @override
  List<Object?> get props => [result, pagination];
}

class CarInventoryResult extends Equatable {
  final String? id;
  final String? title;
  final String? imageUrl;
  final int? year;
  final String? city;
  final String? state;
  final double? gradeScore;
  final String? sellingCondition;
  final bool? hasWarranty;
  final int? marketplacePrice;
  final int? marketplaceOldPrice;
  final bool? hasFinancing;
  final int? mileage;
  final String? mileageUnit;
  final double? installment;
  final bool? depositReceived;
  final double? loanValue;
  final String? websiteUrl;
  final Stats? stats;
  final String? bodyTypeId;
  final bool? sold;
  final bool? hasThreeDImage;
  final String? transmission;
  final String? fuelType;
  final DateTime? marketplaceVisibleDate;
  final int? ccMeasurement;

  const CarInventoryResult({
    this.id,
    this.title,
    this.imageUrl,
    this.year,
    this.city,
    this.state,
    this.gradeScore,
    this.sellingCondition,
    this.hasWarranty,
    this.marketplacePrice,
    this.marketplaceOldPrice,
    this.hasFinancing,
    this.mileage,
    this.mileageUnit,
    this.installment,
    this.depositReceived,
    this.loanValue,
    this.websiteUrl,
    this.stats,
    this.bodyTypeId,
    this.sold,
    this.hasThreeDImage,
    this.transmission,
    this.fuelType,
    this.marketplaceVisibleDate,
    this.ccMeasurement,
  });

  factory CarInventoryResult.fromJson(Map<String, dynamic> json) => CarInventoryResult(
        id: json["id"],
        title: json["title"],
        imageUrl: json["imageUrl"],
        year: json["year"],
        city: json["city"],
        state: json["state"],
        gradeScore: json["gradeScore"]?.toDouble(),
        sellingCondition: json["sellingCondition"],
        hasWarranty: json["hasWarranty"],
        marketplacePrice: json["marketplacePrice"],
        marketplaceOldPrice: json["marketplaceOldPrice"],
        hasFinancing: json["hasFinancing"],
        mileage: json["mileage"],
        mileageUnit: json["mileageUnit"],
        installment: json["installment"]?.toDouble(),
        depositReceived: json["depositReceived"],
        loanValue: json["loanValue"]?.toDouble(),
        websiteUrl: json["websiteUrl"],
        stats: json["stats"] == null ? null : Stats.fromJson(json["stats"]),
        bodyTypeId: json["bodyTypeId"],
        sold: json["sold"],
        hasThreeDImage: json["hasThreeDImage"],
        transmission: json["transmission"],
        fuelType: json["fuelType"],
        marketplaceVisibleDate:
            json["marketplaceVisibleDate"] == null ? null : DateTime.parse(json["marketplaceVisibleDate"]),
        ccMeasurement: json["ccMeasurement"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "imageUrl": imageUrl,
        "year": year,
        "city": city,
        "state": state,
        "gradeScore": gradeScore,
        "sellingCondition": sellingCondition,
        "hasWarranty": hasWarranty,
        "marketplacePrice": marketplacePrice,
        "marketplaceOldPrice": marketplaceOldPrice,
        "hasFinancing": hasFinancing,
        "mileage": mileage,
        "mileageUnit": mileageUnit,
        "installment": installment,
        "depositReceived": depositReceived,
        "loanValue": loanValue,
        "websiteUrl": websiteUrl,
        "stats": stats?.toJson(),
        "bodyTypeId": bodyTypeId,
        "sold": sold,
        "hasThreeDImage": hasThreeDImage,
        "transmission": transmission,
        "fuelType": fuelType,
        "marketplaceVisibleDate": marketplaceVisibleDate?.toIso8601String(),
        "ccMeasurement": ccMeasurement,
      };

  @override
  List<Object?> get props => [
        id,
        title,
        imageUrl,
        year,
        city,
        state,
        gradeScore,
        sellingCondition,
        hasWarranty,
        marketplacePrice,
        marketplaceOldPrice,
        hasFinancing,
        mileage,
        mileageUnit,
        installment,
        depositReceived,
        loanValue,
        websiteUrl,
        stats,
        bodyTypeId,
        sold,
        hasThreeDImage,
        transmission,
        fuelType,
        marketplaceVisibleDate,
        ccMeasurement,
      ];
}

class Stats extends Equatable {
  final int? webViewCount;
  final int? webViewerCount;
  final int? interestCount;
  final int? testDriveCount;
  final int? appViewCount;
  final int? appViewerCount;
  final int? processedLoanCount;

  const Stats({
    this.webViewCount,
    this.webViewerCount,
    this.interestCount,
    this.testDriveCount,
    this.appViewCount,
    this.appViewerCount,
    this.processedLoanCount,
  });

  factory Stats.fromJson(Map<String, dynamic> json) => Stats(
        webViewCount: json["webViewCount"],
        webViewerCount: json["webViewerCount"],
        interestCount: json["interestCount"],
        testDriveCount: json["testDriveCount"],
        appViewCount: json["appViewCount"],
        appViewerCount: json["appViewerCount"],
        processedLoanCount: json["processedLoanCount"],
      );

  Map<String, dynamic> toJson() => {
        "webViewCount": webViewCount,
        "webViewerCount": webViewerCount,
        "interestCount": interestCount,
        "testDriveCount": testDriveCount,
        "appViewCount": appViewCount,
        "appViewerCount": appViewerCount,
        "processedLoanCount": processedLoanCount,
      };

  @override
  List<Object?> get props => [
        webViewCount,
        webViewerCount,
        interestCount,
        testDriveCount,
        appViewCount,
        appViewerCount,
        processedLoanCount,
      ];
}
