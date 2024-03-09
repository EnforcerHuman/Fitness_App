import 'package:flutter/material.dart';
import 'package:strongify/common_widget/round_button.dart';
import 'package:strongify/functions/profile/feedback_function.dart';

class ReviewForm extends StatefulWidget {
  const ReviewForm({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ReviewFormState createState() => _ReviewFormState();
}

class _ReviewFormState extends State<ReviewForm> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
        key: _scaffoldKey,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    width: media.width,
                    height: media.height - 200,
                    decoration: BoxDecoration(border: Border.all(width: 2)),
                    child: TextField(
                      controller: reviewController,
                      decoration: const InputDecoration(
                          labelText:
                              'We value your feedback | help us to improve',
                          border: InputBorder.none),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: RoundButton(
                      title: 'Submit',
                      onPressed: () {
                        setState(() {});
                        submitReview();
                        reviewController.clear();
                      }),
                ),
              ],
            ),
          ),
        ));
  }
}
