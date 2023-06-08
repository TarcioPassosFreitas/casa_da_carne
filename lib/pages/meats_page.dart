import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Meat {
  final String image;
  final String name;
  final double price;

  Meat(this.image, this.name, this.price);
}

class MeatsPage extends StatelessWidget {
  final List<Meat> meats = [
    Meat('lib/assets/images/meat1.jpg', 'Carne 1', 29.99),
    Meat('lib/assets/images/meat2.jpg', 'Carne 2', 39.99),
    Meat('lib/assets/images/fundo1.jpg', 'Carne 3', 49.99),
    Meat('lib/assets/images/fundo2.jpg', 'Carne 3', 59.99),
    Meat('lib/assets/images/fundo3.jpg', 'Carne 3', 69.99),
    Meat('lib/assets/images/fundo1.jpg', 'Carne 3', 79.99),
    Meat('lib/assets/images/fundo2.jpg', 'Carne 3', 89.99),
    Meat('lib/assets/images/fundo3.jpg', 'Carne 3', 99.99)
  ];

  @override
  Widget build(BuildContext context) {
    int crossAxisCount =
        MediaQuery.of(context).orientation == Orientation.portrait ? 2 : 3;

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
          Container(
            color: Colors.black.withOpacity(0.6),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                ),
                itemCount: meats.length,
                itemBuilder: (context, index) {
                  return Container(
                    child: Column(
                      children: [
                        Expanded(
                          child: Image.asset(meats[index].image,
                              fit: BoxFit.cover),
                        ),
                        Text(meats[index].name,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                        Text('R\$${meats[index].price.toStringAsFixed(2)}',
                            style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
