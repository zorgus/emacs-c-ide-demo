(use-package dracula-theme)

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
  (define-key projectile-mode-map (kbd "C-c p") #'projectile-command-map)
  (setq projectile-indexing-method 'hybrid))

;; clang-format
(use-package clang-format
  :config
  (defun my-c++-mode-hook ()
    ;;(fset 'c-indent-region 'clang-format-region)
    (global-set-key (kbd "C-c f r") 'clang-format-region)
    (global-set-key (kbd "C-c f b") 'clang-format-buffer))
  (add-hook 'c++-mode-hook 'my-c++-mode-hook)
  (add-hook 'c-mode-hook 'my-c++-mode-hook))

(use-package slime
  :config
  (load (expand-file-name "~/.quicklisp/slime-helper.el"))
  (setq inferior-lisp-program "sbcl"))

(use-package evil
  :ensure t
  :init
  (setq evil-want-integration t) ;; This is optional since it's already set to t by default.
  (setq evil-want-keybinding nil)
  (setq evil-want-C-u-scroll t)
  :config
  (setq-default evil-symbol-word-search t)
  (evil-mode enable-evil-mode))

(use-package evil-collection
  :requires evil
  :ensure t
  :config
  (evil-collection-init)
  (add-hook 'prog-mode-hook #'(lambda () (load "~/.emacs.d/evil-key.el"))))

(use-package evil-magit
  :requires evil)

(use-package magit)

(use-package which-key :ensure t
  :diminish which-key-mode
  :config (progn (which-key-mode)
                 (which-key-setup-side-window-bottom)))

(use-package cmake-ide
  :config
  (setq
   helm-make-build-dir "build"
   helm-make-arguments "-j4"
   cmake-ide-build-dir "build"
   cmake-ide-cmake-opts "-DCMAKE_BUILD_TYPE=Debug -DCMAKE_EXPORT_COMPILE_COMMANDS=ON"
   ))

(use-package popwin
  :config
  (popwin-mode t))
