require 'formula'

class Openssl <Formula
  url 'http://www.openssl.org/source/openssl-1.0.0b.tar.gz'
  version '1.0.0b'
  homepage 'http://www.openssl.org'
  md5 '104deb3b7e6820cae6de3f49ba0ff2b0'

  keg_only :provided_by_osx

  def options
    [["--universal", "Build a universal binary."]]
  end

  def install
    ENV.universal_binary if ARGV.include? "--universal"
    ENV.j1 # Breaks on Mac Pro
    system "./config", "--prefix=#{prefix}",
                       "--openssldir=#{etc}",
                       "zlib-dynamic", "shared"
    system "make"
    system "make test"
    system "make install"
  end
end
