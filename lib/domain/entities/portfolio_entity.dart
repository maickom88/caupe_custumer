class PortfolioEntity {
  final String guid;
  final String? guidUser;
  final String link;
  PortfolioEntity({
    required this.guid,
    required this.link,
    this.guidUser,
  });
}
