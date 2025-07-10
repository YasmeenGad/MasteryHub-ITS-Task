import 'package:json_annotation/json_annotation.dart';

part 'search_response_dto.g.dart';

@JsonSerializable()
class SearchResponseDto {
  final String? kind;
  final int? totalItems;
  final List<SearchResponseDtoItems?>? items;

  SearchResponseDto(this.kind, this.totalItems, this.items);

  factory SearchResponseDto.fromJson(Map<String, dynamic> json) =>
      _$SearchResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SearchResponseDtoToJson(this);
}

@JsonSerializable()
class SearchResponseDtoItems {
  final String? kind;
  final String? id;
  final String? etag;
  final String? selfLink;
  final SearchResponseDtoItemsVolumeInfo? volumeInfo;
  final SearchResponseDtoItemsSaleInfo? saleInfo;
  final SearchResponseDtoItemsAccessInfo? accessInfo;
  final SearchResponseDtoItemsSearchInfo? searchInfo;

  SearchResponseDtoItems(this.kind, this.id, this.etag, this.selfLink,
      this.volumeInfo, this.saleInfo, this.accessInfo, this.searchInfo);

  factory SearchResponseDtoItems.fromJson(Map<String, dynamic> json) =>
      _$SearchResponseDtoItemsFromJson(json);

  Map<String, dynamic> toJson() => _$SearchResponseDtoItemsToJson(this);
}

@JsonSerializable()
class SearchResponseDtoItemsVolumeInfo {
  final String? title;
  final String? publishedDate;
  final List<SearchResponseDtoItemsVolumeInfoIndustryIdentifiers?>?
      industryIdentifiers;
  final SearchResponseDtoItemsVolumeInfoReadingModes? readingModes;
  final int? pageCount;
  final String? printType;
  final String? maturityRating;
  final bool? allowAnonLogging;
  final String? contentVersion;
  final SearchResponseDtoItemsVolumeInfoPanelizationSummary?
      panelizationSummary;
  final SearchResponseDtoItemsVolumeInfoImageLinks? imageLinks;
  final String? language;
  final String? previewLink;
  final String? infoLink;
  final String? canonicalVolumeLink;

  SearchResponseDtoItemsVolumeInfo(
      this.title,
      this.publishedDate,
      this.industryIdentifiers,
      this.readingModes,
      this.pageCount,
      this.printType,
      this.maturityRating,
      this.allowAnonLogging,
      this.contentVersion,
      this.panelizationSummary,
      this.imageLinks,
      this.language,
      this.previewLink,
      this.infoLink,
      this.canonicalVolumeLink);

  factory SearchResponseDtoItemsVolumeInfo.fromJson(
          Map<String, dynamic> json) =>
      _$SearchResponseDtoItemsVolumeInfoFromJson(json);

  Map<String, dynamic> toJson() =>
      _$SearchResponseDtoItemsVolumeInfoToJson(this);
}

@JsonSerializable()
class SearchResponseDtoItemsVolumeInfoIndustryIdentifiers {
  final String? type;
  final String? identifier;

  SearchResponseDtoItemsVolumeInfoIndustryIdentifiers(
      this.type, this.identifier);

  factory SearchResponseDtoItemsVolumeInfoIndustryIdentifiers.fromJson(
          Map<String, dynamic> json) =>
      _$SearchResponseDtoItemsVolumeInfoIndustryIdentifiersFromJson(json);

  Map<String, dynamic> toJson() =>
      _$SearchResponseDtoItemsVolumeInfoIndustryIdentifiersToJson(this);
}

@JsonSerializable()
class SearchResponseDtoItemsVolumeInfoReadingModes {
  final bool? text;
  final bool? image;

  SearchResponseDtoItemsVolumeInfoReadingModes(this.text, this.image);

  factory SearchResponseDtoItemsVolumeInfoReadingModes.fromJson(
          Map<String, dynamic> json) =>
      _$SearchResponseDtoItemsVolumeInfoReadingModesFromJson(json);

  Map<String, dynamic> toJson() =>
      _$SearchResponseDtoItemsVolumeInfoReadingModesToJson(this);
}

@JsonSerializable()
class SearchResponseDtoItemsVolumeInfoPanelizationSummary {
  final bool? containsEpubBubbles;
  final bool? containsImageBubbles;

  SearchResponseDtoItemsVolumeInfoPanelizationSummary(
      this.containsEpubBubbles, this.containsImageBubbles);

  factory SearchResponseDtoItemsVolumeInfoPanelizationSummary.fromJson(
          Map<String, dynamic> json) =>
      _$SearchResponseDtoItemsVolumeInfoPanelizationSummaryFromJson(json);

  Map<String, dynamic> toJson() =>
      _$SearchResponseDtoItemsVolumeInfoPanelizationSummaryToJson(this);
}

@JsonSerializable()
class SearchResponseDtoItemsVolumeInfoImageLinks {
  final String? smallThumbnail;
  final String? thumbnail;

  SearchResponseDtoItemsVolumeInfoImageLinks(
      this.smallThumbnail, this.thumbnail);

  factory SearchResponseDtoItemsVolumeInfoImageLinks.fromJson(
          Map<String, dynamic> json) =>
      _$SearchResponseDtoItemsVolumeInfoImageLinksFromJson(json);

  Map<String, dynamic> toJson() =>
      _$SearchResponseDtoItemsVolumeInfoImageLinksToJson(this);
}

@JsonSerializable()
class SearchResponseDtoItemsSaleInfo {
  final String? country;
  final String? saleability;
  final bool? isEbook;
  final String? buyLink;

  SearchResponseDtoItemsSaleInfo(
      this.country, this.saleability, this.isEbook, this.buyLink);

  factory SearchResponseDtoItemsSaleInfo.fromJson(Map<String, dynamic> json) =>
      _$SearchResponseDtoItemsSaleInfoFromJson(json);

  Map<String, dynamic> toJson() => _$SearchResponseDtoItemsSaleInfoToJson(this);
}

@JsonSerializable()
class SearchResponseDtoItemsAccessInfo {
  final String? country;
  final String? viewability;
  final bool? embeddable;
  final bool? publicDomain;
  final String? textToSpeechPermission;
  final SearchResponseDtoItemsAccessInfoEpub? epub;
  final SearchResponseDtoItemsAccessInfoPdf? pdf;
  final String? webReaderLink;
  final String? accessViewStatus;
  final bool? quoteSharingAllowed;

  SearchResponseDtoItemsAccessInfo(
      this.country,
      this.viewability,
      this.embeddable,
      this.publicDomain,
      this.textToSpeechPermission,
      this.epub,
      this.pdf,
      this.webReaderLink,
      this.accessViewStatus,
      this.quoteSharingAllowed);

  factory SearchResponseDtoItemsAccessInfo.fromJson(
          Map<String, dynamic> json) =>
      _$SearchResponseDtoItemsAccessInfoFromJson(json);

  Map<String, dynamic> toJson() =>
      _$SearchResponseDtoItemsAccessInfoToJson(this);
}

@JsonSerializable()
class SearchResponseDtoItemsAccessInfoEpub {
  final bool? isAvailable;
  final String? downloadLink;

  SearchResponseDtoItemsAccessInfoEpub(this.isAvailable, this.downloadLink);

  factory SearchResponseDtoItemsAccessInfoEpub.fromJson(
          Map<String, dynamic> json) =>
      _$SearchResponseDtoItemsAccessInfoEpubFromJson(json);

  Map<String, dynamic> toJson() =>
      _$SearchResponseDtoItemsAccessInfoEpubToJson(this);
}

@JsonSerializable()
class SearchResponseDtoItemsAccessInfoPdf {
  final bool? isAvailable;

  SearchResponseDtoItemsAccessInfoPdf(this.isAvailable);

  factory SearchResponseDtoItemsAccessInfoPdf.fromJson(
          Map<String, dynamic> json) =>
      _$SearchResponseDtoItemsAccessInfoPdfFromJson(json);

  Map<String, dynamic> toJson() =>
      _$SearchResponseDtoItemsAccessInfoPdfToJson(this);
}

@JsonSerializable()
class SearchResponseDtoItemsSearchInfo {
  final String? textSnippet;

  SearchResponseDtoItemsSearchInfo(this.textSnippet);

  factory SearchResponseDtoItemsSearchInfo.fromJson(
          Map<String, dynamic> json) =>
      _$SearchResponseDtoItemsSearchInfoFromJson(json);

  Map<String, dynamic> toJson() =>
      _$SearchResponseDtoItemsSearchInfoToJson(this);
}
