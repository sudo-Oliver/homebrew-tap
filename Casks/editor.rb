# Homebrew cask for Editor. The release workflow fills in the version and the
# checksum and attaches the result to the release; copy it into the tap
# repository (sudo-Oliver/homebrew-tap, Casks/editor.rb) to publish it. Then:
#
#   brew install --cask sudo-oliver/tap/editor
cask "editor" do
  version "0.1.0"
  sha256 "715acb6791008ae35e63ab8e225168dabbd821dc0442aca73983086437937ed8"

  url "https://github.com/sudo-Oliver/Editor/releases/download/v#{version}/Editor-#{version}.dmg"
  name "Editor"
  desc "Local LaTeX and Typst editor with a live PDF preview"
  homepage "https://github.com/sudo-Oliver/Editor"

  depends_on macos: ">= :big_sur"

  app "Editor.app"
  binary "#{appdir}/Editor.app/Contents/Resources/bin/editor"

  # The Library folders hold everything the app keeps; the dot folders are
  # where versions before them kept it. Editor Tools is a folder people drop
  # their own downloads into, so it only goes when it is empty.
  zap trash: [
        "~/.cache/editor",
        "~/.config/editor",
        "~/Library/Application Support/io.github.sudo-oliver.editor",
        "~/Library/Caches/io.github.sudo-oliver.editor",
        "~/Library/Preferences/io.github.sudo-oliver.editor.plist",
        "~/Library/Saved Application State/io.github.sudo-oliver.editor.savedState",
      ],
      rmdir: "~/Applications/Editor Tools"

  caveats <<~EOS
    The editor command opens files and folders: editor .
    On the first start, Editor installs LaTeX (MacTeX or Tectonic) or Typst, with Homebrew if you like.
  EOS
end
