enum Roles { ADMIN, FREE, PREMIUM }

extension RoleConvert on Roles {
  String toRole() {
    switch (this) {
      case Roles.ADMIN:
        return "ADMIN";
      case Roles.PREMIUM:
        return "PREMIUM";
      default:
        return "FREE";
    }
  }
}
