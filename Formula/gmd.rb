# The Homebrew formula of gmd, written by scripts/brewformula in michael-reichenauer/gmd for every
# release, so a change made here is overwritten by the next one
class Gmd < Formula
  desc "Git client for the terminal that shows only the branches you choose"
  homepage "https://github.com/michael-reichenauer/gmd"
  version "1.20.1474.720"
  license "MIT"

  on_macos do
    depends_on arch: :arm64

    url "https://github.com/michael-reichenauer/gmd/releases/download/v1.20.1474.720/gmd_osx_arm64"
    sha256 "7e84583c6d6a96972d9f982ba2a6fcb00c7feb6b8b4375498071f14bb9f20673"
  end

  on_linux do
    on_arm do
      url "https://github.com/michael-reichenauer/gmd/releases/download/v1.20.1474.720/gmd_linux_arm64"
      sha256 "0edeac1720364c30e6c9a8d26ae3703b3814e501e4ae34cbb9faab6c25b06562"
    end
    on_intel do
      url "https://github.com/michael-reichenauer/gmd/releases/download/v1.20.1474.720/gmd_linux_x64"
      sha256 "63a7de5dd303c4aa77e3c16153d12694f61eb6a321c5b0ae5fa25740f98c8a3f"
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
