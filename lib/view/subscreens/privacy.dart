import 'package:flutter/material.dart';

class PrivacyPage extends StatelessWidget {
  const PrivacyPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Privacy Policy'),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30),
              Text(
                'Our Commitment to Privacy',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                '''
                At Voyager, we are committed to protecting your privacy and ensuring the security of your personal information. This Privacy Policy outlines the types of information we collect, how we use it, and the measures we take to safeguard your data.
                ''',
              ),
              SizedBox(height: 30),
              Text(
                'Information We Collect',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                '''
                - Personal Information: When you create an account or use our services, we may collect personal information such as your name, email address, and profile picture.
                - Usage Data: We may collect data about how you interact with the app, including the pages you visit, the actions you take, and the devices you use.
                - Location Information: With your consent, we may collect and store information about your location to provide personalized features and improve our services.
                ''',
              ),
              SizedBox(height: 30),
              Text(
                'How We Use Your Information',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                '''
                - To Provide and Improve Services: We use your information to deliver personalized content, enhance user experience, and optimize our app's performance.
                - For Communication: We may send you updates, notifications, and promotional messages related to our services.
                - To Ensure Security: We take measures to protect against unauthorized access, misuse, or alteration of your information.
                ''',
              ),
              SizedBox(height: 30),
              Text(
                'Your Choices and Rights',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                '''
                - Opt-Out: You have the option to opt-out of receiving promotional communications and to delete your account at any time.
                - Access and Update: You can access and update your personal information through your account settings.
                - Data Portability: You can request a copy of your data or transfer it to another service provider.
                ''',
              ),
              SizedBox(height: 30),
              Text(
                'Contact Us',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                '''
                If you have any questions, concerns, or requests regarding our Privacy Policy, please contact us at [contact@email.com]. We value your privacy and are committed to addressing any issues promptly.
                ''',
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
