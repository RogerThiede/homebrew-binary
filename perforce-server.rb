require "formula"

class PerforceServer < Formula
  homepage "http://www.perforce.com/"
  version "2014.2.962050"

  if MacOS.prefer_64_bit?
    url "http://filehost.perforce.com/perforce/r14.2/bin.darwin90x86_64/p4d"
    sha256 "81cb0362c56db51f6859744fe1bef89003d98bf63f611d3343a7a6778e88f298"
  else
    url "http://filehost.perforce.com/perforce/r14.2/bin.darwin90x86/p4d"
    sha256 "6d2ed5afc26ab5e893af2a9f97b2a087ed52288aca6e5e1d63eac6b723c209f4"
  end

  def install
    bin.install "p4d"
    (var+"p4root").mkpath
  end

  def plist; <<-EOS.undent
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
    <dict>
      <key>Label</key>
      <string>#{plist_name}</string>
      <key>ProgramArguments</key>
      <array>
        <string>#{opt_bin}/p4d</string>
        <string>-p</string>
        <string>1666</string>
        <string>-r</string>
        <string>#{var}/p4root</string>
      </array>
      <key>RunAtLoad</key>
      <true/>
      <key>KeepAlive</key>
      <true/>
      <key>WorkingDirectory</key>
      <string>#{var}/p4root</string>
      <key>StandardErrorPath</key>
      <string>#{var}/log/p4d.log</string>
      <key>StandardOutPath</key>
      <string>#{var}/log/p4d.log</string>
    </dict>
    </plist>
    EOS
  end
end
