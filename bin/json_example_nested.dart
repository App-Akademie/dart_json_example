import 'dart:convert';

void main() {
  final complicatedJsonString = """
  {
    "products": [
      {
        "id": 1,
        "title": "kaiPhone 9",
        "description": "Tolles Smartphone ;-)",
        "price": 549,
        "brand": "Apple",
        "category": "smartphones",
        "images": [
          "https://kai.com/images/1/1.jpg",
          "https://kai.com/images/1/4.jpg"
        ]
      },
      {
        "id": 2,
        "title": "lennartPhone 11",
        "description": "Supertolles Smartphone ;-)",
        "price": 699,
        "brand": "Android",
        "category": "smartphones",
        "images": [
          "https://lennart.com/images/1/1.jpg",
          "https://lennart.com/images/1/4.jpg"
        ]
      }
    ]
  }
  """;

  final Map<String, dynamic> jsonDecoded = jsonDecode(complicatedJsonString);

  final price = jsonDecoded["products"][1]["price"];
  final name = jsonDecoded["products"][1]["title"];
  print("Preis von $name ist: $price €");

  final secondImageUrl = jsonDecoded["products"][0]["images"][1];
  print("URL des zweiten Bilds des ersten Eintrags: $secondImageUrl");
}
