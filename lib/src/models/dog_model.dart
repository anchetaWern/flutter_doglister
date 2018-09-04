class DogModel {
  String url;

  DogModel(Map<String, dynamic> parsedJson) {
    url = parsedJson['message'];
  }
}