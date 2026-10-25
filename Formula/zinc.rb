# Written by tools/homebrew-formula in Frulko/zinc on each release: do not edit by hand.
class Zinc < Formula
  desc "Strict, typed subset of TypeScript for apps, games and boards"
  homepage "https://github.com/Frulko/zinc"
  version "0.8.0"

  on_macos do
    on_arm do
      url "https://github.com/Frulko/zinc/releases/download/v0.8.0/zinc-0.8.0-macos-arm64.tar.gz"
      sha256 "0119a60e16bbc2baa58d8c5f09773c641c3b14a68f6b4e161455e8e1070c296e"
    end
    on_intel do
      url "https://github.com/Frulko/zinc/releases/download/v0.8.0/zinc-0.8.0-macos-x86_64.tar.gz"
      sha256 "167bec75f4f37709002c674731e11c0772958e2eeefd3bbd3e96ba7d58f43d76"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Frulko/zinc/releases/download/v0.8.0/zinc-0.8.0-linux-aarch64.tar.gz"
      sha256 "57bb85677a3086b5e37ae416796b37dff8ce6dfd5fe933aa52195e2ddb49947e"
    end
    on_intel do
      url "https://github.com/Frulko/zinc/releases/download/v0.8.0/zinc-0.8.0-linux-x86_64.tar.gz"
      sha256 "d706f88a978800a094ece999fdc9ae70ae9b604b01f5cad5c029121a04aa2c6d"
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
