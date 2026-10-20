# Written by tools/homebrew-formula in Frulko/zinc on each release: do not edit by hand.
class Zinc < Formula
  desc "Strict, typed subset of TypeScript for apps, games and boards"
  homepage "https://github.com/Frulko/zinc"
  version "0.4.0"

  on_macos do
    on_arm do
      url "https://github.com/Frulko/zinc/releases/download/v0.4.0/zinc-0.4.0-macos-arm64.tar.gz"
      sha256 "b49390728eba97ee27e8d3b1b918fae607030e601977d16d6df488df0a9a4c6b"
    end
    on_intel do
      url "https://github.com/Frulko/zinc/releases/download/v0.4.0/zinc-0.4.0-macos-x86_64.tar.gz"
      sha256 "f691016ea6b84c1dcdf19219d940c792418bd13a97bd8e202991b389946b5f4b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Frulko/zinc/releases/download/v0.4.0/zinc-0.4.0-linux-aarch64.tar.gz"
      sha256 "8c4d4a47c7a59c704ed2e81451f0dbdfc75e26a713bffc51504417ee86bdc232"
    end
    on_intel do
      url "https://github.com/Frulko/zinc/releases/download/v0.4.0/zinc-0.4.0-linux-x86_64.tar.gz"
      sha256 "c753390cb28f6f9921b9733e8e5cda8e23ffa314d2f1ac670f53fcf90f1e1bd3"
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
