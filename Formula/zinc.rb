# Written by tools/homebrew-formula in Frulko/zinc on each release: do not edit by hand.
class Zinc < Formula
  desc "Strict, typed subset of TypeScript for apps, games and boards"
  homepage "https://github.com/Frulko/zinc"
  version "0.10.16"

  on_macos do
    on_arm do
      url "https://github.com/Frulko/zinc/releases/download/v0.10.16/zinc-0.10.16-macos-arm64.tar.gz"
      sha256 "183e7d3997ab5986a24a55da819dfca23dbd2df78309bb0a17d0e729583f42d6"
    end
    on_intel do
      url "https://github.com/Frulko/zinc/releases/download/v0.10.16/zinc-0.10.16-macos-x86_64.tar.gz"
      sha256 "62019d757dc83c646d420655bc040071565f4a4bf5f2fd1178523c233081b3bf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Frulko/zinc/releases/download/v0.10.16/zinc-0.10.16-linux-aarch64.tar.gz"
      sha256 "360fdfd7d96381cc3fe86cea12ba5a721bd42fdab9e488e3c0c176e91cbcd317"
    end
    on_intel do
      url "https://github.com/Frulko/zinc/releases/download/v0.10.16/zinc-0.10.16-linux-x86_64.tar.gz"
      sha256 "0f80a0f9aea0b00c33867c4ed0eb9c2e0300e9f44d2e7d9fb9ba24401447ed75"
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
