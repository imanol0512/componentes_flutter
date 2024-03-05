import 'package:flutter/material.dart';
import 'package:practica3/theme/app_theme.dart';
import 'package:transparent_image/transparent_image.dart';

class ImagesScreen extends StatefulWidget {
  const ImagesScreen({super.key});

  @override
  State<ImagesScreen> createState() => _ImagesScreenState();
}

class _ImagesScreenState extends State<ImagesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Imagenes'),
      ),
      body: ListView(
        children: [
          cardImage1(),
          image2(),
        ],
      ),
    );
  }

  Card cardImage1() {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      margin: const EdgeInsets.all(15),
      elevation: 10,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Column(
          children: [
            const Image(
              image: AssetImage('assets/img/Imagen.jpg'),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: Text(
                'Una pisina',
                style: AppTheme.lightTheme.textTheme.headlineMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }

  SizedBox image2() {
    return SizedBox(
        height: 250.0,
        width: 200.0,
        child: Image.network(
            'https://albercasaqualine.com.mx/wp-content/uploads/2017/03/construccion-de-albercas.jpeg'));
  }

  Stack imageFade() {
    return Stack(
      children: <Widget>[
        const Center(
          child: CircularProgressIndicator(),
        ),
        Center(
          child: FadeInImage.memoryNetwork(
              placeholder: kTransparentImage,
              image:
                  'https://albercasaqualine.com.mx/wp-content/uploads/2017/03/construccion-de-albercas.jpeg'),
        ),
      ],
    );
  }
}
