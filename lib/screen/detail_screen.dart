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

class DigitalCard extends StatelessWidget {
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
        _buildCardItem("Hilman", "Mahasiswa", "0821xxxxxx", "hilman***@gmail.com", 'images/user2.png'),
        _buildCardItem("fery", "Designer", "0812xxxxxx", "fery***@gmail.com", 'images/user2.png'),
        _buildCardItem("vito", "Developer", "0856xxxxxx", "vito***@gmail.com", 'images/user2.png'),
      ],
    );
  }

  Widget _buildVerticalCard() {
    return ListView(
      padding: EdgeInsets.all(20),
      children: [
        _buildCardItem("Hilman", "Mahasiswa", "0821xxxxxx", "hilman***@gmail.com", 'images/user2.png'),
        SizedBox(height: 20),
        _buildCardItem("fery", "Designer", "0812xxxxxx", "fery***@gmail.com", 'images/user1.png'),
        SizedBox(height: 20),
        _buildCardItem("vito", "Developer", "0856xxxxxx", "vito***@gmail.com", 'images/user3.png'),
      ],
    );
  }

  Widget _buildCardItem(String name, String pekerjaan, String noHP, String email, String imagePath) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
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
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage(imagePath),
          ),
          SizedBox(height: 20),
          Text(
            name,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            pekerjaan,
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 10),
          Text(
            noHP,
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 10),
          Text(
            email,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
