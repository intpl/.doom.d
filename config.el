;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here
;;

;; (setq doom-font (font-spec :family "Source Code Pro Medium" :size 16))

 (defun transparency (value)
   "Sets the transparency of the frame window. 0=transparent/100=opaque"
   (interactive "nTransparency Value 0 - 100 opaque:")
   (set-frame-parameter (selected-frame) 'alpha value))

(require 'rvm)
(rvm-use-default) ;; use rvm's default ruby for the current Emacs session

(defun add-string-to-end-of-line (str) "Adds a string to the end of line" (end-of-line) (insert str))

(define-key evil-normal-state-map (kbd ", ,") (lambda () (interactive) (add-string-to-end-of-line ",")))
(define-key evil-normal-state-map (kbd ", ;") (lambda () (interactive) (add-string-to-end-of-line ";")))

(defun add-string-below (str) "Adds a string to the line below" (evil-open-below 1) (insert str) (evil-normal-state))
(defun add-string-above (str) "Adds a string to the line above" (evil-open-above 1) (insert str) (evil-normal-state))

(evil-define-key 'normal js-mode-map (kbd ", o") (lambda () (interactive) (add-string-below "console.log()")))
(evil-define-key 'normal js-mode-map (kbd ", O") (lambda () (interactive) (add-string-above "console.log()")))

(evil-define-key 'normal enh-ruby-mode-map (kbd ", o") (lambda () (interactive) (add-string-below "binding.pry")))
(evil-define-key 'normal enh-ruby-mode-map (kbd ", O") (lambda () (interactive) (add-string-above "binding.pry")))
