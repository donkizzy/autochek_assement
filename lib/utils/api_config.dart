abstract class ApiConfig {
  static String baseUrl = ' https://api.staging.myautochek.com/v1/inventory';

  static String popularMakes = '$baseUrl/make?popular=true';
  static String allCars = '$baseUrl/car/search';
  static String carDetail({required String carId}) => '$baseUrl/car/$carId';
  static String carMedia({required String carId}) => '$baseUrl/car_media?carId=$carId';
}
