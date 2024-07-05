
import 'package:flutter/material.dart';
import 'package:rep1/core/styles.dart';
import 'package:rep1/featuers/explore/peresintaion/view/explore.dart';

class RecordStepWidget extends StatelessWidget {
  const RecordStepWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            'My Records',
            style: Styles.textStyle10w700,
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              RecordRowWidget(
                color: Color(0xffBBF246),
                record: '50 Push ups',
              ),
              RecordRowWidget(
                color: Colors.grey,
                record: '50 Pench Press',
              ),
            ],
          ),
          Row(
            children: [
              RecordRowWidget(
                color: Color(0xffF075AA),
                record: '50 Pull ups',
              ),
              RecordRowWidget(
                color: Colors.grey,
                record: '50 Dead left',
              )
            ],
          ),
          Row(
            children: [
              RecordRowWidget(
                color: Color.fromARGB(255, 137, 117, 240),
                record: '3000 steps',
              ),
              RecordRowWidget(
                color: Colors.grey,
                record: '5 min Sprints',
              )
            ],
          ),
        ],
      ),
    );
  }
}
