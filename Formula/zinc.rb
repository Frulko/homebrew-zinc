# Written by tools/homebrew-formula in Frulko/zinc on each release: do not edit by hand.
class Zinc < Formula
  desc "Strict, typed subset of TypeScript for apps, games and boards"
  homepage "https://github.com/Frulko/zinc"
  version "0.6.2"

  on_macos do
    on_arm do
      url "https://github.com/Frulko/zinc/releases/download/v0.6.2/zinc-0.6.2-macos-arm64.tar.gz"
      sha256 "bfa118e52402689e47377ec192384e05ddc6be8725cbd120895a254fe7dcac51"
    end
    on_intel do
      url "https://github.com/Frulko/zinc/releases/download/v0.6.2/zinc-0.6.2-macos-x86_64.tar.gz"
      sha256 "d9f92ce62333fbd0f181af1370b54bbcbda295f07f272201f6d11a353fe8a847"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Frulko/zinc/releases/download/v0.6.2/zinc-0.6.2-linux-aarch64.tar.gz"
      sha256 "498df42b4e4ff24327602d59145df9f4b442b0237a3ffa27dd519f2c1bebe0bb"
    end
    on_intel do
      url "https://github.com/Frulko/zinc/releases/download/v0.6.2/zinc-0.6.2-linux-x86_64.tar.gz"
      sha256 "2aadac3316f0ee41fff180999e4493fa3552d010558be4a101c676b27722202f"
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
