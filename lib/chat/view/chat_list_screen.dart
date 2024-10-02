import 'package:auction_shop/chat/model/chat_model.dart';
import 'package:auction_shop/chat/provider/chatroom_provider.dart';
import 'package:auction_shop/chat/provider/chatting_provider.dart';
import 'package:auction_shop/chat/view/chat_info_screen.dart';
import 'package:auction_shop/common/component/appbar.dart';
import 'package:auction_shop/common/component/image_widget.dart';
import 'package:auction_shop/common/model/cursor_pagination_model.dart';
import 'package:auction_shop/common/variable/color.dart';
import 'package:auction_shop/common/variable/textstyle.dart';
import 'package:auction_shop/common/layout/default_layout.dart';
import 'package:auction_shop/main.dart';
import 'package:auction_shop/user/provider/user_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ChatListScreen extends ConsumerStatefulWidget {
  static String get routeName => "chat";
  const ChatListScreen({super.key});

  @override
  ConsumerState<ChatListScreen> createState() => _ChatListScreenState();
}

class _ChatListScreenState extends ConsumerState<ChatListScreen> {
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(chatRoomProvider);

    return DefaultLayout(
      appBar: CustomAppBar().noLeadingAppBar(
        popupList: [
          popupItem(text: "Example"),
        ],
        vertFunc: (String? val) {
          print(val);
        },
        title: "채팅 모음",
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 0, right: 0),
        //padding: const EdgeInsets.only(left: 16, right: 34),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 50),
                  Text(
                  "추후 업데이트될 예정입니다.\n감사합니다.",
                  textAlign: TextAlign.center,
                ),
                ],
              )
            ),
            //topBar(),
            // if (state.length == 0)
            //   SliverToBoxAdapter(child: SizedBox())
            // else if (state.length != 0)
            //   SliverList.builder(
            //     itemCount: state.length,
            //     itemBuilder: (context, index) {
            //       print( state[index].toJson());
            //       final memberId = ref.read(userProvider.notifier).getMemberId();
            //       print("mymemberId : ${memberId}");
            //       return Padding(
            //         padding: const EdgeInsets.only(bottom: 25),
            //         child: ChatListBox(
            //           func: () async {
            //             final extra = state[index];
            //             final enterData = MakeRoom(userId: extra.userId, postId: extra.postId, yourId: extra.yourId);
            //             ref.read(chatProvider.notifier).enterChat(enterData);

            //             context.pushNamed(ChatInfoScreen.routeName, extra: extra);
            //           },
            //           username: 'userId : ${state[index].userId}',
            //           date: "postId : ${state[index].postId}",
            //           content: "yourId : ${state[index].yourId}",
            //         ),
            //       );
            //     },
            //   ),
          ],
        ),
      ),
    );
  }

  SliverToBoxAdapter topBar() {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: ratio.height * 50,
          ),
          Text(
            "경매 채팅",
            style: tsNotoSansKR(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: auctionColor.subBlackColor49,
            ),
          ),
          SizedBox(
            height: ratio.height * 40,
          ),
        ],
      ),
    );
  }

  GestureDetector ChatListBox({
    required String username,
    required String date,
    required String content,
    required VoidCallback func,
  }) {
    return GestureDetector(
      onTap: func,
      child: Container(
        child: IntrinsicHeight(
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.only(
                  right: 15,
                ),
                decoration: BoxDecoration(
                  color: auctionColor.subGreyColorCC,
                  borderRadius: BorderRadius.circular(5),
                ),
                width: ratio.width * 56,
                height: ratio.height * 56,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        UserImage(size: 25),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 6, vertical: 3),
                          child: Text(
                            username,
                            style: tsNotoSansKR(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: auctionColor.subBlackColor49,
                            ),
                          ),
                        ),
                        Text(
                          date,
                          style: tsNotoSansKR(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: auctionColor.subGreyColor94,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      content,
                      style: tsNotoSansKR(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: auctionColor.subGreyColor94,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: 3,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
