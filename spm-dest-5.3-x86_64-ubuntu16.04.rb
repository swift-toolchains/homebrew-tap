class SpmDest53X8664Ubuntu1604 < Formula
  
  desc "An Ubuntu 16.04 (Xenial) cross compilation toolchain for Swift 5.3.3"
  homepage "https://github.com/swift-toolchains/homebrew-tap"
  url "https://swift.org/builds/swift-5.3.3-release/ubuntu1604/swift-5.3.3-RELEASE/swift-5.3.3-RELEASE-ubuntu16.04.tar.gz"
  # curl -L https://swift.org/builds/swift-5.3.3-release/ubuntu1604/swift-5.3.3-RELEASE/swift-5.3.3-RELEASE-ubuntu16.04.tar.gz | shasum -a 256
  sha256 "2ba0b650b6d510b291d4dab355c8670022ee28f6ca6a0da2a78e708c49bb5b11"
  
  version "5.3.3"
  version_scheme 2
  revision 13
  
  # the respective things are cloned into the X toolchain, hence only required
  # at build time.
  depends_on "swift-toolchains/tap/swift-xctoolchain-5.3" => [:build]
  depends_on "swift-toolchains/tap/host-lld-bin-8"   => [:build, :recommended]
  depends_on "swift-toolchains/tap/clang-llvm-bin-8" => [:build, :optional]

  patch do
    url "https://helgehess.eu/patches/ubuntu16.04-5.3-2020-11-21-11.patch"
    sha256 "97ab5a610188487681360032b64e90834cbdbf5a753ddac339bf72d0d2619269"
  end
  
  def install
    ENV.deparallelize
    system "chmod", "+x", "build-toolchain.sh"
    system "chmod", "+x", "retrieve-sdk-packages.sh"
    system "make", \
           "prefix=#{prefix}", \
           "ACTUAL_DESTINATION_PREFIX=#{HOMEBREW_PREFIX}", \
           "SWIFT_LIB_DIR=#{HOMEBREW_PREFIX}/lib/swift", \
           "install"
  end
end
