// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:travel_app/view/screens/add_screen.dart';
// import 'package:travel_app/view/screens/confirm_screen.dart';
// import 'package:travel_app/view/subscreens/add_form.dart';

// class CompleteDetails extends StatefulWidget {
//   const CompleteDetails({Key? key, required this.destination, this.image});

//   final String destination;
//   final String? image;

//   @override
//   State<CompleteDetails> createState() => _CompleteDetailState();
// }

// class _CompleteDetailState extends State<CompleteDetails> {
//   File? selectedimage;
//   String? destination;
//   late TextEditingController extraDaysController;
//   late TextEditingController extraMoneyController;

//   @override
//   void initState() {
//     selectedimage = widget.image != '' ? File(widget.image!) : null;
//     destination = widget.destination;
//     extraDaysController = TextEditingController();
//     extraMoneyController = TextEditingController();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromRGBO(221, 249, 247, 1),
//       body: SingleChildScrollView(
//         child: Container(
//           child: Column(
//             children: [
//               const SizedBox(
//                 height: 60,
//               ),
//               Center(
//                 child: Text(
//                   widget.destination,
//                   style: const TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 29,
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 40,
//               ),
//               Center(
//                 child: SizedBox(
//                   width: 300,
//                   height: 210,
//                   child: Container(
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: ClipRRect(
//                       borderRadius: BorderRadius.circular(10),
//                       child: Image(
//                         image: FileImage(File(widget.image!)),
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               const Center(
//                 child: Padding(
//                   padding: EdgeInsets.only(left: 18),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text(
//                         'Trip Extras',
//                         style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 18,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               Row(
//                 children: [
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         const SizedBox(
//                           height: 20,
//                         ),
//                         AddPageForm(
//                             hintText: 'Extra Days',
//                             controller: extraDaysController,
//                             validator: (value) {
//                               if (value == null || value.isEmpty) {
//                                 return 'this is required';
//                               } else {
//                                 return null;
//                               }
//                             }),
//                         AddPageForm(
//                             hintText: 'Extra Days',
//                             controller: extraDaysController,
//                             validator: (value) {
//                               if (value == null || value.isEmpty) {
//                                 return 'this is required';
//                               } else {
//                                 return null;
//                               }
//                             }),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(
//                 height: 30,
//               ),
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => const ConfirmScreen()),
//                   );
//                 },
//                 style: TextButton.styleFrom(
//                   textStyle: const TextStyle(
//                       fontSize: 16, fontWeight: FontWeight.w500),
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10)),
//                   backgroundColor: const Color.fromARGB(255, 238, 139, 82),
//                 ),
//                 child: const Text(
//                   "Trip Done!",
//                   style: TextStyle(color: Colors.white),
//                 ),
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               TextButton(
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => const AddScreen(),
//                       ),
//                     );
//                   },
//                   child: const Text(
//                     "Go back",
//                     style: TextStyle(color: Colors.black, fontSize: 16),
//                   )),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:travel_app/functions/functions.dart';
import 'package:travel_app/model/complete_model/complete_model.dart';
import 'package:travel_app/view/screens/add_screen.dart';
import 'package:travel_app/view/subscreens/add_form.dart';

class CompleteDetails extends StatefulWidget {
  const CompleteDetails(
      {Key? key, required this.destination, required this.image});

  final String destination;
  final String image;

  @override
  State<CompleteDetails> createState() => _CompleteDetailState();
}

class _CompleteDetailState extends State<CompleteDetails> {
  late TextEditingController extraDaysController;
  late TextEditingController extraMoneyController;

  @override
  void initState() {
    super.initState();
    extraDaysController = TextEditingController();
    extraMoneyController = TextEditingController();
  }

  @override
  void dispose() {
    extraDaysController.dispose();
    extraMoneyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(221, 249, 247, 1),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 60),
              Text(
                widget.destination,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 29,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              Center(
                child: SizedBox(
                  width: 300,
                  height: 210,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.file(
                        File(widget.image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Trip Extras',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 20),
              AddPageForm(
                hintText: 'Extra Days',
                controller: extraDaysController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Required';
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(height: 10),
              AddPageForm(
                hintText: 'Extra Money',
                controller: extraMoneyController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Required';
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  doneClicked();
                  completeDialogue();
                },
                style: ElevatedButton.styleFrom(
                  textStyle: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w500),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  primary: const Color.fromARGB(255, 238, 139, 82),
                ),
                child: const Text("Trip Done!",
                    style: TextStyle(color: Colors.white)),
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const AddScreen()),
                  );
                },
                child: const Text("Go back",
                    style: TextStyle(color: Colors.black, fontSize: 16)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> doneClicked() async {
    final image = widget.image;
    final destination = widget.destination;
    final extraDay = extraDaysController.text;
    final extraMoney = extraMoneyController.text;

    final completed = CompleteModel(
        destination: destination,
        image: image,
        extraDay: extraDay,
        extraMoney: int.parse(extraMoney));

    await TripOperations.completeTrip(completed);
  }

  void completeDialogue() {
    showDialog(
        context: context,
        useSafeArea: true,
        builder: (context) => AlertDialog(
              scrollable: true,
              content: const Text('Hurreay..You dit it!!!'),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Yeah'))
              ],
            ));
  }
}
