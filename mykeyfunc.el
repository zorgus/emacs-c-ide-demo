(setq-default
  leader-key "SPC"
  leader-for-major-mode ",")

(defun set-keys-for-major-mode (maps key def &rest bindings)
  (while key
    (general-define-key
      :prefix ","
      :states 'normal
      :keymaps maps
      key def)
    (setq key (pop bindings) def (pop bindings))))

(defun set-keys (key def &rest bindings)
  (while key
    (general-define-key
      :states 'normal
      :prefix leader-key
      key def)
    (setq key (pop bindings) def (pop bindings))))

(defun declare-prefixes (prefix name &rest bindings)
  (while prefix
    (which-key-add-key-based-replacements (concat leader-key " " prefix) name)
    (setq prefix (pop bindings) name (pop bindings))))

(defun declare-prefixes-for-major-mode (mode key def &rest bindings)
  (while key
    (which-key-add-major-mode-key-based-replacements mode (concat leader-for-major-mode key) def)
    (setq key (pop bindings) def (pop bindings))))
