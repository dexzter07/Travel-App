import 'package:cab_booking/data/models/car_category_model.dart';
import 'package:cab_booking/presentation/styles/custom_text_style.dart';
import 'package:flutter/material.dart';
import 'custom_text_widget.dart';


class ProductWidget extends StatelessWidget {

  final ProductModel? productModel;
  ProductWidget({this.productModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4,vertical: 4),

      child: Column(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(5),topRight: Radius.circular(5)),
              child: Image.asset(productModel!.imageUrl.toString(),height: 60,width:240,fit: BoxFit.contain,)),
          SizedBox(height: 8,),
          CustomTextWidget(productModel!.title.toString(),style: CustomTextStyle.mediumTextStyle(color: Colors.white),textOverflow: TextOverflow.ellipsis, alignText: false,),
          CustomTextWidget(productModel!.desc.toString(),style: CustomTextStyle.smallTextStyle1(color: Colors.black), alignText: false, textOverflow: null,),
          CustomTextWidget(productModel!.subTitle.toString(),style: CustomTextStyle.smallTextStyle1(color: Colors.black), alignText: false, textOverflow: null,)

        ],
      ),
    );
  }
}


