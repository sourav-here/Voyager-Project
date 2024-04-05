import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/controller/add_provider.dart';
import 'package:travel_app/services/functions.dart';
import 'package:travel_app/model/tripmodel/trip_model.dart';
import 'package:travel_app/view/screens/add_screen.dart';
import 'package:travel_app/view/screens/home_screen.dart';
import 'package:travel_app/view/subscreens/add_form.dart';

class AddPage extends StatelessWidget {
  const AddPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final addProvider = Provider.of<AddProvider>(context);
    return Scaffold(
      backgroundColor: const Color.fromRGBO(221, 249, 247, 1),
      body: Form(
        key: addProvider.formkey,
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
                  child: addProvider.pickedImage != null 
                      ? Container(
                          width: 150,
                          height: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            image: DecorationImage(
                              image: FileImage(addProvider.pickedImage!),
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
                    addProvider.pickImageFromGallery();
                  },
                  style: ElevatedButton.styleFrom(
                    textStyle: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w500),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    backgroundColor: const Color.fromARGB(255, 5, 191, 171),
                  ),
                  child: const Icon(Icons.add_a_photo_rounded),
                ),
                const SizedBox(height: 10),
                AddPageForm(
                    hintText: "Destination",
                    controller: addProvider.destinationController,
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
                    controller: addProvider.travellingController,
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
                    controller: addProvider.budgetController,
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
                    controller: addProvider.startingDateController,
                    suffixIcon: Icons.keyboard_arrow_down_rounded,
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
                    controller: addProvider.daysController,
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
                        if (addProvider.formkey.currentState!.validate()) {
                          addButtonClicked(context, addProvider);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        textStyle: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
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
                                builder: (context) =>  AddScreen()));
                      },
                      style: ElevatedButton.styleFrom(
                        textStyle: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
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
                    style: TextStyle(
                        color: Color.fromARGB(255, 238, 139, 82), fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> addButtonClicked(
      BuildContext context, AddProvider addProvider) async {
    final destination = addProvider.destinationController.text.trim();
    final wayofTravel = addProvider.travellingController.text.trim();
    final budget = addProvider.budgetController.text.trim();
    final date = addProvider.startingDateController.text.trim();
    final totalDay = addProvider.daysController.text.trim();
    final image = addProvider.pickedImage!.path;
    if (destination.isEmpty ||
        wayofTravel.isEmpty ||
        budget.isEmpty ||
        date.isEmpty ||
        totalDay.isEmpty ||
        image.isEmpty) {
      return;
    }

    addProvider.destinationController.clear();
    addProvider.travellingController.clear();
    addProvider.budgetController.clear();
    addProvider.startingDateController.clear();
    addProvider.daysController.clear();
    addProvider.clearSelectedImage();

    final trip = TripModel(
      destination: destination,
      wayofTravel: wayofTravel,
      budget: int.tryParse(budget) ?? 0,
      date: int.tryParse(date) ?? 0,
      totalDay: int.tryParse(totalDay) ?? 0,
      image: image,
    );

    await TripOperations.addTrip(trip);
    // ignore: use_build_context_synchronously
    Navigator.pop(context);
  }
}
