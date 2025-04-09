import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double height;
  final double width;
  final Color color;
  final ImageProvider? image;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.height = 60,
    this.width = 362,
    this.color = const Color.fromRGBO(219, 239, 255, 1),
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (image != null) // Conditionally show image if provided
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: SizedBox(
                  width:
                      24, // Adjust the width of the SizedBox to fit the image
                  height:
                      24, // Adjust the height of the SizedBox to fit the image
                  child: Image(image: image!, fit: BoxFit.cover),
                ),
              ),
            Text(
              text,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),

      ),
    );
  }
}
