import 'package:flutter/material.dart';
import 'package:template/album.dart';
import 'package:template/api_service.dart';

class DetailsPage extends StatefulWidget {
  static const routeName = '/details';
  const DetailsPage({super.key, required this.id});
  final int id;

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  late Future<Album> futureAlbum;

  // DetailsPage({required this.id});
  @override
  Widget build(BuildContext context) {
    futureAlbum = ApiService().getAlbum(widget.id);
    // Fetch and display details for the given item ID here.
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.id.toString()),
      ),
      body: Center(
        child: FutureBuilder<Album>(
          future: futureAlbum,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final album = snapshot.data!;
              return ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/second');
                    // Navigate back to first screen when tapped.
                  },
                  child: Text(album.title));
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            // By default, show a loading spinner.
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}

class DetailsArgs {
  const DetailsArgs(this.userId);
  final int userId;
}
