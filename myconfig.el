(when (eq system-type 'darwin)
  ;; meta
  (setq mac-option-modifier 'super)
  (setq mac-command-modifier 'meta)
  ;; go
  (setq exec-path (append '("/usr/local/go/bin")
                          exec-path))
  (setq exec-path (append '("/usr/local/bin")
                          exec-path)))

(setq make-backup-files nil)
(setq auto-save-default nil)
(setq column-number-mode t)
(setq enable-evil-mode 0)
(when (version<= "26.0.50" emacs-version )
  (add-hook 'prog-mode-hook #'(lambda () (display-line-numbers-mode t))))
(unless (version<= "26.0.50" emacs-version)
  (add-hook 'prog-mode-hook #'(lambda () (linum-mode t)
                                (setq linum-format "%4d \u2502 ")
                                (set-face-attribute 'linum nil :foreground "gray"))))

(show-paren-mode 1)

(when window-system
  (blink-cursor-mode 0)
  (scroll-bar-mode 0)
  (tool-bar-mode 0)
  (tooltip-mode 0)
  (menu-bar-mode 0))

(global-auto-revert-mode t)

(add-hook 'c-mode-hook 'my-prog-mode-hook)
(add-hook 'c++-mode-hook 'my-prog-mode-hook)

(set-language-environment "Korean")
(prefer-coding-system 'utf-8)
(when window-system
  (set-fontset-font "fontset-default" '(#x1100 . #xffdc)  '("NanumGothicCoding" . "unicode-bmp"))
  (set-fontset-font "fontset-default" '(#xe0bc . #xf66e) '("NanumGothicCoding" . "unicode-bmp"))
  )
