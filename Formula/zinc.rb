# Written by tools/homebrew-formula in Frulko/zinc on each release: do not edit by hand.
class Zinc < Formula
  desc "Strict, typed subset of TypeScript for apps, games and boards"
  homepage "https://github.com/Frulko/zinc"
  version "0.10.15"

  on_macos do
    on_arm do
      url "https://github.com/Frulko/zinc/releases/download/v0.10.15/zinc-0.10.15-macos-arm64.tar.gz"
      sha256 "33f153e32c9af840f2b7853e62a5a293315f8ad0fb04bce91bf8529429b6683b"
    end
    on_intel do
      url "https://github.com/Frulko/zinc/releases/download/v0.10.15/zinc-0.10.15-macos-x86_64.tar.gz"
      sha256 "ca3d442b2671056d34c7953bb002b25ee7765f5414aa416aef902f62804f1e70"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Frulko/zinc/releases/download/v0.10.15/zinc-0.10.15-linux-aarch64.tar.gz"
      sha256 "19b5b28555fc567addaa5bece52906ba9a2b5a887ad5a47a0b6005e03383532e"
    end
    on_intel do
      url "https://github.com/Frulko/zinc/releases/download/v0.10.15/zinc-0.10.15-linux-x86_64.tar.gz"
      sha256 "670c6d9bdd205719787de415c10e86b6a6d7bd6ee07d60dad261a1c2e5349dd7"
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
