///
//  Generated code. Do not modify.
//  source: service.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'service.pb.dart' as $0;
export 'service.pb.dart';

class MessingerClient extends $grpc.Client {
  static final _$signup =
      $grpc.ClientMethod<$0.SignupRequest, $0.SignupResponse>(
          '/proto.Messinger/signup',
          ($0.SignupRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.SignupResponse.fromBuffer(value));
  static final _$addFriend =
      $grpc.ClientMethod<$0.AddFriendRequest, $0.AddFriendResponse>(
          '/proto.Messinger/addFriend',
          ($0.AddFriendRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.AddFriendResponse.fromBuffer(value));
  static final _$sendMessage = $grpc.ClientMethod<$0.Message, $0.Close>(
      '/proto.Messinger/sendMessage',
      ($0.Message value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Close.fromBuffer(value));
  static final _$createStream =
      $grpc.ClientMethod<$0.RegisterRequest, $0.Message>(
          '/proto.Messinger/createStream',
          ($0.RegisterRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.Message.fromBuffer(value));
  static final _$uploadMedia = $grpc.ClientMethod<$0.Message, $0.MediaResponse>(
      '/proto.Messinger/uploadMedia',
      ($0.Message value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.MediaResponse.fromBuffer(value));
  static final _$downloadMedia = $grpc.ClientMethod<$0.Empty, $0.Message>(
      '/proto.Messinger/downloadMedia',
      ($0.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Message.fromBuffer(value));

  MessingerClient($grpc.ClientChannel channel, {$grpc.CallOptions options})
      : super(channel, options: options);

  $grpc.ResponseFuture<$0.SignupResponse> signup($0.SignupRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(_$signup, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.AddFriendResponse> addFriend(
      $0.AddFriendRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(_$addFriend, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.Close> sendMessage($0.Message request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$sendMessage, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseStream<$0.Message> createStream($0.RegisterRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$createStream, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseStream(call);
  }

  $grpc.ResponseFuture<$0.MediaResponse> uploadMedia(
      $async.Stream<$0.Message> request,
      {$grpc.CallOptions options}) {
    final call = $createCall(_$uploadMedia, request, options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseStream<$0.Message> downloadMedia($0.Empty request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$downloadMedia, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseStream(call);
  }
}

abstract class MessingerServiceBase extends $grpc.Service {
  $core.String get $name => 'proto.Messinger';

  MessingerServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.SignupRequest, $0.SignupResponse>(
        'signup',
        signup_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.SignupRequest.fromBuffer(value),
        ($0.SignupResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.AddFriendRequest, $0.AddFriendResponse>(
        'addFriend',
        addFriend_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.AddFriendRequest.fromBuffer(value),
        ($0.AddFriendResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Message, $0.Close>(
        'sendMessage',
        sendMessage_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Message.fromBuffer(value),
        ($0.Close value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.RegisterRequest, $0.Message>(
        'createStream',
        createStream_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.RegisterRequest.fromBuffer(value),
        ($0.Message value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Message, $0.MediaResponse>(
        'uploadMedia',
        uploadMedia,
        true,
        false,
        ($core.List<$core.int> value) => $0.Message.fromBuffer(value),
        ($0.MediaResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Empty, $0.Message>(
        'downloadMedia',
        downloadMedia_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($0.Message value) => value.writeToBuffer()));
  }

  $async.Future<$0.SignupResponse> signup_Pre(
      $grpc.ServiceCall call, $async.Future<$0.SignupRequest> request) async {
    return signup(call, await request);
  }

  $async.Future<$0.AddFriendResponse> addFriend_Pre($grpc.ServiceCall call,
      $async.Future<$0.AddFriendRequest> request) async {
    return addFriend(call, await request);
  }

  $async.Future<$0.Close> sendMessage_Pre(
      $grpc.ServiceCall call, $async.Future<$0.Message> request) async {
    return sendMessage(call, await request);
  }

  $async.Stream<$0.Message> createStream_Pre($grpc.ServiceCall call,
      $async.Future<$0.RegisterRequest> request) async* {
    yield* createStream(call, await request);
  }

  $async.Stream<$0.Message> downloadMedia_Pre(
      $grpc.ServiceCall call, $async.Future<$0.Empty> request) async* {
    yield* downloadMedia(call, await request);
  }

  $async.Future<$0.SignupResponse> signup(
      $grpc.ServiceCall call, $0.SignupRequest request);
  $async.Future<$0.AddFriendResponse> addFriend(
      $grpc.ServiceCall call, $0.AddFriendRequest request);
  $async.Future<$0.Close> sendMessage(
      $grpc.ServiceCall call, $0.Message request);
  $async.Stream<$0.Message> createStream(
      $grpc.ServiceCall call, $0.RegisterRequest request);
  $async.Future<$0.MediaResponse> uploadMedia(
      $grpc.ServiceCall call, $async.Stream<$0.Message> request);
  $async.Stream<$0.Message> downloadMedia(
      $grpc.ServiceCall call, $0.Empty request);
}
