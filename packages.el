;; -*- no-byte-compile: t; -*-
;;; ~/.doom.d/packages.el

;;; Examples:
;; (package! some-package)
;; DEPRECATED (package! another-package :recipe (:fetcher github :repo "username/repo"))
;; (package! builtin-package :disable t)

(package! rvm)
;;(package! robe)
(package! yari)
;; (package! goto-gem) apparently removed
(package! projectile-rails)
(package! ruby-tools)
;; (package! company-tabnine)
;; (package! auto-complete)
(package! zoom)
;; (package! graphql-mode)
;; (package! graphql)
(package! emacs)
(package! elm-mode)

(package! evil-anzu)
(package! helm-dash)
;; (package! zeal-at-point)
(package! google-translate)
(package! solarized-theme)
(package! nord-theme)
(package! xclip)
;; (package! memrise :recipe (:fetcher github :repo "SavchenkoValeriy/memrise.el"))
;; (package! reason-mode :recipe (:host github :repo "reasonml-editor/reason-mode"))
(package! evil-matchit)
(package! deadgrep)
(package! ob-elixir)

;; Remove from default DOOM installation
(package! evil-snipe :disable t)
(package! solaire-mode :disable t)
;;(package! forge :disable t)
(package! evil-escape :disable t)
(package! robe :disable t)

;; TODO add ox-reveal
