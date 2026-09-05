import 'package:bookly/core/widgets/cuostom_snack_bar.dart';
import 'package:bookly/core/widgets/custom_button.dart';
import 'package:bookly/features/home/data/models/book_model/item.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BooksAction extends StatelessWidget {
  const BooksAction({super.key, required this.item});
  final Item item;
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          const Expanded(
            child: CustomButton(
              text: 'Free',
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                bottomLeft: Radius.circular(16),
              ),
              backgroundColor: Colors.white,
              textColor: Colors.black,
            ),
          ),
          Expanded(
            child: CustomButton(
              onPressed: () async {
                try {
                  Uri uri = Uri.parse(item.volumeInfo.previewLink!);
                  if (await canLaunchUrl(uri)) {
                    await launchUrl(uri);
                  } else {
                    CustomSnackBar.showError(
                      context,
                      'Unable to open the link. Please try again.',
                    );
                  }
                } catch (e) {
                  CustomSnackBar.showError(
                    context,
                    'Something went wrong. Please try again.',
                  );
                }
              },
              text: 'Preview',
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
              backgroundColor: const Color(0xffEF8262),
              textColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}





