import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddProvider extends ChangeNotifier {
  final destinationController = TextEditingController();
  final travellingController = TextEditingController();
  final budgetController = TextEditingController();
  final startingDateController = TextEditingController();
  final daysController = TextEditingController();
  File? pickedImage;
  final formkey = GlobalKey<FormState>();

  Future<void> pickImageFromGallery() async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (returnImage == null) {
      return;
    }

    pickedImage = File(returnImage.path);
    notifyListeners();
  }

  void clearSelectedImage() {
    pickedImage = null;
    notifyListeners();
  }

}
