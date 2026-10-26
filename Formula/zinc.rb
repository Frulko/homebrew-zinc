# Written by tools/homebrew-formula in Frulko/zinc on each release: do not edit by hand.
class Zinc < Formula
  desc "Strict, typed subset of TypeScript for apps, games and boards"
  homepage "https://github.com/Frulko/zinc"
  version "0.9.1"

  on_macos do
    on_arm do
      url "https://github.com/Frulko/zinc/releases/download/v0.9.1/zinc-0.9.1-macos-arm64.tar.gz"
      sha256 "3118247c5fb5ff4ba743f455d1c4573379ea7e4fc4f0085992b8dfd5efea7517"
    end
    on_intel do
      url "https://github.com/Frulko/zinc/releases/download/v0.9.1/zinc-0.9.1-macos-x86_64.tar.gz"
      sha256 "bdfcc89db02d99a24920993e27a100c05bfcb93164a7ddc67b2e1365ad666e19"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Frulko/zinc/releases/download/v0.9.1/zinc-0.9.1-linux-aarch64.tar.gz"
      sha256 "2bf2d6f52126bb8e0e1383846016de5d8b3685568a1d610f0190e17cf4d4baa2"
    end
    on_intel do
      url "https://github.com/Frulko/zinc/releases/download/v0.9.1/zinc-0.9.1-linux-x86_64.tar.gz"
      sha256 "3aecea3dafbc319464965b3ab765a0a31221af75545b0edeea8fbfec55b90b4c"
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
