class GetBooksResponseEntity {
  final String? kind;
  final int? totalItems;
  final List<GetBooksResponseEntityItems?>? items;

  GetBooksResponseEntity({this.kind, this.totalItems, this.items});
}

class GetBooksResponseEntityItems {
  final String? kind;
  final String? id;
  final String? etag;
  final String? selfLink;
  final GetBooksResponseEntityItemsVolumeInfo? volumeInfo;
  final GetBooksResponseEntityItemsSaleInfo? saleInfo;
  final GetBooksResponseEntityItemsAccessInfo? accessInfo;
  final GetBooksResponseEntityItemsSearchInfo? searchInfo;

  GetBooksResponseEntityItems(this.kind, this.id, this.etag, this.selfLink,
      this.volumeInfo, this.saleInfo, this.accessInfo, this.searchInfo);
}

class GetBooksResponseEntityItemsVolumeInfo {
  final String? title;
  final List<String?>? authors;
  final String? publisher;
  final String? publishedDate;
  final String? description;
  final List<GetBooksResponseEntityItemsVolumeInfoIndustryIdentifiers?>?
      industryIdentifiers;
  final GetBooksResponseEntityItemsVolumeInfoReadingModes? readingModes;
  final int? pageCount;
  final String? printType;
  final List<String?>? categories;
  final String? maturityRating;
  final bool? allowAnonLogging;
  final String? contentVersion;
  final GetBooksResponseEntityItemsVolumeInfoPanelizationSummary?
      panelizationSummary;
  final GetBooksResponseEntityItemsVolumeInfoImageLinks? imageLinks;
  final String? language;
  final String? previewLink;
  final String? infoLink;
  final String? canonicalVolumeLink;

  GetBooksResponseEntityItemsVolumeInfo(
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
}

class GetBooksResponseEntityItemsVolumeInfoIndustryIdentifiers {
  final String? type;
  final String? identifier;

  GetBooksResponseEntityItemsVolumeInfoIndustryIdentifiers(
      this.type, this.identifier);
}

class GetBooksResponseEntityItemsVolumeInfoReadingModes {
  final bool? text;
  final bool? image;

  GetBooksResponseEntityItemsVolumeInfoReadingModes(this.text, this.image);
}

class GetBooksResponseEntityItemsVolumeInfoPanelizationSummary {
  final bool? containsEpubBubbles;
  final bool? containsImageBubbles;

  GetBooksResponseEntityItemsVolumeInfoPanelizationSummary(
      this.containsEpubBubbles, this.containsImageBubbles);
}

class GetBooksResponseEntityItemsVolumeInfoImageLinks {
  final String? smallThumbnail;
  final String? thumbnail;

  GetBooksResponseEntityItemsVolumeInfoImageLinks(
      this.smallThumbnail, this.thumbnail);
}

class GetBooksResponseEntityItemsSaleInfo {
  final String? country;
  final String? saleability;
  final bool? isEbook;

  GetBooksResponseEntityItemsSaleInfo(
      this.country, this.saleability, this.isEbook);
}

class GetBooksResponseEntityItemsAccessInfo {
  final String? country;
  final String? viewability;
  final bool? embeddable;
  final bool? publicDomain;
  final String? textToSpeechPermission;
  final GetBooksResponseEntityItemsAccessInfoEpub? epub;
  final GetBooksResponseEntityItemsAccessInfoPdf? pdf;
  final String? webReaderLink;
  final String? accessViewStatus;
  final bool? quoteSharingAllowed;

  GetBooksResponseEntityItemsAccessInfo(
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
}

class GetBooksResponseEntityItemsAccessInfoEpub {
  final bool? isAvailable;

  GetBooksResponseEntityItemsAccessInfoEpub(this.isAvailable);
}

class GetBooksResponseEntityItemsAccessInfoPdf {
  final bool? isAvailable;
  final String? acsTokenLink;

  GetBooksResponseEntityItemsAccessInfoPdf(this.isAvailable, this.acsTokenLink);
}

class GetBooksResponseEntityItemsSearchInfo {
  final String? textSnippet;

  GetBooksResponseEntityItemsSearchInfo(this.textSnippet);
}
