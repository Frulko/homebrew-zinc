# Written by tools/homebrew-formula in Frulko/zinc on each release: do not edit by hand.
class Zinc < Formula
  desc "Strict, typed subset of TypeScript for apps, games and boards"
  homepage "https://github.com/Frulko/zinc"
  version "0.6.1"

  on_macos do
    on_arm do
      url "https://github.com/Frulko/zinc/releases/download/v0.6.1/zinc-0.6.1-macos-arm64.tar.gz"
      sha256 "2ba7d71e0c9b8373ded9237b6369de46fd8d44c765d3672d7fc8a355e4dced4b"
    end
    on_intel do
      url "https://github.com/Frulko/zinc/releases/download/v0.6.1/zinc-0.6.1-macos-x86_64.tar.gz"
      sha256 "a5c8c4d9d6e98bf8085a6b348133c965d294e3c148900e13748c2daab94b93dd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Frulko/zinc/releases/download/v0.6.1/zinc-0.6.1-linux-aarch64.tar.gz"
      sha256 "84414610b0bf93d1faae99f30c45bdd990d7e54a533e16d259db0ae14b6274ac"
    end
    on_intel do
      url "https://github.com/Frulko/zinc/releases/download/v0.6.1/zinc-0.6.1-linux-x86_64.tar.gz"
      sha256 "d8d0d9f993f7d81e8bbcf1aa5e216c25de3285b87a4fb1f30cee484fb21ed6b2"
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
