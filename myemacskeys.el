(general-emacs-define-key prog-mode-map
  "C-c c" 'cmake-ide-compile
  "C-c C" 'cmake-ide-run-cmake
  )

(general-emacs-define-key helm-gtags-mode-map
  "C-c g C" 'helm-gtags-create-tags
  "C-c g n" 'helm-gtags-next-history
  "C-c g p" 'helm-gtags-previous-history
  )
