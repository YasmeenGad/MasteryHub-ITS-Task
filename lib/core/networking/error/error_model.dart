class ErrorModel {
  final int? code;
  final String? message;
  final List<ErrorDetail>? errors;

  const ErrorModel({
    this.code,
    this.message,
    this.errors,
  });

  factory ErrorModel.fromMap(Map<String, dynamic> map) {
    final error = map['error'] as Map<String, dynamic>?;

    return ErrorModel(
      code: error?['code'] as int?,
      message: error?['message']?.toString(),
      errors: (error?['errors'] as List<dynamic>?)
          ?.map((e) => ErrorDetail.fromMap(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'message': message,
      'errors': errors?.map((e) => e.toJson()).toList(),
    };
  }

  @override
  List<Object?> get props => [code, message, errors];
}

class ErrorDetail {
  final String? message;
  final String? domain;
  final String? reason;

  const ErrorDetail({
    this.message,
    this.domain,
    this.reason,
  });

  factory ErrorDetail.fromMap(Map<String, dynamic> map) {
    return ErrorDetail(
      message: map['message']?.toString(),
      domain: map['domain']?.toString(),
      reason: map['reason']?.toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'domain': domain,
      'reason': reason,
    };
  }
}
