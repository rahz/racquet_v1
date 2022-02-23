import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

ChooseImage(ImageSource source) async {
  final ImagePicker _imageChooser = ImagePicker();
  XFile? _image = await _imageChooser.pickImage(source: source);

  if (_image != null) {
    return await _image.readAsBytes();
  } else {
    return null;
    //print("No Image Selected!");
  }
}
