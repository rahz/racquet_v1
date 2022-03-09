import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

ChooseImage(ImageSource source) async {
  final ImagePicker _imageChooser = ImagePicker();
  Uint8List _defaultpic = (await rootBundle.load('assets/images/default.jpeg'))
      .buffer
      .asUint8List();
  XFile? _image = await _imageChooser.pickImage(source: source);

  if (_image != null) {
    return await _image.readAsBytes();
  } else {
    return _defaultpic;
    //print("No Image Selected!");
  }
}
