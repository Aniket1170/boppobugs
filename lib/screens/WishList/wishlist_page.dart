import 'package:boppo_stream/AutoSizeText/auto_size_text.dart';
import 'package:boppo_stream/Sizer/sizer.dart';
import 'package:boppo_stream/screens/Search/component/search_bar.dart';
import 'package:boppo_stream/utils/progress_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/mywishlist_bloc.dart';
import 'components/wish_list.dart';
import 'model/wishlist_response.dart';

class WishListPage extends StatefulWidget {
  const WishListPage({Key? key}) : super(key: key);

  @override
  _WishListPageState createState() => _WishListPageState();
}

class _WishListPageState extends State<WishListPage> {
  final MywishlistBloc _bloc = MywishlistBloc();
  final List<WishlistData> _wishList = [];
  final List<WishlistData> _searchList = [];
  final _controller = TextEditingController();
  final _focusNode = FocusNode();
  bool _isSearching = false;

  Future<void> _getWishList() async {
    _bloc.add(GetWishlist());
  }

  void _searchData(String data) {
    if (data != '') {
      _isSearching = true;
      _searchList.clear();
      _wishList.forEach((element) {
        if (element.name != null &&
            element.name!.toLowerCase().contains(data.toLowerCase())) {
          _searchList.add(element);
        }
      });

      setState(() {});
    } else {
      _clearSearch();
    }
  }

  void _clearSearch() {
    _controller.clear();
    _searchList.clear();
    _isSearching = false;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _getWishList();
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    _bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: SearchBar(
            textEditingController: _controller,
            focusNode: _focusNode,
            onChanged: (query) {
              _searchData(query);
            },
            onClear: _clearSearch,
          ),
        ),
        // appBar: BuildAppBar(showBackbutton: false, title: 'Favourites'),
        body: _buildOrderhistoryBloc(),
      );

  BlocConsumer<MywishlistBloc, MywishlistState> _buildOrderhistoryBloc() =>
      BlocConsumer<MywishlistBloc, MywishlistState>(
        bloc: _bloc,
        listener: (context, state) {
          if (state is MywishlistLoading) {
            showProgressDialog(context);
          } else if (state is MywishlistSuccess) {
            hideProgressDialog(context);
            _wishList.clear();
            _wishList.addAll(state.wishList);
          } else if (state is DetailAddFavSuccess) {
            hideProgressDialog(context);
            _getWishList();
          } else if (state is MywishlistError) {
            hideProgressDialog(context);
            _wishList.clear();
            // showValidationAlert(context, errorMessage: state.error,
            //     onClose: () {
            //   Navigator.pop(context);
            // });
          }
        },
        builder: (context, state) =>
            (state is MywishlistLoading) ? Container() : _buildBody(),
      );

  Widget _buildBody() => RefreshIndicator(
        onRefresh: _getWishList,
        child: (_wishList.length > 0)
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    // child: AutoSizeText(
                    //   'Favourites',
                    //   style: TextStyle(
                    //       fontWeight: FontWeight.w500, fontSize: 12.sp),
                    // ),
                    child: Text(
                      'Favourites',
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Expanded(
                    child: (_isSearching)
                        ? MyWistList(bloc: _bloc, wishList: _searchList)
                        : MyWistList(bloc: _bloc, wishList: _wishList),
                  )
                ],
              )
            : SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                child: Container(
                  height: 80.h,
                  child: Center(
                    child: AutoSizeText(
                      'No favourite movie found',
                      style: TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 10.sp),
                    ),
                  ),
                ),
              ),
      );
}
