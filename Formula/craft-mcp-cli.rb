class CraftMcpCli < Formula
  desc "CLI and SDK for Craft documents via Model Context Protocol"
  homepage "https://github.com/lukilabs/craft-mcp-cli"
  version "1.0.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lukilabs/craft-mcp-cli/releases/download/v1.0.2/craft-1.0.2-darwin-arm64.tar.gz"
      sha256 "8d62f7d7a22956d09e370bc145af6299f8ac2aa3e0185d4bcdcb43d401bd7235"
    else
      url "https://github.com/lukilabs/craft-mcp-cli/releases/download/v1.0.2/craft-1.0.2-darwin-x64.tar.gz"
      sha256 "58fc3a70578655b56288e2700ba475a468ceb7102c295fb74e32c09a81987d96"
    end
  end

  on_linux do
    url "https://github.com/lukilabs/craft-mcp-cli/releases/download/v1.0.2/craft-1.0.2-linux-x64.tar.gz"
    sha256 "cabbbcfb709f1dbc259baff56e73b86f88063dd89c969fafc2b52c79f923dba7"
  end

  def install
    bin.install "craft-bun-darwin-arm64" => "craft" if Hardware::CPU.arm? && OS.mac?
    bin.install "craft-bun-darwin-x64" => "craft" if Hardware::CPU.intel? && OS.mac?
    bin.install "craft-bun-linux-x64" => "craft" if OS.linux?
  end

  test do
    system "#{bin}/craft", "--version"
  end
end
