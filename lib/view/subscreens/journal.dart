import 'package:flutter/material.dart';

class JournalPage extends StatelessWidget {
  const JournalPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Travel Journal'),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Travel Journal',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              '''
              "Traveling – it leaves you speechless, then turns you into a storyteller." – Ibn Battuta

              "The world is a book and those who do not travel read only one page." – Saint Augustine

              "To travel is to take a journey into yourself." – Danny Kaye

              "Travel makes one modest. You see what a tiny place you occupy in the world." – Gustave Flaubert

              "Not all those who wander are lost." – J.R.R. Tolkien

              "The journey not the arrival matters." – T.S. Eliot

              "A journey is best measured in friends, rather than miles." – Tim Cahill

              "Travel is fatal to prejudice, bigotry, and narrow-mindedness." – Mark Twain

              "The real voyage of discovery consists not in seeking new landscapes, but in having new eyes." – Marcel Proust

              "Travel far enough, you meet yourself." – David Mitchell

              "The gladdest moment in human life, me thinks, is a departure into unknown lands." – Sir Richard Burton

              "Adventure is worthwhile." – Aesop

              "Traveling is not something you're good at. It's something you do. Like breathing." – Gayle Foreman

              "The world is big and I want to have a good look at it before it gets dark." – John Muir

              "Live your life by a compass, not a clock." – Stephen Covey

              "Jobs fill your pocket, but adventures fill your soul." – Jaime Lyn

              "Traveling tends to magnify all human emotions." – Peter Hoeg
              ''',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
