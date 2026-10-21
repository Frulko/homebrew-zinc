# Written by tools/homebrew-formula in Frulko/zinc on each release: do not edit by hand.
class Zinc < Formula
  desc "Strict, typed subset of TypeScript for apps, games and boards"
  homepage "https://github.com/Frulko/zinc"
  version "0.4.3"

  on_macos do
    on_arm do
      url "https://github.com/Frulko/zinc/releases/download/v0.4.3/zinc-0.4.3-macos-arm64.tar.gz"
      sha256 "c20dd10f7c35786bf77e81414746e3991e1412d7d6a337c474eb5a040ff3e2c3"
    end
    on_intel do
      url "https://github.com/Frulko/zinc/releases/download/v0.4.3/zinc-0.4.3-macos-x86_64.tar.gz"
      sha256 "d953cb588faf7f582660db9d17cd5a78b6729ab996118dd211975924bd68fa40"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Frulko/zinc/releases/download/v0.4.3/zinc-0.4.3-linux-aarch64.tar.gz"
      sha256 "1d06d77d46547617882c2e99287cd1cb364d562326819d1c9e53cc51b361885a"
    end
    on_intel do
      url "https://github.com/Frulko/zinc/releases/download/v0.4.3/zinc-0.4.3-linux-x86_64.tar.gz"
      sha256 "9a9da1eb953f685610ed68d794ec306eee7172bbe887f6dc31d622788945722d"
    end
  end

  def install
    # the engine finds its files beside bin/zinc (share/zinc, the plugins' libraries): the whole archive goes in libexec
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/zinc"
  end

  def caveats
    <<~TXT
      Update zinc with: brew update && brew upgrade zinc   (zinc update is for the install.sh install)
      Zinc Atelier, the app: https://github.com/Frulko/zinc/releases/latest
    TXT
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/zinc --version")
  end
end
