local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
	return
end

math.randomseed(os.time())

local dashboard = require("alpha.themes.dashboard")

dashboard.section.header.val ={
[[██╗  ██╗ █████╗ ██╗       ██╗██╗  ██╗     ██╗ █████╗  █████╗ ██╗  ██╗]],
[[██║  ██║██╔══██╗██║  ██╗  ██║██║ ██╔╝     ██║██╔══██╗██╔══██╗██║ ██╔╝]],
[[███████║███████║╚██╗████╗██╔╝█████═╝      ██║███████║██║  ╚═╝█████═╝ ]],
[[██╔══██║██╔══██║ ████╔═████║ ██╔═██╗ ██╗  ██║██╔══██║██║  ██╗██╔═██╗ ]],
[[██║  ██║██║  ██║ ╚██╔╝ ╚██╔╝ ██║ ╚██╗╚█████╔╝██║  ██║╚█████╔╝██║ ╚██╗]],
[[╚═╝  ╚═╝╚═╝  ╚═╝  ╚═╝   ╚═╝  ╚═╝  ╚═╝ ╚════╝ ╚═╝  ╚═╝ ╚════╝ ╚═╝  ╚═╝]],
}

dashboard.section.header.opts.hl = "Include"

  dashboard.section.buttons.val = {
	dashboard.button("f", "🔭  Find file", ":Telescope find_files <CR>"),
	dashboard.button("n", "🆕  New file", ":ene <BAR> startinsert <CR>"),
	dashboard.button("p", "📁  Find project", ":Telescope projects <CR>"),
	dashboard.button("r", "⏰  Recently used files", ":Telescope oldfiles <CR>"),
	dashboard.button("t", "📜  Find text", ":Telescope live_grep <CR>"),
	dashboard.button("c", "🛠️  Configuration", ":e ~/.config/nvim/init.lua <CR>"),
    dashboard.button("?", "❓  Shortcuts", ":e ~/.config/nvim/shortcuts.txt <CR>"),
    dashboard.button("s", "🎨  Colorscheme", ":Telescope colorscheme <CR>"),
    dashboard.button("q", "❌  Quit Neovim", ":qa<CR>"),
}

dashboard.section.footer.opts.hl = "Type"

local function footer()
    local quotes = {
    "Give someone a program; you frustrate them for a day; teach them how to program, and you frustrate them for a lifetime – David Leinweber",
    "Don’t comment bad code – rewrite it – Brian Kernighan",
    "No one in the brief history of computing has ever written a piece of perfect software. It’s unlikely that you’ll be the first – Andy Hunt",
    "Sometimes it pays to stay in bed on Monday rather than spending the rest of the week debugging Monday’s code – Dan Salomon",
    "Bad programmers worry about the code. Good programmers worry about data structures and their relationships – Linus Torvalds",
    "Debugging becomes significantly easier if you first admit that you are the problem – William Laeder",
    "Any fool can write code that a computer can understand. Good programmers write code that humans can understand – Martin Fowler",
    "One of my most productive days was throwing away 1000 lines of code – Ken Thompson",
    "Everyday life is like programming, I guess. If you love something, you can put beauty into it – Donald Knuth",
    "Everybody in this country should learn to program a computer because it teaches you how to think – Steve Jobs",
    "System programmers are the high priests of a low cult – Robert S. Barton",
    "A good programmer is someone who always looks both ways before crossing a one-way street – Doug Linder",
    "I don’t care if it works on your machine! We are not shipping your machine – Vidiu Platon",
    "Fix the cause, not the symptom – Steve Maguire",
    "Measuring programming progress by lines of code is like measuring aircraft building progress by weight – Bill Gates",
    "In programming, the hard part isn’t solving problems but deciding what problems to solve – Paul Graham",
    "If debugging is the process of removing software bugs, then programming must be the process of putting them in – Edsger W. Dijkstra",
    "First, solve the problem. Then write the code – John Johnson",
    "The computer was born to solve problems that did not exist before – Bill Gates",
    "Make it work, make it right, make it fast – Kent Beck",
    "Always code as if the guy who ends up maintaining your code will be a violent psychopath who knows where you live – Rick Osborne",
    "People don’t care about what you say, they care about what you build – Mark Zuckerberg",
    "In order to be irreplaceable, one must always be different – Coco Chanel",
    }

    -- Choose a random quote
    local random_index = math.random(1, #quotes)
    return quotes[random_index]
end

dashboard.section.footer.val = footer()
dashboard.section.footer.opts.hl = "Type"
dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"

dashboard.opts.opts.noautocmd = true
--vim.cmd ":cd /home/aviraj___1729/my_projects/"
--
--vim.cmd([[autocmd User AlphaReady echo 'ready']])
alpha.setup(dashboard.opts)

