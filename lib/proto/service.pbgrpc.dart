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
  static final _$sendMessage = $grpc.ClientMethod<$0.Message, $0.Close>(
      '/proto.Messinger/sendMessage',
      ($0.Message value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Close.fromBuffer(value));
  static final _$createStream =
      $grpc.ClientMethod<$0.RegisterRequest, $0.Message>(
          '/proto.Messinger/createStream',
          ($0.RegisterRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.Message.fromBuffer(value));

  MessingerClient($grpc.ClientChannel channel, {$grpc.CallOptions options})
      : super(channel, options: options);

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
}

abstract class MessingerServiceBase extends $grpc.Service {
  $core.String get $name => 'proto.Messinger';

  MessingerServiceBase() {
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
  }

  $async.Future<$0.Close> sendMessage_Pre(
      $grpc.ServiceCall call, $async.Future<$0.Message> request) async {
    return sendMessage(call, await request);
  }

  $async.Stream<$0.Message> createStream_Pre($grpc.ServiceCall call,
      $async.Future<$0.RegisterRequest> request) async* {
    yield* createStream(call, await request);
  }

  $async.Future<$0.Close> sendMessage(
      $grpc.ServiceCall call, $0.Message request);
  $async.Stream<$0.Message> createStream(
      $grpc.ServiceCall call, $0.RegisterRequest request);
}
