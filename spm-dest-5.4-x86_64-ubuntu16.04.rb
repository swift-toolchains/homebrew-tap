class SpmDest54X8664Ubuntu1604 < Formula
  
  desc "An Ubuntu 16.04 (Xenial) cross compilation toolchain for Swift 5.4"
  homepage "https://github.com/swift-toolchains/homebrew-tap"
  url "https://swift.org/builds/swift-5.4-release/ubuntu1604/swift-5.4-RELEASE/swift-5.4-RELEASE-ubuntu16.04.tar.gz"
  # curl -L https://swift.org/builds/swift-5.4-release/ubuntu1604/swift-5.4-RELEASE/swift-5.4-RELEASE-ubuntu16.04.tar.gz | shasum -a 256
  sha256 "42c8295d42222af0e12d7410f97c4ceae396c068c0ac98bfb6239b0f901c71d7"
  
  version "5.4.0"
  version_scheme 2
  revision 18
  
  # the respective things are cloned into the X toolchain, hence only required
  # at build time.
  depends_on "swift-toolchains/tap/swift-xctoolchain-5.4" => [:build]
  depends_on "swift-toolchains/tap/host-lld-bin-8"   => [:build, :recommended]
  depends_on "swift-toolchains/tap/clang-llvm-bin-8" => [:build, :optional]

  patch do
    url "https://raw.githubusercontent.com/swift-toolchains/homebrew-tap/main/ubuntu16.04-5.3-2020-11-21-11.patch"
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
