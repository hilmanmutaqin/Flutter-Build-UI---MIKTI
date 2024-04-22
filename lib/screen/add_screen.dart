import 'package:flutter/material.dart';
import 'package:latihan_flutter/colors/colors.dart';

class AddScreen extends StatelessWidget {
  const AddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 300,
              margin: EdgeInsets.only(bottom: 20),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Masukkan teks di sini',
                  labelText: 'Teks',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Konfirmasi'),
                      content: Text('Apakah Anda yakin ingin menambahkan?'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text("tidak"),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text("iya"),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text(
                'Tampilkan Dialog',
                style: TextStyle(color: textNavigation),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: navigation,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
