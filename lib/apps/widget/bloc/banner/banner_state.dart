abstract class BannerState {
  final int currentIndex;
  final List<String> banners;

  const BannerState({required this.currentIndex, required this.banners});
}

class BannerLoadState extends BannerState {
  const BannerLoadState() : super(currentIndex: 0, banners: const []);
}

class BannerFullState extends BannerState {
  const BannerFullState({required int currIndex, required List<String> banner})
    : super(currentIndex: currIndex, banners: banner);

  BannerFullState copyWith({int? currIndex, List<String>? banner}) {
    return BannerFullState(
      currIndex: currIndex ?? currentIndex,
      banner: banner ?? banners,
    );
  }
}
