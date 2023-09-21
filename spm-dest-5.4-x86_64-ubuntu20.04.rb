class SpmDest54X8664Ubuntu2004 < Formula
  
  desc "An Ubuntu 20.04 (Focal) cross compilation toolchain for Swift 5.4"
  homepage "https://github.com/swift-toolchains/homebrew-tap"
  url "https://swift.org/builds/swift-5.4-release/ubuntu2004/swift-5.4-RELEASE/swift-5.4-RELEASE-ubuntu20.04.tar.gz"
  # curl -L https://swift.org/builds/swift-5.4-release/ubuntu2004/swift-5.4-RELEASE/swift-5.4-RELEASE-ubuntu20.04.tar.gz | shasum -a 256
  sha256 "751ea4f939612c705e09f6da9bc45aac8d918956429c97274c806a99ac3b03c4"
  
  version "5.4.0"
  version_scheme 2
  revision 18
  
  # the respective things are cloned into the X toolchain, hence only required
  # at build time.
  depends_on "swift-toolchains/tap/swift-xctoolchain-5.4" => [:build]
  depends_on "swift-toolchains/tap/host-lld-bin-8"   => [:build, :recommended]
  depends_on "swift-toolchains/tap/clang-llvm-bin-8" => [:build, :optional]

  patch do
    url "https://raw.githubusercontent.com/swift-toolchains/homebrew-tap/main/spm-dest-5.4-x86_64-ubuntu20.04.patch"
    sha256 "88e3200a8deed8ea2d5644c3f8f70ea15af78b77f64eaf001411c69106d72f46"
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
