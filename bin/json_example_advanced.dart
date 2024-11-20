import 'dart:convert';

/// Klasse für ein Produkt mit Name und Preis
class Product {
  final String name;
  final double preis;

  Product({
    required this.name,
    required this.preis,
  });

  /// Wandelt eine Dart-Map, die aus einem JSON-String stammt, in eine Product-Instanz um.
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      name: json['name'] as String,
      preis: (json['preis'] as num).toDouble(),
    );
  }

  /// Wandelt die Product-Instanz in eine Map um, die dann JSON-enkodiert werden kann.
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'preis': preis,
    };
  }
}

/// Klasse für eine Bestellung mit einer Liste von Produkten und einer Bestellnummer
class Order {
  final String bestellnummer;
  final List<Product> produkte;

  Order({
    required this.bestellnummer,
    required this.produkte,
  });

  /// Wandelt eine Dart-Map, die aus einem JSON-String stammt, in eine Order-Instanz um.
  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      bestellnummer: json['bestellnummer'] as String,
      produkte: (json['produkte'] as List)
          .map((produktJson) => Product.fromJson(produktJson))
          .toList(),
    );
  }

  /// Wandelt die Order-Instanz in eine Map um, die dann JSON-enkodiert werden kann.
  Map<String, dynamic> toJson() {
    return {
      'bestellnummer': bestellnummer,
      'produkte': produkte.map((produkt) => produkt.toJson()).toList(),
    };
  }
}

/// Klasse für einen Benutzer mit Namen, E-Mail und Registrierungsdatum
class User {
  final String name;
  final String email;
  final DateTime registrierungsdatum;

  User({
    required this.name,
    required this.email,
    required this.registrierungsdatum,
  });

  /// Wandelt eine Dart-Map, die aus einem JSON-String stammt, in eine User-Instanz um.
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'] as String,
      email: json['email'] as String,
      registrierungsdatum:
          DateTime.parse(json['registrierungsdatum'] as String),
    );
  }

  /// Wandelt die User-Instanz in eine Map um, die dann JSON-enkodiert werden kann.
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'registrierungsdatum': registrierungsdatum.toIso8601String(),
    };
  }
}

void main() {
  // Ein Produkt erstellen und in JSON konvertieren
  final produkt = Product(name: "Apfel", preis: 1.5);
  final produktJson = produkt.toJson();
  print("Produkt zu JSON: ${jsonEncode(produktJson)}"); // Als JSON-String

  // Ein Produkt von JSON konvertieren
  final produktString = '{"name": "Apfel", "preis": 1.5}';
  final produktNeu = Product.fromJson(jsonDecode(produktString));
  print("Produkt von JSON: Name=${produktNeu.name}, Preis=${produktNeu.preis}");

  // Eine Bestellung erstellen und in JSON konvertieren
  final bestellung = Order(
    bestellnummer: "12345",
    produkte: [
      Product(name: "Apfel", preis: 1.5),
      Product(name: "Banane", preis: 0.8),
    ],
  );
  final bestellungJson = bestellung.toJson();
  print("Bestellung zu JSON: ${jsonEncode(bestellungJson)}"); // Als JSON-String

  // Eine Bestellung von JSON konvertieren
  final bestellungString =
      '{"bestellnummer": "12345", "produkte": [{"name": "Apfel", "preis": 1.5}, {"name": "Banane", "preis": 0.8}]}';
  final bestellungNeu = Order.fromJson(jsonDecode(bestellungString));
  print(
      "Bestellung von JSON: Bestellnummer=${bestellungNeu.bestellnummer}, Produkte=${bestellungNeu.produkte.map((p) => p.name).toList()}");

  // Einen Benutzer erstellen und in JSON konvertieren
  final benutzer = User(
    name: "Max Mustermann",
    email: "max@example.com",
    registrierungsdatum: DateTime.now(),
  );
  final benutzerJson = benutzer.toJson();
  print("Benutzer zu JSON: ${jsonEncode(benutzerJson)}"); // Als JSON-String

  // Einen Benutzer von JSON konvertieren
  final benutzerString =
      '{"name": "Max Mustermann", "email": "max@example.com", "registrierungsdatum": "2024-11-20T10:15:30.000Z"}';
  final benutzerNeu = User.fromJson(jsonDecode(benutzerString));
  print(
      "Benutzer von JSON: Name=${benutzerNeu.name}, Email=${benutzerNeu.email}, Registrierungsdatum=${benutzerNeu.registrierungsdatum}");
}
