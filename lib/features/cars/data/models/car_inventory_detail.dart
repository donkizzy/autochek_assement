import 'package:equatable/equatable.dart';

class CarInventoryDetail extends Equatable {
  final List<dynamic>? features;
  final List<dynamic>? carFeatures;
  final List<dynamic>? modelFeatures;
  final List<dynamic>? damageMedia;
  final String? id;
  final int? year;
  final bool? insured;
  final int? mileage;
  final String? vin;
  final int? marketplacePrice;
  final bool? marketplaceVisible;
  final String? marketplaceVisibleDate;
  final bool? isFeatured;
  final String? imageUrl;
  final Model? model;
  final String? state;
  final String? country;
  final String? ownerType;
  final String? transmission;
  final String? fuelType;
  final String? sellingCondition;
  final BodyType? bodyType;
  final String? city;
  final int? marketplaceOldPrice;
  final String? createdAt;
  final String? updatedAt;
  final String? mileageUnit;
  final bool? hasWarranty;
  final bool? hasFinancing;
  final String? interiorColor;
  final String? exteriorColor;
  final String? engineType;
  final double? gradeScore;
  final int? installment;
  final bool? depositReceived;
  final int? loanValue;
  final String? websiteUrl;
  final bool? sold;
  final bool? hasThreeDImage;
  final InspectorDetails? inspectorDetails;
  final String? carName;
  final FinancingSettings? financingSettings;
  final int? ccMeasurement;

  const CarInventoryDetail({
    this.features,
    this.carFeatures,
    this.modelFeatures,
    this.damageMedia,
    this.id,
    this.year,
    this.insured,
    this.mileage,
    this.vin,
    this.marketplacePrice,
    this.marketplaceVisible,
    this.marketplaceVisibleDate,
    this.isFeatured,
    this.imageUrl,
    this.model,
    this.state,
    this.country,
    this.ownerType,
    this.transmission,
    this.fuelType,
    this.sellingCondition,
    this.bodyType,
    this.city,
    this.marketplaceOldPrice,
    this.createdAt,
    this.updatedAt,
    this.mileageUnit,
    this.hasWarranty,
    this.hasFinancing,
    this.interiorColor,
    this.exteriorColor,
    this.engineType,
    this.gradeScore,
    this.installment,
    this.depositReceived,
    this.loanValue,
    this.websiteUrl,
    this.sold,
    this.hasThreeDImage,
    this.inspectorDetails,
    this.carName,
    this.financingSettings,
    this.ccMeasurement,
  });

  factory CarInventoryDetail.fromJson(Map<String, dynamic> json) => CarInventoryDetail(
        features: json["features"] == null ? [] : List<dynamic>.from(json["features"]!.map((x) => x)),
        carFeatures: json["carFeatures"] == null ? [] : List<dynamic>.from(json["carFeatures"]!.map((x) => x)),
        modelFeatures: json["modelFeatures"] == null ? [] : List<dynamic>.from(json["modelFeatures"]!.map((x) => x)),
        damageMedia: json["damageMedia"] == null ? [] : List<dynamic>.from(json["damageMedia"]!.map((x) => x)),
        id: json["id"],
        year: json["year"],
        insured: json["insured"],
        mileage: json["mileage"],
        vin: json["vin"],
        marketplacePrice: json["marketplacePrice"],
        marketplaceVisible: json["marketplaceVisible"],
        marketplaceVisibleDate: json["marketplaceVisibleDate"],
        isFeatured: json["isFeatured"],
        imageUrl: json["imageUrl"],
        model: json["model"] == null ? null : Model.fromJson(json["model"]),
        state: json["state"],
        country: json["country"],
        ownerType: json["ownerType"],
        transmission: json["transmission"],
        fuelType: json["fuelType"],
        sellingCondition: json["sellingCondition"],
        bodyType: json["bodyType"] == null ? null : BodyType.fromJson(json["bodyType"]),
        city: json["city"],
        marketplaceOldPrice: json["marketplaceOldPrice"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        mileageUnit: json["mileageUnit"],
        hasWarranty: json["hasWarranty"],
        hasFinancing: json["hasFinancing"],
        interiorColor: json["interiorColor"],
        exteriorColor: json["exteriorColor"],
        engineType: json["engineType"],
        gradeScore: json["gradeScore"]?.toDouble(),
        installment: json["installment"],
        depositReceived: json["depositReceived"],
        loanValue: json["loanValue"],
        websiteUrl: json["websiteUrl"],
        sold: json["sold"],
        hasThreeDImage: json["hasThreeDImage"],
        inspectorDetails: json["inspectorDetails"] == null ? null : InspectorDetails.fromJson(json["inspectorDetails"]),
        carName: json["carName"],
        financingSettings:
            json["financingSettings"] == null ? null : FinancingSettings.fromJson(json["financingSettings"]),
        ccMeasurement: json["ccMeasurement"],
      );

  Map<String, dynamic> toJson() =>
      {
        "features": features == null ? [] : List<dynamic>.from(features!.map((x) => x)),
        "carFeatures": carFeatures == null ? [] : List<dynamic>.from(carFeatures!.map((x) => x)),
        "modelFeatures": modelFeatures == null ? [] : List<dynamic>.from(modelFeatures!.map((x) => x)),
        "damageMedia": damageMedia == null ? [] : List<dynamic>.from(damageMedia!.map((x) => x)),
        "id": id,
        "year": year,
        "insured": insured,
        "mileage": mileage,
        "vin": vin,
        "marketplacePrice": marketplacePrice,
        "marketplaceVisible": marketplaceVisible,
        "marketplaceVisibleDate": marketplaceVisibleDate,
        "isFeatured": isFeatured,
        "imageUrl": imageUrl,
        "model": model?.toJson(),
        "state": state,
        "country": country,
        "ownerType": ownerType,
        "transmission": transmission,
        "fuelType": fuelType,
        "sellingCondition": sellingCondition,
        "bodyType": bodyType?.toJson(),
        "city": city,
        "marketplaceOldPrice": marketplaceOldPrice,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "mileageUnit": mileageUnit,
        "hasWarranty": hasWarranty,
        "hasFinancing": hasFinancing,
        "interiorColor": interiorColor,
        "exteriorColor": exteriorColor,
        "engineType": engineType,
        "gradeScore": gradeScore,
        "installment": installment,
        "depositReceived": depositReceived,
        "loanValue": loanValue,
        "websiteUrl": websiteUrl,
        "sold": sold,
        "hasThreeDImage": hasThreeDImage,
        "inspectorDetails": inspectorDetails?.toJson(),
        "carName": carName,
        "financingSettings": financingSettings?.toJson(),
        "ccMeasurement": ccMeasurement,
      };

  @override
  List<Object?> get props => [
        features,
        carFeatures,
        modelFeatures,
        damageMedia,
        id,
        year,
        insured,
        mileage,
        vin,
        marketplacePrice,
        marketplaceVisible,
        marketplaceVisibleDate,
        isFeatured,
        imageUrl,
        model,
        state,
        country,
        ownerType,
        transmission,
        fuelType,
        sellingCondition,
        bodyType,
        city,
        marketplaceOldPrice,
        createdAt,
        updatedAt,
        mileageUnit,
        hasWarranty,
        hasFinancing,
        interiorColor,
        exteriorColor,
        engineType,
        gradeScore,
        installment,
        depositReceived,
        loanValue,
        websiteUrl,
        sold,
        hasThreeDImage,
        inspectorDetails,
        carName,
        financingSettings,
        ccMeasurement,
      ];
}

class BodyType extends Equatable {
  final int? id;
  final String? name;
  final String? imageUrl;

  const BodyType({
    this.id,
    this.name,
    this.imageUrl,
  });

  factory BodyType.fromJson(Map<String, dynamic> json) => BodyType(
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

class FinancingSettings extends Equatable {
  final LoanCalculator? loanCalculator;

  const FinancingSettings({
    this.loanCalculator,
  });

  factory FinancingSettings.fromJson(Map<String, dynamic> json) => FinancingSettings(
        loanCalculator: json["loanCalculator"] == null ? null : LoanCalculator.fromJson(json["loanCalculator"]),
      );

  Map<String, dynamic> toJson() => {
        "loanCalculator": loanCalculator?.toJson(),
      };

  @override
  List<Object?> get props => [loanCalculator];
}

class LoanCalculator extends Equatable {
  final double? loanPercentage;
  final Ranges? ranges;
  final DefaultValues? defaultValues;

  const LoanCalculator({
    this.loanPercentage,
    this.ranges,
    this.defaultValues,
  });

  factory LoanCalculator.fromJson(Map<String, dynamic> json) => LoanCalculator(
    loanPercentage: json["loanPercentage"]?.toDouble(),
        ranges: json["ranges"] == null ? null : Ranges.fromJson(json["ranges"]),
        defaultValues: json["defaultValues"] == null ? null : DefaultValues.fromJson(json["defaultValues"]),
      );

  Map<String, dynamic> toJson() => {
        "loanPercentage": loanPercentage,
        "ranges": ranges?.toJson(),
        "defaultValues": defaultValues?.toJson(),
      };

  @override
  List<Object?> get props => [loanPercentage, ranges, defaultValues];
}

class DefaultValues extends Equatable {
  final double? interestRate;
  final double? downPayment;
  final int? tenure;

  const DefaultValues({
    this.interestRate,
    this.downPayment,
    this.tenure,
  });

  factory DefaultValues.fromJson(Map<String, dynamic> json) => DefaultValues(
        interestRate: json["interestRate"]?.toDouble(),
        downPayment: json["downPayment"]?.toDouble(),
        tenure: json["tenure"],
      );

  Map<String, dynamic> toJson() => {
        "interestRate": interestRate,
        "downPayment": downPayment,
        "tenure": tenure,
      };

  @override
  List<Object?> get props => [interestRate, downPayment, tenure];
}

class Ranges extends Equatable {
  final double? minInterestRate;
  final double? maxInterestRate;
  final double? minDownPayment;
  final double? maxDownPayment;
  final int? tenure;

  const Ranges({
    this.minInterestRate,
    this.maxInterestRate,
    this.minDownPayment,
    this.maxDownPayment,
    this.tenure,
  });

  factory Ranges.fromJson(Map<String, dynamic> json) => Ranges(
        minInterestRate: json["minInterestRate"]?.toDouble(),
        maxInterestRate: json["maxInterestRate"]?.toDouble(),
        minDownPayment: json["minDownPayment"]?.toDouble(),
        maxDownPayment: json["maxDownPayment"]?.toDouble(),
        tenure: json["tenure"],
      );

  Map<String, dynamic> toJson() => {
        "minInterestRate": minInterestRate,
        "maxInterestRate": maxInterestRate,
        "minDownPayment": minDownPayment,
        "maxDownPayment": maxDownPayment,
        "tenure": tenure,
      };

  @override
  List<Object?> get props => [minInterestRate, maxInterestRate, minDownPayment, maxDownPayment, tenure];
}

class InspectorDetails extends Equatable {
  final List<InspectedMake>? inspectedMakes;
  final String? inspectorFullName;
  final int? totalInspection;
  final String? profileImageUrl;

  const InspectorDetails({
    this.inspectedMakes,
    this.inspectorFullName,
    this.totalInspection,
    this.profileImageUrl,
  });

  factory InspectorDetails.fromJson(Map<String, dynamic> json) => InspectorDetails(
        inspectedMakes: json["inspectedMakes"] == null
            ? []
            : List<InspectedMake>.from(json["inspectedMakes"]!.map((x) => InspectedMake.fromJson(x))),
        inspectorFullName: json["inspectorFullName"],
        totalInspection: json["totalInspection"],
        profileImageUrl: json["profileImageUrl"],
      );

  Map<String, dynamic> toJson() => {
        "inspectedMakes": inspectedMakes == null ? [] : List<dynamic>.from(inspectedMakes!.map((x) => x.toJson())),
        "inspectorFullName": inspectorFullName,
        "totalInspection": totalInspection,
        "profileImageUrl": profileImageUrl,
      };

  @override
  List<Object?> get props => [inspectedMakes, inspectorFullName, totalInspection, profileImageUrl];
}

class InspectedMake extends Equatable {
  final int? count;
  final String? name;
  final String? imageUrl;

  const InspectedMake({
    this.count,
    this.name,
    this.imageUrl,
  });

  factory InspectedMake.fromJson(Map<String, dynamic> json) => InspectedMake(
        count: json["count"],
        name: json["name"],
        imageUrl: json["imageUrl"],
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "name": name,
        "imageUrl": imageUrl,
      };

  @override
  List<Object?> get props => [count, name, imageUrl];
}

class Model extends Equatable {
  final List<dynamic>? modelFeatures;
  final int? id;
  final String? name;
  final String? imageUrl;
  final String? wheelType;
  final BodyType? make;
  final bool? popular;

  const Model({
    this.modelFeatures,
    this.id,
    this.name,
    this.imageUrl,
    this.wheelType,
    this.make,
    this.popular,
  });

  factory Model.fromJson(Map<String, dynamic> json) => Model(
        modelFeatures: json["modelFeatures"] == null ? [] : List<dynamic>.from(json["modelFeatures"]!.map((x) => x)),
        id: json["id"],
        name: json["name"],
        imageUrl: json["imageUrl"],
        wheelType: json["wheelType"],
        make: json["make"] == null ? null : BodyType.fromJson(json["make"]),
        popular: json["popular"],
      );

  Map<String, dynamic> toJson() =>
      {
        "modelFeatures": modelFeatures == null ? [] : List<dynamic>.from(modelFeatures!.map((x) => x)),
        "id": id,
        "name": name,
        "imageUrl": imageUrl,
        "wheelType": wheelType,
        "make": make?.toJson(),
        "popular": popular,
      };

  @override
  List<Object?> get props => [modelFeatures, id, name, imageUrl, wheelType, make, popular];
}
