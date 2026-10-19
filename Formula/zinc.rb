# Written by tools/homebrew-formula in Frulko/zinc on each release: do not edit by hand.
class Zinc < Formula
  desc "Strict, typed subset of TypeScript for apps, games and boards"
  homepage "https://github.com/Frulko/zinc"
  version "0.3.1"

  on_macos do
    on_arm do
      url "https://github.com/Frulko/zinc/releases/download/v0.3.1/zinc-0.3.1-macos-arm64.tar.gz"
      sha256 "2ae39a942dc30422367c3803e946ba02e6adca1a64d0f14d5f6e1927ff522cde"
    end
    on_intel do
      url "https://github.com/Frulko/zinc/releases/download/v0.3.1/zinc-0.3.1-macos-x86_64.tar.gz"
      sha256 "00750484d1023f08a10a774c880ccd2cf92a05998516995adf51d6f4f0f87117"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Frulko/zinc/releases/download/v0.3.1/zinc-0.3.1-linux-aarch64.tar.gz"
      sha256 "4f80c9c6d07acd97e260224e4cb22a886c22ca3189eef4c40771806dbb3aaab4"
    end
    on_intel do
      url "https://github.com/Frulko/zinc/releases/download/v0.3.1/zinc-0.3.1-linux-x86_64.tar.gz"
      sha256 "5571fd8851dbf1705dff9af83e3e0a6785a8d37860c6b05c83cadf367ede77ac"
    end
  end

  def install
    # the engine finds its files beside bin/zinc (share/zinc, the plugins' libraries): the whole archive goes in libexec
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/zinc"
  end

  def caveats
    <<~TXT
      Update zinc with: brew upgrade zinc   (zinc update is for the install.sh install)
      Zinc Atelier, the app: https://github.com/Frulko/zinc/releases/latest
    TXT
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/zinc --version")
  end
end
