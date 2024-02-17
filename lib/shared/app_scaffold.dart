import 'package:flutter/material.dart';
import 'package:widgets_catalog/00test.dart';

class AppScaffold extends StatelessWidget {
  final String title;
  final Widget body;
  final bool withCode;
  final String? filePath;
  const AppScaffold({super.key, required this.title, required this.body, this.withCode = true, this.filePath});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onSecondaryTap: () {
        Navigator.pop(context);
      },
      child: DefaultTabController(
        length: withCode ? 2 : 1,
        child: Scaffold(
          appBar: AppBar(
            title: Text(title),
            bottom: withCode
                ? const TabBar(
                    tabs: [
                      Icon(Icons.zoom_in_outlined),
                      Icon(Icons.code_off_outlined),
                    ],
                  )
                : null,
          ),
          body: withCode
              ? TabBarView(children: [
                  SingleChildScrollView(
                    child: body,
                  ),
                  SourceCodeView(
                    filePath: filePath,
                  )
                ])
              : SingleChildScrollView(
                  child: body,
                ),
        ),
      ),
    );
  }
}

const atomOneLightTheme = {
  'root': TextStyle(color: Color(0xff383a42), backgroundColor: Color(0xfffafafa)),
  'comment': TextStyle(color: Color(0xffa0a1a7), fontStyle: FontStyle.italic),
  'quote': TextStyle(color: Color(0xffa0a1a7), fontStyle: FontStyle.italic),
  'doctag': TextStyle(color: Color(0xffa626a4)),
  'keyword': TextStyle(color: Color(0xffa626a4)),
  'formula': TextStyle(color: Color(0xffa626a4)),
  'section': TextStyle(color: Color(0xffe45649)),
  'name': TextStyle(color: Color(0xffe45649)),
  'selector-tag': TextStyle(color: Color(0xffe45649)),
  'deletion': TextStyle(color: Color(0xffe45649)),
  'subst': TextStyle(color: Color(0xffe45649)),
  'literal': TextStyle(color: Color(0xff0184bb)),
  'string': TextStyle(color: Color(0xff50a14f)),
  'regexp': TextStyle(color: Color(0xff50a14f)),
  'addition': TextStyle(color: Color(0xff50a14f)),
  'attribute': TextStyle(color: Color(0xff50a14f)),
  'meta-string': TextStyle(color: Color(0xff50a14f)),
  'built_in': TextStyle(color: Color(0xffc18401)),
  'attr': TextStyle(color: Color(0xff986801)),
  'variable': TextStyle(color: Color(0xff986801)),
  'template-variable': TextStyle(color: Color(0xff986801)),
  'type': TextStyle(color: Color(0xff986801)),
  'selector-class': TextStyle(color: Color(0xff986801)),
  'selector-attr': TextStyle(color: Color(0xff986801)),
  'selector-pseudo': TextStyle(color: Color(0xff986801)),
  'number': TextStyle(color: Color(0xff986801)),
  'symbol': TextStyle(color: Color(0xff4078f2)),
  'bullet': TextStyle(color: Color(0xff4078f2)),
  'link': TextStyle(color: Color(0xff4078f2)),
  'meta': TextStyle(color: Color(0xff4078f2)),
  'selector-id': TextStyle(color: Color(0xff4078f2)),
  'title': TextStyle(color: Color(0xff4078f2)),
  'emphasis': TextStyle(fontStyle: FontStyle.italic),
  'strong': TextStyle(fontWeight: FontWeight.bold),
};
