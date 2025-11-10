class CraftMcpCli < Formula
  desc "CLI and SDK for Craft documents via Model Context Protocol"
  homepage "https://github.com/lukilabs/craft-mcp-cli"
  version "1.0.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lukilabs/craft-mcp-cli/releases/download/v1.0.0/craft-1.0.0-darwin-arm64.tar.gz"
      sha256 "2ceb788395baddec5c70a80dc5fe81cafebdb0144817848915931e5639ccb7c8"
    else
      url "https://github.com/lukilabs/craft-mcp-cli/releases/download/v1.0.0/craft-1.0.0-darwin-x64.tar.gz"
      sha256 "626f64f6aa840abafbbad71a813431f744d77ec23646ed323b3d3c3b1fa9c53a"
    end
  end

  on_linux do
    url "https://github.com/lukilabs/craft-mcp-cli/releases/download/v1.0.0/craft-1.0.0-linux-x64.tar.gz"
    sha256 "07e19b6a8af70ce3e4e5e67716645fc2274a35138311b5891d9e3912fa07a97b"
  end

  def install
    bin.install "craft-darwin-arm64" => "craft" if Hardware::CPU.arm? && OS.mac?
    bin.install "craft-darwin-x64" => "craft" if Hardware::CPU.intel? && OS.mac?
    bin.install "craft-linux-x64" => "craft" if OS.linux?
  end

  test do
    system "#{bin}/craft", "--version"
  end
end
