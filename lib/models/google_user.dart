class GoogleUser{
  String providerDetails;
  String username;
  String photoUrl;
  String userEmail;
  List<ProviderDetails> providerData;
  GoogleUser(this.providerDetails, this.username, this.photoUrl, this.userEmail, this.providerData);
}

class ProviderDetails{
  ProviderDetails(this.providerId);
  String providerId;
}