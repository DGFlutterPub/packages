class DGHubSplashData {
  String appname;
  String? logo;
  String? backgroundPhoto;
  String site;
  bool isError;
  Function()? onTryAgain;
  Function()? onComplete;
  Function()? onTapAgent;
  int seconds;
  DGHubSplashData(
      {this.onTryAgain,
      this.onTapAgent,
      this.backgroundPhoto,
      this.onComplete,
      this.seconds = 2,
      this.isError = false,
      this.appname = 'DGHub Studio',
      this.logo,
      this.site = 'www.dghub.in'});
}
