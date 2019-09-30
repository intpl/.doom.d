;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here
;;

;; (setq doom-font (font-spec :family "Source Code Pro Medium" :size 16))

;; WIP
;; (global-set-key (kbd "C-v") 'vterm-yank)
;; (evil-define-key 'normal 'vterm "p" 'vterm-yank)

(defun jta-reformat-xml ()
  "Reformats xml to make it readable (respects current selection)."
  (interactive)
  (save-excursion
    (let ((beg (point-min))
          (end (point-max)))
      (if (and mark-active transient-mark-mode)
          (progn
            (setq beg (min (point) (mark)))
            (setq end (max (point) (mark))))
        (widen))
      (setq end (copy-marker end t))
      (goto-char beg)
      (while (re-search-forward ">\\s-*<" end t)
        (replace-match ">\n<" t t))
      (goto-char beg)
      (indent-region beg end nil))))

(defun sort-this-yaml-file ()
  (interactive)
  (shell-command (concatenate 'string "/home/b/.nvm/versions/node/v8.16.0/bin/yml-sorter --input " (buffer-file-name)))
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

(defun transparency_in_terminal ()
  (set-face-background 'default "unspecified-bg" (selected-frame)))

(defun transparency_USE_KEYBINDINGS (value)
  "Sets the transparency of the frame window. 0=transparent/100=opaque"
  (interactive "nTransparency Value 0 - 100 opaque:")
  (set-frame-parameter (selected-frame) 'alpha value))

(defun kde-blurry-emacs () (interactive) (shell-command "kde_blurry_pgrep emacs"))
(defun kde-blurry-konsole () (interactive) (shell-command "kde_blurry_pgrep konsole"))

(require 'rvm)
(rvm-use-default) ;; use rvm's default ruby for the current Emacs session

(setq enh-ruby-add-encoding-comment-on-save nil)

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

(define-key evil-normal-state-map (kbd ", f f") (lambda () (interactive) (ffap)))

(define-key evil-normal-state-map (kbd ", l") (lambda () (interactive) (what-line)))

(define-key evil-normal-state-map (kbd "SPC 1") (lambda () (interactive) (+workspace/switch-to 0)))
(define-key evil-normal-state-map (kbd "SPC 2") (lambda () (interactive) (+workspace/switch-to 1)))
(define-key evil-normal-state-map (kbd "SPC 3") (lambda () (interactive) (+workspace/switch-to 2)))
(define-key evil-normal-state-map (kbd "SPC 4") (lambda () (interactive) (+workspace/switch-to 3)))
(define-key evil-normal-state-map (kbd "SPC 5") (lambda () (interactive) (+workspace/switch-to 4)))
(define-key evil-normal-state-map (kbd "SPC 6") (lambda () (interactive) (+workspace/switch-to 5)))

(define-key evil-visual-state-map (kbd "SPC 1") (lambda () (interactive) (+workspace/switch-to 0)))
(define-key evil-visual-state-map (kbd "SPC 2") (lambda () (interactive) (+workspace/switch-to 1)))
(define-key evil-visual-state-map (kbd "SPC 3") (lambda () (interactive) (+workspace/switch-to 2)))
(define-key evil-visual-state-map (kbd "SPC 4") (lambda () (interactive) (+workspace/switch-to 3)))
(define-key evil-visual-state-map (kbd "SPC 5") (lambda () (interactive) (+workspace/switch-to 4)))
(define-key evil-visual-state-map (kbd "SPC 6") (lambda () (interactive) (+workspace/switch-to 5)))

(evil-define-key 'normal magit-mode-map (kbd "SPC 1") (lambda () (interactive) (+workspace/switch-to 0)))
(evil-define-key 'normal magit-mode-map (kbd "SPC 2") (lambda () (interactive) (+workspace/switch-to 1)))
(evil-define-key 'normal magit-mode-map (kbd "SPC 3") (lambda () (interactive) (+workspace/switch-to 2)))
(evil-define-key 'normal magit-mode-map (kbd "SPC 4") (lambda () (interactive) (+workspace/switch-to 3)))
(evil-define-key 'normal magit-mode-map (kbd "SPC 5") (lambda () (interactive) (+workspace/switch-to 4)))
(evil-define-key 'normal magit-mode-map (kbd "SPC 6") (lambda () (interactive) (+workspace/switch-to 5)))

(setenv "TERM" "screen-256color")

(setq multi-term-program "/usr/bin/fish")

(define-key evil-normal-state-map (kbd ", r") (lambda () (interactive) (rvm-open-gem (getenv "GEM_HOME"))))

;; (setq visual-line-mode 'nil)
(setq display-line-numbers-type 'relative)
;; (setq display-line-numbers-type nil)
;;(setq markdown-open-command "/Applications/MacDown.app/Contents/MacOS/MacDown")

(define-key evil-normal-state-map (kbd "SPC f k") (lambda () (interactive) (copy-file-name-to-clipboard)))
(define-key evil-normal-state-map (kbd ", s") (lambda () (interactive) (sort-this-yaml-file)))

(define-key evil-normal-state-map (kbd "SPC w ,") (lambda () (interactive) (zoom)))
(evil-define-key 'normal magit-mode-map (kbd "SPC w ,") (lambda () (interactive) (zoom)))

(define-key evil-normal-state-map (kbd ", i") (lambda () (interactive) (ielm)))

(define-key evil-normal-state-map (kbd ", q") (lambda () (interactive) (kill-current-buffer)))
(evil-define-key 'normal magit-mode-map (kbd ", q") (lambda () (interactive) (kill-current-buffer)))

(define-key evil-normal-state-map (kbd ", c q") (lambda () (interactive) (kill-emacs)))
(evil-define-key 'normal magit-mode-map (kbd ", c q") (lambda () (interactive) (kill-emacs)))
(define-key evil-normal-state-map (kbd "SPC c q") (lambda () (interactive) (kill-emacs)))
(evil-define-key 'normal magit-mode-map (kbd "SPC c q") (lambda () (interactive) (kill-emacs)))

(define-key evil-normal-state-map (kbd ", z") (lambda () (interactive) (helm-dash-at-point)))
(define-key evil-normal-state-map (kbd ", Z") (lambda () (interactive) (zeal-at-point)))

(global-set-key (kbd "<backtab>") 'dabbrev-expand)
(define-key minibuffer-local-map (kbd "<backtab>") 'dabbrev-expand)

;; Google Translate

(define-key evil-normal-state-map (kbd ", g") 'google-translate-at-point) ; normal
(define-key evil-visual-state-map (kbd ", g") 'google-translate-at-point) ; visual
(define-key evil-normal-state-map (kbd ", G") 'google-translate-query-translate) ; normal

;; (setq google-translate-default-source-language "Detect language")
;; (setq google-translate-default-target-language "English")

;; other things
;;(define-key evil-normal-state-map (kbd ", j") #'robe-jump)
;;(define-key evil-visual-state-map (kbd ", j") #'robe-jump)

(custom-set-variables '(zoom-size '(0.8 . 0.8)))
;(custom-set-variables '(zoom-size '(0.618 . 0.618)))

;;(defadvice evil-inner-word (around underscore-as-word activate)
;;  (let ((table (copy-syntax-table (syntax-table))))
;;    (modify-syntax-entry ?_ "w" table)
;;    (with-syntax-table table
;;      ad-do-it)))

;; WIP (def-package-hook! helm-dash :post-init (setq helm-dash-docsets-path "~/.local/share/Zeal/Zeal/docsets"))

(with-eval-after-load 'evil
  (require 'evil-anzu))

(require 'evil-matchit)
(global-evil-matchit-mode 1)

(setq doom-font (font-spec :family "Iosevka SS01 Medium" :size 17)
      doom-big-font (font-spec :family "Iosevka SS01 Medium" :size 21))

(setq js-indent-level 2)

;;(setq doom-theme 'doom-moonlight)
(setq doom-theme 'doom-palenight)

(setq projectile-project-search-path '("~/work/" "~/code/" "~/.doom.d/"))


(setq hippie-expand-try-functions-list '(try-expand-dabbrev
                                         try-expand-dabbrev-all-buffers
                                         try-expand-dabbrev-from-kill
                                         try-complete-file-name-partially
                                         try-complete-file-name
                                         try-expand-all-abbrevs
                                         try-expand-list
                                         try-expand-line
                                         try-complete-lisp-symbol-partially
                                         try-complete-lisp-symbol))

(defun indent-or-expand (arg)
  "Either indent according to mode, or expand the word preceding
point."
  (interactive "*P")
  (if (and
       (or (bobp) (= ?w (char-syntax (char-before))))
       (or (eobp) (not (= ?w (char-syntax (char-after))))))
      (dabbrev-expand arg)
    (indent-according-to-mode)))

(global-set-key (kbd "TAB") 'indent-or-expand)

;;(with-eval-after-load 'evil
;;  (defalias #'forward-evil-word #'forward-evil-symbol))

(global-set-key (kbd "<f5>") #'deadgrep)

(load-file "~/.doom.d/better-navigate.el")

(unless (display-graphic-p)
  (xclip-mode 1))
