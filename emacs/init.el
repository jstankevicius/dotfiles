(require 'package)

; Add melpa package source when using package list
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

; Packages
(setq package-selected-packages
  '())

(when (cl-find-if-not #'package-installed-p package-selected-packages)
  (package-refresh-contents)
  (mapc #'package-install package-selected-packages))

; Stop Emacs from losing undo information by
; setting very high limits for undo buffers
(setq undo-limit 20000000)
(setq undo-strong-limit 40000000)

; Disable startup screen
(setq inhibit-startup-screen t)

; Highlight current line
(global-hl-line-mode t)

; Make cursor not blink
(blink-cursor-mode 0)

; Disable toolbar
(tool-bar-mode -1)

; Disable scrollbar
(scroll-bar-mode -1)

; Turn off the bell on MacOS
(defun nil-bell ())
(setq ring-bell-function 'nil-bell)

; Moving around
(defun previous-blank-line ()
  "Moves to the previous line containing nothing but whitespace."
  (interactive)
  (ignore-errors
  (search-backward-regexp "^[ \t]*\n")))

(defun next-blank-line ()
  "Moves to the next line containing nothing but whitespace."
  (interactive)
  (ignore-errors
  (forward-line)
  (search-forward-regexp "^[ \t]*\n")
  (forward-line -1)))

(defun split-window-horizontally-and-move ()
  "Splits the window horizontally and moves to the new window."
  (interactive)
  (split-window-horizontally)
  (balance-windows)
  (windmove-right))

(defun split-window-vertically-and-move ()
  "Splits the window vertically and moves to the new window."
  (interactive)
  (split-window-vertically)
  (balance-windows)
  (windmove-down))

(defun delete-window-with-rebalance ()
  (interactive)
  (delete-window)
  (balance-windows))

(define-key global-map [C-right] 'forward-word)
(define-key global-map [C-left] 'backward-word)
(define-key global-map [C-up]  'previous-blank-line)
(define-key global-map [C-down]  'next-blank-line)
(define-key global-map [home] 'beginning-of-line)
(define-key global-map [end] 'end-of-line)
(define-key global-map [pgup] 'forward-page)
(define-key global-map [pgdown] 'backward-page)

(define-key global-map [s-return] 'split-window-horizontally-and-move)
(define-key global-map (kbd "s-\\") 'split-window-vertically-and-move)
(define-key global-map (kbd "s-'") 'delete-window-with-rebalance)
(define-key global-map [s-left] 'windmove-left)
(define-key global-map [s-right] 'windmove-right)
(define-key global-map [s-up] 'windmove-up)
(define-key global-map [s-down] 'windmove-down)

; C/C++ mode style stuff
(setq-default c-basic-offset 4)
(setq-default c++-basic-offset 4)


; Color scheme
(add-to-list 'load-path "~/.emacs.d/solarized-emacs/")
(require 'solarized)
(load-theme 'solarized-light :no-confirm)

; Ruler at column 80
(add-hook 'prog-mode-hook #'display-fill-column-indicator-mode)

; Font size
(setq tab-stop-list (number-sequence 4 200 4))
(setq-default indent-tabs-mode nil)

(set-face-attribute 'default nil :height 160)
