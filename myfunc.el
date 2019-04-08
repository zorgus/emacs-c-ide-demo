
(defun load-config (file)
  (setq config-file (concat my-config-base file))
  (when (file-exists-p config-file)
    (load config-file)))

(defun my-prog-mode-hook ()
  (c-set-style "bsd")
  (setq-default tab-width 4)
  (setq c-basic-offset 4)
  (setq indent-tabs-mode nil)
  (helm-gtags-mode))

(defun my-clang-format-before-save ()
  "Usage: (add-hook 'before-save-hook 'my-clang-format-before-save)."
  (when (or (eq major-mode 'c-mode) (eq major-mode 'c++-mode))
    (clang-format-buffer)))
