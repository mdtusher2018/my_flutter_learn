
enum StorageKeyType { string, bool, int, secureString }

enum StorageKey {
  token(StorageKeyType.secureString, 'token'),
  rememberMe(StorageKeyType.bool, 'rememberMe'),
  savedLoginsKey(StorageKeyType.string, 'saved_logins_accounts'),
  languageCode(StorageKeyType.string, 'langCode'),
  countryCode(StorageKeyType.string, 'countryCode'),
  isUserOnboardingCompleted(StorageKeyType.bool, 'onboarding_user'),
  isDealerOnBoardingCompleted(StorageKeyType.bool, 'onboarding_dealer');

  final StorageKeyType type;
  final String key;

  const StorageKey(this.type, this.key);
}
