class ClangLlvmBin14 < Formula

  desc "Prebuilt CLang and LLVM 14.0.0 for cross compilation purposes."
  homepage "https://releases.llvm.org"
  url "https://github.com/llvm/llvm-project/releases/download/llvmorg-14.0.0/clang+llvm-14.0.0-x86_64-apple-darwin.tar.xz"
  sha256 "cf5af0f32d78dcf4413ef6966abbfd5b1445fe80bba57f2ff8a08f77e672b9b3"

  conflicts_with "swift-toolchains/tap/host-lld-bin-14", :because => "host-lld-bin-14 also ships `lld`"

  # This patch is for adding the Makefile which does the installation
  patch do
    url "https://raw.githubusercontent.com/swift-toolchains/homebrew-tap/main/clang-llvm-14.0.0-makefile.patch"
    sha256 "9eeb46671393eed6ad814fe3e4cc89c5aa1892fe1b1d0f0017fc85888cc99648"
  end
  
  def install
    system "make", "prefix=#{prefix}", "VERSION=14.0.0", "install"
  end
end
