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
(package! auto-complete)

;; Remove from default DOOM installation
(package! evil-snipe :ignore t)
