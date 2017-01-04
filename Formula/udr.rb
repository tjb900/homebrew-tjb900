# Documentation: https://github.com/Homebrew/homebrew/blob/master/share/doc/homebrew/Formula-Cookbook.md
#                http://www.rubydoc.info/github/Homebrew/homebrew/master/frames
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class Udr < Formula
  desc ""
  homepage ""
  url "https://github.com/LabAdvComp/UDR/archive/v0.9.4.tar.gz"
  version "0.9.4"
  sha256 "fc3e42bd63b16ff8676dd973aac2cb9106777904440381a6fe41be007862da26"

  # depends_on "cmake" => :build
  depends_on :x11 # if your formula requires any X11/XQuartz components
  depends_on "openssl"

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel
    ENV.prepend_create_path "CPATH", "#{Formula["openssl"].opt_prefix}/include"
    system "make", "-C", "udt/src", "-e", "os=OSX"
    system "make", "-C", "src", "-e", "os=OSX"
    system "mkdir", "#{bin}"
    system "cp", "src/udr", "#{bin}"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test UDR`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "#{bin}/udr"
  end
end
