# Written by tools/homebrew-formula in Frulko/zinc on each release: do not edit by hand.
class Zinc < Formula
  desc "Strict, typed subset of TypeScript for apps, games and boards"
  homepage "https://github.com/Frulko/zinc"
  version "0.10.18"

  on_macos do
    on_arm do
      url "https://github.com/Frulko/zinc/releases/download/v0.10.18/zinc-0.10.18-macos-arm64.tar.gz"
      sha256 "3efc93dc1f5dc48000256f0b2aadae9c2818b70306f559cb4b1b318ecc7f1f92"
    end
    on_intel do
      url "https://github.com/Frulko/zinc/releases/download/v0.10.18/zinc-0.10.18-macos-x86_64.tar.gz"
      sha256 "3e8e850ef00c3afe58274052e2f17f5017d745068dccfaf3a8817f0db24c22b0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Frulko/zinc/releases/download/v0.10.18/zinc-0.10.18-linux-aarch64.tar.gz"
      sha256 "544e2f110fca97d525b6b00a3104e564f85ad4a72751e9b871ad5acd5e04e1fd"
    end
    on_intel do
      url "https://github.com/Frulko/zinc/releases/download/v0.10.18/zinc-0.10.18-linux-x86_64.tar.gz"
      sha256 "576e21ee29cc2f11a56f187bc6a674166b6175c6683c5a5fd67edc5cef3a6393"
    end
  end

  def install
    # the engine finds its files beside bin/zinc (share/zinc, the plugins' libraries): the whole archive goes in libexec
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/zinc"
  end

  def caveats
    # the end of install.sh and install.ps1 (zinc --next-steps in English; tests/t1/first_run.sh keeps the two equal)
    <<~TXT
      Three steps to start:
        1. zinc new   make a project (a game in my-game, with no question)
        2. zinc dev   in the project's folder: runs it, every save shows at once
        3. zinc tour  a guided first walk
      Learn to draw and react to the keyboard and mouse: https://frulko.github.io/zinc/docs/learn/
      The guide: https://frulko.github.io/zinc/docs/guide/01-getting-started/
      Is this machine ready? zinc doctor tells you.

      Update zinc with: brew update && brew upgrade zinc   (zinc update is for the install.sh install)
      Zinc Atelier, the app: https://github.com/Frulko/zinc/releases/latest
    TXT
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/zinc --version")
  end
end
