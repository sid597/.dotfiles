(local {: autoload} (require :nfnl.module))
(local core (autoload :nfnl.core))
(local map (fn [modes lhs rhs & [opts]]
  (vim.keymap.set modes lhs rhs (or opts {}))))



;space is reserved to be lead
(vim.keymap.set :n :<space> :<nop> {:noremap true})

;sets a nvim global options
(let [options
      {;tabs is space
       :expandtab      	true
       ;tab/indent size
       :tabstop        	2
       :shiftwidth     	2
       :softtabstop    	2
       :nu             	true 
;       :termguicolors   true
       :relativenumber 	true
       :wrap 		false 
       :swapfile 	false
       :backup 		false
       :undodir 	(.. (os.getenv "HOME") "/.vim/undodir")
       :undofile 	true
       :hlsearch        false
       :incsearch	true
       :scrolloff       8
       :updatetime      50
       ;settings needed for compe autocompletion
       :completeopt 	"menuone,noselect"
       ;case insensitive search
       :ignorecase 	true
       ;smart search case
       :smartcase 	true
       ;shared clipboard with linux
       :clipboard 	"unnamedplus"
       ;show line numbers
       :number 		true
       ;show line and column number
       :ruler 		true
       ;makes signcolumn always one column with signs and linenumber
       :signcolumn 	"number"}]
  (each [option value (pairs options)]
    (core.assoc vim.o option value)))
(vim.opt.isfname:append "@-@")

(map "n" "<leader>nn" vim.cmd.Ex)
(local normal-visual-modes {"n" "v"})

(local key-mappings {
  "n" "h"
  "e" "j"
  "i" "k"
  "o" "l"
  "'" "o"
  "k" "n"
  "s" "i"
  "f" "e"
  "S" "I"})

(each [lhs rhs (pairs key-mappings)]
  (map "n" lhs rhs))

(each [lhs rhs (pairs key-mappings)]
  (map "v" lhs rhs))



; Create an autocmd group for custom Netrw mappings
(vim.api.nvim_create_augroup "CustomNetrwMappings" {:clear true})

(vim.api.nvim_create_autocmd "FileType"
  {:group "CustomNetrwMappings"
   :pattern "netrw"
   :callback (fn []
     (local netrw-mappings {
       "n" "h"
       "e" "j"
       "i" "k"
       "o" "l"
       "'" "o"
       "k" "n"
       "s" "i"
       "f" "e"
       "S" "I"})
     (each [lhs rhs (pairs netrw-mappings)]
       (vim.keymap.set "n" lhs rhs {:buffer true})))})




;Scrolling and Yank Keybindings
(vim.keymap.set "n" "<C-d>" "<C-d>zz")
(vim.keymap.set "n" "<C-u>" "<C-u>zz")
(vim.keymap.set "n" "<leader>y" "\"+y")
(vim.keymap.set "v" "<leader>y" "\"+y")
(vim.keymap.set "v" "<leader>Y" "\"+Y")
(vim.keymap.set "n" "<leader>gg" "ggVG")
(vim.keymap.set "v" "<leader>gg" "ggVG")



(vim.keymap.set ["n" "v"] "<leader>yy"
  (fn []
    (local old-pos (vim.fn.getpos "."))
    (vim.cmd "normal! ggVG\"+y")
    (vim.fn.setpos "." old-pos))
  {:desc "Yank entire buffer to system clipboard"})


{}

