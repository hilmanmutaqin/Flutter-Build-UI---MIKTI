import 'package:flutter/material.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

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
  final String name = 'Kelompok 5';
  final String kerja = 'flutter dev';
  final String nomorTelpon = '62234567890';
  final String email = 'kelompok5@gmail.com';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Digital Card'),
      ),
      body: Center(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            if (constraints.maxWidth > 600) {
              return _buildHorizontalCard();
            } else {
              // Tampil secara vertikal jika lebar < 600 pixel
              return _buildVerticalCard();
            }
          },
        ),
      ),
    );
  }

  Widget _buildHorizontalCard() {
    return Container(
      width: 600,
      height: 200,
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
      child: Row(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage('images/user2.png'),
          ),
          SizedBox(width: 20),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                kerja,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                nomorTelpon,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                email,
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildVerticalCard() {
    return Container(
      width: 300,
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
            backgroundImage: AssetImage('images/user2.png'),
          ),
          SizedBox(height: 20),
          Text(
            name,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            kerja,
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 10),
          Text(
            nomorTelpon,
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