# The Homebrew formula of gmd, written by scripts/brewformula in michael-reichenauer/gmd for every
# release, so a change made here is overwritten by the next one
class Gmd < Formula
  desc "Git client for the terminal that shows only the branches you choose"
  homepage "https://github.com/michael-reichenauer/gmd"
  version "1.17.1471.546"
  license "MIT"

  on_macos do
    depends_on arch: :arm64

    url "https://github.com/michael-reichenauer/gmd/releases/download/v1.17.1471.546/gmd_osx_arm64"
    sha256 "ac08b8bf2b21f73f16f3360beb395561257cfec1e3d383c5cee797d8ed436014"
  end

  on_linux do
    on_arm do
      url "https://github.com/michael-reichenauer/gmd/releases/download/v1.17.1471.546/gmd_linux_arm64"
      sha256 "2358b4e0145a88a0ada8658eccd1e5186e555affa9475bf88c4ba67e4a27acd0"
    end
    on_intel do
      url "https://github.com/michael-reichenauer/gmd/releases/download/v1.17.1471.546/gmd_linux_x64"
      sha256 "6fa2ccb818941d61c226506c5552f45534d57e4fb2d7b6694bafcb5e6801ad69"
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
