part of training_services;

abstract class MediaApiService {
  Future<List<MediaItem>> getItems();
  Future<List<MediaItem>> addItem({
    required MediaItemDTO mediaItemDTO,
  });
}

class MediaApiServiceImpl implements MediaApiService {
  final _baseUrl = TrainingConfig.instance!.values.baseDomain;

  @override
  Future<List<MediaItem>> getItems() async {
    final _mediaApiUrl = '$_baseUrl/b/B7IO';
    try {
      final _resp = await _networkUtil.getReq(_mediaApiUrl);

      return MediaItemResult.fromJson(_resp).data;
    } on FormatException {
      throw Failure(
        message: 'Bad response format.',
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<MediaItem>> addItem({required MediaItemDTO mediaItemDTO}) async {
    final _mediaApiUrl = '$_baseUrl/b/B7IO';
    try {
      final _resp = await _networkUtil.postReq(
        _mediaApiUrl,
        body: mediaItemDTO.toString(),
      );

      return MediaItemResult.fromJson(_resp).data;
    } on FormatException {
      throw Failure(
        message: 'Bad response format.',
      );
    } catch (e) {
      rethrow;
    }
  }
}
