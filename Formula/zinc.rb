# Written by tools/homebrew-formula in Frulko/zinc on each release: do not edit by hand.
class Zinc < Formula
  desc "Strict, typed subset of TypeScript for apps, games and boards"
  homepage "https://github.com/Frulko/zinc"
  version "0.11.5"

  on_macos do
    on_arm do
      url "https://github.com/Frulko/zinc/releases/download/v0.11.5/zinc-0.11.5-macos-arm64.tar.gz"
      sha256 "77f4985b2218f30e57d4c9046ff6b170e673fbdc05a4b124da21a0b9cdd4e3b6"
    end
    on_intel do
      url "https://github.com/Frulko/zinc/releases/download/v0.11.5/zinc-0.11.5-macos-x86_64.tar.gz"
      sha256 "0c56bc0f984fd8ad16dea30b38d10d13ecce8526260f0b1058efefa93202b32b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Frulko/zinc/releases/download/v0.11.5/zinc-0.11.5-linux-aarch64.tar.gz"
      sha256 "7dccd7acf735f02b00ccd9474834a95f8415f7df4b278dfa530c148016441a6f"
    end
    on_intel do
      url "https://github.com/Frulko/zinc/releases/download/v0.11.5/zinc-0.11.5-linux-x86_64.tar.gz"
      sha256 "5fe1265edeb1d4aaf57a2c2ef35b8ac589c46b334ca66ffe46c68aac92a8bcd8"
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
