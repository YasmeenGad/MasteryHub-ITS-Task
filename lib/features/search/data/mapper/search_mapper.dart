import '../../domain/entities/response/search_response_entity.dart';
import '../models/response/search_response_dto.dart';

class SearchMapper {
  static SearchResponseEntity toEntity(SearchResponseDto dto) {
    return SearchResponseEntity(
      kind: dto.kind,
      totalItems: dto.totalItems,
      items: dto.items?.map(toItemEntity).toList(),
    );
  }

  static SearchResponseEntityItems toItemEntity(SearchResponseDtoItems? item) {
    if (item == null)
      return SearchResponseEntityItems(
          null, null, null, null, null, null, null, null);
    return SearchResponseEntityItems(
      item.kind,
      item.id,
      item.etag,
      item.selfLink,
      toVolumeInfoEntity(item.volumeInfo),
      toSaleInfoEntity(item.saleInfo),
      toAccessInfoEntity(item.accessInfo),
      toSearchInfoEntity(item.searchInfo),
    );
  }

  static SearchResponseEntityItemsVolumeInfo? toVolumeInfoEntity(
      SearchResponseDtoItemsVolumeInfo? info) {
    if (info == null) return null;
    return SearchResponseEntityItemsVolumeInfo(
      info.title,
      info.publishedDate,
      info.industryIdentifiers?.map(toIndustryIdentifierEntity).toList(),
      toReadingModesEntity(info.readingModes),
      info.pageCount,
      info.printType,
      info.maturityRating,
      info.allowAnonLogging,
      info.contentVersion,
      toPanelizationEntity(info.panelizationSummary),
      toImageLinksEntity(info.imageLinks),
      info.language,
      info.previewLink,
      info.infoLink,
      info.canonicalVolumeLink,
    );
  }

  static SearchResponseEntityItemsVolumeInfoIndustryIdentifiers?
      toIndustryIdentifierEntity(
          SearchResponseDtoItemsVolumeInfoIndustryIdentifiers? identifier) {
    if (identifier == null) return null;
    return SearchResponseEntityItemsVolumeInfoIndustryIdentifiers(
      identifier.type,
      identifier.identifier,
    );
  }

  static SearchResponseEntityItemsVolumeInfoReadingModes? toReadingModesEntity(
      SearchResponseDtoItemsVolumeInfoReadingModes? readingModes) {
    if (readingModes == null) return null;
    return SearchResponseEntityItemsVolumeInfoReadingModes(
      readingModes.text,
      readingModes.image,
    );
  }

  static SearchResponseEntityItemsVolumeInfoPanelizationSummary?
      toPanelizationEntity(
          SearchResponseDtoItemsVolumeInfoPanelizationSummary? panel) {
    if (panel == null) return null;
    return SearchResponseEntityItemsVolumeInfoPanelizationSummary(
      panel.containsEpubBubbles,
      panel.containsImageBubbles,
    );
  }

  static SearchResponseEntityItemsVolumeInfoImageLinks? toImageLinksEntity(
      SearchResponseDtoItemsVolumeInfoImageLinks? imageLinks) {
    if (imageLinks == null) return null;
    return SearchResponseEntityItemsVolumeInfoImageLinks(
      imageLinks.smallThumbnail,
      imageLinks.thumbnail,
    );
  }

  static SearchResponseEntityItemsSaleInfo? toSaleInfoEntity(
      SearchResponseDtoItemsSaleInfo? saleInfo) {
    if (saleInfo == null) return null;
    return SearchResponseEntityItemsSaleInfo(
      saleInfo.country,
      saleInfo.saleability,
      saleInfo.isEbook,
      saleInfo.buyLink,
    );
  }

  static SearchResponseEntityItemsAccessInfo? toAccessInfoEntity(
      SearchResponseDtoItemsAccessInfo? accessInfo) {
    if (accessInfo == null) return null;
    return SearchResponseEntityItemsAccessInfo(
      accessInfo.country,
      accessInfo.viewability,
      accessInfo.embeddable,
      accessInfo.publicDomain,
      accessInfo.textToSpeechPermission,
      toEpubEntity(accessInfo.epub),
      toPdfEntity(accessInfo.pdf),
      accessInfo.webReaderLink,
      accessInfo.accessViewStatus,
      accessInfo.quoteSharingAllowed,
    );
  }

  static SearchResponseEntityItemsAccessInfoEpub? toEpubEntity(
      SearchResponseDtoItemsAccessInfoEpub? epub) {
    if (epub == null) return null;
    return SearchResponseEntityItemsAccessInfoEpub(
      epub.isAvailable,
      epub.downloadLink,
    );
  }

  static SearchResponseEntityItemsAccessInfoPdf? toPdfEntity(
      SearchResponseDtoItemsAccessInfoPdf? pdf) {
    if (pdf == null) return null;
    return SearchResponseEntityItemsAccessInfoPdf(
      pdf.isAvailable,
    );
  }

  static SearchResponseEntityItemsSearchInfo? toSearchInfoEntity(
      SearchResponseDtoItemsSearchInfo? searchInfo) {
    if (searchInfo == null) return null;
    return SearchResponseEntityItemsSearchInfo(
      searchInfo.textSnippet,
    );
  }
}
