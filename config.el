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

(defadvice inf-ruby-console-auto (before activate-rvm-for-robe activate)
  (rvm-activate-corresponding-ruby))

(add-hook 'ruby-mode-hook 'robe-mode)

(eval-after-load 'company
  '(push 'company-robe company-backends))

(add-hook 'robe-mode-hook 'ac-robe-setup)

(defadvice inf-ruby-console-auto (before activate-rvm-for-robe activate)
  (rvm-activate-corresponding-ruby))

;; (defvar my-leader-map (make-sparse-keymap)
;;   "Keymap for \"leader key\" shortcuts.")

;; ;; binding "," to the keymap
;; (define-key evil-normal-state-map "," my-leader-map)

;; (defun insert-semicolon-at-the-end () ((forward-line -1)
;;                                         (insert ";")))

;; (define-key my-leader-map ";" #'insert-semicolon-at-the-end)

(setq company-idle-delay 0.1
      company-minimum-prefix-length 2)
