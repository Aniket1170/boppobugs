import 'package:boppo_stream/AutoSizeText/auto_size_text.dart';
import 'package:boppo_stream/CommomWidgets/build_app_bar.dart';
import 'package:boppo_stream/Sizer/sizer.dart';
import 'package:boppo_stream/utils/const.dart';
import 'package:boppo_stream/utils/progress_loader.dart';
import 'package:boppo_stream/utils/validation_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/faq_bloc.dart';

class Faq {
  final String title;
  final String contents;

  const Faq({required this.title, required this.contents});
}

class FaqPage extends StatefulWidget {
  @override
  _FaqPageState createState() => _FaqPageState();
}

class _FaqPageState extends State<FaqPage> {
  final TextEditingController _textEditingController = TextEditingController();
  final FaqBloc _bloc = FaqBloc();
  final List<Faq> _faqs = [];
  bool _isExpanded = false;
  int _selected = -1;

  @override
  void initState() {
    super.initState();
    _bloc.add(GetFaq());
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    _bloc.close();
    super.dispose();
  }

  // _buildExpandableContent(Faq faq) {
  //   List<Widget> columnContent = [];

  //   for (String content in faq.contents)
  //     columnContent.add(
  //       new ListTile(
  //         title: new Text(
  //           content,
  //           style: new TextStyle(fontSize: 18.0),
  //         ),
  //         leading: new Icon(faq.icon),
  //       ),
  //     );

  //   return columnContent;
  // }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: BuildAppBar(title: 'FAQs'),
        body: SafeArea(
          child: _buildBloc(),
        ),
      );

  Widget _buildBloc() => BlocConsumer<FaqBloc, FaqState>(
        bloc: _bloc,
        listener: (context, state) {
          if (state is FaqLoading) {
            showProgressDialog(context);
          }

          if (state is FaqSuccess) {
            hideProgressDialog(context);
            _faqs.clear();
            final data = state.data;
            data.forEach((element) {
              Faq _faq = Faq(
                  title: element.type ?? '',
                  contents: element.description ?? '');
              _faqs.add(_faq);
            });
          }

          if (state is FaqError) {
            hideProgressDialog(context);
            showValidationAlert(context, errorMessage: state.error,
                onClose: () {
              Navigator.pop(context);
            });
          }
        },
        builder: (context, state) => FAQListWidget(
          faqs: _faqs,
        ),
      );
}

class FAQListWidget extends StatelessWidget {
  const FAQListWidget({Key? key, required this.faqs}) : super(key: key);

  final List<Faq> faqs;

  @override
  Widget build(BuildContext context) => ListView.builder(
        itemCount: faqs.length,
        itemBuilder: (context, i) => Container(
          color: tileColor,
          padding: const EdgeInsets.only(top: 4.0, bottom: 4.0),
          margin: const EdgeInsets.only(top: 4.0, bottom: 4.0),
          child: ExpansionTile(
            title: AutoSizeText(
              faqs[i].title,
              style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500),
            ),
            iconColor: Colors.white,
            collapsedIconColor: Colors.white,
            expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: AutoSizeText(
                  faqs[i].contents,
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 10.sp),
                ),
              ),
              // Column(
              //   children: _buildExpandableContent(vehicles[i]),
              // ),
            ],
          ),
        ),
      );
}
