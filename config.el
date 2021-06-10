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
(defun kde-blurry-qterminal () (interactive) (shell-command "kde_blurry_pgrep qterminal"))

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

(evil-define-key 'normal elixir-mode-map (kbd ", o") (lambda () (interactive) (add-string-below "require IEx; IEx.pry # FIXME")))
(evil-define-key 'normal elixir-mode-map (kbd ", O") (lambda () (interactive) (add-string-above "require IEx; IEx.pry # FIXME")))

(define-key evil-normal-state-map (kbd ", t") (lambda () (interactive) (+vterm/here nil)))
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

;; (setq multi-term-program "/usr/bin/fish")

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

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#F5F5F9" "#D70000" "#005F00" "#AF8700" "#1F55A0" "#AF005F" "#007687" "#0F1019"])
 '(custom-safe-themes
   (quote
    ("d71aabbbd692b54b6263bfe016607f93553ea214bc1435d17de98894a5c3a086" "9b01a258b57067426cc3c8155330b0381ae0d8dd41d5345b5eddac69f40d409b" "7d56fb712ad356e2dacb43af7ec255c761a590e1182fe0537e1ec824b7897357" "0713580a6845e8075113a70275b3421333cfe7079e48228c52300606fa5ce73b" "0d087b2853473609d9efd2e9fbeac088e89f36718c4a4c89c568dd1b628eae41" "001c2ff8afde9c3e707a2eb3e810a0a36fb2b466e96377ac95968e7f8930a7c5" "fefab1b6d3366a959c78b4ed154018d48f4ec439ce652f4748ef22945ca7c2d5" "332e009a832c4d18d92b3a9440671873187ca5b73c2a42fbd4fc67ecf0379b8c" "70ed3a0f434c63206a23012d9cdfbe6c6d4bb4685ad64154f37f3c15c10f3b90" "f2b83b9388b1a57f6286153130ee704243870d40ae9ec931d0a1798a5a916e76" "2a3ffb7775b2fe3643b179f2046493891b0d1153e57ec74bbe69580b951699ca" "728eda145ad16686d4bbb8e50d540563573592013b10c3e2defc493f390f7d83" "2d1fe7c9007a5b76cea4395b0fc664d0c1cfd34bb4f1860300347cdad67fb2f9" "018c8326bced5102b4c1b84e1739ba3c7602019c645875459f5e6dfc6b9d9437" "2d392972cbe692ee4ac61dc79907af65051450caf690a8c4d36eb40c1857ba7d" "1a6d627434899f6d21e35b85fee62079db55ef04ecd9b70b82e5d475406d9c69" "045496bf9a9de2be2266930507bf6533a0e61c4686994af5602d172ebab8347a" "06e4b3fdcbadc29ff95a7146dee846cd027cfefca871b2e9142b54ad5de4832f" "8c847a5675ece40017de93045a28ebd9ede7b843469c5dec78988717f943952a" "34c99997eaa73d64b1aaa95caca9f0d64229871c200c5254526d0062f8074693" "e3c87e869f94af65d358aa279945a3daf46f8185f1a5756ca1c90759024593dd" "ef4edbfc3ec509612f3cf82476beddd2aeb3da7bdc3a35726337a0cc838a4ef4" "e838d6375a73fda607820c65eb3ea1f9336be7bd9a5528c9161e10c4aa663b5b" "d91ef4e714f05fff2070da7ca452980999f5361209e679ee988e3c432df24347" "ab9456aaeab81ba46a815c00930345ada223e1e7c7ab839659b382b52437b9ea" "155a5de9192c2f6d53efcc9c554892a0d87d87f99ad8cc14b330f4f4be204445" "a16e816774b437acb78beb9916a60ea236cfcd05784227a7d829623f8468c5a2" "db10381a554231a40b7474eaac28bd58f05067faacce3b25d294bb179a3511a1" "868abc288f3afe212a70d24de2e156180e97c67ca2e86ba0f2bf9a18c9672f07" "9c27124b3a653d43b3ffa088cd092c34f3f82296cf0d5d4f719c0c0817e1afa6" "fe666e5ac37c2dfcf80074e88b9252c71a22b6f5d2f566df9a7aa4f9bea55ef8" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "0598c6a29e13e7112cfbc2f523e31927ab7dce56ebb2016b567e1eff6dc1fd4f" "84da7b37214b4ac095a55518502dfa82633bee74f64daf6e1785322e77516f96" "93a0885d5f46d2aeac12bf6be1754faa7d5e28b27926b8aa812840fe7d0b7983" "75d3dde259ce79660bac8e9e237b55674b910b470f313cdf4b019230d01a982a" "9954ed41d89d2dcf601c8e7499b6bb2778180bfcaeb7cdfc648078b8e05348c6" "a3fa4abaf08cc169b61dea8f6df1bbe4123ec1d2afeb01c17e11fdc31fc66379" "d1b4990bd599f5e2186c3f75769a2c5334063e9e541e37514942c27975700370" "6b2636879127bf6124ce541b1b2824800afc49c6ccd65439d6eb987dbf200c36" "d2e9c7e31e574bf38f4b0fb927aaff20c1e5f92f72001102758005e53d77b8c9" "10461a3c8ca61c52dfbbdedd974319b7f7fd720b091996481c8fb1dded6c6116" default)))
 '(fci-rule-color "#4E4E4E")
 '(jdee-db-active-breakpoint-face-colors (cons "#D0D0E3" "#009B7C"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#D0D0E3" "#005F00"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#D0D0E3" "#4E4E4E"))
 '(objed-cursor-color "#D70000")
 '(pdf-view-midnight-colors (cons "#0F1019" "#F5F5F9"))
 '(rustic-ansi-faces
   ["#F5F5F9" "#D70000" "#005F00" "#AF8700" "#1F55A0" "#AF005F" "#007687" "#0F1019"])
 '(safe-local-variable-values (quote ((eval progn (pp-buffer) (indent-buffer)))))
 '(vc-annotate-background "#F5F5F9")
 '(vc-annotate-color-map
   (list
    (cons 20 "#005F00")
    (cons 40 "#3a6c00")
    (cons 60 "#747900")
    (cons 80 "#AF8700")
    (cons 100 "#bc7900")
    (cons 120 "#c96c00")
    (cons 140 "#D75F00")
    (cons 160 "#c93f1f")
    (cons 180 "#bc1f3f")
    (cons 200 "#AF005F")
    (cons 220 "#bc003f")
    (cons 240 "#c9001f")
    (cons 260 "#D70000")
    (cons 280 "#b41313")
    (cons 300 "#922727")
    (cons 320 "#703a3a")
    (cons 340 "#4E4E4E")
    (cons 360 "#4E4E4E")))
 '(vc-annotate-very-old-color nil)
 '(zoom-size (quote (0.8 . 0.8))))
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

(setq doom-font (font-spec :family "Iosevka Term SS09" :size 15 :weight 'regular)
      doom-big-font (font-spec :family "Iosevka Term SS09" :size 23 :weight 'regular))

(setq js-indent-level 2)

(setq doom-theme 'doom-gruvbox)

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
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
