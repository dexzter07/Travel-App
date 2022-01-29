import 'package:cab_booking/logic/controllers/shared_booking_controller.dart';
import 'package:cab_booking/presentation/pages/success.dart';
import 'package:cab_booking/presentation/styles/app_colors.dart';
import 'package:cab_booking/presentation/styles/custom_text_style.dart';
import 'package:cab_booking/presentation/widgets/custom_text_widget.dart';
import 'package:cab_booking/presentation/widgets/full_width_button.dart';
import 'package:cab_booking/presentation/widgets/shared_booking_component.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({Key? key}) : super(key: key);

  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  final SharedBookingController _sharedBookingController = Get.put(SharedBookingController());
  late Razorpay _razorpay;

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);

  }
  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }
  void openCheckout() async {
    var options = {
      'key': 'rzp_test_WnUytFfxajxZn2',
      'amount': '120000',
      'name': 'Proceed for Payments',
      'description': 'Payment',
      'prefill': {'contact': '', 'email': 'dexztercodes07@gmail.com'},
    };
    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint(e.toString());
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Checkout Details"),
        backgroundColor: AppColors.primaryColor,
        elevation: 0,
      ),
      body: ListView(
        children: [
          // SharedBookingComponent(),
          SizedBox(
            height: 10,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      blurRadius: 10,
                      spreadRadius: 2,
                      offset: Offset(3, 3))
                ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextWidget("Fare Details",
                    style: CustomTextStyle.bigTextStyle(color: Colors.black),
                    alignText: false,
                    textOverflow: null),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      CustomTextWidget("Ride Fare (in Rs.)",
                          style: CustomTextStyle.boldMediumTextStyle(
                              color: Colors.black),
                          alignText: false,
                          textOverflow: null),
                      Spacer(),
                      CustomTextWidget("₹ 1200",
                          style: CustomTextStyle.boldMediumTextStyle(
                              color: Colors.black),
                          alignText: false,
                          textOverflow: null),
                    ],
                  ),
                ),
                SizedBox(
                  height: 7,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      CustomTextWidget("Goods & Services Tax (in Rs.)",
                          style: CustomTextStyle.boldMediumTextStyle(
                              color: Colors.black),
                          alignText: false,
                          textOverflow: null),
                      Spacer(),
                      CustomTextWidget("₹ 60",
                          style: CustomTextStyle.boldMediumTextStyle(
                              color: Colors.black),
                          alignText: false,
                          textOverflow: null),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(5)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        CustomTextWidget("Total Fare (in Rs.)",
                            style: CustomTextStyle.boldMediumTextStyle(
                                color: Colors.white),
                            alignText: false,
                            textOverflow: null),
                        Spacer(),
                        CustomTextWidget("₹ 1260",
                            style: CustomTextStyle.boldMediumTextStyle(
                                color: Colors.white),
                            alignText: false,
                            textOverflow: null),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      blurRadius: 10,
                      spreadRadius: 2,
                      offset: Offset(3, 3))
                ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextWidget(
                    "By clicking on the Proceed To Payment button, you agree to our Terms & Condition of Our App and that you have read our Privacy Policy and User Agreement.",
                    style: CustomTextStyle.smallTextStyle1(color: Colors.black),
                    alignText: false,
                    textOverflow: null),
                SizedBox(
                  height: 8,
                ),
                CustomTextWidget(
                    "Also please make sure to check our Cancellation Policy.",
                    style: CustomTextStyle.smallTextStyle1(color: Colors.black),
                    alignText: false,
                    textOverflow: null),
                SizedBox(
                  height: 30,
                ),
                FullWidthButton(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    border: Border.all(
                      color: Colors.red,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(10),
                    title: "Proceed To Payment",
                    color: AppColors.primaryButtonColor,
                    onTap: () async {
                     await _sharedBookingController.confirmBooking();
                     openCheckout();
                    }),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    Fluttertoast.showToast(
        msg: "SUCCESS: " + response.paymentId.toString(), timeInSecForIosWeb: 4);

    Navigator.push(context, MaterialPageRoute(builder: (context) => SuccessPage()));

  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(
        msg: "ERROR: " + response.code.toString() + " - " + response.message.toString(),
        timeInSecForIosWeb: 4);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(
        msg: "EXTERNAL_WALLET: " + response.walletName.toString(), timeInSecForIosWeb: 4);
  }

}
