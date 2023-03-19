import 'package:flutter/material.dart';
import 'package:searchack/pages/main/catalog/widgets/search_field_widget.dart';
import 'package:searchack/pages/main/catalog/widgets/specialization_choise_widet.dart';

class CatalogPage extends StatelessWidget {
  const CatalogPage({super.key});

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
          children: const [
            SearchFieldWidget(),
            SpecializationChoiseWidget(),
          ],
        ),
      ),
    );
  }
}
