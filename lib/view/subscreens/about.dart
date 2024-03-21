import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [
        Image.asset(
          'assets/images/bg.png',
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        const Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height:70),
                  Text(
                    'Welcome to Voyager: Your Dream Destination Bucket List',
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24,color: Colors.white),
                  ),
                  Text(
                    '''
                    Voyager is your ultimate companion in fulfilling your travel aspirations. Whether it's exploring ancient ruins, lounging on tropical beaches, or trekking through breathtaking landscapes, Voyager empowers you to curate and manage your dream destination bucket list with ease.
                    ''',
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(height:30),
                  Text(
                    'Key Features:',
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24,color: Colors.white),
                  ),
                  Text(
                    '''
                    - Create and manage multiple bucket lists
                    - Add dream destinations with descriptions and images
                    - Set goals and deadlines for visiting destinations
                    - Track your progress and mark destinations as visited
                    - Share your bucket lists with friends and family
                    - Customize settings and preferences to personalize your experience
                    ''',
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(height:30),
                  Text(
                    'Mission Statement:',
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24,color: Colors.white),
                  ),
                  Text(
                    '''
                    Voyager is dedicated to helping you turn your travel dreams into reality. Our mission is to inspire and guide you on your journey to explore the world, one destination at a time. With Voyager, the possibilities are limitless, and the adventures are endless.
                    ''',
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(height:30),
                  Text(
                    'Developer Information:',
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24,color: Colors.white),
                  ),
                  Text(
                    '''
                    Voyager is developed by Sourav Raj, a team passionate about travel and technology. For support, feedback, or inquiries, please contact us at souravrajsrk11@gmail.com.
                    ''',
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(height:30),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
