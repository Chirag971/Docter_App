import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImageCnt extends GetxController {
  @override
  void dispose() {
    getImage;
    imageFile;

    super.dispose();
  }

  final _getImage = ''.obs;
  get getImage => _getImage.value;
  set getImage(value) => _getImage.value = value;

  PickedFile? imageFile;
  Future<void> getPicker(
      {required BuildContext context, required ImageSource source}) async {
    final pickedFile = await ImagePicker().getImage(
      source: source,
    );
    imageFile = pickedFile!;
    if (imageFile != null) {
      getImage = imageFile!.path;
    }
  }
}
