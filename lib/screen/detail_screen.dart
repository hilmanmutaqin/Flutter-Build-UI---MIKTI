import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Digital Card',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DigitalCard(),
    );
  }
}

class DigitalCard extends StatefulWidget {
  @override
  _DigitalCardState createState() => _DigitalCardState();
}

class _DigitalCardState extends State<DigitalCard> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('Digital Card'),
      ),
      body: Center(
        child: screenWidth >= 600 ? _buildHorizontalCard() : _buildVerticalCard(),
      ),
    );
  }

  Widget _buildHorizontalCard() {
    return GridView.count(
      crossAxisCount: 2,
      padding: EdgeInsets.all(20),
      mainAxisSpacing: 20,
      crossAxisSpacing: 20,
      children: [
        _buildCardItem("Hilman", "Mahasiswa", "0821xxxxxx", "hilman***@gmail.com", 'https://img.icons8.com/?size=100&id=13042&format=png&color=000000'),
        _buildCardItem("Ananda", "Designer", "0812xxxxxx", "Ananda***@gmail.com", 'https://img.icons8.com/?size=100&id=nuMODtuVLj4A&format=png&color=000000'),
        _buildCardItem("Raveendra", "Developer", "0856xxxxxx", "Ravee***@gmail.com", 'https://img.icons8.com/?size=100&id=108639&format=png&color=000000'),
      ],
    );
  }

  Widget _buildVerticalCard() {
    return ListView(
      padding: EdgeInsets.all(20),
      children: [
        _buildCardItem("Hilman", "Mahasiswa", "0821xxxxxx", "hilman***@gmail.com", 'https://img.icons8.com/?size=100&id=13042&format=png&color=000000'),
        SizedBox(height: 20),
        _buildCardItem("Ananda", "Designer", "0812xxxxxx", "Ananda***@gmail.com", 'https://img.icons8.com/?size=100&id=nuMODtuVLj4A&format=png&color=000000'),
        SizedBox(height: 20),
        _buildCardItem("Raveendra", "Developer", "0856xxxxxx", "Ravee***@gmail.com", 'https://img.icons8.com/?size=100&id=108639&format=png&color=000000'),
      ],
    );
  }

  Widget _buildCardItem(String name, String pekerjaan, String noHP, String email, String imageUrl) {
    bool isHovered = false;
    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        return MouseRegion(
          onEnter: (event) => setState(() => isHovered = true),
          onExit: (event) => setState(() => isHovered = false),
          child: AnimatedContainer(
            duration: Duration(milliseconds: 200),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: isHovered ? Colors.blue.shade50 : Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(imageUrl),
                ),
                SizedBox(height: 20),
                Flexible(
                  child: Text(
                    name,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 10),
                Flexible(
                  child: Text(
                    pekerjaan,
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 10),
                Flexible(
                  child: Text(
                    noHP,
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 10),
                Flexible(
                  child: Text(
                    email,
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
