import 'package:template/album.dart';
import 'package:template/api_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers.g.dart';


// Membuat provider untuk ApiService dari file api_service.dart
// final apiServiceProvider = Provider<ApiService>((ref) {
// // Sesuaikan dengan URL API Anda
//   return ApiService();
// });

// final dataAlbumsProvider = FutureProvider<List<Album>>((ref) async {
//   final apiService = ref.read(apiServiceProvider);
//   return apiService.getAlbums();
// });


@riverpod
Future<List<Album>> dataAlbums(DataAlbumsRef ref) async {
  final api = ApiService();
  final ucoPrices = await api.getAlbums();
  return ucoPrices;
}