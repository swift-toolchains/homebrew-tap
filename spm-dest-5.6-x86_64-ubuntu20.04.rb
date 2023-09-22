class SpmDest56X8664Ubuntu2004 < Formula
  
  desc "An Ubuntu 20.04 (Focal) cross compilation toolchain for Swift 5.6"
  homepage "https://github.com/swift-toolchains/homebrew-tap"
  url "https://download.swift.org/swift-5.6.2-release/ubuntu2004/swift-5.6.2-RELEASE/swift-5.6.2-RELEASE-ubuntu20.04.tar.gz"
  # curl -L https://download.swift.org/swift-5.6.2-release/ubuntu2004/swift-5.6.2-RELEASE/swift-5.6.2-RELEASE-ubuntu20.04.tar.gz | shasum -a 256
  sha256 "ac1c711985113d0d9daf7bf80205935a0688fb146546690d93c23df54d81cfb7"
  
  version "5.6.2"
  version_scheme 2
  revision 20
  
  # the respective things are cloned into the X toolchain, hence only required
  # at build time.
  depends_on "swift-toolchains/tap/swift-xctoolchain-5.6" => [:build]
  depends_on "swift-toolchains/tap/host-lld-bin-8"   => [:build, :recommended]
  depends_on "swift-toolchains/tap/clang-llvm-bin-8" => [:build, :optional]

  patch do
    url "https://raw.githubusercontent.com/swift-toolchains/homebrew-tap/main/spm-dest-5.6-x86_64-ubuntu20.04.patch"
    sha256 "498efc5406d684a0628a7d062352406c4e0202085ce7d6955e516d064207d36d"
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
