import 'dart:async';
import 'dart:convert';
import 'dart:core' as prefix1;
import 'dart:core';

import 'package:chat/proto/service.pbgrpc.dart';
import 'package:crypto/crypto.dart';
import 'package:grpc/grpc.dart' as prefix0;
import 'package:grpc/service_api.dart';

class ChatService {
  String local = "10.0.2.2";
  String home = "192.168.1.96";
  String uni = "10.8.143.51";
  MessingerClient client;
  ChatService() {
    client = MessingerClient(prefix0.ClientChannel(home,
        port: 8080,
        options: prefix0.ChannelOptions(
            credentials: prefix0.ChannelCredentials.secure(
                onBadCertificate: (a, b) => true))));
  }
  Future<Close> sendMessage(Message message) async {
    client.sendMessage(message);
    return Close();
  }

  Stream<Message> subscribeToService(User user) async* {
    RegisterRequest registerRequest = RegisterRequest()
      ..active = true
      ..user = user;
    await for (var msg in client.createStream(registerRequest)) {
      yield msg;
    }
  }

  Future<SignupResponse> signup(User user) async {
    user
      ..id =
          sha1.convert(utf8.encode(user.name.trim().toLowerCase())).toString();
    return client.signup(SignupRequest()..user = user);
  }

  Future<AddFriendResponse> addContact(String username) async {
    return client.addFriend(AddFriendRequest()
      ..id = sha1.convert(utf8.encode(username)).toString());
  }

  Future<Message> downloadMedia() async {
    var result = Message();
    await for (var msg in client.downloadMedia(Empty())) {
      result
        ..body = msg.body
        ..timestamp = msg.timestamp
        ..senderId = msg.senderId
        ..targetId = msg.targetId;
      if (msg.media.hasFile()) {
        result.media.file.addAll(msg.media.file);
      }
      if (msg.media.hasImage()) {
        result.media.file.addAll(msg.media.image);
      }
      if (msg.media.hasVideo()) {
        result.media.file.addAll(msg.media.video);
      }
    }
    return result;
  }

  Future<MediaResponse> uploadMedia(Message msg) async {
    var data = Message();
    data = msg;
    data.media.clear();
    int type = 0;
    int size = 0;
    int chunkSize = 0;
    StreamController<Message> streamController = StreamController();

    if (msg.media.hasFile()) {
      type = 0;
      size = msg.media.file.length;
    }
    if (msg.media.hasImage()) {
      type = 1;
      size = msg.media.image.length;
    }
    if (msg.media.hasVideo()) {
      type = 2;
      size = msg.media.video.length;
    }
    for (int i = 0; i < size; i += chunkSize) {
      switch (type) {
        case 0:
          streamController.add(data
            ..media
                .file
                .addAll(msg.media.file.getRange(i, chunkSize).toList()));

          break;
        case 1:
          streamController.add(data
            ..media
                .image
                .addAll(msg.media.image.getRange(i, chunkSize).toList()));
          break;
        case 2:
          streamController.add(data
            ..media
                .video
                .addAll(msg.media.video.getRange(i, chunkSize).toList()));
          break;
      }
    }
    client.uploadMedia(streamController.stream);
  }
}
