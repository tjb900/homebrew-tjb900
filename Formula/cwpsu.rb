# Documentation: https://github.com/Homebrew/homebrew/blob/master/share/doc/homebrew/Formula-Cookbook.md
#                http://www.rubydoc.info/github/Homebrew/homebrew/master/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class Cwpsu < Formula
  desc ""
  homepage ""
  url "ftp://ftp.cwp.mines.edu/pub/cwpcodes/cwp_su_all_44R1.tgz"
  version "44"
  sha256 "36c2026ce8b5d1792bf0e5cd94e994ba65aa35c837170a482bb230e462b93673"

  # depends_on "cmake" => :build
  depends_on :x11 # if your formula requires any X11/XQuartz components

  def install
    ENV.deparallelize  # if your formula fails when building in parallel

    # Remove unrecognized options if warned by configure
#    system "./configure", "--disable-debug",
#                          "--disable-dependency-tracking",
#                          "--disable-silent-rules",
#                          "--prefix=#{prefix}"
#    # system "cmake", ".", *std_cmake_args
#    system "make", "install" # if this fails, try separate make/make install steps
     system "pwd"
     system "bash", "-c", "< configs/Makefile.config_MacOSX_Yosemite grep -v SUXDR > Makefile.config"
     ENV["CWPROOT"] = "#{buildpath}/.."
     system "env"
     system "bash", "-c", "> chkroot.sh"
     system "touch", "LICENSE_44_ACCEPTED"
     system "touch", "MAILHOME_44"
     system "make", "install", "xtinstall"

     bin.install Dir["#{buildpath}/../bin/*"]
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test cwpsu`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
