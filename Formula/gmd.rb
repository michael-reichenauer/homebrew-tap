# The Homebrew formula of gmd, written by scripts/brewformula in michael-reichenauer/gmd for every
# release, so a change made here is overwritten by the next one
class Gmd < Formula
  desc "Git client for the terminal that shows only the branches you choose"
  homepage "https://github.com/michael-reichenauer/gmd"
  version "1.8.1445.1141"
  license "MIT"

  on_macos do
    depends_on arch: :arm64

    url "https://github.com/michael-reichenauer/gmd/releases/download/v1.8.1445.1141/gmd_osx_arm64"
    sha256 "e4f32d59bdb4139134e566dfb14dd4d292fef5dec966584fa8cca0b9db9e99fe"
  end

  on_linux do
    on_arm do
      url "https://github.com/michael-reichenauer/gmd/releases/download/v1.8.1445.1141/gmd_linux_arm64"
      sha256 "0405346de355dad7ac70822d1f5aade47503a9fb963488bc2f38e06de5b0eb3c"
    end
    on_intel do
      url "https://github.com/michael-reichenauer/gmd/releases/download/v1.8.1445.1141/gmd_linux_x64"
      sha256 "360bb83d17119aeba6581cd6826fdeb8bfc2dc3374498552cb9e6daef5247364"
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
