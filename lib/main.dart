import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Segundo App em Flutter',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: ImageChangeScreen(),
    );
  }
}

class ImageChangeScreen extends StatefulWidget {
  @override
  _ImageChangeScreenState createState() => _ImageChangeScreenState();
}

class _ImageChangeScreenState extends State<ImageChangeScreen> {
  final List<String> _images = [
    'assets/images/image1.jpg',
    'assets/images/image2.jpg',
    'assets/images/image3.jpg',
  ];

  late String _currentImage;

  @override
  void initState() {
    super.initState();
    _currentImage = _images[0]; // Definindo a primeira imagem como inicial
  }

  void _changeImage() {
    setState(() {
      _currentImage = _images[Random().nextInt(_images.length)];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Segundo App em Flutter'),
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: _currentImage != null
                  ? Image.asset(
                _currentImage,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              )
                  : CircularProgressIndicator(),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _changeImage,
        child: Icon(Icons.refresh),
        backgroundColor: Colors.deepOrange,
      ),
    );
  }
}
