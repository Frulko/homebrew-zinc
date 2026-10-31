# Written by tools/homebrew-formula in Frulko/zinc on each release: do not edit by hand.
class Zinc < Formula
  desc "Strict, typed subset of TypeScript for apps, games and boards"
  homepage "https://github.com/Frulko/zinc"
  version "0.10.13"

  on_macos do
    on_arm do
      url "https://github.com/Frulko/zinc/releases/download/v0.10.13/zinc-0.10.13-macos-arm64.tar.gz"
      sha256 "d4eac1d31eb0cdba57e8aa48125f546075c9c4162a88184463f5a81024b803dc"
    end
    on_intel do
      url "https://github.com/Frulko/zinc/releases/download/v0.10.13/zinc-0.10.13-macos-x86_64.tar.gz"
      sha256 "5b622cff54bda972edec18037d16a09e39d2bb8b34b88610a368aaf6effd8c1a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Frulko/zinc/releases/download/v0.10.13/zinc-0.10.13-linux-aarch64.tar.gz"
      sha256 "bd41fd33b2e99e89108d0d4ab0ec1395b1ce01fffddacfdfa490ca35c997bb38"
    end
    on_intel do
      url "https://github.com/Frulko/zinc/releases/download/v0.10.13/zinc-0.10.13-linux-x86_64.tar.gz"
      sha256 "41d46b4d49e7bd7b45a09826b5ce8ea990943bce22f5be7a8cb32c700363f78b"
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
