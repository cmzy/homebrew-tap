cask "geecompare" do
  arch arm: "aarch64", intel: "x64"

  version "0.1.0"
  sha256 arm:   "f0874ca85b1bb5e020c87beeaf39689eb60699cb1f8e56d76ffa9c92c1da9825",
         intel: "95f39f8a034ff946ec35127fc614d7ff58b538fea6eb33577817b5a1a6ec3f4d"

  url "https://github.com/cmzy/geecompare/releases/download/v#{version}/GeeCompare_#{arch}.dmg",
      verified: "github.com/cmzy/geecompare/"
  name "GeeCompare"
  desc "Compare and merge folders, text, tables, pictures and more"
  homepage "https://github.com/cmzy/geecompare"

  livecheck do
    url :url
    strategy :github_latest
  end

  # No `auto_updates`: `brew upgrade` upgrades GeeCompare like any cask. The app also updates
  # itself; brew, which does not see that, then reinstalls the version already running.
  depends_on macos: ">= :monterey"

  app "GeeCompare.app"
  binary "#{appdir}/GeeCompare.app/Contents/MacOS/geecompare"

  zap trash: [
    "~/Library/Application Support/app.geecompare.GeeCompare",
    "~/Library/Caches/app.geecompare.GeeCompare",
    "~/Library/Logs/GeeCompare",
    "~/Library/Preferences/app.geecompare.GeeCompare.plist",
    "~/Library/Saved Application State/app.geecompare.GeeCompare.savedState",
  ]
end
