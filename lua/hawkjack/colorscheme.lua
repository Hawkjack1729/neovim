require("tokyonight").setup({
    -- use the night style
    style = "moon",
    transparent = true,
    -- disable italic for functions
    styles = {
        functions = {},
        sidebars = "transparent", -- style for sidebars, see below
        floats = "transparent", -- style for floating windows
    },
    sidebars = { "qf", "vista_kind", "terminal", "packer" },
    -- Change the "hint" color to the "orange" color, and make the "error" color bright red
    on_colors = function(colors)
        colors.hint = colors.orange
        colors.error = "#ff0000"
    end
})


vim.cmd [[
try
  colorscheme tokyonight
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
endtry
]]
