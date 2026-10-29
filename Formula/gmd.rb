# The Homebrew formula of gmd, written by scripts/brewformula in michael-reichenauer/gmd for every
# release, so a change made here is overwritten by the next one
class Gmd < Formula
  desc "Git client for the terminal that shows only the branches you choose"
  homepage "https://github.com/michael-reichenauer/gmd"
  version "1.16.1460.412"
  license "MIT"

  on_macos do
    depends_on arch: :arm64

    url "https://github.com/michael-reichenauer/gmd/releases/download/v1.16.1460.412/gmd_osx_arm64"
    sha256 "dc0b0b058089cdaa33712a64710feb7746a48473d1ae606490ece1acb8b0d56a"
  end

  on_linux do
    on_arm do
      url "https://github.com/michael-reichenauer/gmd/releases/download/v1.16.1460.412/gmd_linux_arm64"
      sha256 "0e710b59f2027ae7a5f8bd9cbe858c06225277958c6f9fafb97bf32bb27b65be"
    end
    on_intel do
      url "https://github.com/michael-reichenauer/gmd/releases/download/v1.16.1460.412/gmd_linux_x64"
      sha256 "fbb356e6c51509a41ccdf392a761cee6fda6e06b76979862190a27048c211b75"
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
