import 'package:flutter/material.dart';

import '../models/quote.dart';

class QuoteWidget extends StatelessWidget {
  const QuoteWidget({super.key, required this.quote});

  final QuoteModel? quote;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 143, 240, 193),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // NOTE: quote! assumes the quote is non-null here.
          // It is, on the happy path, but a 200 with an empty
          // body would crash. Fine for the lesson; worth a
          // mention to students about the ! "null assertion".
          Text(
            "\" ${quote!.quote} \"",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            "-- ${quote!.author}",
            textAlign: TextAlign.left,
            style: TextStyle(fontWeight: FontWeight.w200),
          ),
        ],
      ),
    );
  }
}
