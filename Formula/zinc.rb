# Written by tools/homebrew-formula in Frulko/zinc on each release: do not edit by hand.
class Zinc < Formula
  desc "Strict, typed subset of TypeScript for apps, games and boards"
  homepage "https://github.com/Frulko/zinc"
  version "0.7.6"

  on_macos do
    on_arm do
      url "https://github.com/Frulko/zinc/releases/download/v0.7.6/zinc-0.7.6-macos-arm64.tar.gz"
      sha256 "588307a1f5feac9e3df4318279f1d59ea3c575c4cd6272c61df5a78bc76f4e23"
    end
    on_intel do
      url "https://github.com/Frulko/zinc/releases/download/v0.7.6/zinc-0.7.6-macos-x86_64.tar.gz"
      sha256 "e72c31f991dbcc2ccd29553a3c94d9fad070161b8ab9c689e55fa8387104e620"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Frulko/zinc/releases/download/v0.7.6/zinc-0.7.6-linux-aarch64.tar.gz"
      sha256 "cb00f28fce85344a81360e535fbab7653e9a484041f17a63d11edce499583ce2"
    end
    on_intel do
      url "https://github.com/Frulko/zinc/releases/download/v0.7.6/zinc-0.7.6-linux-x86_64.tar.gz"
      sha256 "3a412406aae12ce7e8636969ae71e15ca481b6b7f41ce92ed8113f063292fc6b"
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
