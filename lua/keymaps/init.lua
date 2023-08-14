local k = vim.api.nvim_set_keymap
local function standard_keymaps()
	k("n", "<CR>", [[o<Esc>]], { noremap = true })
	k("n", "<TAB>", [[:bnext<CR>]], { noremap = true })
	k("n", "<S-TAB>", [[:bprevious<CR>]], { noremap = true })

	k("n", "h", "h", { noremap = true })
	k("n", "j", "gj", { noremap = true })
	k("n", "k", "gk", { noremap = true })
	k("n", "l", "l", { noremap = true })

	k("n", "i", "i", { noremap = true })
	k("n", "u", "u", { noremap = true })

	k("n", "<C-c>", [[<Esc>]], { noremap = true })
	k("i", "jk", [[<Esc>]], { noremap = true })
	k("i", "kj", [[<Esc>]], { noremap = true })
	k("v", "q", [[<Esc>]], { noremap = true })

	k("n", "<C-h>", [[<C-w>h]], { noremap = true })
	k("n", "<C-j>", [[<C-w>j]], { noremap = true })
	k("n", "<C-k>", [[<C-w>k]], { noremap = true })
	k("n", "<C-l>", [[<C-w>l]], { noremap = true })

	k("v", "<", [[<gv]], { noremap = true })
	k("v", ">", [[>gv]], { noremap = true })

	k("n", "x", [["_x]], { noremap = true })
	k("n", "X", [["_X]], { noremap = true })

	-- Fix for Xterm
	k("i", "<S-{>", "{", { noremap = false })
	k("i", "<S-}>", "}", { noremap = false })
end

local function colemakdh_keymaps()
	k("n", "<CR>", [[o<Esc>]], { noremap = true })
	k("n", "<TAB>", [[:bnext<CR>]], { noremap = true })
	k("n", "<S-TAB>", [[:bprevious<CR>]], { noremap = true })

	k("n", "m", "h", { noremap = true })
	k("n", "n", "gj", { noremap = true })
	k("n", "e", "gk", { noremap = true })
	k("n", "i", "l", { noremap = true })

	k("n", "u", "i", { noremap = true })
	k("n", "l", "u", { noremap = true })

	k("n", "<C-c>", [[<Esc>]], { noremap = true })
	k("i", "ne", [[<Esc>]], { noremap = true })
	k("i", "en", [[<Esc>]], { noremap = true })
	k("v", "q", [[<Esc>]], { noremap = true })

	k("n", "<C-m>", [[<C-w>h]], { noremap = true })
	k("n", "<C-n>", [[<C-w>j]], { noremap = true })
	k("n", "<C-e>", [[<C-w>k]], { noremap = true })
	k("n", "<C-i>", [[<C-w>l]], { noremap = true })

	k("v", "<", [[<gv]], { noremap = true })
	k("v", ">", [[>gv]], { noremap = true })

	k("n", "x", [["_x]], { noremap = true })
	k("n", "X", [["_X]], { noremap = true })
	-- Fix for Xterm
	k("i", "<S-{>", "{", { noremap = false })
	k("i", "<S-}>", "}", { noremap = false })
end

-- check for colemak in setxkbmap query
-- if colemak, use special keymaps
-- else use standard
local function check_layout()
	local x = vim.fn.system({ "setxkbmap", "-query" })
	for s in x:gmatch("[^\r\n]+") do
		if string.find(s, "variant") then
			for v in string.gmatch(s, "([^ ]+)") do
				if v ~= "variant:" then
					if v == "colemak_dh" then
						colemakdh_keymaps()
						return
					end
				end
			end
		end
	end
	standard_keymaps()
end
check_layout()
