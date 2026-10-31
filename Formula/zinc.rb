# Written by tools/homebrew-formula in Frulko/zinc on each release: do not edit by hand.
class Zinc < Formula
  desc "Strict, typed subset of TypeScript for apps, games and boards"
  homepage "https://github.com/Frulko/zinc"
  version "0.10.6"

  on_macos do
    on_arm do
      url "https://github.com/Frulko/zinc/releases/download/v0.10.6/zinc-0.10.6-macos-arm64.tar.gz"
      sha256 "f8c1b039f4c352e226ebb1eebdbd5c72b5f5be3640fd690e22b18ca60bf76448"
    end
    on_intel do
      url "https://github.com/Frulko/zinc/releases/download/v0.10.6/zinc-0.10.6-macos-x86_64.tar.gz"
      sha256 "6685d67dff51b5c4c7a43f30a0b01e770db02269feb8f7ccc3daa4dd19798fbe"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Frulko/zinc/releases/download/v0.10.6/zinc-0.10.6-linux-aarch64.tar.gz"
      sha256 "0433857972eebb5a915cfdebd7b3540cf1dc833a2b6dd63011d45ee85793fdcd"
    end
    on_intel do
      url "https://github.com/Frulko/zinc/releases/download/v0.10.6/zinc-0.10.6-linux-x86_64.tar.gz"
      sha256 "cab888be99cd65d9527c0368dcc49293b94a1eef273a422d2f23e03c98ef6e65"
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
