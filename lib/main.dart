import 'package:flutter/material.dart';

import 'domain/garden.dart';

void main() => runApp(GardenApp());

class GardenApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, title: 'Сады', home: HomePage());
  }
}

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.brown[200],
            foregroundColor: Colors.black,
            title: const Text('Европейские сады'),
            leading: Icon(Icons.nature, color: Colors.green[900]),
          ),
          body: GardensList()),
    );
  }
}

class GardensList extends StatelessWidget {
  final gardens = <Garden>[
    Garden(
        title: 'Хортус Ботаникус, Нидерланды',
        description: 'Действует с 1638-го года',
        image: 'assets/images/amsterdam.jpg',
        avatar: 'assets/images/amsterdam.jpg'),
    Garden(
        title: 'Деревенский дом в Англии',
        description: 'Английский ландшафтный стиль',
        image: 'assets/images/britain.jpg',
        avatar: 'assets/images/britain.jpg'),
    Garden(
        title: 'Вальдштейнский сад, Чехия',
        description: 'Основан в 1630-м году',
        image: 'assets/images/chezch.jpg',
        avatar: 'assets/images/chezch.jpg'),
    Garden(
        title: 'Парк дер Гертен, Германия',
        description: 'Действует с 2003-го года',
        image: 'assets/images/germany.jpg',
        avatar: 'assets/images/germany.jpg')
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Container(
      child: ListView.builder(
          itemCount: gardens.length,
          itemBuilder: (context, i) {
            var title;
            var avatar;
            return Card(
              elevation: 2.0,
              margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Container(
                decoration: BoxDecoration(color: Colors.brown[100]),
                child: ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 15),
                  leading: CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage(gardens[i].avatar)),
                  title: Text(
                    gardens[i].title,
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                        fontSize: 18),
                  ),
                  subtitle: Text(gardens[i].description),
                  trailing: const Icon(Icons.keyboard_arrow_right,
                      color: Colors.black),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailScreen(garden: gardens[i]),
                      ),
                    );
                  },
                ),
              ),
            );
          }),
    ));
  }

  subtitle(BuildContext context, Garden garden) {}
}

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key, required this.garden}) : super(key: key);

  final Garden garden;

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.brown[100],
        appBar: AppBar(
          backgroundColor: Colors.brown[200],
          foregroundColor: Colors.black,
          title: Text(garden.title),
        ),
        body: Container(
            child: Column(
          children: [
            Image.asset(garden.image),
            SizedBox(height: 30),
            Text(garden.description, style: TextStyle(fontSize: 18))
          ],
        )));
  }
}
