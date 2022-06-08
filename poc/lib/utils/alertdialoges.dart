import 'package:flutter/material.dart';
import 'package:poc/utils/navig.dart';
import 'package:fluttertoast/fluttertoast.dart';


mixin AlertDiag on Navig {
  
  showHttpFailureDialog(
      {
        required String message, 
        required VoidCallback callback
      }){
    displayDialog(
      title: 'ALERT',
      message: message,
      textConfirm: 'BACK',
      confirmCallBack: () {
        pop();
        callback();
      },
    );
  }

  displayDialog(
      {required String title,
      required String message,
      required String textConfirm,
      String? textCancel,
      required Function() confirmCallBack,
      Function()? cancelCallBack,
      Color backgroundColor = Colors.white,
      double borderRadius = 20.0,
      double padding = 8.0}) {
    showDialog(
      context: ctx!,
      builder: (BuildContext context) => AlertDialog(
        backgroundColor: backgroundColor,
        titlePadding: EdgeInsets.all(padding),
        contentPadding: EdgeInsets.all(padding),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(borderRadius))),
        title: Text(
          title,
          textAlign: TextAlign.center,
        ),
        content: Text(
          message,
          textAlign: TextAlign.center,
        ),
        actions: [
          if (textCancel != null && cancelCallBack != null)
            TextButton(
              style: TextButton.styleFrom(
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100)),
              ),
              onPressed: cancelCallBack,
              child: Text(
                textCancel,
                style: const TextStyle(color: Colors.green),
              ),
            ),
          TextButton(
            key: const Key('alert_dialog_confirm'),
            style: TextButton.styleFrom(
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100)),
            ),
            onPressed: confirmCallBack,
            child: Text(
              textConfirm,
              style: const TextStyle(color: Colors.green),
            ),
          ),
        ],
      ),
    );
  }

  void showSnack(String message) {
    ScaffoldMessenger.of(ctx!).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.black,
      ),
    );
  }

  void showToast(message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.white,
        textColor: Colors.black);
  }

}