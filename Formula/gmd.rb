# The Homebrew formula of gmd, written by scripts/brewformula in michael-reichenauer/gmd for every
# release, so a change made here is overwritten by the next one
class Gmd < Formula
  desc "Git client for the terminal that shows only the branches you choose"
  homepage "https://github.com/michael-reichenauer/gmd"
  version "1.14.1452.819"
  license "MIT"

  on_macos do
    depends_on arch: :arm64

    url "https://github.com/michael-reichenauer/gmd/releases/download/v1.14.1452.819/gmd_osx_arm64"
    sha256 "06cf0c2e41605bccc68c9968d1d5ed0393fb32edaeb50b72324f14a3c6fce213"
  end

  on_linux do
    on_arm do
      url "https://github.com/michael-reichenauer/gmd/releases/download/v1.14.1452.819/gmd_linux_arm64"
      sha256 "63242330a96a941b1e9e92efdfaa05a1dba21c5c71919185a153e30aca466862"
    end
    on_intel do
      url "https://github.com/michael-reichenauer/gmd/releases/download/v1.14.1452.819/gmd_linux_x64"
      sha256 "8102f4410f8ed3fe992f014bae1c02557a5f6553cfce0cc486bfbd621e54da9f"
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
