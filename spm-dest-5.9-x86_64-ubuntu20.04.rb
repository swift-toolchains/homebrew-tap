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
  depends_on "swift-toolchains/tap/host-lld-bin-14"   => [:build, :recommended]
  depends_on "swift-toolchains/tap/clang-llvm-bin-14" => [:build, :optional]

  patch do
    url "https://raw.githubusercontent.com/swift-toolchains/homebrew-tap/main/spm-dest-5.9-x86_64-ubuntu20.04.patch"
    sha256 "e4ce3c1fc0be4847b8141f19d03d9ae671cb990c61c21a141b3d2f808589830e"
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
