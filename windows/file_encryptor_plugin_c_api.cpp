#include "include/file_encryptor/file_encryptor_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "file_encryptor_plugin.h"

void FileEncryptorPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  file_encryptor::FileEncryptorPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
