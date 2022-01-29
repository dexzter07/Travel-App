
import 'dart:io';
import 'package:cab_booking/logic/controllers/permit_form_controller.dart';
import 'package:cab_booking/presentation/styles/custom_text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';
import 'custom_text_field.dart';
import 'custom_text_widget.dart';

class PermitFormWidget extends StatefulWidget {
  const PermitFormWidget({Key? key}) : super(key: key);

  @override
  _PermitFormWidgetState createState() => _PermitFormWidgetState();
}

class _PermitFormWidgetState extends State<PermitFormWidget> {
  final list = [];
  var fullName = TextEditingController();
  var age = TextEditingController();
  var gender = TextEditingController();
  final PermitFormController _permitFormController = Get.put(PermitFormController());
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
        Obx(() => _permitFormController.isLoading.value == true ? Center(
          child: CircularProgressIndicator(),
        ) :CustomTextField(
              controller: fullName,
                contentPadding: EdgeInsets.all(10),
                validator: RequiredValidator(
                    errorText: "Full Name is required as per ID Proof"),
                hintText: "Enter Full Name",
                obSecureText: false,
                borderRadius: BorderRadius.circular(10),
                maxLines: 1,
                numberButton: false)),
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
                        controller: age,
                          contentPadding: EdgeInsets.all(10),
                          validator: RequiredValidator(
                              errorText: "Age is required as per ID Proof"),
                          hintText: "Enter Age",
                          obSecureText: false,
                          borderRadius: BorderRadius.circular(10),
                          maxLines: 1,
                          numberButton: true),
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
                        controller: gender,
                          contentPadding: EdgeInsets.all(10),
                          validator: RequiredValidator(
                              errorText: "Gender is required as per ID Proof"),
                          hintText: "Enter Gender",
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
            MaterialButton(onPressed: (){
              list.add(fullName.text);
              list.add(age.text);
              list.add(gender.text);
              _permitFormController.datas.add(list);
              print(list);
              print(_permitFormController.datas);
            },
            child: Text("Save"),
            )

          ],
        ),
      ),
    );
  }
}
