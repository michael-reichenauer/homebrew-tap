# The Homebrew formula of gmd, written by scripts/brewformula in michael-reichenauer/gmd for every
# release, so a change made here is overwritten by the next one
class Gmd < Formula
  desc "Git client for the terminal that shows only the branches you choose"
  homepage "https://github.com/michael-reichenauer/gmd"
  version "1.12.1448.496"
  license "MIT"

  on_macos do
    depends_on arch: :arm64

    url "https://github.com/michael-reichenauer/gmd/releases/download/v1.12.1448.496/gmd_osx_arm64"
    sha256 "19773a1ed984f93c8380fe11d608f2a532f9b80d397df12b38376812d4ffd3d3"
  end

  on_linux do
    on_arm do
      url "https://github.com/michael-reichenauer/gmd/releases/download/v1.12.1448.496/gmd_linux_arm64"
      sha256 "d776dc6da3f7dd95785130c430bb7e6116350fd1dea7c29ef9a5b38c16c89d02"
    end
    on_intel do
      url "https://github.com/michael-reichenauer/gmd/releases/download/v1.12.1448.496/gmd_linux_x64"
      sha256 "eed3e73d159d7387b0b9c711256c92f0c34ee469b28c8bdf024723a230e70372"
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
