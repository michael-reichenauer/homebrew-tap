# The Homebrew formula of gmd, written by scripts/brewformula in michael-reichenauer/gmd for every
# release, so a change made here is overwritten by the next one
class Gmd < Formula
  desc "Git client for the terminal that shows only the branches you choose"
  homepage "https://github.com/michael-reichenauer/gmd"
  version "1.7.1445.1049"
  license "MIT"

  on_macos do
    depends_on arch: :arm64

    url "https://github.com/michael-reichenauer/gmd/releases/download/v1.7.1445.1049/gmd_osx_arm64"
    sha256 "f0d0c93000ec28f86de761d0733ea9451a4b16cfa77323e02d26497577dec12d"
  end

  on_linux do
    on_arm do
      url "https://github.com/michael-reichenauer/gmd/releases/download/v1.7.1445.1049/gmd_linux_arm64"
      sha256 "34cb95f43af3f6b88aa637051f4b507739556531272419b39147859254320970"
    end
    on_intel do
      url "https://github.com/michael-reichenauer/gmd/releases/download/v1.7.1445.1049/gmd_linux_x64"
      sha256 "0e9aaa76fdb35d5417855ea160f1cf672a48485c2da1da413db88580af1b30b7"
    end
  end

  def install
    binary = Dir["gmd_*"].first
    chmod 0755, binary
    bin.install binary => "gmd"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/gmd --version").strip
  end
end
