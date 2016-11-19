
class Pub < Formula
  depends_on "imagemagick" 
  depends_on "jq"
  desc "PUB - Mobile assets factory command-line program - www.brunoneves.com"
  homepage "https://github.com/sevenb/pub/"
  url "https://github.com/sevenb/pub/archive/v1.0.0.tar.gz"
  version "1.0.0"
  sha256 "b5534fe55648f36c5bc415dd1190ba166ffe9392e718337ae3d8a9d50f80db67"


  def install
    bin.install "pub"
  end
    
  test do
      output = shell_output(bin/"pub --version")
      assert_match "pub version #{version}\n", output
      
      system('wget https://github.com/sevenb/homebrew-pub/raw/master/icon-test.png')

      system bin/"pub"

      sleep 2
      assert File.exist?("app_icon")
  end
    
end
