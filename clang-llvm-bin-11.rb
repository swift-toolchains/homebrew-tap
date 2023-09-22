class ClangLlvmBin11 < Formula

  desc "Prebuilt CLang and LLVM 11.0.0 for cross compilation purposes."
  homepage "https://releases.llvm.org"
  url "https://github.com/llvm/llvm-project/releases/download/llvmorg-11.0.0/clang+llvm-11.0.0-x86_64-apple-darwin.tar.xz"
  sha256 "b93886ab0025cbbdbb08b46e5e403a462b0ce034811c929e96ed66c2b07fe63a"

  conflicts_with "swift-toolchains/tap/host-lld-bin-8", :because => "host-lld-bin-8 also ships `lld`"

  # This patch is for adding the Makefile which does the installation
  patch do
    url "https://raw.githubusercontent.com/swift-toolchains/homebrew-tap/main/clang-llvm-11.0.0-makefile.patch"
    sha256 "da20eaef7621692061aff87cd70acffe1b9bc407e0eca74cf5314c8345ac0041"
  end
  
  def install
    system "make", "prefix=#{prefix}", "VERSION=11.0.0", "install"
  end
end
