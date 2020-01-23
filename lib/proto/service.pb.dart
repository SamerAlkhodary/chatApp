///
//  Generated code. Do not modify.
//  source: service.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core show bool, Deprecated, double, int, List, Map, override, pragma, String;

import 'package:protobuf/protobuf.dart' as $pb;

class RegisterRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('RegisterRequest', package: const $pb.PackageName('proto'))
    ..a<User>(1, 'user', $pb.PbFieldType.OM, User.getDefault, User.create)
    ..aOB(2, 'active')
    ..hasRequiredFields = false
  ;

  RegisterRequest._() : super();
  factory RegisterRequest() => create();
  factory RegisterRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RegisterRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  RegisterRequest clone() => RegisterRequest()..mergeFromMessage(this);
  RegisterRequest copyWith(void Function(RegisterRequest) updates) => super.copyWith((message) => updates(message as RegisterRequest));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RegisterRequest create() => RegisterRequest._();
  RegisterRequest createEmptyInstance() => create();
  static $pb.PbList<RegisterRequest> createRepeated() => $pb.PbList<RegisterRequest>();
  static RegisterRequest getDefault() => _defaultInstance ??= create()..freeze();
  static RegisterRequest _defaultInstance;

  User get user => $_getN(0);
  set user(User v) { setField(1, v); }
  $core.bool hasUser() => $_has(0);
  void clearUser() => clearField(1);

  $core.bool get active => $_get(1, false);
  set active($core.bool v) { $_setBool(1, v); }
  $core.bool hasActive() => $_has(1);
  void clearActive() => clearField(2);
}

class LogoutRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('LogoutRequest', package: const $pb.PackageName('proto'))
    ..aOS(1, 'id')
    ..hasRequiredFields = false
  ;

  LogoutRequest._() : super();
  factory LogoutRequest() => create();
  factory LogoutRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LogoutRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  LogoutRequest clone() => LogoutRequest()..mergeFromMessage(this);
  LogoutRequest copyWith(void Function(LogoutRequest) updates) => super.copyWith((message) => updates(message as LogoutRequest));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static LogoutRequest create() => LogoutRequest._();
  LogoutRequest createEmptyInstance() => create();
  static $pb.PbList<LogoutRequest> createRepeated() => $pb.PbList<LogoutRequest>();
  static LogoutRequest getDefault() => _defaultInstance ??= create()..freeze();
  static LogoutRequest _defaultInstance;

  $core.String get id => $_getS(0, '');
  set id($core.String v) { $_setString(0, v); }
  $core.bool hasId() => $_has(0);
  void clearId() => clearField(1);
}

class Close extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Close', package: const $pb.PackageName('proto'))
    ..hasRequiredFields = false
  ;

  Close._() : super();
  factory Close() => create();
  factory Close.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Close.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Close clone() => Close()..mergeFromMessage(this);
  Close copyWith(void Function(Close) updates) => super.copyWith((message) => updates(message as Close));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Close create() => Close._();
  Close createEmptyInstance() => create();
  static $pb.PbList<Close> createRepeated() => $pb.PbList<Close>();
  static Close getDefault() => _defaultInstance ??= create()..freeze();
  static Close _defaultInstance;
}

class User extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('User', package: const $pb.PackageName('proto'))
    ..aOS(1, 'id')
    ..aOS(2, 'name')
    ..aOS(3, 'profilePic')
    ..hasRequiredFields = false
  ;

  User._() : super();
  factory User() => create();
  factory User.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory User.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  User clone() => User()..mergeFromMessage(this);
  User copyWith(void Function(User) updates) => super.copyWith((message) => updates(message as User));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static User create() => User._();
  User createEmptyInstance() => create();
  static $pb.PbList<User> createRepeated() => $pb.PbList<User>();
  static User getDefault() => _defaultInstance ??= create()..freeze();
  static User _defaultInstance;

  $core.String get id => $_getS(0, '');
  set id($core.String v) { $_setString(0, v); }
  $core.bool hasId() => $_has(0);
  void clearId() => clearField(1);

  $core.String get name => $_getS(1, '');
  set name($core.String v) { $_setString(1, v); }
  $core.bool hasName() => $_has(1);
  void clearName() => clearField(2);

  $core.String get profilePic => $_getS(2, '');
  set profilePic($core.String v) { $_setString(2, v); }
  $core.bool hasProfilePic() => $_has(2);
  void clearProfilePic() => clearField(3);
}

class Message extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Message', package: const $pb.PackageName('proto'))
    ..aOS(1, 'senderId')
    ..aOS(2, 'targetId')
    ..aOS(3, 'body')
    ..aOS(4, 'timestamp')
    ..hasRequiredFields = false
  ;

  Message._() : super();
  factory Message() => create();
  factory Message.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Message.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Message clone() => Message()..mergeFromMessage(this);
  Message copyWith(void Function(Message) updates) => super.copyWith((message) => updates(message as Message));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Message create() => Message._();
  Message createEmptyInstance() => create();
  static $pb.PbList<Message> createRepeated() => $pb.PbList<Message>();
  static Message getDefault() => _defaultInstance ??= create()..freeze();
  static Message _defaultInstance;

  $core.String get senderId => $_getS(0, '');
  set senderId($core.String v) { $_setString(0, v); }
  $core.bool hasSenderId() => $_has(0);
  void clearSenderId() => clearField(1);

  $core.String get targetId => $_getS(1, '');
  set targetId($core.String v) { $_setString(1, v); }
  $core.bool hasTargetId() => $_has(1);
  void clearTargetId() => clearField(2);

  $core.String get body => $_getS(2, '');
  set body($core.String v) { $_setString(2, v); }
  $core.bool hasBody() => $_has(2);
  void clearBody() => clearField(3);

  $core.String get timestamp => $_getS(3, '');
  set timestamp($core.String v) { $_setString(3, v); }
  $core.bool hasTimestamp() => $_has(3);
  void clearTimestamp() => clearField(4);
}

