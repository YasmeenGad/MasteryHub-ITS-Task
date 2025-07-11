import 'package:json_annotation/json_annotation.dart';

part 'get_books_response_dto.g.dart';

@JsonSerializable()
class GetBooksResponseDto {
  final String? kind;
  final int? totalItems;
  final List<GetBooksResponseDtoItems?>? items;

  GetBooksResponseDto(this.kind, this.totalItems, this.items);

  factory GetBooksResponseDto.fromJson(Map<String, dynamic> json) =>
      _$GetBooksResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$GetBooksResponseDtoToJson(this);
}

@JsonSerializable()
class GetBooksResponseDtoItems {
  final String? kind;
  final String? id;
  final String? etag;
  final String? selfLink;
  final GetBooksResponseDtoItemsVolumeInfo? volumeInfo;
  final GetBooksResponseDtoItemsSaleInfo? saleInfo;
  final GetBooksResponseDtoItemsAccessInfo? accessInfo;
  final GetBooksResponseDtoItemsSearchInfo? searchInfo;

  GetBooksResponseDtoItems(this.kind, this.id, this.etag, this.selfLink,
      this.volumeInfo, this.saleInfo, this.accessInfo, this.searchInfo);

  factory GetBooksResponseDtoItems.fromJson(Map<String, dynamic> json) =>
      _$GetBooksResponseDtoItemsFromJson(json);

  Map<String, dynamic> toJson() => _$GetBooksResponseDtoItemsToJson(this);
}

@JsonSerializable()
class GetBooksResponseDtoItemsVolumeInfo {
  final String? title;
  final List<String?>? authors;
  final String? publisher;
  final String? publishedDate;
  final String? description;
  final List<GetBooksResponseDtoItemsVolumeInfoIndustryIdentifiers?>?
  industryIdentifiers;
  final GetBooksResponseDtoItemsVolumeInfoReadingModes? readingModes;
  final int? pageCount;
  final String? printType;
  final List<String?>? categories;
  final String? maturityRating;
  final bool? allowAnonLogging;
  final String? contentVersion;
  final GetBooksResponseDtoItemsVolumeInfoPanelizationSummary?
  panelizationSummary;
  final GetBooksResponseDtoItemsVolumeInfoImageLinks? imageLinks;
  final String? language;
  final String? previewLink;
  final String? infoLink;
  final String? canonicalVolumeLink;

  GetBooksResponseDtoItemsVolumeInfo(
      this.title,
      this.authors,
      this.publisher,
      this.publishedDate,
      this.description,
      this.industryIdentifiers,
      this.readingModes,
      this.pageCount,
      this.printType,
      this.categories,
      this.maturityRating,
      this.allowAnonLogging,
      this.contentVersion,
      this.panelizationSummary,
      this.imageLinks,
      this.language,
      this.previewLink,
      this.infoLink,
      this.canonicalVolumeLink);

  factory GetBooksResponseDtoItemsVolumeInfo.fromJson(
      Map<String, dynamic> json) =>
      _$GetBooksResponseDtoItemsVolumeInfoFromJson(json);

  Map<String, dynamic> toJson() =>
      _$GetBooksResponseDtoItemsVolumeInfoToJson(this);
}

@JsonSerializable()
class GetBooksResponseDtoItemsVolumeInfoIndustryIdentifiers {
  final String? type;
  final String? identifier;

  GetBooksResponseDtoItemsVolumeInfoIndustryIdentifiers(this.type,
      this.identifier);

  factory GetBooksResponseDtoItemsVolumeInfoIndustryIdentifiers.fromJson(
      Map<String, dynamic> json) =>
      _$GetBooksResponseDtoItemsVolumeInfoIndustryIdentifiersFromJson(json);

  Map<String, dynamic> toJson() =>
      _$GetBooksResponseDtoItemsVolumeInfoIndustryIdentifiersToJson(this);
}

@JsonSerializable()
class GetBooksResponseDtoItemsVolumeInfoReadingModes {
  final bool? text;
  final bool? image;

  GetBooksResponseDtoItemsVolumeInfoReadingModes(this.text, this.image);

  factory GetBooksResponseDtoItemsVolumeInfoReadingModes.fromJson(
      Map<String, dynamic> json) =>
      _$GetBooksResponseDtoItemsVolumeInfoReadingModesFromJson(json);

  Map<String, dynamic> toJson() =>
      _$GetBooksResponseDtoItemsVolumeInfoReadingModesToJson(this);
}

@JsonSerializable()
class GetBooksResponseDtoItemsVolumeInfoPanelizationSummary {
  final bool? containsEpubBubbles;
  final bool? containsImageBubbles;

  GetBooksResponseDtoItemsVolumeInfoPanelizationSummary(
      this.containsEpubBubbles, this.containsImageBubbles);

  factory GetBooksResponseDtoItemsVolumeInfoPanelizationSummary.fromJson(
      Map<String, dynamic> json) =>
      _$GetBooksResponseDtoItemsVolumeInfoPanelizationSummaryFromJson(json);

  Map<String, dynamic> toJson() =>
      _$GetBooksResponseDtoItemsVolumeInfoPanelizationSummaryToJson(this);
}

@JsonSerializable()
class GetBooksResponseDtoItemsVolumeInfoImageLinks {
  final String? smallThumbnail;
  final String? thumbnail;

  GetBooksResponseDtoItemsVolumeInfoImageLinks(this.smallThumbnail,
      this.thumbnail);

  factory GetBooksResponseDtoItemsVolumeInfoImageLinks.fromJson(
      Map<String, dynamic> json) =>
      _$GetBooksResponseDtoItemsVolumeInfoImageLinksFromJson(json);

  Map<String, dynamic> toJson() =>
      _$GetBooksResponseDtoItemsVolumeInfoImageLinksToJson(this);
}

@JsonSerializable()
class GetBooksResponseDtoItemsSaleInfo {
  final String? country;
  final String? saleability;
  final bool? isEbook;

  GetBooksResponseDtoItemsSaleInfo(this.country, this.saleability,
      this.isEbook);

  factory GetBooksResponseDtoItemsSaleInfo.fromJson(
      Map<String, dynamic> json) =>
      _$GetBooksResponseDtoItemsSaleInfoFromJson(json);

  Map<String, dynamic> toJson() =>
      _$GetBooksResponseDtoItemsSaleInfoToJson(this);
}

@JsonSerializable()
class GetBooksResponseDtoItemsAccessInfo {
  final String? country;
  final String? viewability;
  final bool? embeddable;
  final bool? publicDomain;
  final String? textToSpeechPermission;
  final GetBooksResponseDtoItemsAccessInfoEpub? epub;
  final GetBooksResponseDtoItemsAccessInfoPdf? pdf;
  final String? webReaderLink;
  final String? accessViewStatus;
  final bool? quoteSharingAllowed;

  GetBooksResponseDtoItemsAccessInfo(this.country,
      this.viewability,
      this.embeddable,
      this.publicDomain,
      this.textToSpeechPermission,
      this.epub,
      this.pdf,
      this.webReaderLink,
      this.accessViewStatus,
      this.quoteSharingAllowed);

  factory GetBooksResponseDtoItemsAccessInfo.fromJson(
      Map<String, dynamic> json) =>
      _$GetBooksResponseDtoItemsAccessInfoFromJson(json);

  Map<String, dynamic> toJson() =>
      _$GetBooksResponseDtoItemsAccessInfoToJson(this);
}

@JsonSerializable()
class GetBooksResponseDtoItemsAccessInfoEpub {
  final bool? isAvailable;

  GetBooksResponseDtoItemsAccessInfoEpub(this.isAvailable);

  factory GetBooksResponseDtoItemsAccessInfoEpub.fromJson(
      Map<String, dynamic> json) =>
      _$GetBooksResponseDtoItemsAccessInfoEpubFromJson(json);

  Map<String, dynamic> toJson() =>
      _$GetBooksResponseDtoItemsAccessInfoEpubToJson(this);
}

@JsonSerializable()
class GetBooksResponseDtoItemsAccessInfoPdf {
  final bool? isAvailable;
  final String? acsTokenLink;

  GetBooksResponseDtoItemsAccessInfoPdf(this.isAvailable, this.acsTokenLink);

  factory GetBooksResponseDtoItemsAccessInfoPdf.fromJson(
      Map<String, dynamic> json) =>
      _$GetBooksResponseDtoItemsAccessInfoPdfFromJson(json);

  Map<String, dynamic> toJson() =>
      _$GetBooksResponseDtoItemsAccessInfoPdfToJson(this);
}

@JsonSerializable()
class GetBooksResponseDtoItemsSearchInfo {
  final String? textSnippet;

  GetBooksResponseDtoItemsSearchInfo(this.textSnippet);

  factory GetBooksResponseDtoItemsSearchInfo.fromJson(
      Map<String, dynamic> json) =>
      _$GetBooksResponseDtoItemsSearchInfoFromJson(json);

  Map<String, dynamic> toJson() =>
      _$GetBooksResponseDtoItemsSearchInfoToJson(this);
}
