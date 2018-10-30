(when (eq system-type 'darwin)
  ;; meta
  (setq mac-option-modifier 'super)
  (setq mac-command-modifier 'meta)
  ;; go
  (setq exec-path (append '("/usr/local/go/bin")
                          exec-path))
  (setq exec-path (append '("/usr/local/bin")
                          exec-path)))

(set-default-font "Monaco 13")
(set-frame-font "Monaco 13" nil t)
(setq make-backup-files nil) ; stop creating backup~ files
(setq auto-save-default nil) ; stop creating #autosave# files
(if (version<= "26.0.50" emacs-version)
  (global-display-line-numbers-mode)
  ((global-linum-mode)
   (setq linum-format "%4d \u2502 ")))

(use-package dracula-theme
  :config
  (load-theme 'dracula t))

(use-package find-file-in-repository
  :config
  (global-set-key (kbd "C-x f") 'find-file-in-repository))

;; platuml-mode
;; (use-package plantuml
;;   :init
;;   (add-to-list 'auto-mode-alist '("\.pu$" . plantuml-mode))
;;   (setq plantuml-jar-path "~/local/platuml/plantuml.jar")
;;   (setq plantuml-java-options "")
;;   (setq plantuml-options "-charset UTF-8")
;;   (org-babel-do-load-languages 'org-babel-load-languages '((plantuml . t)))
;;   (setq org-plantuml-jar-path (expand-file-name "/Users/user/local/platuml/plantuml.jar")))

;; company-mode (auto completion)
(use-package company
  :config
  (setq company-dabbrev-downcase nil))


(use-package go-mode
  :config
  (add-hook 'go-mode-hook 'helm-gtags-mode)
  (defun my-go-mode-hook ()
    (add-hook 'before-save-hook 'gofmt-before-save))
  (add-hook 'go-mode-hook 'my-go-mode-hook)
  (setenv "GOPATH" "~/project/go")
)

;; projectile
(use-package projectile
  :config
  (projectile-global-mode)
  (define-key projectile-mode-map (kbd "C-c p") #'projectile-command-map))

;; clang-format
(use-package clang-format
  :config
  (defun my-c++-mode-hook ()
    (fset 'c-indent-region 'clang-format-region)
    (global-set-key (kbd "C-c b") 'clang-format-region)
    (global-set-key (kbd "C-c c") 'clang-format))
  (add-hook 'c++-mode-hook 'my-c++-mode-hook)
)
