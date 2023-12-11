import '../index.dart';

class SearchBarWidget extends StatelessWidget {
  SearchBarWidget({
    Key? key,
    required this.context,
    required this.textEditingController,
    required this.searchCallback,
  }) : super(key: key);

  final BuildContext context;

  final TextEditingController textEditingController;

  final VoidCallback searchCallback;

  final ValueNotifier<bool> _clearVisibleNotifier = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      floating: true,
      delegate: SearchPinnedDelegate(searchBarUi()),
    );
  }

  Widget searchBarUi() {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 12),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColor.backgroundHeavy,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(38.0),
                  ),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        offset: const Offset(0, 2),
                        blurRadius: 8.0),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 18),
                  child: TextField(
                    controller: textEditingController,
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                    onChanged: (String value) =>
                        {_clearVisibleNotifier.value = value.isNotEmpty},
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(top: 4),
                      border: InputBorder.none,
                      hintText: '搜索',
                      suffixIcon: ValueListenableBuilder(
                        builder: (context, value, child) {
                          return textEditingController.text.isNotEmpty
                              ? IconButton(
                                  onPressed: () {
                                    textEditingController.clear();
                                    _clearVisibleNotifier.value = false;
                                    searchCallback();
                                  },
                                  icon: const Icon(Icons.cancel,
                                      color: AppColor.important))
                              : const SizedBox();
                        },
                        valueListenable: _clearVisibleNotifier,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: AppColor.important,
              borderRadius: const BorderRadius.all(
                Radius.circular(38.0),
              ),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.grey.withOpacity(0.4),
                    offset: const Offset(0, 2),
                    blurRadius: 8.0),
              ],
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: const BorderRadius.all(
                  Radius.circular(32.0),
                ),
                onTap: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                  searchCallback();
                },
                child: const Padding(
                  padding: EdgeInsets.only(
                      top: 10.0, left: 16, right: 16, bottom: 10),
                  child: Icon(FontAwesomeIcons.magnifyingGlass,
                      size: 20, color: AppColor.backgroundLight),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SearchPinnedDelegate extends SliverPersistentHeaderDelegate {
  SearchPinnedDelegate(
    this.searchBar,
  );

  final Widget searchBar;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return searchBar;
  }

  @override
  double get maxExtent => 52.0;

  @override
  double get minExtent => 52.0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
