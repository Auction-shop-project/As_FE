import 'package:auction_shop/common/component/appbar.dart';
import 'package:auction_shop/common/layout/default_layout.dart';
import 'package:auction_shop/common/variable/color.dart';
import 'package:auction_shop/common/variable/textstyle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  static String get routeName => 'notification';
  const NotificationScreen({super.key});

  String changeText({
    required String text,
  }) {
    if (text == '채팅') {
      return 'chatting';
    } else if (text == '새로운 입찰') {
      return 'new_bid';
    } else if (text == '경매 제한 시간') {
      return 'limit_clock';
    } else {
      return 'limit_hammer';
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      bgColor: auctionColor.subGreyColorF6,
      appBar: CustomAppBar().noLeadingAppBar(
        vertFunc: (String? val) {
          print('object');
        },
        popupList: [
          // popupItem(text: '수정하기'),
          // PopupMenuDivider(),
          // popupItem(text: '수정하기2'),
          // PopupMenuDivider(),
          // popupItem(text: '수정3하기'),
          // PopupMenuDivider(),
          // popupItem(text: '수정6하기'),
          // PopupMenuDivider(),
          // popupItem(text: '수정5하기'),
        ],
        title: '알림',
      ),
      child: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 50),
              Text(
                "추후 업데이트될 예정입니다.\n감사합니다.",
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        // child: Padding(
        //   padding: const EdgeInsets.symmetric(horizontal: 16),
        //   child: ListView.separated(
        //     separatorBuilder: (context, index) {
        //       return SizedBox(
        //         height: 11,
        //       );
        //     },
        //     shrinkWrap: true,
        //     itemCount: 8,
        //     itemBuilder: (context, index) {
        //       return notificationBox(
        //         type: '채팅',
        //         title: '알림 제목입니다.',
        //         content: '알림 내용입니다. 알림 내용입니다. 알림 내용입니다. 알림 내용입니다. 알림 내용입니다. 알림 내용입니다. 알림 내용입니다.',
        //       );
        //     },
        //   ),
        // ),
      ),
    );
  }

  Container notificationBox({
    required String type,
    required String title,
    required String content,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/img/${changeText(text: type)}.png'),
              SizedBox(
                width: 6.5,
              ),
              Text(
                type,
                style: tsNotoSansKR(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: auctionColor.subGreyColorB6,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 6,
              bottom: 4,
            ),
            child: Text(
              title,
              style: tsNotoSansKR(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Text(
            content,
            style: tsNotoSansKR(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: auctionColor.subGreyColorB6,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
