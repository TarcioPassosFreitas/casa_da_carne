import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ContactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
      child: Stack(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              height: MediaQuery.of(context).size.height,
              viewportFraction: 1.0,
              autoPlay: true,
            ),
            items: [
              'lib/assets/images/fundo1.jpg',
              'lib/assets/images/fundo2.jpg',
              'lib/assets/images/fundo3.jpg',
            ].map((imagePath) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(imagePath),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              );
            }).toList(),
          ),
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.8,
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.7),
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    'Telefone',
                    style: TextStyle(fontSize: 20.0, color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    '(00) 12345-6789',
                    style: TextStyle(fontSize: 20.0, color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Email',
                    style: TextStyle(fontSize: 20.0, color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'contato@casadecarnes.com',
                    style: TextStyle(fontSize: 20.0, color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Endereço',
                    style: TextStyle(fontSize: 20.0, color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'Rua das Carnes, 123\nBairro da Picanha, Cidade do Churrasco',
                    style: TextStyle(fontSize: 20.0, color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
