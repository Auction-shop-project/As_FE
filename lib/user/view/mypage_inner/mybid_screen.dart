import 'package:auction_shop/common/component/user_image.dart';
import 'package:auction_shop/common/layout/default_layout.dart';
import 'package:auction_shop/common/variable/color.dart';
import 'package:auction_shop/common/variable/textstyle.dart';
import 'package:auction_shop/product/component/product_card.dart';
import 'package:auction_shop/product/provider/product_provider.dart';
import 'package:auction_shop/user/provider/user_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class MyBidScreen extends ConsumerStatefulWidget {
  static String get routeName => 'mybid';
  const MyBidScreen({super.key});

  @override
  ConsumerState<MyBidScreen> createState() => _MyBidScreenState();
}

class _MyBidScreenState extends ConsumerState<MyBidScreen>
    with SingleTickerProviderStateMixin {
  late TabController controller;
  int index = 0;

  @override
  void initState() {
    controller = TabController(length: 2, vsync: this);
    controller.addListener(tabListener);
    super.initState();
  }

  @override
  void dispose() {
    controller.removeListener(tabListener);
    super.dispose();
  }

  void tabListener() {
    setState(() {
      index = controller.index;
    });
  }

  @override
  Widget build(BuildContext context) {
    //final state = ref.watch(userProvider);
    // final products = ref.watch(productProvider);
    final products = [];
    return DefaultLayout(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          '내 경매장',
          style: tsNotoSansKR(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: auctionColor.subBlackColor49,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: Icon(
            Icons.arrow_back_ios,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.more_vert,
            ),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 20,
        ),
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              // userInfo
              userInfo(name: 'name'),

              // TabBar
              SliverPersistentHeader(
                delegate: CustomAppBarDelegate(
                  myBidTabBar(),
                ),
                pinned: true,
              ),
            ];
          },
          body: TabBarView(
            controller: controller,
            children: [
              // 첫 번째 탭: CustomScrollView 사용
              Padding(
                padding: const EdgeInsets.only(top: 25,),
                child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 12,
                      ),
                      child: Divider(
                        color: auctionColor.subGreyColorE2,
                      ),
                    );
                  },
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    final model = products[index];
                    return IntrinsicHeight(
                        child: ProductCard.fromModel(model: model));
                  },
                ),
              ),

              // 두 번째 탭
              Center(
                child: Text('1'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  SliverToBoxAdapter userInfo({
    required String name,
  }) {
    return SliverToBoxAdapter(
      child: Row(
        children: [
          UserImage(
            size: 60,
          ),
          SizedBox(
            width: 8,
          ),
          Text(
            'user.name',
            style: tsNotoSansKR(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  TabBar myBidTabBar() {
    return TabBar(
      labelStyle: tsNotoSansKR(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      unselectedLabelStyle: tsNotoSansKR(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: auctionColor.subGreyColorB6,
      ),
      indicator: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: auctionColor.mainColor,
            width: 3,
          ),
        ),
      ),
      controller: controller,
      tabs: [
        Tab(
          text: "경매중",
        ),
        Tab(
          text: "경매 완료",
        ),
      ],
    );
  }
}

// sliver 리스트에서 커스텀 헤더를 정의하는 추상 클래스
// 헤더의 최소 및 최대 높이 설정
class CustomAppBarDelegate extends SliverPersistentHeaderDelegate {
  CustomAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(CustomAppBarDelegate oldDelegate) {
    return false;
  }
}
