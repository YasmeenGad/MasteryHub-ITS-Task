import '../../domain/entities/response/get_books_response_entity.dart';
import '../models/response/get_books_response_dto.dart';

class HomeMapper {
  static GetBooksResponseEntity toEntity(GetBooksResponseDto dto) {
    return GetBooksResponseEntity(
      kind: dto.kind,
      totalItems: dto.totalItems,
      items: dto.items?.map(toItemEntity).toList(),
    );
  }

  static GetBooksResponseEntityItems toItemEntity(
      GetBooksResponseDtoItems? item) {
    if (item == null)
      return GetBooksResponseEntityItems(
          null, null, null, null, null, null, null, null);

    return GetBooksResponseEntityItems(
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

  static GetBooksResponseEntityItemsVolumeInfo? toVolumeInfoEntity(
      GetBooksResponseDtoItemsVolumeInfo? info) {
    if (info == null) return null;
    return GetBooksResponseEntityItemsVolumeInfo(
      info.title,
      info.authors,
      info.publisher,
      info.publishedDate,
      info.description,
      info.industryIdentifiers?.map(toIndustryIdentifierEntity).toList(),
      toReadingModesEntity(info.readingModes),
      info.pageCount,
      info.printType,
      info.categories,
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

  static GetBooksResponseEntityItemsVolumeInfoIndustryIdentifiers?
      toIndustryIdentifierEntity(
          GetBooksResponseDtoItemsVolumeInfoIndustryIdentifiers? identifier) {
    if (identifier == null) return null;
    return GetBooksResponseEntityItemsVolumeInfoIndustryIdentifiers(
        identifier.type, identifier.identifier);
  }

  static GetBooksResponseEntityItemsVolumeInfoReadingModes?
      toReadingModesEntity(
          GetBooksResponseDtoItemsVolumeInfoReadingModes? readingModes) {
    if (readingModes == null) return null;
    return GetBooksResponseEntityItemsVolumeInfoReadingModes(
        readingModes.text, readingModes.image);
  }

  static GetBooksResponseEntityItemsVolumeInfoPanelizationSummary?
      toPanelizationEntity(
          GetBooksResponseDtoItemsVolumeInfoPanelizationSummary?
              panelizationSummary) {
    if (panelizationSummary == null) return null;
    return GetBooksResponseEntityItemsVolumeInfoPanelizationSummary(
        panelizationSummary.containsEpubBubbles,
        panelizationSummary.containsImageBubbles);
  }

  static GetBooksResponseEntityItemsVolumeInfoImageLinks? toImageLinksEntity(
      GetBooksResponseDtoItemsVolumeInfoImageLinks? imageLinks) {
    if (imageLinks == null) return null;
    return GetBooksResponseEntityItemsVolumeInfoImageLinks(
        imageLinks.smallThumbnail, imageLinks.thumbnail);
  }

  static GetBooksResponseEntityItemsSaleInfo? toSaleInfoEntity(
      GetBooksResponseDtoItemsSaleInfo? saleInfo) {
    if (saleInfo == null) return null;
    return GetBooksResponseEntityItemsSaleInfo(
        saleInfo.country, saleInfo.saleability, saleInfo.isEbook);
  }

  static GetBooksResponseEntityItemsAccessInfo? toAccessInfoEntity(
      GetBooksResponseDtoItemsAccessInfo? accessInfo) {
    if (accessInfo == null) return null;
    return GetBooksResponseEntityItemsAccessInfo(
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

  static GetBooksResponseEntityItemsAccessInfoEpub? toEpubEntity(
      GetBooksResponseDtoItemsAccessInfoEpub? epub) {
    if (epub == null) return null;
    return GetBooksResponseEntityItemsAccessInfoEpub(epub.isAvailable);
  }

  static GetBooksResponseEntityItemsAccessInfoPdf? toPdfEntity(
      GetBooksResponseDtoItemsAccessInfoPdf? pdf) {
    if (pdf == null) return null;
    return GetBooksResponseEntityItemsAccessInfoPdf(
        pdf.isAvailable, pdf.acsTokenLink);
  }

  static GetBooksResponseEntityItemsSearchInfo? toSearchInfoEntity(
      GetBooksResponseDtoItemsSearchInfo? searchInfo) {
    if (searchInfo == null) return null;
    return GetBooksResponseEntityItemsSearchInfo(searchInfo.textSnippet);
  }
}
