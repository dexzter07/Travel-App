import 'dart:async';
import 'dart:io';

import 'package:cab_booking/presentation/styles/app_colors.dart';
import 'package:cab_booking/presentation/styles/custom_text_style.dart';
import 'package:cab_booking/presentation/widgets/full_width_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'custom_text_field.dart';
import 'custom_text_widget.dart';

class PermitFormWidget extends StatefulWidget {
  const PermitFormWidget({Key? key}) : super(key: key);

  @override
  _PermitFormWidgetState createState() => _PermitFormWidgetState();
}

class _PermitFormWidgetState extends State<PermitFormWidget> {
  final ImagePicker _picker = ImagePicker();
  File? _image;
  File? _image1;

  _imgFromCamera() async {
    // ignore: deprecated_member_use
    XFile? image =
        (await _picker.pickImage(source: ImageSource.camera, imageQuality: 50));
    XFile? image1 =
        (await _picker.pickImage(source: ImageSource.camera, imageQuality: 50));
    print(image);
    print("image not ");

    setState(() {
      _image = File(image!.path);
      _image1 = File(image1!.path);

      print(_image);
      print("image not Showing");
    });
  }

  _imgFromGallery() async {
    XFile? image = (await _picker.pickImage(
        source: ImageSource.gallery, imageQuality: 50));
    XFile? image1 = (await _picker.pickImage(
        source: ImageSource.gallery, imageQuality: 50));

    setState(() {
      _image = File(image!.path);
      _image1 = File(image1!.path);

      print(_image);
    });
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Photo Library'),
                      onTap: () {
                        _imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      _imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.all(8),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextWidget(
              "Full Name",
              style: CustomTextStyle.boldMediumTextStyle(color: Colors.black),
              alignText: false,
              textOverflow: null,
            ),
            CustomTextField(
                contentPadding: EdgeInsets.all(10),
                validator: () {},
                obSecureText: false,
                borderRadius: BorderRadius.circular(10),
                maxLines: 1,
                numberButton: false),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextWidget(
                        "Age",
                        style: CustomTextStyle.boldMediumTextStyle(
                            color: Colors.black),
                        alignText: false,
                        textOverflow: null,
                      ),
                      CustomTextField(
                          contentPadding: EdgeInsets.all(10),
                          validator: () {},
                          obSecureText: false,
                          borderRadius: BorderRadius.circular(10),
                          maxLines: 1,
                          numberButton: false),
                    ],
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextWidget(
                        "Gender",
                        style: CustomTextStyle.boldMediumTextStyle(
                            color: Colors.black),
                        alignText: false,
                        textOverflow: null,
                      ),
                      CustomTextField(
                          contentPadding: EdgeInsets.all(10),
                          validator: () {},
                          obSecureText: false,
                          borderRadius: BorderRadius.circular(10),
                          maxLines: 1,
                          numberButton: false),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    _showPicker(context);
                  },
                  child: _image != null
                      ? ClipRRect(
                          child: Image.file(
                            _image!,
                            width: 50,
                            height: 57,
                            fit: BoxFit.fitHeight,
                          ),
                        )
                      : Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7)),
                          child: Column(
                            children: [
                              Icon(
                                Icons.add,
                                size: 30,
                                color: Color.fromRGBO(196, 196, 196, 1),
                              ),
                              Text(
                                "Pass photo",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black),
                              )
                            ],
                          ),
                        ),
                ),
                GestureDetector(
                  onTap: () {
                    _showPicker(context);
                  },
                  child: _image1 != null
                      ? ClipRRect(
                          child: Image.file(
                            _image1!,
                            width: 75,
                            height: 40,
                            fit: BoxFit.fitWidth,
                          ),
                        )
                      : Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7)),
                          child: Column(
                            children: [
                              Icon(
                                Icons.add,
                                size: 30,
                                color: Color.fromRGBO(196, 196, 196, 1),
                              ),
                              Text(
                                "Id Card",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black),
                              )
                            ],
                          ),
                        ),
                ),
                GestureDetector(
                  onTap: () {
                    _showPicker(context);
                  },
                  child: _image1 != null
                      ? ClipRRect(
                    child: Image.file(
                      _image1!,
                      width: 75,
                      height: 40,
                      fit: BoxFit.fitWidth,
                    ),
                  )
                      : Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7)),
                    child: Column(
                      children: [
                        Icon(
                          Icons.add,
                          size: 30,
                          color: Color.fromRGBO(196, 196, 196, 1),
                        ),
                        Text(
                          "Back Side if req.",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.black),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
