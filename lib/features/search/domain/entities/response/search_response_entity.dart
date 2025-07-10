class SearchResponseEntity {
  final String? kind;
  final int? totalItems;
  final List<SearchResponseEntityItems?>? items;

  SearchResponseEntity({this.kind, this.totalItems, this.items});
}

class SearchResponseEntityItems {
  final String? kind;
  final String? id;
  final String? etag;
  final String? selfLink;
  final SearchResponseEntityItemsVolumeInfo? volumeInfo;
  final SearchResponseEntityItemsSaleInfo? saleInfo;
  final SearchResponseEntityItemsAccessInfo? accessInfo;
  final SearchResponseEntityItemsSearchInfo? searchInfo;

  SearchResponseEntityItems(this.kind, this.id, this.etag, this.selfLink,
      this.volumeInfo, this.saleInfo, this.accessInfo, this.searchInfo);
}

class SearchResponseEntityItemsVolumeInfo {
  final String? title;
  final String? publishedDate;
  final List<SearchResponseEntityItemsVolumeInfoIndustryIdentifiers?>?
      industryIdentifiers;
  final SearchResponseEntityItemsVolumeInfoReadingModes? readingModes;
  final int? pageCount;
  final String? printType;
  final String? maturityRating;
  final bool? allowAnonLogging;
  final String? contentVersion;
  final SearchResponseEntityItemsVolumeInfoPanelizationSummary?
      panelizationSummary;
  final SearchResponseEntityItemsVolumeInfoImageLinks? imageLinks;
  final String? language;
  final String? previewLink;
  final String? infoLink;
  final String? canonicalVolumeLink;

  SearchResponseEntityItemsVolumeInfo(
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
}

class SearchResponseEntityItemsVolumeInfoIndustryIdentifiers {
  final String? type;
  final String? identifier;

  SearchResponseEntityItemsVolumeInfoIndustryIdentifiers(
      this.type, this.identifier);
}

class SearchResponseEntityItemsVolumeInfoReadingModes {
  final bool? text;
  final bool? image;

  SearchResponseEntityItemsVolumeInfoReadingModes(this.text, this.image);
}

class SearchResponseEntityItemsVolumeInfoPanelizationSummary {
  final bool? containsEpubBubbles;
  final bool? containsImageBubbles;

  SearchResponseEntityItemsVolumeInfoPanelizationSummary(
      this.containsEpubBubbles, this.containsImageBubbles);
}

class SearchResponseEntityItemsVolumeInfoImageLinks {
  final String? smallThumbnail;
  final String? thumbnail;

  SearchResponseEntityItemsVolumeInfoImageLinks(
      this.smallThumbnail, this.thumbnail);
}

class SearchResponseEntityItemsSaleInfo {
  final String? country;
  final String? saleability;
  final bool? isEbook;
  final String? buyLink;

  SearchResponseEntityItemsSaleInfo(
      this.country, this.saleability, this.isEbook, this.buyLink);
}

class SearchResponseEntityItemsAccessInfo {
  final String? country;
  final String? viewability;
  final bool? embeddable;
  final bool? publicDomain;
  final String? textToSpeechPermission;
  final SearchResponseEntityItemsAccessInfoEpub? epub;
  final SearchResponseEntityItemsAccessInfoPdf? pdf;
  final String? webReaderLink;
  final String? accessViewStatus;
  final bool? quoteSharingAllowed;

  SearchResponseEntityItemsAccessInfo(
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

class SearchResponseEntityItemsAccessInfoEpub {
  final bool? isAvailable;
  final String? downloadLink;

  SearchResponseEntityItemsAccessInfoEpub(this.isAvailable, this.downloadLink);
}

class SearchResponseEntityItemsAccessInfoPdf {
  final bool? isAvailable;

  SearchResponseEntityItemsAccessInfoPdf(this.isAvailable);
}

class SearchResponseEntityItemsSearchInfo {
  final String? textSnippet;

  SearchResponseEntityItemsSearchInfo(this.textSnippet);
}
