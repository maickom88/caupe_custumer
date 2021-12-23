import '../../domain/entities/portfolio_entity.dart';

class PortfolioModel implements PortfolioEntity {
  final String guid;
  final String link;
  final String? guidUser;
  PortfolioModel({
    required this.link,
    required this.guid,
    this.guidUser,
  });

  factory PortfolioModel.fromMap(Map<String, dynamic> map) {
    return PortfolioModel(
      link: map['link'],
      guid: map['guid'],
      guidUser: map['guid_user'],
    );
  }

  factory PortfolioModel.fromModel(PortfolioEntity portfolioEntity) {
    return PortfolioModel(
      link: portfolioEntity.link,
      guid: portfolioEntity.guid,
      guidUser: portfolioEntity.guidUser,
    );
  }
}
