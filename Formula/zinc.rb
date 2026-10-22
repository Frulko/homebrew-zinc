# Written by tools/homebrew-formula in Frulko/zinc on each release: do not edit by hand.
class Zinc < Formula
  desc "Strict, typed subset of TypeScript for apps, games and boards"
  homepage "https://github.com/Frulko/zinc"
  version "0.6.0"

  on_macos do
    on_arm do
      url "https://github.com/Frulko/zinc/releases/download/v0.6.0/zinc-0.6.0-macos-arm64.tar.gz"
      sha256 "aff34dd8b7944dd4a11d79fd3509fb60c5740e90236e8014f3d8032460948a53"
    end
    on_intel do
      url "https://github.com/Frulko/zinc/releases/download/v0.6.0/zinc-0.6.0-macos-x86_64.tar.gz"
      sha256 "575433c48fd27edf25184b551d06abc69c5e6d49a3ecaa8b4a0d42de1509b8ad"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Frulko/zinc/releases/download/v0.6.0/zinc-0.6.0-linux-aarch64.tar.gz"
      sha256 "784dbd4ce931af58a686ea00d62fb1374c26b748ea3583a2bd4ee448535353cf"
    end
    on_intel do
      url "https://github.com/Frulko/zinc/releases/download/v0.6.0/zinc-0.6.0-linux-x86_64.tar.gz"
      sha256 "1915619028793303e5ebedb3284526ef19c4381d2de4e5b3174fcc8a40753123"
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
