import 'package:share_plus/share_plus.dart';

class SharePlugin {
  static void shareLink(String link, String subjet) {
    Share.share(link, subject: subjet);
  }
}
