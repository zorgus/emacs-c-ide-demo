;(global-display-line-numbers-mode)

(setq make-backup-files nil) ; stop creating backup~ files
(setq auto-save-default nil) ; stop creating #autosave# files

;(setq mac-option-modifier 'alt)
;(setq mac-command-modifier 'meta)
(global-set-key [kp-delete] 'delete-char) ;; sets fn-delete to be right-delete
(setq exec-path (append exec-path '("/usr/local/bin")))

;; company-mode (auto completion)
(setq company-dabbrev-downcase nil)

(setq linum-format "%5d \u2502 ")
(add-hook 'text-mode-hook 'linum-mode)
(add-hook 'prog-mode-hook 'linum-mode)

;; c, c++ indent
(defun my-c-mode-common-hook ()
  ;; my customizations for all of c-mode, c++-mode, objc-mode, java-mode
  (c-set-offset 'substatement-open 0)
  ;; other customizations can go here

  (setq c++-tab-always-indent t)
  (setq c-basic-offset 2)                  ;; Default is 2
  (setq c-indent-level 2)                  ;; Default is 2

  (setq tab-stop-list '(2 4 6 8 10 12 14 16 18 20 22 24 26 28 32 36 40 44 48 52 56 60))
  (setq tab-width 2)
  (setq indent-tabs-mode nil)  ; use spaces only if nil
  )
(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)

(use-package clang-format)

(defun clang-format-buffer-smart ()
  "Reformat buffer if .clang-format exists in the projectile root."
  (when (file-exists-p (expand-file-name ".clang-format" (projectile-project-root)))
    (clang-format-buffer)))

(add-hook 'c-mode-common-hook
    (function (lambda ()
        (add-hook 'before-save-hook 'clang-format-buffer-smart))))

;; magit
(global-set-key (kbd "C-x g") 'magit-status)

;; projectile
(setq projectile-globally-ignored-files '("GPATH" "GRTAGS" "GTAGS"))
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
;; (setq projectile-keymap-prefix (kbd "C-c p"))
;; (projectile-global-mode)
