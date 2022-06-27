import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  final Function(String)? onChanged;
  final Function()? onClear;
  final TextEditingController? textEditingController;
  final FocusNode? focusNode;

  const SearchBar({
    Key? key,
    this.onChanged,
    this.textEditingController,
    this.focusNode,
    this.onClear,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.0),
            border: Border.all(color: Colors.white, width: 2.0)),
        child: Padding(
          padding: const EdgeInsets.only(left: 5),
          child: TextField(
            decoration: InputDecoration(
                // contentPadding: const EdgeInsets.only(left: 5.0, top: 5.0, right: 5.0),
                hintText: 'Search',
                hintStyle: TextStyle(color: Colors.white.withOpacity(0.57)),
                border: InputBorder.none,
                icon: Icon(Icons.search, color: Colors.white),
                suffixIcon: textEditingController?.text != ''
                    ? IconButton(onPressed: onClear, icon: Icon(Icons.clear))
                    : SizedBox.shrink()),
            onChanged: onChanged,
            controller: textEditingController,
            focusNode: focusNode,
          ),
        ),
      );
}
