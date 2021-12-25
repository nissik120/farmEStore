import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';


class DiscountBanner extends StatelessWidget{

  final List<Map<String, dynamic>> offers = [
    {"icon": "assets/images/itemA.jpg", "name": "Potatoes", "price": "1.49"},
    {"icon": "assets/images/itemB.jpg", "name": "Rice", "price": "0.79"},
    {"icon": "assets/images/itemC.jpg", "name": "Eggs", "price": "1.30"},
    {"icon": "assets/images/itemD.jpg", "name": "Chicken", "price": "2.99"},
    {"icon": "assets/images/itemE.jpg", "name": "Beef", "price": "2.15"},
    {"icon": "assets/images/itemG.jpg", "name": "Honey", "price": "0.99"},
  ];


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Top Offers',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          CarouselSlider(
              items: List.generate(offers.length,
                  (index) => OfferCard(
                      icon: offers[index]["icon"],
                      name: offers[index]["name"],
                      price: offers[index]["price"],
                    press: (){},
                  )
              ),
              options: CarouselOptions(
                height: 240.0,
                autoPlay: true,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: Duration(microseconds: 2000),
                viewportFraction: 0.55,
              ),
          )
        ],
      ),
    );
  }

}

class OfferCard extends StatelessWidget{

  const OfferCard({
    Key key,
    @required this.icon,
    @required this.price,
    @required this.name,
    @required this.press,
  }):super(key: key);

  final String icon, price, name;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Card(
        color: Colors.grey[900],
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.white70, width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        margin: EdgeInsets.all(10),
        elevation: 6.0,
        shadowColor: Colors.grey[60],
        child: Container(
          padding: EdgeInsets.all(5),
          height: 240,
          width: 240,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: AssetImage(icon),
              fit: BoxFit.fill,
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children:[
              cardInfo(name, price),
            ],
          ),
        ),
      ),
    );
  }

  Widget cardInfo(name, price) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.amber,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
                icon: Icon (Icons.add_shopping_cart),
                color: Colors.white,
                onPressed: (){
                  print('Add Cart');
                }
            ),
            SizedBox(width: 15,),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children:[
                  Text(name,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                  ),
                  Text(price, style: TextStyle(color: Colors.white),),
                ]
            ),
            SizedBox(width: 5,),
          ],
        ),
    );
  }

}