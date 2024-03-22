import 'package:flutter/material.dart';
import 'package:travel_app/view/subscreens/article_page.dart';
import 'package:travel_app/view/subscreens/home_card.dart';
import 'package:travel_app/view/subscreens/homehead.dart';
import 'package:travel_app/view/widgets/bottom_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(221, 249, 247, 1),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 44,
              ),
              const HomeHead(),
              const SizedBox(
                height: 32,
              ),
              const Row(
                children: [
                  Text(
                    "Let’s",
                    style: TextStyle(fontSize: 32, color: Colors.black),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Text(
                    "travel",
                    style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Text(
                    "now",
                    style: TextStyle(fontSize: 32),
                  )
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                "“We live in a wonderful world that is full of beauty, charm and adventure. There is no end to the adventures we can have if only we seek them with our eyes open.”",
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(
                height: 10,
              ),
              const Align(
                alignment: Alignment.centerRight,
                child: Text(
                  " – Jawaharial Nehru",
                  style: TextStyle(fontSize: 16),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Recommended",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  Row(
                    children: [
                      Text(
                        "Scroll down",
                        style: TextStyle(fontSize: 16),
                      ),
                      Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: Colors.orange,
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  HomeCard(
                    imagePath: 'assets/images/taj.jpg',
                    sceneryName: 'Taj Mahal',
                    placeName: 'India',
                    onTap: () {
                      _navigateToArticlePage(
                          context,
                          'assets/images/mahal.jpg',
                          'Taj Mahal',
                          'The Taj Mahal is an iconic symbol of love and architectural masterpiece located in Agra, India. Built by Emperor Shah Jahan in memory of his beloved wife Mumtaz Mahal, it is renowned for its stunning white marble dome and intricate carvings.',
                          '5000');
                    },
                  ),
                  HomeCard(
                    imagePath: 'assets/images/mana.jpg',
                    sceneryName: 'Manali',
                    placeName: 'India',
                    onTap: () {
                      _navigateToArticlePage(
                          context,
                          'assets/images/manali.jpg',
                          'Manali',
                          'Manali, nestled in the Indian state of Himachal Pradesh, is a serene hill station renowned for its breathtaking landscapes, adventurous activities like trekking and skiing, and vibrant culture. Surrounded by snow-capped peaks, lush valleys, and meandering rivers, Manali attracts tourists seeking both relaxation and adrenaline-filled experiences throughout the year.',
                          '6500');
                    },
                  ),
                ],
              ),
              Row(
                children: [
                  HomeCard(
                    imagePath: 'assets/images/varana.jpg',
                    sceneryName: 'Varanasi',
                    placeName: 'India',
                    onTap: () {
                      _navigateToArticlePage(
                          context,
                          'assets/images/varanasi.jpg',
                          'Varanasi',
                          'Varanasi, also known as Kashi, is one of the oldest continuously inhabited cities in the world, situated on the banks of the Ganges River in Uttar Pradesh, India. It is a sacred city in Hinduism, attracting millions of pilgrims annually who come to bathe in the holy waters and perform rituals along its ghats.',
                          '4500');
                    },
                  ),
                  HomeCard(
                    imagePath: 'assets/images/khalifa.jpg',
                    sceneryName: 'Burj Khalifa',
                    placeName: 'Dubai',
                    onTap: () {
                      _navigateToArticlePage(
                          context,
                          'assets/images/burj.jpg',
                          'Burj Khalifa',
                          'The Burj Khalifa, located in Dubai, United Arab Emirates, is the tallest building in the world, standing at a staggering height of over 828 meters. It is an iconic symbol of modern architecture and engineering prowess, attracting millions of visitors annually to its observation decks, luxurious hotels, and prestigious offices.',
                          '150000');
                    },
                  ),
                ],
              ),
              Row(
                children: [
                  HomeCard(
                    imagePath: 'assets/images/veni.jpg',
                    sceneryName: 'Venice',
                    placeName: 'Italy',
                    onTap: () {
                      _navigateToArticlePage(
                          context,
                          'assets/images/venice.jpg',
                          'Venice',
                          'Venice, renowned for its intricate network of canals, is a city in northeastern Italy characterized by its unique architectural beauty and rich cultural heritage, drawing millions of visitors annually to experience its romantic ambiance and historic landmarks such as St. Marks Basilica and the Grand Canal.',
                          '250000');
                    },
                  ),
                  HomeCard(
                    imagePath: 'assets/images/swizz.jpg',
                    sceneryName: 'Zurich',
                    placeName: 'Switzerland',
                    onTap: () {
                      _navigateToArticlePage(
                          context,
                          'assets/images/swiz.jpg',
                          'Zurich',
                          'Zurich, the largest city in Switzerland, is renowned for its vibrant cultural scene, stunning architecture, and picturesque waterfront along the Limmat River. Boasting a perfect blend of historical charm and modern sophistication, Zurich is a global hub for finance, innovation, and quality of life.',
                          '500000');
                    },
                  ),
                ],
              ),
              Row(
                children: [
                  HomeCard(
                    imagePath: 'assets/images/wal.jpg',
                    sceneryName: 'Great Wall',
                    placeName: 'China',
                    onTap: () {
                      _navigateToArticlePage(
                          context,
                          'assets/images/wall.jpg',
                          'Great Wall of China',
                          'The Great Wall of China is a monumental ancient structure that spans thousands of miles across northern China, built primarily to protect against invasions from nomadic tribes. It is one of the most iconic and recognizable landmarks in the world, showcasing incredible engineering prowess and historical significance.',
                          '100000');
                    },
                  ),
                  HomeCard(
                    imagePath: 'assets/images/jap.jpg',
                    sceneryName: 'Honshu',
                    placeName: 'Japan',
                    onTap: () {
                      _navigateToArticlePage(
                          context,
                          'assets/images/japan.jpg',
                          'Mount Fuji',
                          'Mount Fuji, Japans highest peak, is an iconic symbol of the country, revered for its graceful conical shape and spiritual significance in Japanese culture. Rising majestically to 3,776 meters above sea level, it attracts countless climbers and tourists each year, offering breathtaking views and a sense of awe-inspiring tranquility.',
                          '300000');
                    },
                  ),
                ],
              ),
              Row(
                children: [
                  HomeCard(
                    imagePath: 'assets/images/buck.jpg',
                    sceneryName: 'Buckingham Palace',
                    placeName: 'England',
                    onTap: () {
                      _navigateToArticlePage(
                          context,
                          'assets/images/palace.jpg',
                          'Buckingham Palace',
                          'Buckingham Palace, located in Westminster, London, serves as the official residence and administrative headquarters of the British monarch. It is renowned for its iconic facade, lavish state rooms, and its role as a focal point for royal ceremonies and events.',
                          '175000');
                    },
                  ),
                  HomeCard(
                    imagePath: 'assets/images/nia.jpg',
                    sceneryName: 'Niagara Falls',
                    placeName: 'Canada',
                    onTap: () {
                      _navigateToArticlePage(
                          context,
                          'assets/images/gra.jpg',
                          'Niagara Falls',
                          'Niagara Falls, situated on the border between Ontario, Canada, and New York, USA, is a breathtaking natural wonder renowned for its powerful cascades and stunning beauty. Drawing millions of visitors annually, it stands as a testament to the awe-inspiring forces of nature and serves as a popular destination for sightseeing and recreational activities.',
                          '235000');
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const CircularBottomBar(),
    );
  }

  void _navigateToArticlePage(BuildContext context, String imagePath,
      String placeName, String about, String price) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ArticlePage(
          backgroundImage: imagePath,
          headingText: placeName,
          about: about,
          price: ' Starts From $price',
        ),
      ),
    );
  }
}
