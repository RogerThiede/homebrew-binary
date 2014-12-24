require "formula"

class Perforce < Formula
  homepage "http://www.perforce.com/"
  version "2014.2.962050"

  if MacOS.prefer_64_bit?
    url "http://filehost.perforce.com/perforce/r14.2/bin.macosx105x86_64/p4"
    sha256 "ce0e80f29813159a0384fafb77d85590e57e2d3deea3a42ad55ee9b70c842002"
  else
    url "http://filehost.perforce.com/perforce/r14.2/bin.macosx105x86/p4"
    sha256 "9895979ba9bdf11523366956b3ad2c168a9038a036b16220eff2d82efef9309c"
  end

  def install
    bin.install "p4"
  end
end
