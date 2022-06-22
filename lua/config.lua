local use = require('packer').use

require('packer').startup(
    function()
        use 'wbthomason/packer.nvim'

        use 'neovim/nvim-lspconfig' -- Collection of configurations for built-in LSP client

        use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
        use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
        use 'hrsh7th/cmp-buffer'
        use 'hrsh7th/cmp-path'
        use 'hrsh7th/cmp-cmdline'
        use 'hrsh7th/cmp-vsnip'
        use 'hrsh7th/vim-vsnip'

        use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
        use 'L3MON4D3/LuaSnip' -- Snippets plugin

        use 'SirVer/ultisnips'
        use 'quangnguyen30192/cmp-nvim-ultisnips'

        use 'dcampos/nvim-snippy'
        use 'dcampos/cmp-snippy'

        use 'vim-scripts/a.vim'
        use 'voldikss/vim-floaterm'
        use 'mhinz/vim-startify'
        use 'preservim/tagbar'
        use 'godlygeek/tabular'
        use 'plasticboy/vim-markdown'
        use 'suan/vim-instant-markdown'
        use 'luochen1990/rainbow'
        use 'vim-airline/vim-airline'
        use 'vim-airline/vim-airline-themes'
        use 'airblade/vim-gitgutter'
        use 'junegunn/gv.vim'
        use 'bronson/vim-trailing-whitespace'
        use 'Yggdroot/indentline'
        use 'scrooloose/nerdtree'
        use 'Xuyuanp/nerdtree-git-plugin'
        use 'scrooloose/nerdcommenter'
        use 'tpope/vim-vinegar'
        --use 'ctrlpvim/ctrlp.vim'
        use 'mileszs/ack.vim'
        use 'easymotion/vim-easymotion'
        use 'tpope/vim-fugitive'
        use { 'ojroques/nvim-lspfuzzy',
                requires = {
                    {'junegunn/fzf'},
                    {'junegunn/fzf.vim'},  -- to enable preview (optional)
                },
        }
        use 'junegunn/fzf.vim'
        use { 'junegunn/fzf',
                run = function()
                    vim.fn['fzf#install']()
                end,
        }
        use { 'puremourning/vimspector',
            run = './install_gadget.py --enable-rust --enable-python'
        }
    end)


-- Mapping.
local my_custom_on_attach = function(client, bufnr)
    local opts = { noremap=true, silent=true }
    vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
    vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, opts)
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)

    local bufopts = { noremap=true, silent=true, buffer=bufnr }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', 'ds', vim.lsp.buf.document_symbol, bufopts)
    vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    vim.keymap.set('n', '<leader>wl',
        function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end,
        bufopts
    )
    vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', '<leader>f', vim.lsp.buf.formatting, bufopts)
end

require('lspfuzzy').setup {
    methods = 'all',         -- either 'all' or a list of LSP methods (see below)
    jump_one = true,         -- jump immediately if there is only one location
    save_last = false,       -- save last location results for the :LspFuzzyLast command
    callback = nil,          -- callback called after jumping to a location
    fzf_preview = {          -- arguments to the FZF '--preview-window' option
        'right:+{2}-/2'          -- preview on the right and centered on entry
    },
    fzf_action = {               -- FZF actions
        ['ctrl-t'] = 'tab split',  -- go to location in a new tab
        ['ctrl-v'] = 'vsplit',     -- go to location in a vertical split
        ['ctrl-x'] = 'split',      -- go to location in a horizontal split
    },
    fzf_modifier = ':~:.',   -- format FZF entries, see |filename-modifiers|
    fzf_trim = true,         -- trim FZF entries
}

-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local lspconfig = require('lspconfig')

-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
local servers = { 'clangd', 'rust_analyzer', 'pyright', 'tsserver' }
for i, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
        on_attach = my_custom_on_attach,
        capabilities = capabilities,
    }
end

-- luasnip setup
local luasnip = require 'luasnip'

-- nvim-cmp setup
local cmp = require 'cmp'
cmp.setup {
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        },
        ['<Tab>'] = cmp.mapping(
            function(fallback)
                if cmp.visible() then
                    cmp.select_next_item()
                elseif luasnip.expand_or_jumpable() then
                    luasnip.expand_or_jump()
                else
                    fallback()
                end
            end,
            { 'i', 's' }
        ),
        ['<S-Tab>'] = cmp.mapping(
            function(fallback)
                if cmp.visible() then
                    cmp.select_prev_item()
                elseif luasnip.jumpable(-1) then
                    luasnip.jump(-1)
                else
                    fallback()
                  end
            end,
            { 'i', 's' }
        ),
    }),
    sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
    },
}

