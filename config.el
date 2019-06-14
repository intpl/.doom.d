;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here
;;

;; (setq doom-font (font-spec :family "Source Code Pro Medium" :size 16))

;; WIP
;; (global-set-key (kbd "C-v") 'vterm-yank)
;; (evil-define-key 'normal 'vterm "p" 'vterm-yank)

(defun sort-this-yaml-file ()
  (interactive)
  (shell-command (concatenate 'string "yml-sorter --input " (buffer-file-name)))
  (revert-buffer :ignore-auto :noconfirm))

(defun copy-file-name-to-clipboard ()
  "Copy the current buffer file name to the clipboard."
  (interactive)
  (let ((filename (if (equal major-mode 'dired-mode)
                      default-directory
                    (buffer-name))))
    (when filename
      (kill-new filename)
      (message "%s" filename))))

(defun connect-gladecki ()
  (interactive)
  (dired "/ssh:gl:/home/bartek"))

(defun transparency (value)
  "Sets the transparency of the frame window. 0=transparent/100=opaque"
  (interactive "nTransparency Value 0 - 100 opaque:")
  (set-frame-parameter (selected-frame) 'alpha value))

(require 'rvm)
(rvm-use-default) ;; use rvm's default ruby for the current Emacs session

(defadvice inf-ruby-console-auto (before activate-rvm-for-robe activate)
  (rvm-activate-corresponding-ruby))

(setq enh-ruby-add-encoding-comment-on-save nil)

(global-company-mode t)

;; (require 'company-tabnine)
;; Trigger completion immediately.
(setq company-idle-delay 0)

;; Number the candidates (use M-1, M-2 etc to select completions).
(setq company-show-numbers t)

;; Use the tab-and-go frontend.
;; Allows TAB to select and complete at the same time.
(company-tng-configure-default)

(push 'company-robe company-backends)
(push 'company-capf company-backends)
(push 'company-dabbrev company-backends)

(push 'company-tng-frontend company-frontends)
(push 'company-pseudo-tooltip-frontend company-frontends)
(push 'company-echo-metadata-frontend company-frontends)

(with-eval-after-load 'company (company-flx-mode +1))
(setq company-flx-limit 200)

;; (setq ivy-re-builders-alist
;;       '((ivy-switch-buffer . ivy--regex-plus)
;;         (t . ivy--regex-fuzzy)))

(setq ivy-re-builders-alist
      '((t . ivy--regex-plus)))

(defun add-string-to-end-of-line (str) "Adds a string to the end of line" (end-of-line) (insert str))

(define-key evil-normal-state-map (kbd ", ,") (lambda () (interactive) (add-string-to-end-of-line ",")))
(define-key evil-normal-state-map (kbd ", ;") (lambda () (interactive) (add-string-to-end-of-line ";")))

(defun add-string-below (str) "Adds a string to the line below" (evil-open-below 1) (insert str) (evil-normal-state))
(defun add-string-above (str) "Adds a string to the line above" (evil-open-above 1) (insert str) (evil-normal-state))

(evil-define-key 'normal js-mode-map (kbd ", o") (lambda () (interactive) (add-string-below "console.log()")))
(evil-define-key 'normal js-mode-map (kbd ", O") (lambda () (interactive) (add-string-above "console.log()")))

(evil-define-key 'normal enh-ruby-mode-map (kbd ", o") (lambda () (interactive) (add-string-below "binding.pry # FIXME")))
(evil-define-key 'normal enh-ruby-mode-map (kbd ", O") (lambda () (interactive) (add-string-above "binding.pry # FIXME")))

(define-key evil-normal-state-map (kbd ", t") (lambda () (interactive) (multi-term-next)))
(define-key evil-normal-state-map (kbd ", f s") 'save-buffer)

(define-key evil-normal-state-map (kbd "SPC 1") (lambda () (interactive) (+workspace/switch-to 0)))
(define-key evil-normal-state-map (kbd "SPC 2") (lambda () (interactive) (+workspace/switch-to 1)))
(define-key evil-normal-state-map (kbd "SPC 3") (lambda () (interactive) (+workspace/switch-to 2)))
(define-key evil-normal-state-map (kbd "SPC 4") (lambda () (interactive) (+workspace/switch-to 3)))
(define-key evil-normal-state-map (kbd "SPC 5") (lambda () (interactive) (+workspace/switch-to 4)))
(define-key evil-normal-state-map (kbd "SPC 6") (lambda () (interactive) (+workspace/switch-to 5)))

(evil-define-key 'normal magit-mode-map (kbd "SPC 1") (lambda () (interactive) (+workspace/switch-to 0)))
(evil-define-key 'normal magit-mode-map (kbd "SPC 2") (lambda () (interactive) (+workspace/switch-to 1)))
(evil-define-key 'normal magit-mode-map (kbd "SPC 3") (lambda () (interactive) (+workspace/switch-to 2)))
(evil-define-key 'normal magit-mode-map (kbd "SPC 4") (lambda () (interactive) (+workspace/switch-to 3)))
(evil-define-key 'normal magit-mode-map (kbd "SPC 5") (lambda () (interactive) (+workspace/switch-to 4)))
(evil-define-key 'normal magit-mode-map (kbd "SPC 6") (lambda () (interactive) (+workspace/switch-to 5)))

(setenv "VISUAL" "emacsclient")
(setenv "EDITOR" "emacsclient")
(setenv "TERM" "screen-256color")
(setenv "TAG_CMD_FMT_STRING" "emacsclient +{{.LineNumber}}:{{.ColumnNumber}} {{.Filename}}")

(setq multi-term-program "/usr/bin/fish")

(define-key evil-normal-state-map (kbd ", r") (lambda () (interactive) (rvm-open-gem (getenv "GEM_HOME"))))

(setq visual-line-mode 'nil)
(setq display-line-numbers-type 'relative)
;;(setq markdown-open-command "/Applications/MacDown.app/Contents/MacOS/MacDown")

(define-key evil-normal-state-map (kbd "SPC f k") (lambda () (interactive) (copy-file-name-to-clipboard)))
(define-key evil-normal-state-map (kbd ", s") (lambda () (interactive) (sort-this-yaml-file)))

(define-key evil-normal-state-map (kbd ", g") (lambda () (interactive) (zoom)))
(define-key evil-normal-state-map (kbd "SPC w ,") (lambda () (interactive) (zoom)))

(define-key evil-normal-state-map (kbd ", i") (lambda () (interactive) (ielm)))

(define-key evil-normal-state-map (kbd ", q") (lambda () (interactive) (kill-current-buffer)))

(custom-set-variables '(zoom-size '(0.8 . 0.8)))
;(custom-set-variables '(zoom-size '(0.618 . 0.618)))

(defadvice evil-inner-word (around underscore-as-word activate)
  (let ((table (copy-syntax-table (syntax-table))))
    (modify-syntax-entry ?_ "w" table)
    (with-syntax-table table
      ad-do-it)))

;; (global-auto-complete-mode t)
;; (global-set-key (kbd "<S-tab>") 'ac-fuzzy-complete)

;; (add-hook 'ruby-mode-hook #'auto-complete-mode)
;; (add-hook 'enh-ruby-mode-hook #'auto-complete-mode)

(with-eval-after-load 'evil
  (require 'evil-anzu))

(setq doom-font (font-spec :family "Iosevka SS01 Medium" :size 17)
      doom-big-font (font-spec :family "Iosevka SS01 Medium" :size 21))
