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

;; (defvar my-leader-map (make-sparse-keymap)
;;   "Keymap for \"leader key\" shortcuts.")

;; ;; binding "," to the keymap
;; (define-key evil-normal-state-map "," my-leader-map)

;; (defun insert-semicolon-at-the-end () ((forward-line -1)
;;                                         (insert ";")))

;; (define-key my-leader-map ";" #'insert-semicolon-at-the-end)

(setq enh-ruby-add-encoding-comment-on-save nil)

(add-to-list 'company-backends #'company-tabnine)

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
