# The Homebrew formula of gmd, written by scripts/brewformula in michael-reichenauer/gmd for every
# release, so a change made here is overwritten by the next one
class Gmd < Formula
  desc "Git client for the terminal that shows only the branches you choose"
  homepage "https://github.com/michael-reichenauer/gmd"
  version "1.18.1471.1270"
  license "MIT"

  on_macos do
    depends_on arch: :arm64

    url "https://github.com/michael-reichenauer/gmd/releases/download/v1.18.1471.1270/gmd_osx_arm64"
    sha256 "35db123c4ebedf9295af9beae41d12a7d91f6a524932892a773091e8b69aa6c6"
  end

  on_linux do
    on_arm do
      url "https://github.com/michael-reichenauer/gmd/releases/download/v1.18.1471.1270/gmd_linux_arm64"
      sha256 "4a1528988e196fe70eff995b8e8eabfa82d94d8bd1f609b3a7fb5e6ea4eae06d"
    end
    on_intel do
      url "https://github.com/michael-reichenauer/gmd/releases/download/v1.18.1471.1270/gmd_linux_x64"
      sha256 "42d23a1c6e447169a4b4849eee9a8af680034c1439191b561f57981604502a8c"
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
