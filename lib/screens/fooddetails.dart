import 'package:flutter/material.dart';



class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        )
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            child: Image.asset(
              'assets/images/20-0.jpg',
              fit: BoxFit.contain,
            )
          ),
        ),
      ),
    );
  }
}