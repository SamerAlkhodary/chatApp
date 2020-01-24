///
//  Generated code. Do not modify.
//  source: service.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

const RegisterRequest$json = const {
  '1': 'RegisterRequest',
  '2': const [
    const {'1': 'user', '3': 1, '4': 1, '5': 11, '6': '.proto.User', '10': 'user'},
    const {'1': 'active', '3': 2, '4': 1, '5': 8, '10': 'active'},
  ],
};

const LogoutRequest$json = const {
  '1': 'LogoutRequest',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
  ],
};

const Close$json = const {
  '1': 'Close',
};

const User$json = const {
  '1': 'User',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'profile_pic', '3': 3, '4': 1, '5': 12, '10': 'profilePic'},
  ],
};

const Message$json = const {
  '1': 'Message',
  '2': const [
    const {'1': 'sender_id', '3': 1, '4': 1, '5': 9, '10': 'senderId'},
    const {'1': 'target_id', '3': 2, '4': 1, '5': 9, '10': 'targetId'},
    const {'1': 'body', '3': 3, '4': 1, '5': 9, '10': 'body'},
    const {'1': 'timestamp', '3': 4, '4': 1, '5': 9, '10': 'timestamp'},
    const {'1': 'read', '3': 5, '4': 1, '5': 8, '10': 'read'},
  ],
};

const SignupRequest$json = const {
  '1': 'SignupRequest',
  '2': const [
    const {'1': 'user', '3': 1, '4': 1, '5': 11, '6': '.proto.User', '10': 'user'},
  ],
};

const SignupResponse$json = const {
  '1': 'SignupResponse',
  '2': const [
    const {'1': 'done', '3': 1, '4': 1, '5': 8, '10': 'done'},
    const {'1': 'msg', '3': 2, '4': 1, '5': 9, '10': 'msg'},
  ],
};

const AddFriendRequest$json = const {
  '1': 'AddFriendRequest',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
  ],
};

const AddFriendResponse$json = const {
  '1': 'AddFriendResponse',
  '2': const [
    const {'1': 'done', '3': 1, '4': 1, '5': 8, '10': 'done'},
    const {'1': 'user', '3': 2, '4': 1, '5': 11, '6': '.proto.User', '10': 'user'},
    const {'1': 'msg', '3': 3, '4': 1, '5': 9, '10': 'msg'},
  ],
};

