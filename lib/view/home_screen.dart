import 'package:flutter/material.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:machine/provider/image_provider.dart';
import 'package:machine/utils/constants.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../di_container.dart';
import '../model/response/image_response.dart';
import '../utils/colors.dart';
import '../widget/network_image_viewer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController = TextEditingController();
  SharedPreferences sp = sl();
  late AppImageProvider imageProvider;

  // List of all images returned by api
  List<AppImage> imageList = [];

  // List of loaded images
  List<AppImage> imageLoaded = [];

  // increment count for lazy loading
  final int increment = 5;

  int currentIndex = 0;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    imageProvider = Provider.of<AppImageProvider>(context, listen: false);
  }

  // method to get all images while clicking on search button
  loadImages(String searchKey) async {
    imageList.clear();
    imageLoaded.clear();
    currentIndex = 0;

    // store search key to shared preference to pass to api
    sp.setString(Constants.spSearchKey, searchKey);

    // get all images
    imageList = await imageProvider.getImages();

    _loadMoreImages();
    setState(() {});
  }

  // method to load images to lazy loading list view
  Future _loadMoreImages() async {
    setState(() {
      isLoading = true;
    });

    await Future.delayed(const Duration(seconds: 1));
    int limit = currentIndex + increment;

    if (currentIndex + increment > imageList.length) {
      limit = imageList.length;
    }

    //loading images to lazy loading list view
    for (int i = currentIndex; i < limit; i++) {
      imageLoaded.add(imageList[i]);
    }
    currentIndex = currentIndex + increment;
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          SizedBox(height: 80, child: searchBox(searchController)),
          imageList.isEmpty
              ? SizedBox(
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  child: const Center(child: Text("Search something..")),
                )
              : Expanded(
                  flex: 8,
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: LazyLoadScrollView(
                      isLoading: isLoading,
                      onEndOfPage: () => _loadMoreImages(),
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: imageLoaded.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(10),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              semanticContainer: true,
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              elevation: 20,
                              color: Colors.black,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => NetworkImageViewer(
                                        title:
                                            imageLoaded[index].id!.toString(),
                                        imageProvider: NetworkImage(
                                          imageLoaded[index].previewURL!,
                                        ),
                                        loadingBuilder: (context, event) {
                                          if (event == null) {
                                            return Container(
                                              color: Colors.transparent,
                                              child: const Center(
                                                child: Text(
                                                  "0%",
                                                  style: TextStyle(
                                                      color: whiteColor),
                                                ),
                                              ),
                                            );
                                          }

                                          final value = event
                                                  .cumulativeBytesLoaded /
                                              (event.expectedTotalBytes ??
                                                  event.cumulativeBytesLoaded);

                                          final percentage =
                                              (100 * value).floor();
                                          return Container(
                                              color: blackColor,
                                              child: Center(
                                                child: Text(
                                                  "$percentage%",
                                                  style: const TextStyle(
                                                      color: whiteColor),
                                                ),
                                              ));
                                        },
                                      ),
                                    ),
                                  );
                                },
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 200,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      fit: BoxFit.fitWidth,
                                      image: NetworkImage(
                                          imageLoaded[index].previewURL!),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget searchBox(TextEditingController controller) {
    return Container(
      color: backgroundColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          child: ListTile(
            title: TextField(
              autofocus: false,
              controller: controller,
              decoration: const InputDecoration(
                  hintText: "Search", border: InputBorder.none),
            ),
            trailing: IconButton(
              icon: const Icon(
                Icons.search,
                color: primaryTheme,
              ),
              onPressed: () {
                if (searchController.text.isNotEmpty) {
                  loadImages(searchController.text.toString());
                  // controller.clear();
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
