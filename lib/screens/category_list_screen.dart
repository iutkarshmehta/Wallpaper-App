import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CategoryList extends StatefulWidget {
  const CategoryList({Key? key}) : super(key: key);

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  List<String> category = [
    'animal',
    'landscapes',
    'people',
    'food',
    'architecture',
    'sports',
    'vehicle',
    'arts',
    'nature',
    'technology',
    'fashion',
    'music',
    'travel',
    'education',
    'science',
    'business',
    'health',
    'emotion',
    'leisure',
    'abstract',
  ];

  List<String> imageUrl = [
    'assets/animal.png',
    'assets/landscapes.png',
    'assets/people.png',
    'assets/food.png',
    'assets/architecture.png',
    'assets/sports.png',
    'assets/vehicle.png',
    'assets/arts.png',
    'assets/nature.png',
    'assets/technology.png',
    'assets/fashion.png',
    'assets/music.png',
    'assets/travel.png',
    'assets/education.png',
    'assets/science.png',
    'assets/business.png',
    'assets/health.png',
    'assets/emotion.png',
    'assets/leisure.png',
    'assets/abstract.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        centerTitle: false,
        title: const Text('Wallpapers',
          textAlign: TextAlign.start,
          style: TextStyle(fontSize: 25),),
      ),

      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Name'),
            ),
            ListTile(
              leading: Icon(Icons.email),
              title: Text('Email'),
            ),
            ListTile(
              leading: Icon(Icons.share),
              title: Text('Share App'),
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
            )
          ],
        ),
      ),
      body: GridView.builder(
          padding: const EdgeInsets.all(20),
          itemCount: imageUrl.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 20,
              crossAxisCount: 2,
              childAspectRatio: 2 / 3,
              crossAxisSpacing: 20),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: (){
                context.beamToNamed('/category_detail_screen');
              },

              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    Row(children: [
                      Container(
                          height: 150,
                          width: 150,
                          child: Center(
                            child: Image.asset(
                              imageUrl[index],
                              fit: BoxFit.fill,
                            ),
                          ))
                    ]),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          category[index].substring(0, 1).toUpperCase() +
                              category[index].substring(1),
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 20,
                              decoration: TextDecoration.none,
                              fontWeight: FontWeight.bold,
                              color: Colors.purple),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
