class HostLldBin14 < Formula

  desc "Prebuilt LLVM lld 14.0.0 for cross compilation purposes."
  homepage "https://github.com/swift-toolchains/host-lld"
  url "https://github.com/swift-toolchains/host-lld/raw/main/x86_64-apple-darwin/14.0.0/lld"
  sha256 "4213f2bfc1ac02dcb5a41fcfa34324788b45e75a37c86e594ecc72db5f35d4a2"

  conflicts_with "swift-toolchains/tap/clang-llvm-bin-14", :because => "clang-llvm-bin-14 also ships `lld`"

  def install
    system "mkdir", "-p", "#{prefix}/lib/swift/clang-llvm/x86_64-apple-darwin/14.0.0/bin"
    system "cp", "-ac", "lld", "#{prefix}/lib/swift/clang-llvm/x86_64-apple-darwin/14.0.0/bin/"
  end
end
