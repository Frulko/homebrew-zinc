# Written by tools/homebrew-formula in Frulko/zinc on each release: do not edit by hand.
class Zinc < Formula
  desc "Strict, typed subset of TypeScript for apps, games and boards"
  homepage "https://github.com/Frulko/zinc"
  version "0.7.5"

  on_macos do
    on_arm do
      url "https://github.com/Frulko/zinc/releases/download/v0.7.5/zinc-0.7.5-macos-arm64.tar.gz"
      sha256 "e1088f2f39a31bb6b302da8e6fa3e9be74d992e73f35f6db0e1512c5c11eecca"
    end
    on_intel do
      url "https://github.com/Frulko/zinc/releases/download/v0.7.5/zinc-0.7.5-macos-x86_64.tar.gz"
      sha256 "8ceb917a861d6aeb619c4cd5989cb98ee4ef4e0ffe434ff4428664aaf2055f51"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Frulko/zinc/releases/download/v0.7.5/zinc-0.7.5-linux-aarch64.tar.gz"
      sha256 "2c3901f4725937f9932e8a34e69c65475d181120ff7864894d77895ee0b90d79"
    end
    on_intel do
      url "https://github.com/Frulko/zinc/releases/download/v0.7.5/zinc-0.7.5-linux-x86_64.tar.gz"
      sha256 "79dcc9d2a86f26c007992c710ec45e816b8566d5d8300490d314ae6772496c9f"
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
