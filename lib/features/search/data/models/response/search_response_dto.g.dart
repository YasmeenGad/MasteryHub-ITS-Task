// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchResponseDto _$SearchResponseDtoFromJson(Map<String, dynamic> json) =>
    SearchResponseDto(
      json['kind'] as String?,
      (json['totalItems'] as num?)?.toInt(),
      (json['items'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : SearchResponseDtoItems.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SearchResponseDtoToJson(SearchResponseDto instance) =>
    <String, dynamic>{
      'kind': instance.kind,
      'totalItems': instance.totalItems,
      'items': instance.items,
    };

SearchResponseDtoItems _$SearchResponseDtoItemsFromJson(
        Map<String, dynamic> json) =>
    SearchResponseDtoItems(
      json['kind'] as String?,
      json['id'] as String?,
      json['etag'] as String?,
      json['selfLink'] as String?,
      json['volumeInfo'] == null
          ? null
          : SearchResponseDtoItemsVolumeInfo.fromJson(
              json['volumeInfo'] as Map<String, dynamic>),
      json['saleInfo'] == null
          ? null
          : SearchResponseDtoItemsSaleInfo.fromJson(
              json['saleInfo'] as Map<String, dynamic>),
      json['accessInfo'] == null
          ? null
          : SearchResponseDtoItemsAccessInfo.fromJson(
              json['accessInfo'] as Map<String, dynamic>),
      json['searchInfo'] == null
          ? null
          : SearchResponseDtoItemsSearchInfo.fromJson(
              json['searchInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SearchResponseDtoItemsToJson(
        SearchResponseDtoItems instance) =>
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

SearchResponseDtoItemsVolumeInfo _$SearchResponseDtoItemsVolumeInfoFromJson(
        Map<String, dynamic> json) =>
    SearchResponseDtoItemsVolumeInfo(
      json['title'] as String?,
      json['publishedDate'] as String?,
      (json['industryIdentifiers'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : SearchResponseDtoItemsVolumeInfoIndustryIdentifiers.fromJson(
                  e as Map<String, dynamic>))
          .toList(),
      json['readingModes'] == null
          ? null
          : SearchResponseDtoItemsVolumeInfoReadingModes.fromJson(
              json['readingModes'] as Map<String, dynamic>),
      (json['pageCount'] as num?)?.toInt(),
      json['printType'] as String?,
      json['maturityRating'] as String?,
      json['allowAnonLogging'] as bool?,
      json['contentVersion'] as String?,
      json['panelizationSummary'] == null
          ? null
          : SearchResponseDtoItemsVolumeInfoPanelizationSummary.fromJson(
              json['panelizationSummary'] as Map<String, dynamic>),
      json['imageLinks'] == null
          ? null
          : SearchResponseDtoItemsVolumeInfoImageLinks.fromJson(
              json['imageLinks'] as Map<String, dynamic>),
      json['language'] as String?,
      json['previewLink'] as String?,
      json['infoLink'] as String?,
      json['canonicalVolumeLink'] as String?,
    );

Map<String, dynamic> _$SearchResponseDtoItemsVolumeInfoToJson(
        SearchResponseDtoItemsVolumeInfo instance) =>
    <String, dynamic>{
      'title': instance.title,
      'publishedDate': instance.publishedDate,
      'industryIdentifiers': instance.industryIdentifiers,
      'readingModes': instance.readingModes,
      'pageCount': instance.pageCount,
      'printType': instance.printType,
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

SearchResponseDtoItemsVolumeInfoIndustryIdentifiers
    _$SearchResponseDtoItemsVolumeInfoIndustryIdentifiersFromJson(
            Map<String, dynamic> json) =>
        SearchResponseDtoItemsVolumeInfoIndustryIdentifiers(
          json['type'] as String?,
          json['identifier'] as String?,
        );

Map<String, dynamic>
    _$SearchResponseDtoItemsVolumeInfoIndustryIdentifiersToJson(
            SearchResponseDtoItemsVolumeInfoIndustryIdentifiers instance) =>
        <String, dynamic>{
          'type': instance.type,
          'identifier': instance.identifier,
        };

SearchResponseDtoItemsVolumeInfoReadingModes
    _$SearchResponseDtoItemsVolumeInfoReadingModesFromJson(
            Map<String, dynamic> json) =>
        SearchResponseDtoItemsVolumeInfoReadingModes(
          json['text'] as bool?,
          json['image'] as bool?,
        );

Map<String, dynamic> _$SearchResponseDtoItemsVolumeInfoReadingModesToJson(
        SearchResponseDtoItemsVolumeInfoReadingModes instance) =>
    <String, dynamic>{
      'text': instance.text,
      'image': instance.image,
    };

SearchResponseDtoItemsVolumeInfoPanelizationSummary
    _$SearchResponseDtoItemsVolumeInfoPanelizationSummaryFromJson(
            Map<String, dynamic> json) =>
        SearchResponseDtoItemsVolumeInfoPanelizationSummary(
          json['containsEpubBubbles'] as bool?,
          json['containsImageBubbles'] as bool?,
        );

Map<String, dynamic>
    _$SearchResponseDtoItemsVolumeInfoPanelizationSummaryToJson(
            SearchResponseDtoItemsVolumeInfoPanelizationSummary instance) =>
        <String, dynamic>{
          'containsEpubBubbles': instance.containsEpubBubbles,
          'containsImageBubbles': instance.containsImageBubbles,
        };

SearchResponseDtoItemsVolumeInfoImageLinks
    _$SearchResponseDtoItemsVolumeInfoImageLinksFromJson(
            Map<String, dynamic> json) =>
        SearchResponseDtoItemsVolumeInfoImageLinks(
          json['smallThumbnail'] as String?,
          json['thumbnail'] as String?,
        );

Map<String, dynamic> _$SearchResponseDtoItemsVolumeInfoImageLinksToJson(
        SearchResponseDtoItemsVolumeInfoImageLinks instance) =>
    <String, dynamic>{
      'smallThumbnail': instance.smallThumbnail,
      'thumbnail': instance.thumbnail,
    };

SearchResponseDtoItemsSaleInfo _$SearchResponseDtoItemsSaleInfoFromJson(
        Map<String, dynamic> json) =>
    SearchResponseDtoItemsSaleInfo(
      json['country'] as String?,
      json['saleability'] as String?,
      json['isEbook'] as bool?,
      json['buyLink'] as String?,
    );

Map<String, dynamic> _$SearchResponseDtoItemsSaleInfoToJson(
        SearchResponseDtoItemsSaleInfo instance) =>
    <String, dynamic>{
      'country': instance.country,
      'saleability': instance.saleability,
      'isEbook': instance.isEbook,
      'buyLink': instance.buyLink,
    };

SearchResponseDtoItemsAccessInfo _$SearchResponseDtoItemsAccessInfoFromJson(
        Map<String, dynamic> json) =>
    SearchResponseDtoItemsAccessInfo(
      json['country'] as String?,
      json['viewability'] as String?,
      json['embeddable'] as bool?,
      json['publicDomain'] as bool?,
      json['textToSpeechPermission'] as String?,
      json['epub'] == null
          ? null
          : SearchResponseDtoItemsAccessInfoEpub.fromJson(
              json['epub'] as Map<String, dynamic>),
      json['pdf'] == null
          ? null
          : SearchResponseDtoItemsAccessInfoPdf.fromJson(
              json['pdf'] as Map<String, dynamic>),
      json['webReaderLink'] as String?,
      json['accessViewStatus'] as String?,
      json['quoteSharingAllowed'] as bool?,
    );

Map<String, dynamic> _$SearchResponseDtoItemsAccessInfoToJson(
        SearchResponseDtoItemsAccessInfo instance) =>
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

SearchResponseDtoItemsAccessInfoEpub
    _$SearchResponseDtoItemsAccessInfoEpubFromJson(Map<String, dynamic> json) =>
        SearchResponseDtoItemsAccessInfoEpub(
          json['isAvailable'] as bool?,
          json['downloadLink'] as String?,
        );

Map<String, dynamic> _$SearchResponseDtoItemsAccessInfoEpubToJson(
        SearchResponseDtoItemsAccessInfoEpub instance) =>
    <String, dynamic>{
      'isAvailable': instance.isAvailable,
      'downloadLink': instance.downloadLink,
    };

SearchResponseDtoItemsAccessInfoPdf
    _$SearchResponseDtoItemsAccessInfoPdfFromJson(Map<String, dynamic> json) =>
        SearchResponseDtoItemsAccessInfoPdf(
          json['isAvailable'] as bool?,
        );

Map<String, dynamic> _$SearchResponseDtoItemsAccessInfoPdfToJson(
        SearchResponseDtoItemsAccessInfoPdf instance) =>
    <String, dynamic>{
      'isAvailable': instance.isAvailable,
    };

SearchResponseDtoItemsSearchInfo _$SearchResponseDtoItemsSearchInfoFromJson(
        Map<String, dynamic> json) =>
    SearchResponseDtoItemsSearchInfo(
      json['textSnippet'] as String?,
    );

Map<String, dynamic> _$SearchResponseDtoItemsSearchInfoToJson(
        SearchResponseDtoItemsSearchInfo instance) =>
    <String, dynamic>{
      'textSnippet': instance.textSnippet,
    };
