;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Marco Antônio"
      user-mail-address "marco@tremtec.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)

;; Set Tab width
(setq tab-width 2)

;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.


;; Setup org mode
(after! org
  (setq org-directory "~/notes/"
        org-todo-keywords '((sequence "TODO(t)" "WIP(i)" "WAIT(w)" "HOLD(h)" "|" "DONE(d)" "CANCELED(c)"))
        org-todo-keyword-faces
        '(("TODO" :foreground "lime" :weight normal :underline t)
          ("WIP" :foreground "yellow" :weight normal :underline t)
          ("WAIT" :foreground "#9f7efe" :weight normal :underline t)
          ("HOLD" :foreground "#9f7efe" :weight normal :underline t)
          ("DONE" :foreground "#50a14f" :weight normal :underline t)
          ("CANCELED" :foreground "#ff6480" :weight normal :underline t))
        org-agenda-files (list "~/notes/agenda.org")))

;; Setup zsh
(setq shell-file-name "zsh")
(setenv "SHELL" shell-file-name)

;; Golang
(add-hook 'before-save-hook 'gofmt-before-save)

;; Setup Packages
(use-package wakatime-mode)

;; Initialization
(global-wakatime-mode)
