// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';
// import 'package:image_picker/image_picker.dart';
// // import 'package:intl/intl.dart';
// import 'package:travel_app/model/tripmodel/trip_model.dart';
// import 'package:travel_app/view/screens/add_screen.dart';
// import 'package:travel_app/view/subscreens/add_form.dart';

// class AddPage extends StatefulWidget {
//   const AddPage({Key? key});

//   @override
//   State<AddPage> createState() => _AddPageState();
// }

// class _AddPageState extends State<AddPage> {
//   final _formkey = GlobalKey<FormState>();
//   late TextEditingController destinationController;
//   late TextEditingController travellingController;
//   late TextEditingController budgetController;
//   late TextEditingController startingDateController;
//   late TextEditingController daysController;
//   File? pickedImage;
//   late Box<TripModel> tripBox;

//   @override
//   void initState() {
//     super.initState();
//     destinationController = TextEditingController();
//     travellingController = TextEditingController();
//     budgetController = TextEditingController();
//     startingDateController = TextEditingController();
//     daysController = TextEditingController();
//     tripBox = Hive.box<TripModel>('tripBox');
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromRGBO(221, 249, 247, 1),
//       body: Form(
//         key: _formkey,
//         child: SingleChildScrollView(
//           child: Container(
//             color: const Color.fromRGBO(221, 249, 247, 1),
//             child: Column(
//               children: [
//                 const SizedBox(height: 55),
//                 Container(
//                   padding: const EdgeInsets.symmetric(horizontal: 140),
//                   width: double.infinity,
//                   height: 130,
//                   child: pickedImage != null
//                       ? Container(
//                           width: 150,
//                           height: 120,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(25),
//                             image: DecorationImage(
//                               image: FileImage(pickedImage!),
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                         )
//                       : Container(
//                           width: 150,
//                           height: 120,
//                           decoration: const BoxDecoration(
//                             borderRadius: BorderRadius.all(Radius.circular(25)),
//                             image: DecorationImage(
//                               image: AssetImage('assets/images/form.jpg'),
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                         ),
//                 ),
//                 const SizedBox(height: 20),
//                 ElevatedButton(
//                   onPressed: () {
//                     pickImageFromGallery();
//                   },
//                   style: TextButton.styleFrom(
//                     textStyle: const TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.w500,
//                     ),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(30),
//                     ),
//                     backgroundColor: const Color.fromARGB(255, 5, 191, 171),
//                   ),
//                   child: const Icon(Icons.add_a_photo_rounded),
//                 ),
//                 const SizedBox(height: 10),
//                 AddPageForm(
//                     hintText: "Destination",
//                     controller: destinationController,
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'this is required';
//                       } else {
//                         return null;
//                       }
//                     }),
//                 AddPageForm(
//                     hintText: "Way of Travelling",
//                     controller: travellingController,
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'this is required';
//                       } else {
//                         return null;
//                       }
//                     }),
//                 AddPageForm(
//                     hintText: "Budget",
//                     controller: budgetController,
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'this is required';
//                       } else {
//                         return null;
//                       }
//                     }),
                
//                 //-------------------------------------------------------------------
//                 // AddPageForm(
//                 //     hintText: "Starting date",
//                 //     suffixIcon: Icons.calendar_month_outlined,
//                 //     controller: startingDateController,
//                 //     validator: (value) {
//                 //       if (value == null || value.isEmpty) {
//                 //         return 'this is required';
//                 //       } else {
//                 //         return null;
//                 //       }
//                 //     }),
//                 // AddPageForm(
//                 //   hintText: "Starting date",
//                 //   suffixIcon: Icons.calendar_today,
//                 //   controller: startingDateController,
//                 //   onDateSelected: (selectedDate) {
//                 //     setState(() {
//                 //       startingDateController.text =
//                 //           DateFormat('yyyy-MM-dd').format(selectedDate);
//                 //     });
//                 //   },
//                 //   validator: (value) {
//                 //     if (value == null || value.isEmpty) {
//                 //       return 'This field is required';
//                 //     } else {
//                 //       return null;
//                 //     }
//                 //   },
//                 // ),
//                 //-------------------------------------------------------------
//                 AddPageForm(
//                   hintText: "Starting date",
//                   suffixIcon: Icons.calendar_today,
//                   controller: startingDateController,
//                   //==================================================
//                   // onDateSelected: (selectedDate) {
//                   //   setState(() {
//                   //     startingDateController.text =
//                   //         DateFormat('yyyy-MM-dd').format(selectedDate);
//                   //   });
//                   // },
//                   //==================================================
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'This field is required';
//                     } else {
//                       return null;
//                     }
//                   },
//                 ),

//                 AddPageForm(
//                     hintText: "Total days",
//                     controller: daysController,
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'this is required';
//                       } else {
//                         return null;
//                       }
//                     }),
//                 const SizedBox(height: 20),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     ElevatedButton(
//                       onPressed: () {
//                         if (_formkey.currentState!.validate()) {
//                           addClicked();
//                           Navigator.pop(context);
//                         }
//                       },
//                       style: TextButton.styleFrom(
//                         textStyle: const TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.w500,
//                         ),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         backgroundColor: const Color.fromARGB(255, 5, 191, 171),
//                       ),
//                       child: const Icon(Icons.download_done_rounded),
//                     ),
//                     const SizedBox(width: 30),
//                     ElevatedButton(
//                       onPressed: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => const AddScreen()));
//                       },
//                       style: TextButton.styleFrom(
//                         textStyle: const TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.w500,
//                         ),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         backgroundColor: const Color.fromARGB(255, 5, 191, 171),
//                       ),
//                       child: const Icon(Icons.close_rounded),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 10),
//                 TextButton(
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                   child: const Text(
//                     "Go Home",
//                     style: TextStyle(
//                       color: Color.fromARGB(255, 238, 139, 82),
//                       fontSize: 16,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Future pickImageFromGallery() async {
//     final returnImage =
//         await ImagePicker().pickImage(source: ImageSource.gallery);

//     if (returnImage == null) {
//       return;
//     }

//     setState(() {
//       pickedImage = File(returnImage.path);
//     });
//   }

//   void clearText() {
//     destinationController.clear();
//     travellingController.clear();
//     budgetController.clear();
//     startingDateController.clear();
//     daysController.clear();
//     setState(() {
//       pickedImage = null;
//     });
//   }

//   Future<void> addClicked() async {
//     final destination = destinationController.text.trim();
//     final wayofTravel = travellingController.text.trim();
//     final budget = budgetController.text.trim();
//     final date = startingDateController.text.trim();
//     final totalDay = daysController.text.trim();
//     final image = pickedImage != null ? pickedImage!.path : "";

//     final trip = TripModel(
//       destination: destination,
//       wayofTravel: wayofTravel,
//       budget: int.parse(budget),
//       date: int.parse(date),
//       totalDay: int.parse(totalDay),
//       image: image,
//     );

//     tripBox.add(trip);
//     clearText();
//   }
// //----------------------------------------------------------
// //   Future<void> addClicked() async {
// //   final destination = destinationController.text.trim();
// //   final wayofTravel = travellingController.text.trim();
// //   final budget = budgetController.text.trim();
  
// //   final dateParts = startingDateController.text.trim().split('-');
// //   final date = DateTime(
// //     int.parse(dateParts[0]), 
// //     int.parse(dateParts[1]),
// //     int.parse(dateParts[2]), 
// //   );
  
// //   final totalDay = int.parse(daysController.text.trim());
// //   final image = pickedImage != null ? pickedImage!.path : "";

// //   final trip = TripModel(
// //     destination: destination,
// //     wayofTravel: wayofTravel,
// //     budget: int.parse(budget),
// //     date: date,
// //     totalDay: totalDay,
// //     image: image,
// //   );

// //   tripBox.add(trip);
// //   clearText();
// // }
// //----------------------------------------------------------------

// }


import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:travel_app/model/tripmodel/trip_model.dart';
import 'package:travel_app/view/screens/add_screen.dart';
import 'package:travel_app/view/subscreens/add_form.dart';

class AddPage extends StatefulWidget {
  const AddPage({Key? key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final _formkey = GlobalKey<FormState>();
  late TextEditingController destinationController;
  late TextEditingController travellingController;
  late TextEditingController budgetController;
  late TextEditingController startingDateController;
  late TextEditingController daysController;
  File? pickedImage;
  late Box<TripModel> tripBox;

  @override
  void initState() {
    super.initState();
    destinationController = TextEditingController();
    travellingController = TextEditingController();
    budgetController = TextEditingController();
    startingDateController = TextEditingController();
    daysController = TextEditingController();
    tripBox = Hive.box<TripModel>('tripBox');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(221, 249, 247, 1),
      body: Form(
        key: _formkey,
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
                  child: pickedImage != null
                      ? Container(
                          width: 150,
                          height: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            image: DecorationImage(
                              image: FileImage(pickedImage!),
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
                    pickImageFromGallery();
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
                    controller: destinationController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'this is required';
                      } else {
                        return null;
                      }
                    }),
                AddPageForm(
                    hintText: "Way of Travelling",
                    controller: travellingController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'this is required';
                      } else {
                        return null;
                      }
                    }),
                AddPageForm(
                    hintText: "Budget",
                    controller: budgetController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'this is required';
                      } else {
                        return null;
                      }
                    }),
                AddPageForm(
                    hintText: "Starting date",
                    suffixIcon: Icons.calendar_month_outlined,
                    controller: startingDateController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'this is required';
                      } else {
                        return null;
                      }
                    }),
                AddPageForm(
                    hintText: "Total days",
                    controller: daysController,
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
                        if (_formkey.currentState!.validate()) {
                          addClicked();
                          Navigator.pop(context);
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

  Future pickImageFromGallery() async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (returnImage == null) {
      return;
    }

    setState(() {
      pickedImage = File(returnImage.path);
    });
  }

  void clearText() {
    destinationController.clear();
    travellingController.clear();
    budgetController.clear();
    startingDateController.clear();
    daysController.clear();
    setState(() {
      pickedImage = null;
    });
  }

  Future<void> addClicked() async {
    final destination = destinationController.text.trim();
    final wayofTravel = travellingController.text.trim();
    final budget = budgetController.text.trim();
    final date = startingDateController.text.trim();
    final totalDay = daysController.text.trim();
    final image = pickedImage != null ? pickedImage!.path : "";

    final trip = TripModel(
      destination: destination,
      wayofTravel: wayofTravel,
      budget: int.parse(budget),
      date: int.parse(date),
      totalDay: int.parse(totalDay),
      image: image,
    );

    tripBox.add(trip);
    clearText();
  }
}