import 'dart:convert';
import 'dart:typed_data';

import '../network.dart';

/// All the talk functions for guest management
class GuestManagement {
  // ignore: public_member_api_docs
  GuestManagement(Network network, String url) {
    _network = network;
    _baseUrl = url;
  }

  late String _baseUrl;
  late Network _network;

  String _getUrl(String path) => '$_baseUrl/$path';

  /// Set the display name as a guest
  ///
  /// The current use have to be a guest (403 error)
  Future setGuestDisplayName(String sessionId, String displayName) async {
    await _network.send(
      'POST',
      _getUrl('guest/$sessionId/name'),
      [200],
      data: Uint8List.fromList(utf8.encode(json.encode({
        'displayName': displayName,
      }))),
    );
  }
}
