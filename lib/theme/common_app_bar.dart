import 'package:flutter/material.dart';

class CommonAppBar {
  static Widget returnAppBar(title, BuildContext context) {
    return SizedBox(
      height: 55,
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 30,
          ),
        ],
      ),
    );
  }
}
