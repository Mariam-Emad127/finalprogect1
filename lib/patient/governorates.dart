import 'package:final_project/component/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../home/theme_cubit.dart';

class Governorate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Text(""),
        title: Center(
            child: Text(
          "Best Doctors in countries",
          style: TextStyle(
            color: Color(0xFF439be8),
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        )),
      ),
      drawer: Drower(),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) => EntryItem(
          data[index],
        ),
      ),
    );
  }
}

class Entry {
  final String title;
  final List<Entry> children;

  Entry(this.title, [this.children = const <Entry>[]]);
}

final List<Entry> data = <Entry>[
  Entry(
    'Cairo',
    <Entry>[
      Entry('دكتور احمد فتح الله   , حلوان : شارع رياض '),
      Entry('دكتور هشام السباعي   , المعادي : كورنيش النيل'),
      Entry(
          'دكتورة هدير شريف  , مدينة نصر:ابراج زاهر اخر امتداد شارع حسن المامون '),
      Entry('دكتور عماد عزت حبيب  , شبرا:أول شارع الترع البولاقيه'),
      Entry(' دكتور أحمد مجدي ربيع  , التجمع : مركز طبي التجمع الخامس'),
    ],
  ),
  // Second Row
  Entry('Giza', <Entry>[
    Entry(
        'دكتور حسين متولي   , الشيخ زايد : عيادات ميديبوينت - بجوار مستشفي الشيخ زايد التخصصي و التوحيد و النور - اعلي صيدلية سيف-الدور الثالث '),
    Entry('دكتور وفاء عاشور   , الدقي : ميدان طيبة'),
    Entry('دكتور أحمد سعد   , الدقي : ميدان طيبة'),
    Entry(
        'دكتور أحمد حامد رشاد   ,6 اكتوبر : مول هاميس التجاري-مدخل الحي المتميز-أعلي مطعم تكا'),
    Entry('دكتور منذر احمد   , حدائق الاهرام : شارع 5أ البوابه الاولي  '),
  ]),

  Entry(
    'Alexandria',
    <Entry>[
      Entry('دكتور محمد الشاذلى       , سبورتينج : طريق الحرية '),
      Entry('دكتور اشرف عبد الغني    , جانكليس : طريق الحرية '),
    ],
  ),
];

// Create the Widget for the row
class EntryItem extends StatelessWidget {
  const EntryItem(this.entry);

  final Entry entry;

  // This function recursively creates the multi-level list rows.
  Widget _buildTiles(Entry root) {
    if (root.children.isEmpty) {
      return ListTile(
        title: Text(root.title),
      );
    }
    return ExpansionTile(
      key: PageStorageKey<Entry>(root),
      title: Text(root.title),
      children: root.children.map<Widget>(_buildTiles).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(entry);
  }
}
