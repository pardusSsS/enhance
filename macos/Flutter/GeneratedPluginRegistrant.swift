//
//  Generated file. Do not edit.
//

import FlutterMacOS
import Foundation

import assets_audio_player
import assets_audio_player_web
import cloud_firestore
import file_selector_macos
import firebase_analytics
import firebase_auth
import firebase_core
import path_provider_foundation
import sqflite

func RegisterGeneratedPlugins(registry: FlutterPluginRegistry) {
  AssetsAudioPlayerPlugin.register(with: registry.registrar(forPlugin: "AssetsAudioPlayerPlugin"))
  AssetsAudioPlayerWebPlugin.register(with: registry.registrar(forPlugin: "AssetsAudioPlayerWebPlugin"))
  FLTFirebaseFirestorePlugin.register(with: registry.registrar(forPlugin: "FLTFirebaseFirestorePlugin"))
  FileSelectorPlugin.register(with: registry.registrar(forPlugin: "FileSelectorPlugin"))
  FLTFirebaseAnalyticsPlugin.register(with: registry.registrar(forPlugin: "FLTFirebaseAnalyticsPlugin"))
  FLTFirebaseAuthPlugin.register(with: registry.registrar(forPlugin: "FLTFirebaseAuthPlugin"))
  FLTFirebaseCorePlugin.register(with: registry.registrar(forPlugin: "FLTFirebaseCorePlugin"))
  PathProviderPlugin.register(with: registry.registrar(forPlugin: "PathProviderPlugin"))
  SqflitePlugin.register(with: registry.registrar(forPlugin: "SqflitePlugin"))
}
