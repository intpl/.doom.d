;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here
;;

;; (setq doom-font (font-spec :family "Source Code Pro Medium" :size 16))

 (defun transparency (value)
   "Sets the transparency of the frame window. 0=transparent/100=opaque"
   (interactive "nTransparency Value 0 - 100 opaque:")
   (set-frame-parameter (selected-frame) 'alpha value))

(add-to-list 'default-frame-alist '(fullscreen . maximized))

(require 'rvm)
(rvm-use-default) ;; use rvm's default ruby for the current Emacs session

(defadvice inf-ruby-console-auto (before activate-rvm-for-robe activate)
  (rvm-activate-corresponding-ruby))

(add-hook 'ruby-mode-hook 'robe-mode)

(eval-after-load 'company
  '(push 'company-robe company-backends))

(add-hook 'robe-mode-hook 'ac-robe-setup)
