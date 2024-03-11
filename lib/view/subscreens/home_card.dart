import 'package:flutter/material.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({
    super.key,
    required this.imagePath,
    required this.scenryName,
    required this.placeName,
  });

  final String imagePath;
  final String scenryName;
  final String placeName;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        elevation: 2 ,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          scenryName,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          placeName,
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}