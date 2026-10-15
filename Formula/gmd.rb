# The Homebrew formula of gmd, written by scripts/brewformula in michael-reichenauer/gmd for every
# release, so a change made here is overwritten by the next one
class Gmd < Formula
  desc "Git client for the terminal that shows only the branches you choose"
  homepage "https://github.com/michael-reichenauer/gmd"
  version "1.9.1446.426"
  license "MIT"

  on_macos do
    depends_on arch: :arm64

    url "https://github.com/michael-reichenauer/gmd/releases/download/v1.9.1446.426/gmd_osx_arm64"
    sha256 "a2497fd98e0a3ec21d7f0a4a2cf3542bc8dbb5718274c3a24097b36750ae9e4c"
  end

  on_linux do
    on_arm do
      url "https://github.com/michael-reichenauer/gmd/releases/download/v1.9.1446.426/gmd_linux_arm64"
      sha256 "b3f2c1643f7579afb8c25542ca61dd758d396eb9d10008df2073f132fb536e66"
    end
    on_intel do
      url "https://github.com/michael-reichenauer/gmd/releases/download/v1.9.1446.426/gmd_linux_x64"
      sha256 "86b97747bc9781d3085da90f4009cfb8882e7773eceb8abdc681aaba714b9b4c"
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
