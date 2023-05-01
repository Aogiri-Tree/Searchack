import 'package:flutter/material.dart';
import 'package:searchack/main.dart';
import 'package:searchack/pages/main/catalog/widgets/hackaton_card_widget.dart';
import 'package:searchack/pages/main/catalog/widgets/modal_widgets/modal_search_field_widget.dart';
import 'package:searchack/pages/main/catalog/widgets/modal_widgets/town_picker_widget.dart';
import 'package:searchack/pages/main/catalog/widgets/search_field_widget.dart';
import 'package:searchack/pages/main/catalog/widgets/specialization_choise_widet.dart';

class CatalogPage extends StatefulWidget {
  const CatalogPage({super.key});

  @override
  State<CatalogPage> createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
  void _onTap() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
      ),
      builder: (BuildContext context) {
        return SafeArea(
          child: Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: Padding(
              padding: const EdgeInsets.only(
                top: 40,
                left: 16,
                right: 16,
                bottom: 30,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Text(
                    "Город",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ModalSearchFieldWidget(),
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(child: TownPickerWidget()),
                  SizedBox(
                    height: 25,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottomOpacity: 0.0,
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Каталог",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchFieldWidget(
              onTap: _onTap,
            ),
            const SizedBox(
              height: 4,
            ),
            const SpecializationChoiseWidget(),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: hacks.all!.length,
                itemBuilder: (context, index) {
                  return HackatonCardWidget(
                    imageUrl: hacks.all![index].imageUrl!,
                    hackName: hacks.all![index].hackName!,
                    isOpen: hacks.all![index].isOpen!,
                    isOnline: hacks.all![index].isOnline!,
                    description: hacks.all![index].description!,
                    address: hacks.all![index].address!,
                    regUrl: hacks.all![index].regUrl!,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
