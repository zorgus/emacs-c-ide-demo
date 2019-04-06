(when (eq system-type 'darwin)
  ;; meta
  (setq mac-option-modifier 'super)
  (setq mac-command-modifier 'meta)
  ;; go
  (setq exec-path (append '("/usr/local/go/bin")
                          exec-path))
  (setq exec-path (append '("/usr/local/bin")
                          exec-path)))

(setq make-backup-files nil) ; stop creating backup~ files
(setq auto-save-default nil) ; stop creating #autosave# files
(setq column-number-mode t)
(setq enable-evil-mode 1)
(when (version<= "26.0.50" emacs-version )
  (add-hook 'prog-mode-hook #'(lambda () (display-line-numbers-mode t))))
(unless (version<= "26.0.50" emacs-version)
  (add-hook 'prog-mode-hook #'(lambda () (linum-mode t)
                                (setq linum-format "%4d \u2502 ")
                                (set-face-attribute 'linum nil :foreground "gray"))))

(add-hook 'c-mode-hook 'my-prog-mode-hook)
(add-hook 'c++-mode-hook 'my-prog-mode-hook)

(set-language-environment "Korean")
(prefer-coding-system 'utf-8)
(when window-system
  (set-fontset-font "fontset-default" '(#x1100 . #xffdc)  '("NanumGothicCoding" . "unicode-bmp"))
  (set-fontset-font "fontset-default" '(#xe0bc . #xf66e) '("NanumGothicCoding" . "unicode-bmp"))
  )
