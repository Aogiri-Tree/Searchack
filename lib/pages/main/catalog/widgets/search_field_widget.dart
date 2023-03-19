import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchFieldWidget extends StatelessWidget {
  const SearchFieldWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 36,
            child: TextFormField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(vertical: 9),
                prefixIcon: SvgPicture.asset(
                  "assets/icons/search.svg",
                  fit: BoxFit.none,
                ),
                border: const OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
                hintText: 'Поиск',
                hintStyle: const TextStyle(
                  color: Color.fromRGBO(106, 106, 106, 1),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 11,
        ),
        InkWell(
          onTap: () {},
          child: Container(
            padding: const EdgeInsets.all(9),
            width: 36,
            height: 36,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
              color: Colors.white,
            ),
            child: SvgPicture.asset(
              "assets/icons/sliders.svg",
              fit: BoxFit.none,
            ),
          ),
        ),
      ],
    );
  }
}
