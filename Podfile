# Uncomment the next line to define a global platform for your project
platform :ios, '12.2'

target 'TestRealm' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for TestRealm
  #pod 'RealmSwift', '3.16.1'
  pod 'Realm', git: 'https://github.com/realm/realm-cocoa.git', branch: 'tg/xcode-11-b1', submodules: true
  pod 'RealmSwift', git: 'https://github.com/realm/realm-cocoa.git', branch: 'tg/xcode-11-b1', submodules: true

  target 'TestRealmTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'TestRealmUITests' do
    inherit! :search_paths
    # Pods for testing
  end

end
