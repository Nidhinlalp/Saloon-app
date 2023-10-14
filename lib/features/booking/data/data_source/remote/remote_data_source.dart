// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:razorpay_web/razorpay_web.dart';

import 'package:salloon_app/features/booking/data/model/booking_model.dart';
import 'package:salloon_app/features/home/presentation/pages/homoe_screen.dart';

abstract class BookingRemoteDataSource {
  void bookingTheSaloon(BookingModel bookingModel, String uid);
  void handleRazorPay(BuildContext context);
}

class BookingRemoteDataSourceImpl extends BookingRemoteDataSource {
  final FirebaseFirestore firestor;
  late Razorpay _razorpay;
  FirebaseAuth auth;
  late BookingModel boking;
  late String saloonUid;

  BookingRemoteDataSourceImpl(
    this.firestor,
    this.auth,
  );
  @override
  void bookingTheSaloon(BookingModel bookingModel, String uid) async {
    boking = bookingModel;
    saloonUid = uid;

    final currentUser = auth.currentUser;

    if (currentUser != null) {
      await _openCheckout(bookingModel.money);
    }
  }

  @override
  void handleRazorPay(BuildContext context) {
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS,
        (PaymentSuccessResponse response) {
      _handlePaymentSuccess(response, context);
    });
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  Future<void> _openCheckout(String amount) async {
    var options = {
      'key': 'rzp_test_FxIHeNPp3kLjby',
      'amount': amount,
      'name': 'testName',
      'description': 'booking',
      'send_sms_hash': true,
      'prefill': {'contact': '8888888888', 'email': 'test@razorpay.com'},
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint('Error: e');
    }
  }

  Future<void> _handlePaymentSuccess(
      PaymentSuccessResponse response, BuildContext context) async {
    log('Success Response: ${response.paymentId}');

    Navigator.pushAndRemoveUntil(
        context,
        CupertinoPageRoute(
          builder: (context) => const HomeScreen(),
        ),
        (route) => false);

    Fluttertoast.showToast(
        msg: "SUCCESS: ${response.paymentId!}",
        toastLength: Toast.LENGTH_SHORT);

    final CollectionReference bookingsCollection = firestor
        .collection('bookings')
        .doc(auth.currentUser!.uid)
        .collection("mybookings");

    await bookingsCollection.doc(saloonUid).set(
      {
        "bookings": [
          boking.toMap(),
        ],
      },
    );
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    log('Error Response: $response');
    Fluttertoast.showToast(
        msg: "ERROR: ${response.code} - ${response.message!}",
        toastLength: Toast.LENGTH_SHORT);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    log('External SDK Response: $response');
    Fluttertoast.showToast(
        msg: "EXTERNAL_WALLET: ${response.walletName!}",
        toastLength: Toast.LENGTH_SHORT);
  }
}
