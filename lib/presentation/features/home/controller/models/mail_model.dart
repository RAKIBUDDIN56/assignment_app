class MailModel {
  MailModel({
    required this.hydraMember,
  });

  List<EmailDetails> hydraMember;

  factory MailModel.fromJson(Map<String, dynamic> json) => MailModel(
        hydraMember: List<EmailDetails>.from(
            json["hydra:member"].map((x) => EmailDetails.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "hydra:member": List<dynamic>.from(hydraMember.map((x) => x.toJson())),
      };
}

class EmailDetails {
  EmailDetails({
    required this.id,
    required this.type,
    required this.hydraMemberId,
    required this.accountId,
    required this.msgid,
    required this.from,
    required this.to,
    required this.subject,
    required this.intro,
    required this.seen,
    required this.isDeleted,
    required this.hasAttachments,
    required this.size,
    required this.downloadUrl,
    required this.createdAt,
    required this.updatedAt,
  });

  String id;
  String type;

  String hydraMemberId;
  String accountId;
  String msgid;
  From from;
  List<From> to;
  String subject;
  String? intro;
  bool seen;
  bool isDeleted;
  bool hasAttachments;
  int size;
  String downloadUrl;
  DateTime createdAt;
  DateTime updatedAt;

  factory EmailDetails.fromJson(Map<String, dynamic> json) => EmailDetails(
        id: json["@id"],
        type: json["@type"],
        hydraMemberId: json["id"],
        accountId: json["accountId"],
        msgid: json["msgid"],
        from: From.fromJson(json["from"]),
        to: List<From>.from(json["to"].map((x) => From.fromJson(x))),
        subject: json["subject"],
        intro: json["intro"] ?? '',
        seen: json["seen"],
        isDeleted: json["isDeleted"],
        hasAttachments: json["hasAttachments"],
        size: json["size"],
        downloadUrl: json["downloadUrl"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "@id": id,
        "@type": type,
        "id": hydraMemberId,
        "accountId": accountId,
        "msgid": msgid,
        "from": from.toJson(),
        "to": List<dynamic>.from(to.map((x) => x.toJson())),
        "subject": subject,
        "intro": intro,
        "seen": seen,
        "isDeleted": isDeleted,
        "hasAttachments": hasAttachments,
        "size": size,
        "downloadUrl": downloadUrl,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}

class From {
  From({
    required this.address,
    required this.name,
  });

  String address;
  String name;

  factory From.fromJson(Map<String, dynamic> json) => From(
        address: json["address"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "address": address,
        "name": name,
      };
}

class HydraSearch {
  HydraSearch({
    required this.type,
    required this.hydraTemplate,
    required this.hydraVariableRepresentation,
    required this.hydraMapping,
  });

  String type;
  String hydraTemplate;
  String hydraVariableRepresentation;
  List<HydraMapping> hydraMapping;

  factory HydraSearch.fromJson(Map<String, dynamic> json) => HydraSearch(
        type: json["@type"],
        hydraTemplate: json["hydra:template"],
        hydraVariableRepresentation: json["hydra:variableRepresentation"],
        hydraMapping: List<HydraMapping>.from(
            json["hydra:mapping"].map((x) => HydraMapping.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "@type": type,
        "hydra:template": hydraTemplate,
        "hydra:variableRepresentation": hydraVariableRepresentation,
        "hydra:mapping":
            List<dynamic>.from(hydraMapping.map((x) => x.toJson())),
      };
}

class HydraMapping {
  HydraMapping({
    required this.type,
    required this.variable,
    required this.property,
    required this.required,
  });

  String type;
  String variable;
  String property;
  bool required;

  factory HydraMapping.fromJson(Map<String, dynamic> json) => HydraMapping(
        type: json["@type"],
        variable: json["variable"],
        property: json["property"],
        required: json["required"],
      );

  Map<String, dynamic> toJson() => {
        "@type": type,
        "variable": variable,
        "property": property,
        "required": required,
      };
}

class HydraView {
  HydraView({
    required this.id,
    required this.type,
    required this.hydraFirst,
    required this.hydraLast,
    required this.hydraPrevious,
    required this.hydraNext,
  });

  String id;
  String type;
  String hydraFirst;
  String hydraLast;
  String hydraPrevious;
  String hydraNext;

  factory HydraView.fromJson(Map<String, dynamic> json) => HydraView(
        id: json[" id"],
        type: json[" type"],
        hydraFirst: json["hydra:first"],
        hydraLast: json["hydra:last"],
        hydraPrevious: json["hydra:previous"],
        hydraNext: json["hydra:next"],
      );

  Map<String, dynamic> toJson() => {
        " id": id,
        " type": type,
        "hydra:first": hydraFirst,
        "hydra:last": hydraLast,
        "hydra:previous": hydraPrevious,
        "hydra:next": hydraNext,
      };
}
