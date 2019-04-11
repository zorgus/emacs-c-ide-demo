(global-set-key (kbd "C-'") 'evil-switch-to-windows-last-buffer)

(when (require 'cmake-ide nil 'noerror)
  (evil-define-key 'normal prog-mode-map
    (kbd ", c r") 'cmake-ide-run-cmake
    (kbd ", c c") 'cmake-ide-compile))

(when (require 'helm-ag nil 'noerror)
  (evil-define-key 'normal prog-mode-map
    (kbd ", g a") 'helm-do-ag))

(when (require 'evil-collection nil 'noerror)
  (evil-define-key 'normal helm-gtags-mode-map
    (kbd ", g C") 'helm-gtags-create-tags
    (kbd ", g u") 'helm-gtags-update-tags
    (kbd ", g g") 'helm-gtags-find-pattern
    (kbd ", g d") 'helm-gtags-find-tag-from-here
    (kbd ", g n") 'helm-gtags-next-history
    (kbd ", g p") 'helm-gtags-previous-history)
  )