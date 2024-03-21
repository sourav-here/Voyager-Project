import 'dart:io';
import 'package:flutter/material.dart';
import 'package:travel_app/view/screens/confirm_screen.dart';
import 'package:travel_app/view/subscreens/detail_text.dart';

class CompletedDetails extends StatefulWidget {
  const CompletedDetails(
      {Key? key,
      required this.destination,
      required this.extraDay,
      required this.extraMoney,
      this.image});

  final String destination;
  final String extraDay;
  final int extraMoney;
  final String? image;

  @override
  State<CompletedDetails> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<CompletedDetails> {
  File? selectedimage;
  String? destination;
  int? extraMoney;

  @override
  void initState() {
    selectedimage = widget.image != '' ? File(widget.image!) : null;
    destination = widget.destination;
    extraMoney = widget.extraMoney;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(221, 249, 247, 1),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              const SizedBox(
                height: 60,
              ),
              Center(
                child: Text(
                  widget.destination,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 29,
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
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
                      child: Image(
                        image: FileImage(File(widget.image!)),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Center(
                child: Padding(
                  padding: EdgeInsets.only(left: 18),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Additional Details',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        detailTextWidget(
                            'Extra Days :  ${widget.extraDay}'),
                        const SizedBox(
                          height: 20,
                        ),
                        detailTextWidget('Extra Amount :  ${widget.extraMoney}'),
                        
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ConfirmScreen()
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  backgroundColor: const Color.fromARGB(255, 238, 139, 82),
                ),
                child: const Text("Go Back", style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
