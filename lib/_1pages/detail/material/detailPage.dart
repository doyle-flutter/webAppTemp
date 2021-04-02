import 'package:exam/_11viewComponents/app/detail/material/detailAppViewMaterial.dart';
import 'package:exam/_11viewComponents/web/detail/detailWebView.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DetailPageMa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return (kIsWeb && MediaQuery.of(context).size.width > 800.0)
      ? DetailWebView()
      : DetailAppView();
  }
}
