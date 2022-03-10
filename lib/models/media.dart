part of training_models;

@freezed
class MediaItemDTO with _$MediaItemDTO {
  factory MediaItemDTO({
    required String name,
    required String slug,
  }) = _MediaItemDTO;

  factory MediaItemDTO.fromJson(Map<String, dynamic> json) =>
      _$MediaItemDTOFromJson(json);
}

@freezed
class MediaItemResult with _$MediaItemResult {
  factory MediaItemResult(
    List<MediaItem> data,
  ) = _MediaItemResult;

  factory MediaItemResult.fromJson(Map<String, dynamic> json) =>
      _$MediaItemResultFromJson(json);
}

@freezed
class MediaItem with _$MediaItem {
  factory MediaItem(
    String uuid,
    String name,
    String slug,
  ) = _MediaItem;

  factory MediaItem.fromJson(Map<String, dynamic> json) =>
      _$MediaItemFromJson(json);
}
