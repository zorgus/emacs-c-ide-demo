(general-emacs-define-key prog-mode-map
  "C-c c" 'cmake-ide-compile
  "C-c C" 'cmake-ide-run-cmake
  )

(general-emacs-define-key helm-gtags-mode-map
  "C-c g C" 'helm-gtags-create-tags
  "C-c g n" 'helm-gtags-next-history
  "C-c g p" 'helm-gtags-previous-history
  )

(general-emacs-define-key global-map
  "C-x TAB" 'evil-switch-to-windows-last-buffer
  "C-c /"   'helm-do-ag
  "C-c C-/" 'helm-swoop
  "C-s"     'helm-swoop
  "C-c C-k" 'evil-yank-line
  )

(general-emacs-define-key prog-mode-map
  "C-c C-c"   'comment-or-uncomment-region
  )
