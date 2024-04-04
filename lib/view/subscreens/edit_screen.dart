

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/controller/edit_provider.dart';
import 'package:travel_app/functions/functions.dart';
import 'package:travel_app/model/tripmodel/trip_model.dart';
import 'package:travel_app/view/screens/add_screen.dart';
import 'package:travel_app/view/subscreens/add_form.dart';

class EditPage extends StatefulWidget {
  const EditPage({
    Key? key,
    required this.destination,
    required this.wayofTravel,
    required this.budget,
    required this.date,
    required this.totalDay,
    required this.imagepath,
    required this.index,
  }) : super(key: key);

  final dynamic destination;
  final dynamic wayofTravel;
  final dynamic budget;
  final dynamic date;
  final dynamic totalDay;
  final dynamic imagepath;
  final int index; 

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    final editProvider = Provider.of<EditProvider>(context, listen: false);
    editProvider.destinationController.text = widget.destination.toString();
    editProvider.travellingController.text = widget.wayofTravel.toString();
    editProvider.budgetController.text = widget.budget.toString();
    editProvider.startingDateController.text = widget.date.toString();
    editProvider.daysController.text = widget.totalDay.toString();
    editProvider.pickedImage =
        widget.imagepath != '' ? File(widget.imagepath.toString()) : null;
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<EditProvider>(context);
    return Scaffold(
      backgroundColor: const Color.fromRGBO(221, 249, 247, 1),
      body: Form(
        key: formkey,
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
                  child: provider.pickedImage != null 
                      ? Container(
                          width: 150,
                          height: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            image:  DecorationImage(
                              image: FileImage(provider.pickedImage!),
                              fit: BoxFit.cover,
                            ),
                          ),
                        )
                      : Container(
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
                  onPressed: () {
                    provider.pickImageFromGallery();
                  },
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
                  child: const Icon(Icons.add_a_photo_rounded),
                ),
                const SizedBox(height: 10),
                AddPageForm(
                    hintText: "Destination",
                    controller: provider.destinationController,
                    keyboardtype: TextInputType.name,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'this is required';
                      } else {
                        return null;
                      }
                    }),
                AddPageForm(
                    hintText: "Way of Travelling",
                    controller: provider.travellingController,
                    keyboardtype: TextInputType.name,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'this is required';
                      } else {
                        return null;
                      }
                    }),
                AddPageForm(
                    hintText: "Budget",
                    controller: provider.budgetController,
                    keyboardtype: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'this is required';
                      } else {
                        return null;
                      }
                    }),
                AddPageForm(
                    hintText: "Year",
                    suffixIcon: Icons.keyboard_arrow_down_rounded,
                    controller: provider.startingDateController,
                    keyboardtype: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'this is required';
                      } else {
                        return null;
                      }
                    }),
                AddPageForm(
                    hintText: "Total days",
                    controller: provider.daysController,
                    keyboardtype: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'this is required';
                      } else {
                        return null;
                      }
                    }),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        if (formkey.currentState!.validate()) {
                          addClicked(widget.index);
                        }
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
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Go Home",
                    style: TextStyle(
                      color: Color.fromARGB(255, 238, 139, 82),
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> addClicked(int index) async {
    final editPageProvider = Provider.of<EditProvider>(context, listen: false);
    final destination = editPageProvider.destinationController.text.trim();
    final wayofTravel = editPageProvider.travellingController.text.trim();
    final budget = editPageProvider.budgetController.text.trim();
    final date = editPageProvider.startingDateController.text.trim();
    final totalDay = editPageProvider.daysController.text.trim();
    final image = editPageProvider.pickedImage!.path;

    final updated = TripModel(
      destination: destination,
      wayofTravel: wayofTravel,
      budget: int.parse(budget),
      date: int.parse(date),
      totalDay: int.parse(totalDay),
      image: image,
    );

    await TripOperations.updateTrip(index, updated);
    // ignore: use_build_context_synchronously
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const AddScreen()));
  }
}
