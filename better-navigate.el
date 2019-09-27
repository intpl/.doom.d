(require 'evil)

(defgroup better-navigate nil
  "seamlessly navigate between Emacs and tmux"
  :prefix "navigate-"
  :group 'evil)

; Without unsetting C-h this is useless
(global-unset-key (kbd "C-h"))

; This requires windmove commands
(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))

(defun tmux-navigate (direction)
  (let
    ((cmd (concat "windmove-" direction)))
      (condition-case nil
          (funcall (read cmd))
        (error
         (unless (display-graphic-p)
          (tmux-command direction))))))

(defun tmux-command (direction)
  (eshell-command
    (concat "tmux select-pane -"
      (tmux-direction direction))))

(defun tmux-direction (direction)
  (upcase
   (substring direction 0 1)))

(define-key evil-normal-state-map (kbd "C-h") (lambda () (interactive) (tmux-navigate "left")))
(define-key evil-normal-state-map (kbd "C-j") (lambda () (interactive) (tmux-navigate "down")))
(define-key evil-normal-state-map (kbd "C-k") (lambda () (interactive) (tmux-navigate "up")))
(define-key evil-normal-state-map (kbd "C-l") (lambda () (interactive) (tmux-navigate "right")))

(define-key evil-insert-state-map (kbd "C-h") (lambda () (interactive) (tmux-navigate "left")))
(define-key evil-insert-state-map (kbd "C-j") (lambda () (interactive) (tmux-navigate "down")))
(define-key evil-insert-state-map (kbd "C-k") (lambda () (interactive) (tmux-navigate "up")))
(define-key evil-insert-state-map (kbd "C-l") (lambda () (interactive) (tmux-navigate "right")))

(define-key evil-visual-state-map (kbd "C-h") (lambda () (interactive) (tmux-navigate "left")))
(define-key evil-visual-state-map (kbd "C-j") (lambda () (interactive) (tmux-navigate "down")))
(define-key evil-visual-state-map (kbd "C-k") (lambda () (interactive) (tmux-navigate "up")))
(define-key evil-visual-state-map (kbd "C-l") (lambda () (interactive) (tmux-navigate "right")))

;; HELP :<<<
;; (evil-define-key 'normal ranger-mode-map (kbd "C-h") (lambda () (interactive) (tmux-navigate "left")))
;; (evil-define-key 'normal ranger-mode-map (kbd "C-j") (lambda () (interactive) (tmux-navigate "down")))
;; (evil-define-key 'normal ranger-mode-map (kbd "C-k") (lambda () (interactive) (tmux-navigate "up")))
;; (evil-define-key 'normal ranger-mode-map (kbd "C-l") (lambda () (interactive) (tmux-navigate "right")))

;;(evil-define-key 'normal magit-mode-map (kbd "C-h") (lambda () (interactive) (tmux-navigate "left")))
;;(evil-define-key 'normal magit-mode-map (kbd "C-j") (lambda () (interactive) (tmux-navigate "down")))
;;(evil-define-key 'normal magit-mode-map (kbd "C-k") (lambda () (interactive) (tmux-navigate "up")))
;;(evil-define-key 'normal magit-mode-map (kbd "C-l") (lambda () (interactive) (tmux-navigate "right")))

;; TODO maybe? add magit
;; FIXME add ranger
;; FIXME add term

(with-eval-after-load 'evil-maps
  ;;    (evil-define-key '(normal insert) term-mode-map (kbd "M-.") nil)
  ;;(evil-define-key '(normal insert) term-mode-map (kbd "C-h") (lambda () (interactive) (tmux-navigate "left")))
  ;;(evil-define-key '(normal insert) term-mode-map (kbd "C-j") (lambda () (interactive) (tmux-navigate "down")))
  ;;(evil-define-key '(normal insert) term-mode-map (kbd "C-k") (lambda () (interactive) (tmux-navigate "up")))
  ;;(evil-define-key '(normal insert) term-mode-map (kbd "C-l") (lambda () (interactive) (tmux-navigate "right")))

  )

(provide 'better-navigate)

;;; better-navigate.el ends here
