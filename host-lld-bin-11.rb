class HostLldBin11 < Formula

  desc "Prebuilt LLVM lld 11.0.0 for cross compilation purposes."
  homepage "https://github.com/swift-toolchains/host-lld"
  url "https://github.com/swift-toolchains/host-lld/raw/main/x86_64-apple-darwin/11.0.0/lld"
  sha256 "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"

  conflicts_with "swift-toolchains/tap/clang-llvm-bin-11", :because => "clang-llvm-bin-11 also ships `lld`"

  def install
    system "mkdir", "-p", "#{prefix}/lib/swift/clang-llvm/x86_64-apple-darwin/11.0.0/bin"
    system "cp", "-ac", "lld", "#{prefix}/lib/swift/clang-llvm/x86_64-apple-darwin/11.0.0/bin/"
  end
end
