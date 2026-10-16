# The Homebrew formula of gmd, written by scripts/brewformula in michael-reichenauer/gmd for every
# release, so a change made here is overwritten by the next one
class Gmd < Formula
  desc "Git client for the terminal that shows only the branches you choose"
  homepage "https://github.com/michael-reichenauer/gmd"
  version "1.11.1447.386"
  license "MIT"

  on_macos do
    depends_on arch: :arm64

    url "https://github.com/michael-reichenauer/gmd/releases/download/v1.11.1447.386/gmd_osx_arm64"
    sha256 "c21f1bdcab6c5b82eb31c6c1355cf4b42c1f483495dfa88c229dc3d2a9262c8a"
  end

  on_linux do
    on_arm do
      url "https://github.com/michael-reichenauer/gmd/releases/download/v1.11.1447.386/gmd_linux_arm64"
      sha256 "0dbad40047e839e931a00095440edecb55b802bbde921f4df9c54d5b96cb2b24"
    end
    on_intel do
      url "https://github.com/michael-reichenauer/gmd/releases/download/v1.11.1447.386/gmd_linux_x64"
      sha256 "7a1550dda5f6a075b58b670b7b2c0f34ca4d4e5d4ad9d7201b8322508bb03661"
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
