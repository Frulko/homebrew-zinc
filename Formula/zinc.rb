# Written by tools/homebrew-formula in Frulko/zinc on each release: do not edit by hand.
class Zinc < Formula
  desc "Strict, typed subset of TypeScript for apps, games and boards"
  homepage "https://github.com/Frulko/zinc"
  version "0.4.2"

  on_macos do
    on_arm do
      url "https://github.com/Frulko/zinc/releases/download/v0.4.2/zinc-0.4.2-macos-arm64.tar.gz"
      sha256 "9898858649478f0e59924be115dec31ad15fe03ff6c3a021e10917f43ff95a74"
    end
    on_intel do
      url "https://github.com/Frulko/zinc/releases/download/v0.4.2/zinc-0.4.2-macos-x86_64.tar.gz"
      sha256 "619886ef32ed4d99d8a42e246e3f7661a3edaaa60bd51a068deb4968ce03ee47"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Frulko/zinc/releases/download/v0.4.2/zinc-0.4.2-linux-aarch64.tar.gz"
      sha256 "e6f31127e57f510ea83eaf08eb847bb4c0c35a70b38cecf5e778c44a47246095"
    end
    on_intel do
      url "https://github.com/Frulko/zinc/releases/download/v0.4.2/zinc-0.4.2-linux-x86_64.tar.gz"
      sha256 "889eb8b630bf1dd157ceda87b97f6a98ad6037b5009d8dcb2cd4ff59c24acaca"
    end
  end

  def install
    # the engine finds its files beside bin/zinc (share/zinc, the plugins' libraries): the whole archive goes in libexec
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/zinc"
  end

  def caveats
    <<~TXT
      Update zinc with: brew upgrade zinc   (zinc update is for the install.sh install)
      Zinc Atelier, the app: https://github.com/Frulko/zinc/releases/latest
    TXT
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/zinc --version")
  end
end
