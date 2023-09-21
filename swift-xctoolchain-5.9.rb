class SwiftXctoolchain59 < Formula
  
  desc     "A macOS Swift 5.9 toolchain for cross compilation purposes"
  homepage "https://swift.org"
  url      "https://download.swift.org/swift-5.9-release/xcode/swift-5.9-RELEASE/swift-5.9-RELEASE-osx.pkg"
  # curl -L https://download.swift.org/swift-5.6.2-release/xcode/swift-5.6.2-RELEASE/swift-5.6.2-RELEASE-osx.pkg | shasum -a 256
  sha256   "3cf7a4b2f3efcfcb4fef42b6588a7b1c54f7b0f2d0a479f41c3e1620b045f48e"
  
  version "swift-5.9.0"
  version_scheme 2
  revision 20
  
  def install
    system "xar -xf *.pkg"
    system "mkdir", "swift.xctoolchain"
    system "cd swift.xctoolchain && cat ../*.pkg/Payload | gunzip -dc | cpio -i"
    system "mkdir", "-p", "#{prefix}/lib/swift/xctoolchains/x86_64-apple-darwin/5.9"
    system "cp -ac swift.xctoolchain #{prefix}/lib/swift/xctoolchains/x86_64-apple-darwin/5.9/swift.xctoolchain"
    system "ln", "-sf", "#{prefix}/lib/swift/xctoolchains/fat-apple-darwin/5.9", "#{prefix}/lib/swift/xctoolchains/x86_64-apple-darwin/5.9-current"
    system "ln", "-sf", "#{prefix}/lib/swift/xctoolchains/x86_64-apple-darwin/5.9", "#{prefix}/lib/swift/xctoolchains/x86_64-apple-darwin/5.9-current"
  end
end
