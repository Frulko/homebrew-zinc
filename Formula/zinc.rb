# Written by tools/homebrew-formula in Frulko/zinc on each release: do not edit by hand.
class Zinc < Formula
  desc "Strict, typed subset of TypeScript for apps, games and boards"
  homepage "https://github.com/Frulko/zinc"
  version "0.5.2"

  on_macos do
    on_arm do
      url "https://github.com/Frulko/zinc/releases/download/v0.5.2/zinc-0.5.2-macos-arm64.tar.gz"
      sha256 "47c21d06609214534a034a0d39b8f87f61ff0d325d342eabe6bb834e5dc0994c"
    end
    on_intel do
      url "https://github.com/Frulko/zinc/releases/download/v0.5.2/zinc-0.5.2-macos-x86_64.tar.gz"
      sha256 "5f97ab2f7d5b77b37ec3d689cd3d33c69818325b5e624ba8d8223ee225c9d2a6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Frulko/zinc/releases/download/v0.5.2/zinc-0.5.2-linux-aarch64.tar.gz"
      sha256 "f2f70c142b6ac54d885575451af17af0d1684788732b2c680e50fd9af52739da"
    end
    on_intel do
      url "https://github.com/Frulko/zinc/releases/download/v0.5.2/zinc-0.5.2-linux-x86_64.tar.gz"
      sha256 "c5b5576615c35e002ae5faa5c9e4636bf6784a735548f5bf74dcec622b492e81"
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
