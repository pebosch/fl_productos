import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:productos_app/models/models.dart';
import 'package:http/http.dart' as http;

class ProductosServices extends ChangeNotifier {
  final String _baseURL =
      'flutter-productos-59724-default-rtdb.europe-west1.firebasedatabase.app';
  final List<Producto> productos = [];
  bool isLoading = true;

  ProductosServices() {
    this.loadProductos();
  }

  Future loadProductos() async {
    final url = Uri.https(_baseURL, 'productos.json');
    final resp = await http.get(url);

    final Map<String, dynamic> productosMap = json.decode(resp.body);

    productosMap.forEach((key, value) {});
  }
}
