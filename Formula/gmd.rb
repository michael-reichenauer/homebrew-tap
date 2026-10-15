# The Homebrew formula of gmd, written by scripts/brewformula in michael-reichenauer/gmd for every
# release, so a change made here is overwritten by the next one
class Gmd < Formula
  desc "Git client for the terminal that shows only the branches you choose"
  homepage "https://github.com/michael-reichenauer/gmd"
  version "1.10.1446.1006"
  license "MIT"

  on_macos do
    depends_on arch: :arm64

    url "https://github.com/michael-reichenauer/gmd/releases/download/v1.10.1446.1006/gmd_osx_arm64"
    sha256 "0ec8fdc5017cf1012d061174a9e8b29c24953f76ffaf7e441d8242c36f03273b"
  end

  on_linux do
    on_arm do
      url "https://github.com/michael-reichenauer/gmd/releases/download/v1.10.1446.1006/gmd_linux_arm64"
      sha256 "aed949c4a8296b38bc15ce9e0ef65d7fb6b1760b895ba61a38fc1d323a7a8265"
    end
    on_intel do
      url "https://github.com/michael-reichenauer/gmd/releases/download/v1.10.1446.1006/gmd_linux_x64"
      sha256 "ddbc1fd8cbd883628e7599b8cc3c129ce71e88600fd65766cf2bfe7a8af2952b"
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
