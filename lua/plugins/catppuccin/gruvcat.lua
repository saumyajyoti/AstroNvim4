-- Saumyajyoti's Gruvbox, Catppuccin combined palette custom

return {
  latte = { -- copied from gruvbox theme
    rosewater = "#c14a4a",
    flamingo = "#c14a4a",
    pink = "#945e80",
    mauve = "#945e80",
    red = "#c14a4a",
    maroon = "#c14a4a",
    peach = "#c35e0a",
    yellow = "#a96b2c",
    green = "#6c782e",
    teal = "#4c7a5d",
    sky = "#4c7a5d",
    sapphire = "#4c7a5d",
    blue = "#45707a",
    lavender = "#45707a",
    text = "#654735",
    subtext1 = "#7b5d44",
    subtext0 = "#8f6f56",
    overlay2 = "#a28368",
    overlay1 = "#b6977a",
    overlay0 = "#c9aa8c",
    surface2 = "#A79C86",
    surface1 = "#C9C19F",
    surface0 = "#DFD6B1",
    base = "#fbf1c7",
    mantle = "#F3EAC1",
    crust = "#E7DEB7",
  },
  mocha = { -- custom
    rosewater = "#ffc6be",
    flamingo = "#fb4934",
    pink = "#ff75a0",
    mauve = "#d3869b",
    red = "#ff5d62", -- "#f2594b",
    maroon = "#fe8019",
    peach = "#e6c384", -- "#FFAD7D",
    yellow = "#d79921", -- "#DEB22C",
    green = "#a9b665",
    teal = "#8ec07c",
    sky = "#a3d4d5", -- #7daea3",
    sapphire = "#689d6a",
    blue = "#7fb4ca", -- "#6d8dad",
    lavender = "#b16286",
    text = "#fbf1c7", -- #D4BE98  #C6D0F5
    subtext1 = "#d5c4a1", -- #BDAE8B  #B3BCDF
    subtext0 = "#a89984", -- #A69372  #A1A8C9
    overlay2 = "#8C7A58", -- #8E95B3
    overlay1 = "#735F3F", -- #7B819D
    overlay0 = "#806234", -- #696D86
    surface2 = "#665c54", -- #6E7477  #4B4F51  #565970
    surface1 = "#3c3836", -- #2A2D2E           #43465A
    surface0 = "#32302f", -- #232728           #313244
    base = "#282828", -- #1D2021           #1E1E2E
    mantle = "#1d2021", -- #191C1D           #181825
    crust = "#1b1b1b", --                   #11111B
  },
}

-- Mocha - Labels	Hex
--
-- Rosewater	#f5e0dc
-- Flamingo 	#f2cdcd
-- Pink     	#f5c2e7
-- Mauve    	#cba6f7
-- Red	      #f38ba8
-- Maroon	    #eba0ac
-- Peach	    #fab387
-- Yellow   	#f9e2af
-- Green    	#a6e3a1
-- Teal     	#94e2d5
-- Sky      	#89dceb
-- Sapphire 	#74c7ec
-- Blue	      #89b4fa
-- Lavender  	#b4befe
-- Text     	#cdd6f4
-- Subtext1 	#bac2de
-- Subtext0 	#a6adc8
-- Overlay2	  #9399b2
-- Overlay1	  #7f849c
-- Overlay0	  #6c7086
-- Surface2	  #585b70
-- Surface1	  #45475a
-- Surface0	  #313244
-- Base   	  #1e1e2e
-- Mantle 	  #181825
-- Crust  	  #11111b
-- Gruvbox_mix-medium from https://github.com/sainnhe/gruvbox-material
-- gruvbox mix material
--   \ 'bg_dim':           ['#1b1b1b',   '233'],
--   \ 'bg0':              ['#282828',   '235'],
--   \ 'bg1':              ['#32302f',   '236'],
--   \ 'bg2':              ['#32302f',   '236'],
--   \ 'bg3':              ['#45403d',   '237'],
--   \ 'bg4':              ['#45403d',   '237'],
--   \ 'bg5':              ['#5a524c',   '239'],
--   \ 'bg_statusline1':   ['#32302f',   '236'],
--   \ 'bg_statusline2':   ['#3a3735',   '236'],
--   \ 'bg_statusline3':   ['#504945',   '240'],
--   \ 'bg_diff_green':    ['#34381b',   '22'],
--   \ 'bg_visual_green':  ['#3b4439',   '22'],
--   \ 'bg_diff_red':      ['#402120',   '52'],
--   \ 'bg_visual_red':    ['#4c3432',   '52'],
--   \ 'bg_diff_blue':     ['#0e363e',   '17'],
--   \ 'bg_visual_blue':   ['#374141',   '17'],
--   \ 'bg_visual_yellow': ['#4f422e',   '94'],
--   \ 'bg_current_word':  ['#3c3836',   '237']
--
--   \ 'fg0':              ['#e2cca9',   '223'],
--   \ 'fg1':              ['#e2cca9',   '223'],

--   \ 'grey0':            ['#7c6f64',   '243'],
--   \ 'grey1':            ['#928374',   '245'],
--   \ 'grey2':            ['#a89984',   '246'],
--
-- alternate alternate (https://github.com/thanhvule0310)
-- Color Tables
-- Red
--    gruvbox #fb4934 #cc241d #9d0006
--    gruvchad #ec6b64 pink #ce8196 #ff75a0
--    gruvMaterial #f2594b #db4740 <- bg
--    Catppuccin: Rosewater #f5e0dc,Flamingo #f2cdcd,Pink	#f5c2e7,Red #f38ba8, Maroon #eba0ac
--    alt : #EA6962 #F38BA8 #ffd3e2
--    kanagawa - #ff5d62 peach red, #e46876 wave red, #d27e99 sakura pink

-- Blue
--    gruvbox #83a598 #458588 #076678
--    gruvchad #6f8faf #6d8dad #7daea3
--    gruvMaterial #80aa9e
--    Catppuccin: Sky	#89dceb, Sapphire #74c7ec, Blue	#89b4fa
--    alt  #89B482 #8ec07c  #7DAEA3
--    kanagawa #a3d4d5 light blue , #7fb4ca spring blue, #7e9cd8 crystal blue,

--
-- Green
--    gruvbox #b8bb26 #98971a #79740e
--    gruvchad #89b482 #a9b665
--    gruvMaterial #b0b846
--    Catppuccin 	#a6e3a1
--    kanagawa : #98bb6c spring green, #7aa89f wave aqua
--
-- Yellow
--    gruvbox #fabd2f #d79921 #b57614
--    gruvchad #d6b676 #d1b171 #e0c080
--    gruvMaterial #e9b143
--    Catppuccin Peach #fab387 Yellow	#f9e2af
--    alt #c68e6b #D8A657
--    kanagawa : #e6c384 , #c0a36e , #938056

-- Purple
--    gruvbox #d3869b  #b16286  #8f3f71
--    gruvchad #9385b4 #887aa9 #d3869b
--    gruvMaterial #d3869b
--    Catppuccin: Mauve 	#cba6f7 Lavender #b4befe
--    alt #D3869B
--    kanagawa :
--
-- Orange
--    gruvbox #fe8019 #d65d0e #af3a03
--    gruvchad #e78a4e #d65d0e
--    gruvMaterial #f28534
--    Catppuccin
--    kanagawa : #ffa066 Surimi orange
--
-- Teal Cyan Aqua
--    gruvbox #8ec07c #689d6a #427b58
--    gruvchad #749689 #82b3a8 #86b17f
--    gruvMaterial #8bba7f
--    Catppuccin 	#94e2d5
--    kanagawa :

-- local BaseColor = {}
--
-- BaseColor.gruvbox = {
--   dark0_hard = "#1d2021",
--   dark0 = "#282828",
--   dark0_soft = "#32302f",
--   dark1 = "#3c3836",
--   dark2 = "#504945",
--   dark3 = "#665c54",
--   dark4 = "#7c6f64",
--   light0_hard = "#f9f5d7",
--   light0 = "#fbf1c7",
--   light0_soft = "#f2e5bc",
--   light1 = "#ebdbb2",
--   light2 = "#d5c4a1",
--   light3 = "#bdae93",
--   light4 = "#a89984",
--
--   gray = "#928374",
-- }
-- BaseColor.base_30 = {
--   white = "#c7b89d",
--   darker_black = "#1a1d1e",
--   black = "#1e2122", --  nvim bg
--   black2 = "#242728",
--   one_bg = "#282b2c",
--   one_bg2 = "#393c3d",
--   one_bg3 = "#404344",
--   grey = "#484b4c",
--   grey_fg = "#575a5b",
--   grey_fg2 = "#545758",
--   light_grey = "#606364",
--   line = "#323536", -- for lines like vertsplit
--   statusline_bg = "#222526",
--   lightbg = "#2d3031",
--   pmenu_bg = "#89b482",
--   folder_bg = "#6d8dad",
-- }
--
-- BaseColor.base_16 = {
--   base00 = "#1e2122",
--   base01 = "#2c2f30",
--   base02 = "#36393a",
--   base03 = "#404344",
-- }
--
--
