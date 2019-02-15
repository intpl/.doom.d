;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here
;;

;; (setq doom-font (font-spec :family "Source Code Pro Medium" :size 16))

(defun connect-gladecki ()
  (interactive)
  (dired "/ssh:gl:/home/bartek"))

(defun transparency (value)
  "Sets the transparency of the frame window. 0=transparent/100=opaque"
  (interactive "nTransparency Value 0 - 100 opaque:")
  (set-frame-parameter (selected-frame) 'alpha value))

(require 'rvm)
(rvm-use-default) ;; use rvm's default ruby for the current Emacs session

(setq enh-ruby-add-encoding-comment-on-save nil)

;; Trigger completion immediately.
(setq company-idle-delay 0)

;; Number the candidates (use M-1, M-2 etc to select completions).
(setq company-show-numbers t)

;; Use the tab-and-go frontend.
;; Allows TAB to select and complete at the same time.
(company-tng-configure-default)
(setq company-frontends
      '(company-tng-frontend
        company-pseudo-tooltip-frontend
        company-echo-metadata-frontend))

(defun add-string-to-end-of-line (str) "Adds a string to the end of line" (end-of-line) (insert str))

(define-key evil-normal-state-map (kbd ", ,") (lambda () (interactive) (add-string-to-end-of-line ",")))
(define-key evil-normal-state-map (kbd ", ;") (lambda () (interactive) (add-string-to-end-of-line ";")))

(defun add-string-below (str) "Adds a string to the line below" (evil-open-below 1) (insert str) (evil-normal-state))
(defun add-string-above (str) "Adds a string to the line above" (evil-open-above 1) (insert str) (evil-normal-state))

(evil-define-key 'normal js-mode-map (kbd ", o") (lambda () (interactive) (add-string-below "console.log()")))
(evil-define-key 'normal js-mode-map (kbd ", O") (lambda () (interactive) (add-string-above "console.log()")))

(evil-define-key 'normal enh-ruby-mode-map (kbd ", o") (lambda () (interactive) (add-string-below "binding.pry # FIXME")))
(evil-define-key 'normal enh-ruby-mode-map (kbd ", O") (lambda () (interactive) (add-string-above "binding.pry # FIXME")))

(define-key evil-normal-state-map (kbd ", t") (lambda () (interactive) (+term/open-popup t)))
(define-key evil-normal-state-map (kbd ", f s") 'save-buffer)

(define-key evil-normal-state-map (kbd "SPC 1") (lambda () (interactive) (+workspace/switch-to 0)))
(define-key evil-normal-state-map (kbd "SPC 2") (lambda () (interactive) (+workspace/switch-to 1)))
(define-key evil-normal-state-map (kbd "SPC 3") (lambda () (interactive) (+workspace/switch-to 2)))
(define-key evil-normal-state-map (kbd "SPC 4") (lambda () (interactive) (+workspace/switch-to 3)))
(define-key evil-normal-state-map (kbd "SPC 5") (lambda () (interactive) (+workspace/switch-to 4)))
(define-key evil-normal-state-map (kbd "SPC 6") (lambda () (interactive) (+workspace/switch-to 5)))

(setenv "VISUAL" "emacsclient")
(setenv "EDITOR" (getenv "VISUAL"))
(setenv "TERM" "screen-256color")

(setq multi-term-program "/usr/local/bin/fish")

(define-key evil-normal-state-map (kbd "SPC r") (lambda () (interactive) (rvm-open-gem (getenv "GEM_HOME"))))
(define-key evil-normal-state-map (kbd ", r") (lambda () (interactive) (rvm-open-gem (getenv "GEM_HOME"))))

(global-set-key (kbd "C-:") 'avy-goto-char)

(setq visual-line-mode 'nil)
(setq display-line-numbers-type 'relative)
(setq markdown-open-command "/Applications/MacDown.app/Contents/MacOS/MacDown")

(defun copy-file-name-to-clipboard ()
  "Copy the current buffer file name to the clipboard."
  (interactive)
  (let ((filename (if (equal major-mode 'dired-mode)
                      default-directory
                    (buffer-name))))
    (when filename
      (kill-new filename)
      (message " -> '%s' <- " filename))))

(define-key evil-normal-state-map (kbd "SPC f k") (lambda () (interactive) (copy-file-name-to-clipboard)))

(define-key evil-normal-state-map (kbd ", g") (lambda () (interactive) (zoom)))
(define-key evil-normal-state-map (kbd "SPC w ,") (lambda () (interactive) (zoom)))
(custom-set-variables '(zoom-size '(0.618 . 0.618)))
