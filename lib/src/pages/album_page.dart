import 'package:flutter/material.dart';
import 'package:template/providers.dart';
import 'package:template/src/pages/detail_album_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final helloWorldProvider = Provider((_) => 'Hello world');

class AlbumPage extends ConsumerStatefulWidget {
  static const routeName = '/album';

  const AlbumPage({super.key});

  @override
  ConsumerState<AlbumPage> createState() => _AlbumPageState();
}

class _AlbumPageState extends ConsumerState<AlbumPage> {
  @override
  void initState() {
    super.initState();
    // futureAlbum = fetchAlbum();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    String titleValue = ref.watch(helloWorldProvider);
    final asyncValue = ref.watch(dataAlbumsProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(titleValue.toString()),
      ),
      body: Center(
        child: Consumer(builder: (context, watch, _) {
          return asyncValue.when(
            data: (data) {
              return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  final post = data[index];
                  return Container(
                    color: Colors.grey.shade300,
                    margin:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                    height: 100,
                    width: double.maxFinite,
                    child: ListTile(
                        trailing: const Icon(Icons.more_vert),
                        onTap: () => {
                              //   Navigator.of(context).push(
                              //   MaterialPageRoute(
                              //     builder: (context) => DetailsPage(itemId: post.id),
                              //   ),
                              // )
                              Navigator.pushNamed(context, '/details',
                                  arguments: DetailsArgs(post.id)),
                            },
                        title: Text(post.title)),
                    // Expanded(flex: 1, child: Text(post.id.toString())),
                    // Expanded(flex: 3, child: Text(post.title)),
                  );
                },
              );
            },
            loading: () => const CircularProgressIndicator(),
            error: (error, stackTrace) => Text('Error: $error'),
          );
        }),
        // child: FutureBuilder(
        //   future: futureAlbum,
        //   builder: (context, snapshot) {
        //     if (snapshot.connectionState == ConnectionState.waiting) {
        //       return const CircularProgressIndicator();
        //     } else if (snapshot.hasData) {
        //       final posts = snapshot.data!;
        //       // return Text('${snapshot.error}');
        //       return buildPosts(posts);
        //       // we have the data, do stuff here
        //     } else {
        //       return Text('${snapshot.error}');
        //     }
        //     // By default, show a loading spinner.
        //   },
        // ),
      ),
    );
  }
}
