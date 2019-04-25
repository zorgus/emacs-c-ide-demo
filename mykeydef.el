
(declare-prefixes
 "a"   "applications"
 "b"   "buffers"
 "f"   "files"
 "g"   "helm-gtags"
 "p"   "projectile"
 "w"   "windows")

;; global
(set-keys
 "SPC" 'helm-M-x
 "TAB" 'evil-switch-to-windows-last-buffer
 "!"   'shell-command
 "&"   'async-shell-command
 "/"   'helm-do-ag
 "v"   'er/expand-region)

;; applications
(set-keys
 "ac"  'calc-dispatch
 "ad"  'dired
 "ag"  'magit
 "aP"  'proced
 "au"  'undo-tree-visualize)

;; buffer
(set-keys
 "bb"  'helm-buffers-list
 "bd"  'kill-this-buffer)

(set-keys
 "gC" 'helm-gtags-create-tags
 "gu" 'helm-gtags-update-tags
 "gg" 'helm-gtags-find-pattern
 "gd" 'helm-gtags-find-tag-from-here
 "gn" 'helm-gtags-next-history
 "gp" 'helm-gtags-previous-history)

(set-keys-for-major-mode 'helm-gtags-mode-map
 "gC" 'helm-gtags-create-tags
 "gu" 'helm-gtags-update-tags
 "gg" 'helm-gtags-find-pattern
 "gd" 'helm-gtags-find-tag-from-here
 "gn" 'helm-gtags-next-history
 "gp" 'helm-gtags-previous-history)

(set-keys
 "cc" 'cmake-ide-compile
 "cC" 'cmake-ide-run-cmake)

;; projectile
(set-keys
 "pp" 'helm-projectile-switch-project
 "pf" 'helm-projectile-find-file
 "p!" 'projectile-run-shell-command-in-root
 "p&" 'projectile-run-async-shell-command-in-root
 "pi" 'projectile-invalidate-cache
 "pD" 'projectile-dired
 "pa" 'projectile-find-other-file
 "pg" 'helm-gtags-create-tags-root
 "pG" 'helm-gtags-create-tags)

;; files
(set-keys
 "ff" 'helm-find-files
 "fs" 'save-buffer)
