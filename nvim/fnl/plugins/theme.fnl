(local current-theme :gruvbox)  ;; Change this to switch themes

;; gruvbox, , onedark, ,everforest, kangawa, nordic


;; Function to detect system theme on macOS
(fn get-system-mode []
  (let [output (vim.fn.system ["defaults" "read" "-g" "AppleInterfaceStyle"])]
    (if (string.match output "Dark")
        :dark
        :light)))

;; Set the mode based on system theme
(local mode (get-system-mode))

(if (= mode :dark)
    (vim.api.nvim_set_option "background" "dark")
    (vim.api.nvim_set_option "background" "light"))


;; Define themes
[
  {1 :rose-pine/neovim
    :priority 1000
    :cond (= current-theme :rose)
    :config (fn []
              (let [rp (require :rose-pine)]
                (rp.setup {:disable-background true}))
              (vim.cmd "colorscheme rose-pine")
              ;;(vim.api.nvim_set_hl 0 "Normal" {:by none})
              ;;(vim.api.nvim_set_hl 0 "NormalFloat" {:by none})
              )}
  ;; Gruvbox Theme
  {1 :ellisonleao/gruvbox.nvim
    :priority 1000
    :cond (= current-theme :gruvbox)
    :config (fn []
              (let [gruvbox (require :gruvbox)]
                (gruvbox.setup
                  {:terminal_colors true
                   :undercurl true
                   :underline true
                   :bold false
                   :italic {:strings true
                            :emphasis true
                            :comments true
                            :operators false
                            :folds true}
                   :strikethrough true
                   :invert_selection false
                   :invert_signs false
                   :invert_tabline false
                   :invert_intend_guides false
                   :inverse true
                   :contrast "hard"
                   :palette_overrides {}
                   :overrides {}
                   :dim_inactive false
                   :transparent_mode false}))
              (vim.cmd "colorscheme gruvbox"))}


  ;; Onedark Theme (Light)
  {1 :navarasu/onedark.nvim
    :priority 1000
    :cond (= current-theme :onedark)
    :config (fn []
              (let [onedark (require :onedark)]
                (onedark.setup {:style (if (= mode :dark)
                                         :darker
                                         :light)}))
              (vim.cmd "colorscheme onedark"))}

  {1 :scottmckendry/cyberdream.nvim
    :priority 1000
    :cond (= current-theme :cyberdream)
    :config (fn []
              (let [cd (require :cyberdream)]
                (cd.setup {:transparent true}))
                
              (vim.cmd "colorscheme cyberdream"))}

  {1 :sainnhe/everforest
    :priority 1000
    :cond (= current-theme :everforest)
    :config (fn []
              (set vim.g.everforest_transparent_background 1)
              (vim.cmd "colorscheme everforest"))}

  {1 :rebelot/kanagawa.nvim
    :priority 1000
    :cond (= current-theme :kanagawa)
    :config (fn []
              (let [kan (require :kanagawa)]
                (kan.setup {:transparent false}))
              (vim.cmd "colorscheme kanagawa"))}

  ]

