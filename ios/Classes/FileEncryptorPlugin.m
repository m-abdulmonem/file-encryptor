#import "FileEncryptorPlugin.h"
#if __has_include(<file_encryptor/file_encryptor-Swift.h>)
#import <file_encryptor/file_encryptor-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "file_encryptor-Swift.h"
#endif

@implementation FileEncryptorPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFileEncryptorPlugin registerWithRegistrar:registrar];
}
@end
