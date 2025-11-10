class CraftMcpCli < Formula
  desc "CLI and SDK for Craft documents via Model Context Protocol"
  homepage "https://github.com/lukilabs/craft-mcp-cli"
  version "1.0.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/lukilabs/craft-mcp-cli/releases/download/v1.0.1/craft-1.0.1-darwin-arm64.tar.gz"
      sha256 "416a9890369db59cbd8c250642aa887e075b8ca42d59de4097b125f11078bfe4"
    else
      url "https://github.com/lukilabs/craft-mcp-cli/releases/download/v1.0.1/craft-1.0.1-darwin-x64.tar.gz"
      sha256 "60bec981ef705a9edaddd7117b0883ec3d444ad43b84f090a7b4c7b0ec1d55fe"
    end
  end

  on_linux do
    url "https://github.com/lukilabs/craft-mcp-cli/releases/download/v1.0.1/craft-1.0.1-linux-x64.tar.gz"
    sha256 "bebe3a9764b42f76a9aa12616a2f36b596a33330afefd616bb7c52b5c750ee29"
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
