return function(mod)
  local CopyrightGameVersion = require("src.core.GameVersion")
  local copyrightSplashByGame = {
    gold = "assets/overrides/gold/title/copyright_splash.png",
    silver = "assets/overrides/silver/title/copyright_splash.png",
    crystal = "assets/overrides/crystal/title/copyright_splash.png",
  }
  local titleScreenByGame = {
    gold = {
      color = "assets/overrides/gold/title/title_screen.png",
      gray = "assets/overrides/gold/title/title_screen_gray.png",
    },
    silver = {
      color = "assets/overrides/silver/title/title_screen.png",
      gray = "assets/overrides/silver/title/title_screen_gray.png",
    },
    crystal = {
      color = "assets/overrides/crystal/title/crystal_screen.png",
      gray = "assets/overrides/crystal/title/crystal_screen_gray.png",
    },
  }
  mod.events:on("intro.boot.copyright", function(event)
    local path = copyrightSplashByGame[CopyrightGameVersion.get()]
    if path then event.screen.image = mod.assets:image(path) end
  end)
  mod.events:on("intro.boot.title", function(event)
    local paths = titleScreenByGame[CopyrightGameVersion.get()]
    if paths then
      event.screen.screenColor = mod.assets:image(paths.color)
      event.screen.screenGray = mod.assets:image(paths.gray)
    end
  end)
end
