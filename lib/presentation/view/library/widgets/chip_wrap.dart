import 'package:flutter/material.dart';
import 'package:library_app/presentation/view/library/widgets/chip_widget.dart';

class ChipWrap extends StatelessWidget {
  const ChipWrap({super.key, required this.dataList, required this.title});
  final List<String> dataList;
  final String title;
  @override
  Widget build(BuildContext context) {
    final styleText = Theme.of(context).textTheme;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      child: ExpansionTile(
        
        title: Text(title, style: styleText.bodyLarge!.copyWith(fontWeight: FontWeight.w600),),
        children: [
          Wrap(
            spacing: 6,
            children: [
              ...dataList.map(

                (alter) => ChipWidget(
                  text: alter,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
