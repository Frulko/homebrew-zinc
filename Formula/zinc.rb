# Written by tools/homebrew-formula in Frulko/zinc on each release: do not edit by hand.
class Zinc < Formula
  desc "Strict, typed subset of TypeScript for apps, games and boards"
  homepage "https://github.com/Frulko/zinc"
  version "0.8.2"

  on_macos do
    on_arm do
      url "https://github.com/Frulko/zinc/releases/download/v0.8.2/zinc-0.8.2-macos-arm64.tar.gz"
      sha256 "5baf43ff8211731e6ff261162ae7e44b64af58a7b2c702ff035aa7ba88c61125"
    end
    on_intel do
      url "https://github.com/Frulko/zinc/releases/download/v0.8.2/zinc-0.8.2-macos-x86_64.tar.gz"
      sha256 "349c1d2417b1980ac0eb1bfb68c86e393d8353c2d954f7d1427b0ae9e35a93e5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Frulko/zinc/releases/download/v0.8.2/zinc-0.8.2-linux-aarch64.tar.gz"
      sha256 "d153f756cded202912e67c53aac5839e3892f929d0e05de5f67a513dd6308dce"
    end
    on_intel do
      url "https://github.com/Frulko/zinc/releases/download/v0.8.2/zinc-0.8.2-linux-x86_64.tar.gz"
      sha256 "fab0a57e906d1528de76e9bd9e261101c71d3694e891459b9cbebe49e5e17966"
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
        1. zinc new   make a project (it asks what to make)
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
