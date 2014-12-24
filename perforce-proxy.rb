require "formula"

class PerforceProxy < Formula
  homepage "http://www.perforce.com/"
  version "2014.2.962050"

  if MacOS.prefer_64_bit?
    url "http://filehost.perforce.com/perforce/r14.2/bin.darwin90x86_64/p4p"
    sha256 "d57e30852341ac4ebe4531c78b74157d95baac644d996e6964ef313b5b86e796"
  else
    url "http://filehost.perforce.com/perforce/r14.2/bin.darwin90x86/p4p"
    sha256 "d8021c9d67a8e7dd683bde7b802d93f5bbba4acf7ad2d713b58e2c6c09b6f351"
  end

  def install
    bin.install "p4p"
    (var+"p4p").mkpath
  end

  def caveats; <<-EOS.undent
    To use the Perforce proxy to access your Perforce server, set your P4PORT
    environment variable to "localhost:1666".

    Before starting the proxy server, you probably need to edit the plist to use
    the correct host and port for your Perforce server (replacing the default
    perforce:1666).
    EOS
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
        <string>#{opt_bin}/p4p</string>
        <string>-p</string>
        <string>1666</string>
        <string>-r</string>
        <string>#{var}/p4p</string>
        <string>-t</string>
        <string>perforce:1666</string>
      </array>
      <key>RunAtLoad</key>
      <true/>
      <key>KeepAlive</key>
      <true/>
      <key>WorkingDirectory</key>
      <string>#{var}/p4p</string>
    </dict>
    </plist>
    EOS
  end
end
