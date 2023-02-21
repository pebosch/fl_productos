import 'package:flutter/material.dart';
import 'package:productos_app/ui/input_decorations.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          _ProductStack(),
          _ProductForm(),
          SizedBox(height: 100),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.save_outlined),
        onPressed: () {},
      ),
    );
  }
}

class _ProductForm extends StatelessWidget {
  const _ProductForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25)),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: Offset(0, 5))
            ]),
        child: Form(
            child: Column(
          children: [
            SizedBox(height: 10),
            TextFormField(
                decoration: InputDecorations.authInputDecoration(
              hintText: 'Nombre del produto',
              labelText: 'Nombre:',
            )),
            SizedBox(height: 30),
            TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecorations.authInputDecoration(
                  hintText: '150€',
                  labelText: 'Precio:',
                )),
            SizedBox(height: 30),
            SwitchListTile.adaptive(
              value: true,
              title: Text('Disponible'),
              activeColor: Colors.indigo,
              onChanged: (value) {},
            ),
            SizedBox(height: 30),
          ],
        )),
      ),
    );
  }
}

class _ProductStack extends StatelessWidget {
  const _ProductStack({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Padding(
        padding: EdgeInsets.only(left: 10, right: 10, top: 10),
        child: Container(
          width: double.infinity,
          height: 450,
          decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(45), topRight: Radius.circular(45)),
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: Offset(0, 5))
              ]),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(45), topRight: Radius.circular(45)),
            child: FadeInImage(
              image: NetworkImage('https://via.placeholder.com/400x300'),
              placeholder: AssetImage('assets/jar-loading.gif'),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      Positioned(
          top: 60,
          left: 20,
          child: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(Icons.arrow_back_ios, size: 40, color: Colors.white),
          )),
      Positioned(
          top: 60,
          right: 20,
          child: IconButton(
            onPressed: () {},
            icon: Icon(Icons.camera_alt_rounded, size: 40, color: Colors.white),
          )),
    ]);
  }
}
