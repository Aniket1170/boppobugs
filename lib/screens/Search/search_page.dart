import 'package:boppo_stream/CommomWidgets/image_helper.dart';
import 'package:boppo_stream/Sizer/sizer.dart';
import 'package:boppo_stream/screens/Details/details_page.dart';
import 'package:boppo_stream/screens/Search/bloc/search_bloc.dart';
import 'package:boppo_stream/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../AutoSizeText/auto_size_text.dart';
import 'component/center_message.dart';
import 'component/search_bar.dart';
import 'model/SearchMovieResponse.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _searchBloc = SearchBloc();
  final _scrollController = ScrollController();
  final _controller = TextEditingController();
  final _focusNode = FocusNode();
  final List<SearchData> _searchList = [];

  // String _contentTypeId = '';
  // String _contentId = '';

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        _controller.selection =
            TextSelection(baseOffset: 0, extentOffset: _controller.text.length);
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    _scrollController.dispose();
    _searchBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => _buildScaffold();

  Scaffold _buildScaffold() => Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          // leading: IconButton(
          //     padding: const EdgeInsets.all(16.0),
          //     onPressed: () {
          //       Navigator.pop(context);
          //     },
          //     icon: Icon(
          //       Icons.arrow_back_ios,
          //       color: Colors.white,
          //     )),
          // leadingWidth: 30,
          title: SearchBar(
            textEditingController: _controller,
            focusNode: _focusNode,
            onChanged: (query) {
              if (query != '') _searchBloc.add(SearchMovie(movieName: query));
            },
            onClear: () {
              _controller.clear();
              _searchList.clear();
              setState(() {});
            },
          ),
        ),
        body: _builldBloc(),
      );

  BlocConsumer<SearchBloc, SearchState> _builldBloc() =>
      BlocConsumer<SearchBloc, SearchState>(
        bloc: _searchBloc,
        listener: (context, state) {
          if (state is SearchSuccess) {
            _searchList.clear();
            _searchList.addAll(state.searchDataList);
          }
        },
        builder: (context, state) {
          // if (state is SearchInitial) {
          //   return CenteredMessage(
          //     message: 'Start searching!',
          //     icon: Icons.ondemand_video,
          //   );
          // }

          if (state is SearchLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is SearchSuccess) {
            return _buildResultList();
          }

          if (state is SearchError) {
            // return CenteredMessage(
            //   message: state.error,
            //   icon: Icons.error_outline,
            // );
          }
          return Container();
        },
      );

  Widget _buildResultList() => NotificationListener<ScrollNotification>(
        onNotification: _handleScrollNotification,
        // child: ListView.separated(
        //   separatorBuilder: (context, index) => Divider(
        //     height: 1,
        //     color: Colors.grey,
        //   ),
        //   itemCount: _searchList.length,
        //   controller: _scrollController,
        //   itemBuilder: (context, index) {
        //     return index >= _searchList.length
        //         ? _buildLoaderListItem()
        //         : _buildVideoListItem(_searchList[index]);
        //   },
        // ),
        child: Container(
          margin:
              const EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 20),
          child: GridView.count(
              physics: BouncingScrollPhysics(),
              controller: _scrollController,
              scrollDirection: Axis.vertical,
              childAspectRatio: (2 / 3),
              crossAxisCount: 3,
              crossAxisSpacing: 12.0,
              mainAxisSpacing: 12.0,
              children: List<Widget>.generate(
                  _searchList.length,
                  (index) => InkWell(
                        onTap: () {
                          _navToDetailPage(context, index);
                        },
                        child: _movieGridItem(
                            '$kImageBaseUrl${_searchList[index].file}'),
                      ))),
          // '${widget.list![index].baseUrl}/${widget.list![index].file}'))),
        ),
      );

  // int _calculateListItemCount(SearchState state) {
  //   if (state.hasReachedEndOfResults) {
  //     return state.searchResults.length;
  //   } else {
  //     return state.searchResults.length + 1;
  //   }
  // }

  bool _handleScrollNotification(ScrollNotification notification) {
    if (notification is ScrollEndNotification &&
        _scrollController.position.extentAfter == 0) {
      // _searchBloc.fetchNextResultPage();
    }
    return false;
  }

  // Widget _buildVideoListItem(SearchData searchItem) {
  //   return GestureDetector(
  //     child: _buildVideoListItemCard(searchItem),
  //     onTap: () {
  //       // _navToDetailPage(context);
  //     },
  //   );
  // }

  void _navToDetailPage(BuildContext context, int index) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => DetailsPage(
                  contentTypeId: _searchList[index].contentTypeId ?? 1,
                  id: _searchList[index].id ?? 1,
                  movieThumbnailUrl: '$kImageBaseUrl${_searchList[index].file}',
                  // movieName: _searchList[index].name ?? '',
                )));
  }

  // Widget _buildVideoListItemCard(SearchData videoSnippet) => Padding(
  //       padding: const EdgeInsets.all(8.0),
  //       child: Column(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: <Widget>[
  //           // AspectRatio(
  //           //   aspectRatio: 16 / 9,
  //           //   child: Image.network(
  //           //     videoSnippet.thumbnails.high.url,
  //           //     fit: BoxFit.cover,
  //           //   ),
  //           // ),
  //           // SizedBox(height: 5),
  //           Text(
  //             videoSnippet.name ?? '',
  //             maxLines: 1,
  //             overflow: TextOverflow.ellipsis,
  //             style: TextStyle(
  //               fontWeight: FontWeight.w500,
  //               fontSize: 14,
  //             ),
  //           ),
  //           SizedBox(height: 5),
  //           Text(
  //             videoSnippet.plot ?? '',
  //           ),
  //         ],
  //       ),
  //     );

  // Widget _buildLoaderListItem() {
  //   return Center(
  //     child: CircularProgressIndicator(),
  //   );
  // }

  Widget _movieGridItem(String imageVal) => ImageHelper(
      image: '$imageVal',
      imageType: ImageType.network,
      boxFit: BoxFit.fill,
      imageShape: ImageShape.roundedCorner,
      height: 200,
      width: 200);
}
