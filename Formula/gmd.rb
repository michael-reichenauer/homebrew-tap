# The Homebrew formula of gmd, written by scripts/brewformula in michael-reichenauer/gmd for every
# release, so a change made here is overwritten by the next one
class Gmd < Formula
  desc "Git client for the terminal that shows only the branches you choose"
  homepage "https://github.com/michael-reichenauer/gmd"
  version "1.15.1453.671"
  license "MIT"

  on_macos do
    depends_on arch: :arm64

    url "https://github.com/michael-reichenauer/gmd/releases/download/v1.15.1453.671/gmd_osx_arm64"
    sha256 "919299b75def25736aa0ce61ad41b063899c8d4c0ecad9b3ced08e4404569aa9"
  end

  on_linux do
    on_arm do
      url "https://github.com/michael-reichenauer/gmd/releases/download/v1.15.1453.671/gmd_linux_arm64"
      sha256 "66d23782267570b472e6c068f91fe87550c9e0583018d36ee0367b47e50fa2e2"
    end
    on_intel do
      url "https://github.com/michael-reichenauer/gmd/releases/download/v1.15.1453.671/gmd_linux_x64"
      sha256 "9bc5b9eaa87affc7fc56971de1444600b1a7e484f5203dfb097ca40d182b3e8f"
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
