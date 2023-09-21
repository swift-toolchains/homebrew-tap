class SpmDest59X8664Ubuntu2004 < Formula
  
  desc "An Ubuntu 20.04 (Focal) cross compilation toolchain for Swift 5.9"
  homepage "https://github.com/swift-toolchains/homebrew-tap"
  url "https://download.swift.org/swift-5.9-release/ubuntu2004/swift-5.9-RELEASE/swift-5.9-RELEASE-ubuntu20.04.tar.gz"
  # curl -L https://download.swift.org/swift-5.9-release/ubuntu2004/swift-5.9-RELEASE/swift-5.9-RELEASE-ubuntu20.04.tar.gz | shasum -a 256
  sha256 "5fca0c384a1cdf9b3d4f71bcab5ff27aaee25f4bc09a134b16fa7fcf34e34c45"
  
  version "5.9.0"
  version_scheme 2
  revision 20
  
  # the respective things are cloned into the X toolchain, hence only required
  # at build time.
  depends_on "swift-toolchains/tap/swift-xctoolchain-5.9" => [:build]
  depends_on "swift-toolchains/tap/host-lld-bin-8"   => [:build, :recommended]
  depends_on "swift-toolchains/tap/clang-llvm-bin-8" => [:build, :optional]

  #patch do
    #url "https://helgehess.eu/patches/ubuntu20.04-5.6-2022-07-01-1.patch"
    #sha256 "83e0b7ea4aa7145b681aee0cbf9fc50676970b9305c749596c7e5a1a43796695"
  #end
  
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
