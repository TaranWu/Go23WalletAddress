#
# Be sure to run `pod lib lint Go23WalletAddress.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'Go23WalletAddress'
  s.version          = '1.0.1'
  s.summary          = 'Go23Wallet Address library'

  s.description      = 'Go23Wallet Address functionality'
  s.homepage         = '  https://github.com/TaranWu/Go23WalletAddress'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Taran' => 'NA' }
  s.source           = { :git => 'https://github.com/TaranWu/Go23WalletAddress.git', :tag => s.version.to_s }
  
  s.ios.deployment_target = '13.0'
  s.swift_version    = '5.0'
  s.platform         = :ios, "13.0"
  s.source_files = 'Go23WalletAddress/Classes/**/*'
  
  s.frameworks       = 'Foundation'

  s.dependency 'Go23TrustKeystore'
  s.dependency 'Go23Web3Swift'
  s.dependency 'Go23EthereumAddress'
  s.dependency 'Go23WalletCore'
  
  # s.resource_bundles = {
  #   'Go23WalletAddress' => ['Go23WalletAddress/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'

end
