# Written by tools/homebrew-formula in Frulko/zinc on each release: do not edit by hand.
class Zinc < Formula
  desc "Strict, typed subset of TypeScript for apps, games and boards"
  homepage "https://github.com/Frulko/zinc"
  version "0.7.4"

  on_macos do
    on_arm do
      url "https://github.com/Frulko/zinc/releases/download/v0.7.4/zinc-0.7.4-macos-arm64.tar.gz"
      sha256 "2a2eb0565d8dea0db2109460fb7438ac45079cca06a78244675784adb9c1ddff"
    end
    on_intel do
      url "https://github.com/Frulko/zinc/releases/download/v0.7.4/zinc-0.7.4-macos-x86_64.tar.gz"
      sha256 "6f56af06955a84774ec1690e7f4f279e4b0b22d1adde165c7dfb7ce6aabf518f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Frulko/zinc/releases/download/v0.7.4/zinc-0.7.4-linux-aarch64.tar.gz"
      sha256 "fb009bec8ff0b8ee1b2a39cdb2de2e6f04c7a63b2c8a597177192feb8fe768d1"
    end
    on_intel do
      url "https://github.com/Frulko/zinc/releases/download/v0.7.4/zinc-0.7.4-linux-x86_64.tar.gz"
      sha256 "1e1e515d62b4636d5dd03c1b8103de0e5756a309171311e5fdb1b2d36895e372"
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
