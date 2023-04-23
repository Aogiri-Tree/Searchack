import 'package:flutter/material.dart';

class TownPickerWidget extends StatefulWidget {
  const TownPickerWidget({
    super.key,
  });

  @override
  State<TownPickerWidget> createState() => _TownPickerWidgetState();
}

class _TownPickerWidgetState extends State<TownPickerWidget> {
  int? selectedValue = 0;

  List<String> towns = [
    'Любой',
    'Москва',
    'Уфа',
    'Казань',
    'Санкт-Петербург',
    'Саратов',
    'Владивосток',
    'Минск',
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(towns[index]),
            Radio(
              visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              value: index,
              groupValue: selectedValue,
              onChanged: (value) => setState(() {
                selectedValue = value;
              }),
            ),
          ],
        );
      },
      separatorBuilder: (_, ___) {
        return const SizedBox(
          height: 12,
        );
      },
      itemCount: towns.length,
    );
  }
}
