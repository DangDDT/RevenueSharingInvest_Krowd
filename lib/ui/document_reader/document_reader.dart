import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:rsi/foundation/constants.dart';
import 'package:rsi/ui/_common/loading/circular_loading.dart';

class DocumentReader extends StatefulWidget {
  const DocumentReader(
      {Key? key, required this.url, required this.documentName})
      : super(key: key);
  final String url;
  final String documentName;
  @override
  State<DocumentReader> createState() => _DocumentReaderState();
}

class _DocumentReaderState extends State<DocumentReader> {
  final Completer<PDFViewController> _pdfViewController =
      Completer<PDFViewController>();
  final StreamController<String> _pageCountController =
      StreamController<String>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.documentName),
      ),
      body: PDF(
        preventLinkNavigation: true,
        fitEachPage: true,
        enableSwipe: true,
        swipeHorizontal: true,
        autoSpacing: false,
        pageFling: false,
        onPageChanged: (int? current, int? total) =>
            _pageCountController.add('${current! + 1} - $total'),
        onViewCreated: (PDFViewController pdfViewController) async {
          _pdfViewController.complete(pdfViewController);
          final int currentPage = await pdfViewController.getCurrentPage() ?? 0;
          final int? pageCount = await pdfViewController.getPageCount();
          _pageCountController.add('${currentPage + 1} - $pageCount');
        },
      ).fromUrl(
        widget.url,
        placeholder: (double progress) => Center(child: CircularLoading()),
        errorWidget: (dynamic error) => Center(child: Text(error.toString())),
      ),
      floatingActionButton: FutureBuilder<PDFViewController>(
        future: _pdfViewController.future,
        builder: (_, AsyncSnapshot<PDFViewController> snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            return Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 30),
                  child: FloatingActionButton(
                    heroTag: '<',
                    backgroundColor: kBackgroundColor,
                    child: const Text('<',
                        style: TextStyle(fontSize: 30, color: kPrimaryColor)),
                    onPressed: () async {
                      final PDFViewController pdfController = snapshot.data!;
                      final int currentPage =
                          (await pdfController.getCurrentPage())! - 1;
                      if (currentPage >= 0) {
                        await pdfController.setPage(currentPage);
                      }
                    },
                  ),
                ),
                FloatingActionButton(
                  heroTag: '>',
                  backgroundColor: kBackgroundColor,
                  child: const Text('>',
                      style: TextStyle(fontSize: 30, color: kPrimaryColor)),
                  onPressed: () async {
                    final PDFViewController pdfController = snapshot.data!;
                    final int currentPage =
                        (await pdfController.getCurrentPage())! + 1;
                    final int numberOfPages =
                        await pdfController.getPageCount() ?? 0;
                    if (numberOfPages > currentPage) {
                      await pdfController.setPage(currentPage);
                    }
                  },
                ),
              ],
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
