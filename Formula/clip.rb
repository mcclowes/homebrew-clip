class Clip < Formula
  desc "Share CLI capabilities between people and agents"
  homepage "https://github.com/mcclowes/clip"
  url "https://github.com/mcclowes/clip/releases/download/v0.4.0/clip-0.4.0.tar.gz"
  sha256 "006cfb4e6568304038a445636b119704080cd869260937e7d888acc7b35384e9"
  license "MIT"

  depends_on "node"

  def install
    libexec.install "dist", "package.json"
    (bin/"clip").write_env_script libexec/"dist/main.js", PATH: "#{formula_opt_bin("node")}:$PATH"
  end

  test do
    ENV["CLIP_HOME"] = testpath/"config"
    assert_equal "clip", JSON.parse(shell_output("#{bin}/clip schema"))["name"]
    assert_equal version.to_s, JSON.parse(shell_output("#{bin}/clip --output json --version"))["version"]
    (testpath/"node.json").write <<~JSON
      {"name":"node","commands":[{"name":"--version","description":"Show runtime version","mutating":false}]}
    JSON
    system bin/"clip", "register", formula_opt_bin("node")/"node",
           "--purpose", "Run JavaScript", "--schema", testpath/"node.json"
    system bin/"clip", "sync", "--skills-dir", testpath/"skills"
    assert_path_exists testpath/"skills/clip-node/SKILL.md"
  end
end
