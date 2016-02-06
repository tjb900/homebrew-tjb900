class Cwpsu < Formula
  desc "CWP Seismic Unix"
  homepage "http://www.cwp.mines.edu/cwpcodes/index.html"
  url "ftp://ftp.cwp.mines.edu/pub/cwpcodes/cwp_su_all_44R1.tgz"
  version "44"
  sha256 "36c2026ce8b5d1792bf0e5cd94e994ba65aa35c837170a482bb230e462b93673"

  depends_on :x11

  def install
     ENV.deparallelize

     system "bash", "-c", "< configs/Makefile.config_MacOSX_Yosemite grep -v SUXDR > Makefile.config"
     ENV["CWPROOT"] = "#{buildpath}/.."
     system "bash", "-c", "> chkroot.sh"
     touch "LICENSE_44_ACCEPTED"
     touch "MAILHOME_44"
     system "make", "install", "xtinstall"

     # the weird pattern here is to exclude the .DSYM directories created in the bin path for whatever reason
     bin.install Dir["#{buildpath}/../bin/*[^M]"]
  end

  test do
    system "false"
  end
end
