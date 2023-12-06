import 'package:flutter/material.dart';
import 'package:relationshipsincorporated/theme/app_common_color.dart';

class CommonCirculer {
  static showProgressIndicator(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: Material(
            elevation: 10,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: const CircularProgressIndicator(
                color: Color.fromRGBO(122, 17, 47, 1),
              ),
            ),
          ),
        );
      },
    );
  }

  static hideLoading(BuildContext dialogContex) {
    Navigator.pop(dialogContex);
  }

  static void showErrorMessage(BuildContext context, title) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Column(
              children: [
                Text(title.toString(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w700)),
                const SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(AppCommonColor.appMainColor)),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Ok",
                    style: TextStyle(color: Color(AppCommonColor.whiteColor)),
                  ),
                )
              ],
            ),
          );
        });
  }

  static showSnackbar(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
  }
}
