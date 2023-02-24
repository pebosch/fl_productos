import 'package:flutter/material.dart';
import 'package:productos_app/services/services.dart';
import 'package:productos_app/widgets/widgets.dart';
import 'package:provider/provider.dart';
import 'package:productos_app/screens/screens.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ProductosServices productosServices =
        Provider.of<ProductosServices>(context);

    if (productosServices.isLoading) return LoadingScreen();

    return Scaffold(
      appBar: AppBar(
        title: Text('Productos'),
      ),
      body: ListView.builder(
          itemCount: productosServices.productos.length,
          itemBuilder: (BuildContext context, int index) => GestureDetector(
              onTap: () {
                productosServices.productoSeleccionado =
                    productosServices.productos[index].copy();
                Navigator.pushNamed(context, 'product');
              },
              child: ProductCard(
                producto: productosServices.productos[index],
              ))),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}
