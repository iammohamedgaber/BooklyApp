import 'package:bookly/features/search/presention/views/widgets/custom_search_text_faild.dart';
import 'package:flutter/material.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(children: const [CustomSearchTextFaild()]),
    );
  }
}
