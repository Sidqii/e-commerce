abstract class BannerEvent {
  const BannerEvent();
}

class BannerLoadEvent extends BannerEvent {
  const BannerLoadEvent();
}

class BannerChangeEvent extends BannerEvent {
  final int index;
  const BannerChangeEvent(this.index);
}

class BannerAutoScrollEvent extends BannerEvent {
  const BannerAutoScrollEvent();
}
