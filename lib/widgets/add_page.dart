import 'package:flutter/material.dart';
import 'package:travel_app/screens/add_screen.dart';
import 'package:travel_app/screens/home_screen.dart';
import 'package:travel_app/widgets/add_form.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(221, 249, 247, 1),
      body: Form(
          child: SingleChildScrollView(
        child: Container(
          color: const Color.fromRGBO(221, 249, 247, 1),
          child: Column(
            children: [
              const SizedBox(height: 55),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 140),
                width: double.infinity,
                height: 130,
                child: Container(
                  width: 150,
                  height: 120,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                    image: DecorationImage(
                      image: AssetImage('assets/images/form.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  backgroundColor: const Color.fromARGB(255, 5, 191, 171),
                ),
                child:  const Icon(Icons.add_a_photo_rounded),
              ),
              const SizedBox(height: 10),
              const AddPageForm(hintText: "Destination",),
              const AddPageForm(hintText: "Way of Travelling"),
              const AddPageForm(hintText: "Budget"),
              const AddPageForm(hintText: "Starting date",suffixIcon: Icons.calendar_month_outlined),
              const AddPageForm(hintText: "Total days",),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AddScreen()));
                    },
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      backgroundColor: const Color.fromARGB(255, 5, 191, 171),
                    ),
                    child: const Icon(Icons.download_done_rounded),
                  ),
                  const SizedBox(width: 30),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AddScreen()));
                    },
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      backgroundColor: const Color.fromARGB(255, 5, 191, 171),
                    ),
                    child: const Icon(Icons.close_rounded),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomeScreen()));
                  },
                  child: const Text(
                    "Go Home",
                    style: TextStyle(color:  Color.fromARGB(255, 238, 139, 82), fontSize: 16),
                  ))
            ],
          ),
        ),
      )),
    );
  }
}
