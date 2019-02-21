;; -*- no-byte-compile: t; -*-
;;; ~/.doom.d/packages.el

;;; Examples:
;; (package! some-package)
;; (package! another-package :recipe (:fetcher github :repo "username/repo"))
;; (package! builtin-package :disable t)

(package! rvm)
(package! robe)
(package! yari)
(package! goto-gem)
(package! projectile-rails)
(package! ruby-tools)
(package! company-tabnine)
(package! auto-complete)
(package! zoom)
(package! graphql-mode)
(package! graphql)

;; Remove from default DOOM installation
(package! evil-snipe :disable t)
(package! solaire-mode :disable t)
(package! forge :disable t)
