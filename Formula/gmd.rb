# The Homebrew formula of gmd, written by scripts/brewformula in michael-reichenauer/gmd for every
# release, so a change made here is overwritten by the next one
class Gmd < Formula
  desc "Git client for the terminal that shows only the branches you choose"
  homepage "https://github.com/michael-reichenauer/gmd"
  version "1.19.1473.971"
  license "MIT"

  on_macos do
    depends_on arch: :arm64

    url "https://github.com/michael-reichenauer/gmd/releases/download/v1.19.1473.971/gmd_osx_arm64"
    sha256 "09aadcd450ef74994dd883f883d32d062b07d0ff6b0614df983d4db1ed92c38c"
  end

  on_linux do
    on_arm do
      url "https://github.com/michael-reichenauer/gmd/releases/download/v1.19.1473.971/gmd_linux_arm64"
      sha256 "f8ecc05d0f29bad34e293c2bc9e5bdd96ccc37641d5d10ac3793789b87a36624"
    end
    on_intel do
      url "https://github.com/michael-reichenauer/gmd/releases/download/v1.19.1473.971/gmd_linux_x64"
      sha256 "8801fa65e7542f84873771dcca348b0b0f178f25e35649aac549b0a69b35bf67"
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
