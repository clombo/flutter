import 'package:flutter/cupertino.dart';
import 'package:quiz_app/widgets/summary_widgets/questions_item.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary({super.key, required this.summaryData});

  final List<Map<String,Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return
      SizedBox(
        height: 300,
        child: SingleChildScrollView(
          child: Column(
            children: summaryData.map((record) {
              return QuestionsItem(itemData: record);
            }).toList(),
          ),
        )
      );

  }
}