import 'package:collection/collection.dart';

enum AdminPages {
  users,
  seasons,
  additionals,
  zoom,
  promo,
  settings,
  logout,
  videos,
}

enum ActiveCampaignAutomations {
  Freemember,
  Plusmember,
}

enum PlusmemberStatus {
  none,
  trial,
  trialExpired,
  active,
  expired,
}

extension FFEnumExtensions<T extends Enum> on T {
  String serialize() => name;
}

extension FFEnumListExtensions<T extends Enum> on Iterable<T> {
  T? deserialize(String? value) =>
      firstWhereOrNull((e) => e.serialize() == value);
}

T? deserializeEnum<T>(String? value) {
  switch (T) {
    case (AdminPages):
      return AdminPages.values.deserialize(value) as T?;
    case (ActiveCampaignAutomations):
      return ActiveCampaignAutomations.values.deserialize(value) as T?;
    case (PlusmemberStatus):
      return PlusmemberStatus.values.deserialize(value) as T?;
    default:
      return null;
  }
}
