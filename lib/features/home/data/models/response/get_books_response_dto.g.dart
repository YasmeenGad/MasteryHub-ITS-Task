// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_books_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetBooksResponseDto _$GetBooksResponseDtoFromJson(Map<String, dynamic> json) =>
    GetBooksResponseDto(
      json['kind'] as String?,
      (json['totalItems'] as num?)?.toInt(),
      (json['items'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : GetBooksResponseDtoItems.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetBooksResponseDtoToJson(
        GetBooksResponseDto instance) =>
    <String, dynamic>{
      'kind': instance.kind,
      'totalItems': instance.totalItems,
      'items': instance.items,
    };

GetBooksResponseDtoItems _$GetBooksResponseDtoItemsFromJson(
        Map<String, dynamic> json) =>
    GetBooksResponseDtoItems(
      json['kind'] as String?,
      json['id'] as String?,
      json['etag'] as String?,
      json['selfLink'] as String?,
      json['volumeInfo'] == null
          ? null
          : GetBooksResponseDtoItemsVolumeInfo.fromJson(
              json['volumeInfo'] as Map<String, dynamic>),
      json['saleInfo'] == null
          ? null
          : GetBooksResponseDtoItemsSaleInfo.fromJson(
              json['saleInfo'] as Map<String, dynamic>),
      json['accessInfo'] == null
          ? null
          : GetBooksResponseDtoItemsAccessInfo.fromJson(
              json['accessInfo'] as Map<String, dynamic>),
      json['searchInfo'] == null
          ? null
          : GetBooksResponseDtoItemsSearchInfo.fromJson(
              json['searchInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetBooksResponseDtoItemsToJson(
        GetBooksResponseDtoItems instance) =>
    <String, dynamic>{
      'kind': instance.kind,
      'id': instance.id,
      'etag': instance.etag,
      'selfLink': instance.selfLink,
      'volumeInfo': instance.volumeInfo,
      'saleInfo': instance.saleInfo,
      'accessInfo': instance.accessInfo,
      'searchInfo': instance.searchInfo,
    };

GetBooksResponseDtoItemsVolumeInfo _$GetBooksResponseDtoItemsVolumeInfoFromJson(
        Map<String, dynamic> json) =>
    GetBooksResponseDtoItemsVolumeInfo(
      json['title'] as String?,
      (json['authors'] as List<dynamic>?)?.map((e) => e as String?).toList(),
      json['publisher'] as String?,
      json['publishedDate'] as String?,
      json['description'] as String?,
      (json['industryIdentifiers'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : GetBooksResponseDtoItemsVolumeInfoIndustryIdentifiers.fromJson(
                  e as Map<String, dynamic>))
          .toList(),
      json['readingModes'] == null
          ? null
          : GetBooksResponseDtoItemsVolumeInfoReadingModes.fromJson(
              json['readingModes'] as Map<String, dynamic>),
      (json['pageCount'] as num?)?.toInt(),
      json['printType'] as String?,
      (json['categories'] as List<dynamic>?)?.map((e) => e as String?).toList(),
      json['maturityRating'] as String?,
      json['allowAnonLogging'] as bool?,
      json['contentVersion'] as String?,
      json['panelizationSummary'] == null
          ? null
          : GetBooksResponseDtoItemsVolumeInfoPanelizationSummary.fromJson(
              json['panelizationSummary'] as Map<String, dynamic>),
      json['imageLinks'] == null
          ? null
          : GetBooksResponseDtoItemsVolumeInfoImageLinks.fromJson(
              json['imageLinks'] as Map<String, dynamic>),
      json['language'] as String?,
      json['previewLink'] as String?,
      json['infoLink'] as String?,
      json['canonicalVolumeLink'] as String?,
    );

Map<String, dynamic> _$GetBooksResponseDtoItemsVolumeInfoToJson(
        GetBooksResponseDtoItemsVolumeInfo instance) =>
    <String, dynamic>{
      'title': instance.title,
      'authors': instance.authors,
      'publisher': instance.publisher,
      'publishedDate': instance.publishedDate,
      'description': instance.description,
      'industryIdentifiers': instance.industryIdentifiers,
      'readingModes': instance.readingModes,
      'pageCount': instance.pageCount,
      'printType': instance.printType,
      'categories': instance.categories,
      'maturityRating': instance.maturityRating,
      'allowAnonLogging': instance.allowAnonLogging,
      'contentVersion': instance.contentVersion,
      'panelizationSummary': instance.panelizationSummary,
      'imageLinks': instance.imageLinks,
      'language': instance.language,
      'previewLink': instance.previewLink,
      'infoLink': instance.infoLink,
      'canonicalVolumeLink': instance.canonicalVolumeLink,
    };

GetBooksResponseDtoItemsVolumeInfoIndustryIdentifiers
    _$GetBooksResponseDtoItemsVolumeInfoIndustryIdentifiersFromJson(
            Map<String, dynamic> json) =>
        GetBooksResponseDtoItemsVolumeInfoIndustryIdentifiers(
          json['type'] as String?,
          json['identifier'] as String?,
        );

Map<String, dynamic>
    _$GetBooksResponseDtoItemsVolumeInfoIndustryIdentifiersToJson(
            GetBooksResponseDtoItemsVolumeInfoIndustryIdentifiers instance) =>
        <String, dynamic>{
          'type': instance.type,
          'identifier': instance.identifier,
        };

GetBooksResponseDtoItemsVolumeInfoReadingModes
    _$GetBooksResponseDtoItemsVolumeInfoReadingModesFromJson(
            Map<String, dynamic> json) =>
        GetBooksResponseDtoItemsVolumeInfoReadingModes(
          json['text'] as bool?,
          json['image'] as bool?,
        );

Map<String, dynamic> _$GetBooksResponseDtoItemsVolumeInfoReadingModesToJson(
        GetBooksResponseDtoItemsVolumeInfoReadingModes instance) =>
    <String, dynamic>{
      'text': instance.text,
      'image': instance.image,
    };

GetBooksResponseDtoItemsVolumeInfoPanelizationSummary
    _$GetBooksResponseDtoItemsVolumeInfoPanelizationSummaryFromJson(
            Map<String, dynamic> json) =>
        GetBooksResponseDtoItemsVolumeInfoPanelizationSummary(
          json['containsEpubBubbles'] as bool?,
          json['containsImageBubbles'] as bool?,
        );

Map<String, dynamic>
    _$GetBooksResponseDtoItemsVolumeInfoPanelizationSummaryToJson(
            GetBooksResponseDtoItemsVolumeInfoPanelizationSummary instance) =>
        <String, dynamic>{
          'containsEpubBubbles': instance.containsEpubBubbles,
          'containsImageBubbles': instance.containsImageBubbles,
        };

GetBooksResponseDtoItemsVolumeInfoImageLinks
    _$GetBooksResponseDtoItemsVolumeInfoImageLinksFromJson(
            Map<String, dynamic> json) =>
        GetBooksResponseDtoItemsVolumeInfoImageLinks(
          json['smallThumbnail'] as String?,
          json['thumbnail'] as String?,
        );

Map<String, dynamic> _$GetBooksResponseDtoItemsVolumeInfoImageLinksToJson(
        GetBooksResponseDtoItemsVolumeInfoImageLinks instance) =>
    <String, dynamic>{
      'smallThumbnail': instance.smallThumbnail,
      'thumbnail': instance.thumbnail,
    };

GetBooksResponseDtoItemsSaleInfo _$GetBooksResponseDtoItemsSaleInfoFromJson(
        Map<String, dynamic> json) =>
    GetBooksResponseDtoItemsSaleInfo(
      json['country'] as String?,
      json['saleability'] as String?,
      json['isEbook'] as bool?,
    );

Map<String, dynamic> _$GetBooksResponseDtoItemsSaleInfoToJson(
        GetBooksResponseDtoItemsSaleInfo instance) =>
    <String, dynamic>{
      'country': instance.country,
      'saleability': instance.saleability,
      'isEbook': instance.isEbook,
    };

GetBooksResponseDtoItemsAccessInfo _$GetBooksResponseDtoItemsAccessInfoFromJson(
        Map<String, dynamic> json) =>
    GetBooksResponseDtoItemsAccessInfo(
      json['country'] as String?,
      json['viewability'] as String?,
      json['embeddable'] as bool?,
      json['publicDomain'] as bool?,
      json['textToSpeechPermission'] as String?,
      json['epub'] == null
          ? null
          : GetBooksResponseDtoItemsAccessInfoEpub.fromJson(
              json['epub'] as Map<String, dynamic>),
      json['pdf'] == null
          ? null
          : GetBooksResponseDtoItemsAccessInfoPdf.fromJson(
              json['pdf'] as Map<String, dynamic>),
      json['webReaderLink'] as String?,
      json['accessViewStatus'] as String?,
      json['quoteSharingAllowed'] as bool?,
    );

Map<String, dynamic> _$GetBooksResponseDtoItemsAccessInfoToJson(
        GetBooksResponseDtoItemsAccessInfo instance) =>
    <String, dynamic>{
      'country': instance.country,
      'viewability': instance.viewability,
      'embeddable': instance.embeddable,
      'publicDomain': instance.publicDomain,
      'textToSpeechPermission': instance.textToSpeechPermission,
      'epub': instance.epub,
      'pdf': instance.pdf,
      'webReaderLink': instance.webReaderLink,
      'accessViewStatus': instance.accessViewStatus,
      'quoteSharingAllowed': instance.quoteSharingAllowed,
    };

GetBooksResponseDtoItemsAccessInfoEpub
    _$GetBooksResponseDtoItemsAccessInfoEpubFromJson(
            Map<String, dynamic> json) =>
        GetBooksResponseDtoItemsAccessInfoEpub(
          json['isAvailable'] as bool?,
        );

Map<String, dynamic> _$GetBooksResponseDtoItemsAccessInfoEpubToJson(
        GetBooksResponseDtoItemsAccessInfoEpub instance) =>
    <String, dynamic>{
      'isAvailable': instance.isAvailable,
    };

GetBooksResponseDtoItemsAccessInfoPdf
    _$GetBooksResponseDtoItemsAccessInfoPdfFromJson(
            Map<String, dynamic> json) =>
        GetBooksResponseDtoItemsAccessInfoPdf(
          json['isAvailable'] as bool?,
          json['acsTokenLink'] as String?,
        );

Map<String, dynamic> _$GetBooksResponseDtoItemsAccessInfoPdfToJson(
        GetBooksResponseDtoItemsAccessInfoPdf instance) =>
    <String, dynamic>{
      'isAvailable': instance.isAvailable,
      'acsTokenLink': instance.acsTokenLink,
    };

GetBooksResponseDtoItemsSearchInfo _$GetBooksResponseDtoItemsSearchInfoFromJson(
        Map<String, dynamic> json) =>
    GetBooksResponseDtoItemsSearchInfo(
      json['textSnippet'] as String?,
    );

Map<String, dynamic> _$GetBooksResponseDtoItemsSearchInfoToJson(
        GetBooksResponseDtoItemsSearchInfo instance) =>
    <String, dynamic>{
      'textSnippet': instance.textSnippet,
    };
