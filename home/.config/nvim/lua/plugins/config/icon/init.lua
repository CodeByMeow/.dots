local colors = {
  blue = '#458588',
  cyan = '#689d6a',
  pink = '#D3869B',
  purple = '#B16286',
  sun = '#FABD2F',
  orange = '#FE8019',
  red = "#CC241D",
  white = "#EBDBB2",
  vibrant_green = "#689D6A"
}
require 'nvim-web-devicons'.setup {
  override = {
    c = {
      icon = "",
      color = colors.blue,
      name = "c",
    },
    css = {
      icon = "",
      color = colors.blue,
      name = "css",
    },
    deb = {
      icon = "",
      color = colors.cyan,
      name = "deb",
    },
    Dockerfile = {
      icon = "",
      color = colors.blue,
      name = "Dockerfile",
    },
    html = {
      icon = "",
      color = colors.red,
      name = "html",
    },
    jpeg = {
      icon = "",
      color = colors.purple,
      name = "jpeg",
    },
    jpg = {
      icon = "",
      color = colors.purple,
      name = "jpg",
    },
    js = {
      icon = "",
      color = colors.sun,
      name = "js",
    },
    kt = {
      icon = "󱈙",
      color = colors.orange,
      name = "kt",
    },
    lock = {
      icon = "",
      color = colors.red,
      name = "lock",
    },
    lua = {
      icon = "",
      color = colors.blue,
      name = "lua",
    },
    mp3 = {
      icon = "",
      color = colors.white,
      name = "mp3",
    },
    mp4 = {
      icon = "",
      color = colors.white,
      name = "mp4",
    },
    out = {
      icon = "",
      color = colors.white,
      name = "out",
    },
    png = {
      icon = "",
      color = colors.purple,
      name = "png",
    },
    py = {
      icon = "",
      color = colors.cyan,
      name = "py",
    },
    ["robots.txt"] = {
      icon = "ﮧ",
      color = colors.red,
      name = "robots",
    },
    toml = {
      icon = "",
      color = colors.blue,
      name = "toml",
    },
    ts = {
      icon = "ﯤ",
      olor = colors.blue,
      name = "ts",
    },
    ttf = {
      icon = "",
      color = colors.white,
      name = "TrueTypeFont",
    },
    rb = {
      icon = "",
      color = colors.pink,
      name = "rb",
    },
    rpm = {
      icon = "",
      color = colors.orange,
      name = "rpm",
    },
    vue = {
      icon = "﵂",
      color = colors.vibrant_green,
      name = "vue",
    },
    woff = {
      icon = "",
      color = colors.white,
      name = "WebOpenFontFormat",
    },
    woff2 = {
      icon = "",
      color = colors.white,
      name = "WebOpenFontFormat2",
    },
    xz = {
      icon = "",
      color = colors.sun,
      name = "xz",
    },
    zip = {
      icon = "",
      color = colors.sun,
      name = "zip",
    },
    md = {
      icon = "",
      color = colors.blue,
      name = "markdown"
    },
    conf = {
      icon = "",
      color = colors.sun,
      name = "config"
    },
    fish = {
      icon = "",
      color = colors.orange,
      name = "fish"
    }
  };
  default = false;
}
