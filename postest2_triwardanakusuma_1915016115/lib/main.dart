import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: HexColor("#ffffff"),
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Postest 2 Tri"),
        backgroundColor: HexColor("#000000"),
      ),
      body: const Body(),
    );
  }
}

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const <Widget>[
          TitleWithMoreBtn(title: "Recommended"),
          RecommendBooks(),
          TitleWithMoreBtn(title: "New"),
          NewBooks(),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}

class TitleWithMoreBtn extends StatelessWidget {
  const TitleWithMoreBtn({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: <Widget>[
          TitleWithCustomUnderline(text: title),
          const Spacer(),
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: HexColor("#000000"),
              borderRadius: const BorderRadius.all(
                Radius.circular(30),
              ),
            ),
            height: 30,
            width: 80,
            child: Text(
              'More',
              style: TextStyle(
                color: HexColor("#ffffff"),
                fontSize: 15,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TitleWithCustomUnderline extends StatelessWidget {
  const TitleWithCustomUnderline({Key? key, required this.text})
      : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 24,
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              text,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 10,
            right: 0,
            child: Container(
              height: 5,
              color: HexColor("#000000").withOpacity(0.2),
            ),
          )
        ],
      ),
    );
  }
}

class RecommendBooks extends StatelessWidget {
  const RecommendBooks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: const <Widget>[
          RecommendBookCard(
            image: "assets/images/book1.jpg",
            title: "Buku 1",
            country: "Indonesia",
            price: 11,
          ),
          RecommendBookCard(
            image: "assets/images/book2.jpg",
            title: "Buku 2",
            country: "Indonesia",
            price: 12,
          ),
          RecommendBookCard(
            image: "assets/images/book3.jpg",
            title: "Buku 3",
            country: "Indonesia",
            price: 13,
          ),
        ],
      ),
    );
  }
}

class RecommendBookCard extends StatelessWidget {
  const RecommendBookCard(
      {Key? key,
      required this.image,
      required this.title,
      required this.country,
      required this.price})
      : super(key: key);

  final String image, title, country;
  final int price;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(left: 20, top: 10, bottom: 50),
      width: size.width * 0.4,
      child: Column(
        children: <Widget>[
          Image.asset(image),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: HexColor("#ffffff"),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 5),
                  blurRadius: 30,
                  color: HexColor("#000000").withOpacity(0.3),
                ),
              ],
            ),
            child: Row(
              children: <Widget>[
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                          text: "$title\n".toUpperCase(),
                          style: Theme.of(context).textTheme.button),
                      TextSpan(
                        text: country.toUpperCase(),
                        style: TextStyle(
                          color: HexColor("#000000").withOpacity(0.5),
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Text(
                  '\$$price',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    color: HexColor("#000000"),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class NewBooks extends StatelessWidget {
  const NewBooks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: const <Widget>[
          NewBookCard(
            image: "assets/images/book4.jpg",
          ),
          NewBookCard(
            image: "assets/images/book5.jpg",
          ),
        ],
      ),
    );
  }
}

class NewBookCard extends StatelessWidget {
  const NewBookCard({Key? key, required this.image}) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(
        left: 20,
        top: 10,
        bottom: 10,
      ),
      width: size.width * 0.7,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(image),
        ),
      ),
    );
  }
}
