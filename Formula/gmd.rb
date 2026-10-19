# The Homebrew formula of gmd, written by scripts/brewformula in michael-reichenauer/gmd for every
# release, so a change made here is overwritten by the next one
class Gmd < Formula
  desc "Git client for the terminal that shows only the branches you choose"
  homepage "https://github.com/michael-reichenauer/gmd"
  version "1.13.1450.1146"
  license "MIT"

  on_macos do
    depends_on arch: :arm64

    url "https://github.com/michael-reichenauer/gmd/releases/download/v1.13.1450.1146/gmd_osx_arm64"
    sha256 "c280f9f75d6d03b39dd0be5583361d15136e9945d3e98c4481972dec7e2a3e47"
  end

  on_linux do
    on_arm do
      url "https://github.com/michael-reichenauer/gmd/releases/download/v1.13.1450.1146/gmd_linux_arm64"
      sha256 "ec710af78d71bea269fe61a9d0750f5b3ea81ed5957f1432d1f13826c365d694"
    end
    on_intel do
      url "https://github.com/michael-reichenauer/gmd/releases/download/v1.13.1450.1146/gmd_linux_x64"
      sha256 "371ffeee8fb224c8b04a6d364bc7a753044e31b3ae969ad90a7a3ccfe2cc15f0"
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
