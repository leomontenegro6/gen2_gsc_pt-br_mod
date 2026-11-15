return function(mod)
  local CopyrightGameVersion = require("src.core.GameVersion")
  local copyrightSplashByGame = {
    gold = "assets/overrides/gold/title/copyright_splash.png",
    silver = "assets/overrides/silver/title/copyright_splash.png",
    crystal = "assets/overrides/crystal/title/copyright_splash.png",
  }
  mod.events:on("intro.boot.copyright", function(event)
    local path = copyrightSplashByGame[CopyrightGameVersion.get()]
    if path then event.screen.image = mod.assets:image(path) end
  end)
end
