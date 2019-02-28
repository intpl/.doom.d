;;; init.el -*- lexical-binding: t; -*-
;;
;; Author:  Henrik Lissner <henrik@lissner.net>
;; URL:     https://github.com/hlissner/doom-emacs
;;
;;   =================     ===============     ===============   ========  ========
;;   \\ . . . . . . .\\   //. . . . . . .\\   //. . . . . . .\\  \\. . .\\// . . //
;;   ||. . ._____. . .|| ||. . ._____. . .|| ||. . ._____. . .|| || . . .\/ . . .||
;;   || . .||   ||. . || || . .||   ||. . || || . .||   ||. . || ||. . . . . . . ||
;;   ||. . ||   || . .|| ||. . ||   || . .|| ||. . ||   || . .|| || . | . . . . .||
;;   || . .||   ||. _-|| ||-_ .||   ||. . || || . .||   ||. _-|| ||-_.|\ . . . . ||
;;   ||. . ||   ||-'  || ||  `-||   || . .|| ||. . ||   ||-'  || ||  `|\_ . .|. .||
;;   || . _||   ||    || ||    ||   ||_ . || || . _||   ||    || ||   |\ `-_/| . ||
;;   ||_-' ||  .|/    || ||    \|.  || `-_|| ||_-' ||  .|/    || ||   | \  / |-_.||
;;   ||    ||_-'      || ||      `-_||    || ||    ||_-'      || ||   | \  / |  `||
;;   ||    `'         || ||         `'    || ||    `'         || ||   | \  / |   ||
;;   ||            .===' `===.         .==='.`===.         .===' /==. |  \/  |   ||
;;   ||         .=='   \_|-_ `===. .==='   _|_   `===. .===' _-|/   `==  \/  |   ||
;;   ||      .=='    _-'    `-_  `='    _-'   `-_    `='  _-'   `-_  /|  \/  |   ||
;;   ||   .=='    _-'          '-__\._-'         '-_./__-'         `' |. /|  |   ||
;;   ||.=='    _-'                                                     `' |  /==.||
;;   =='    _-'                                                            \/   `==
;;   \   _-'                                                                `-_   /
;;    `''                                                                      ``'
;;
;; These demons are not part of GNU Emacs.
;;
;;; License: MIT

(doom! :feature
       ;;debugger          ; FIXME stepping through code, to help you add bugs
       eval              ; run code, run (also, repls)
       (evil +everywhere); come to the dark side, we have cookies
       file-templates    ; auto-snippets for empty files
       lookup           ; helps you navigate your code and documentation
        ;; +docsets)        ; ...or in Dash docsets locally
       snippets          ; my elves. They type so I don't have to
       spellcheck        ; tasing you for misspelling mispelling
       syntax-checker   ; tasing you for every semicolon you forget
        ;; +childframe)     ; use childframes for error popups (Emacs 26+ only)
       workspaces        ; tab emulation, persistence & separate workspaces

       :completion
       ;; (company          ; the ultimate code completion backend
       ;;  +auto)           ; as-you-type code completion
       (helm             ; the *other* search engine for love and life
        +fuzzy)          ; enable fuzzy search backend for helm
       ;;ido               ; the other *other* search engine...
       ;; (ivy              ; a search engine for love and life
       ;; +fuzzy)          ; enable fuzzy search backend for ivy

       :ui
       ;;deft              ; notational velocity for emacs
       doom              ; what makes doom look the way it does
       doom-dashboard    ; a nifty splash screen for emacs
       doom-modeline     ; a snazzy atom-inspired mode-line
       doom-quit         ; doom quit-message prompts when you quit emacs
       evil-goggles      ; display visual hints when editing in evil
       ;;fci               ; a `fill-column' indicator
       hl-todo           ; highlight todo/fixme/note tags
       ;;modeline          ; snazzy, atom-inspired modeline, plus api
       nav-flash         ; blink the current line after jumping
       ;; neotree           ; a project drawer, like NERDTree for vim
       treemacs          ; a project drawer, like neotree but cooler
       (popup            ; tame sudden yet inevitable temporary windows
        +all             ; catch all popups that start with an asterix
        +defaults)       ; default popup rules
       ;;pretty-code       ; replace bits of code with pretty symbols
       tabbar            ; fixme an (incomplete) tab bar for emacs
       ;;unicode           ; extended unicode support for various languages
       vc-gutter         ; vcs diff in the fringe
       vi-tilde-fringe   ; fringe tildes to mark beyond eob
       window-select     ; visually switch windows

       :editor
       fold
       ;;(format +onsave)  ; automated prettiness
       multiple-cursors  ; editing in many places at once
       ;;parinfer          ; turn lisp into python, sort of
       rotate-text       ; cycle region at point between text candidates

       :emacs
       dired             ; making dired pretty [functional]
       ediff             ; comparing files in emacs
       electric          ; smarter, keyword-based electric-indent
       ;;eshell            ; a consistent, cross-platform shell (wip)
       ;;hideshow          ; basic code-folding support
       imenu             ; an imenu sidebar and searchable code index
       term              ; terminals in emacs
       vc                ; version-control and emacs, sitting in a tree

       :tools
       ;;ansible
       ;;docker
       ;;editorconfig      ; let someone else argue about tabs vs spaces
       ;;ein               ; tame jupyter notebooks with emacs
       ;;gist              ; interacting with github gists
       ;; macos             ; macos-specific commands
       ;;make              ; run make tasks from emacs
       magit             ; a git porcelain for emacs
       ;;password-store    ; password manager for nerds
       pdf               ; pdf enhancements
       ;;prodigy           ; fixme managing external services & code builders
       ;;rgb               ; creating color strings
       ;;terraform         ; infrastructure as code
       tmux              ; an api for interacting with tmux
       ;;upload            ; map local to remote projects via ssh/ftp
       ;;wakatime

       :lang
       ;;assembly          ; assembly for fun or debugging
       ;;(cc +irony +rtags); c/c++/obj-c madness
       clojure           ; java with a lisp
       common-lisp       ; if you've seen one lisp, you've seen them all
       ;;coq               ; proofs-as-programs
       crystal           ; ruby at the speed of c
       ;;csharp            ; unity, .net, and mono shenanigans
       data              ; config/data formats
       erlang            ; an elegant language for a more civilized age
       elixir            ; erlang done right
       ;;elm               ; care for a cup of tea?
       emacs-lisp        ; drown in parentheses
       ;;ess               ; emacs speaks statistics
       go                ; the hipster dialect
       (haskell +intero) ; a language that's lazier than i am
       ;;hy                ; readability of scheme w/ speed of python
       ;;idris             ;
       ;;(java +meghanada) ; the poster child for carpal tunnel syndrome
       javascript        ; all(hope(abandon(ye(who(enter(here))))))
       ;;julia             ; a better, faster matlab
       ;;latex             ; writing papers in emacs has never been so fun
       ;;ledger            ; an accounting system in emacs
       ;;lua               ; one-based indices? one-based indices
       markdown          ; writing docs for people to ignore
       ;;nim               ; python + lisp at the speed of c
       ;;nix               ; i hereby declare "nix geht mehr!"
       ;;ocaml             ; an objective camel
       (org              ; organize your plain life in plain text
        +attach          ; custom attachment system
        +babel           ; running code in org
        +capture         ; org-capture in and outside of emacs
        +export          ; exporting org to whatever you want
        +present)        ; emacs for presentations
       ;;perl              ; write code no one else can comprehend
       php               ; perl's insecure younger brother
       ;;plantuml          ; diagrams for confusing people more
       ;;purescript        ; javascript, but functional
       ;;python            ; beautiful is better than ugly
       ;;qt                ; the 'cutest' gui framework ever
       ;;racket            ; a dsl for dsls
       rest              ; emacs as a rest client
       ruby              ; 1.step do {|i| p "ruby is #{i.even? ? 'love' : 'life'}"}
       rust              ; fe2o3.unwrap().unwrap().unwrap().unwrap()
       ;;scala             ; java, but good
       (sh +fish)        ; she sells (ba|z|fi)sh shells on the c xor
       ;;solidity          ; do you need a blockchain? no.
       ;;swift             ; who asked for emoji variables?
       web               ; the tubes
       ;;vala              ; gobjective-c

       ;; applications are complex and opinionated modules that transform emacs
       ;; toward a specific purpose. they may have additional dependencies and
       ;; should be loaded late.
       :app
       (email +gmail)    ; emacs as an email client
       ;;irc               ; how neckbeards socialize
       ;;(rss +org)        ; emacs as an rss reader
       ;;twitter           ; twitter client https://twitter.com/vnought
       ;;(write            ; emacs as a word processor (latex + org + markdown)
       ;; +wordnut         ; wordnet (wn) search
       ;; +langtool)       ; a proofreader (grammar/style check) for emacs

       :collab
       ;;floobits          ; peer programming for a price
       ;;impatient-mode    ; show off code over http

       :config
       ;; for literate config users. this will tangle+compile a config.org
       ;; literate config in your `doom-private-dir' whenever it changes.
       ;;literate

       ;; the default module sets reasonable defaults for emacs. it also
       ;; provides a spacemacs-inspired keybinding scheme, a custom yasnippet
       ;; library, and additional ex commands for evil-mode. use it as a
       ;; reference for your own modules.
       (default +bindings +snippets +evil-commands))

(setq doom-font (font-spec :family "Source Code Pro Semibold" :size 14)
      doom-big-font (font-spec :family "Source Code Pro Semibold" :size 18))
