import 'package:flutter/material.dart';
import 'package:rsi/foundation/constants.dart';
import 'package:sizer/sizer.dart';

import 'faq_container.dart';

Future<void> showQuestionModal(BuildContext context) {
  return showModalBottomSheet<void>(
    isScrollControlled: true,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
    backgroundColor: Colors.white,
    context: context,
    builder: (context) => QuestionModal(),
  );
}

class QuestionModal extends StatelessWidget {
  const QuestionModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: GestureDetector(
            child: Container(
                height: 80.h,
                padding: EdgeInsets.symmetric(
                  horizontal: kDefaultPadding,
                  vertical: kDefaultPadding + 10,
                ),
                decoration: new BoxDecoration(
                  color: kBackgroundColor,
                  borderRadius: new BorderRadius.only(
                    topLeft: const Radius.circular(kBorder),
                    topRight: const Radius.circular(kBorder),
                  ),
                ),
                child: new LayoutBuilder(builder:
                    (BuildContext context, BoxConstraints constraints) {
                  return Column(
                    children: [
                      Container(
                        height: constraints.maxHeight * 0.25,
                        decoration: new BoxDecoration(
                          color: nWhite,
                          borderRadius: BorderRadius.all(
                            Radius.circular(kBorder + 4),
                          ),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  "Câu hỏi",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: kFontSize - 2,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Thường gặp",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: kFontSize + 4,
                                    color: kPrimaryColor,
                                  ),
                                )
                              ],
                            ),
                            Image.asset(
                              "assets/images/business_idea.png",
                              width: 170,
                              fit: BoxFit.cover,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: constraints.maxHeight * 0.75,
                        child: ListView(
                          shrinkWrap: true,
                          children: [
                            FAQ(
                              constraints: constraints,
                              question:
                                  "Tôi muốn tham gia dự án thì phải làm gì?",
                              answer:
                                  "Lựa chọn được dự án mình yêu thích. Sau đó, chọn mua gói đầu tư phù hợp với tài chính của mình. ",
                            ),
                            FAQ(
                              constraints: constraints,
                              question:
                                  "Chuyển tiền vào ví đầu tư chung mất bao lâu?",
                              answer:
                                  "Hệ thống sẽ xử lý tiền của bạn chậm nhất là một ngày. Nếu sau một ngày vẫn chưa thấy tiền được chuyển vào thì hãy liên hệ để được xử lý sớm nhất.",
                            )
                          ],
                        ),
                      ),
                    ],
                  );
                }))));
  }
}
