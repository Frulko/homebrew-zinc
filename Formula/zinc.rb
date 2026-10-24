# Written by tools/homebrew-formula in Frulko/zinc on each release: do not edit by hand.
class Zinc < Formula
  desc "Strict, typed subset of TypeScript for apps, games and boards"
  homepage "https://github.com/Frulko/zinc"
  version "0.7.3"

  on_macos do
    on_arm do
      url "https://github.com/Frulko/zinc/releases/download/v0.7.3/zinc-0.7.3-macos-arm64.tar.gz"
      sha256 "342dcbfb9eeea1777243c553c6cfff6068c1fc649468c9d412d339b40767c101"
    end
    on_intel do
      url "https://github.com/Frulko/zinc/releases/download/v0.7.3/zinc-0.7.3-macos-x86_64.tar.gz"
      sha256 "b0bf6636994d5fe4425193d83622b7c1de3cc803e73b9b221860603a6f014f6a"
    end
  end

  on_linux do


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
