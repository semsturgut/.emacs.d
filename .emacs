;; Melpa Package
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(package-initialize)
;; Visual Settings
(set-frame-font "Source Code Pro 18" nil t)
;; (setq-default truncate-lines t)
(global-visual-line-mode t)
(show-paren-mode 1)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(add-to-list 'default-frame-alist '(height . 47))
(add-to-list 'default-frame-alist '(width . 82))
(setq inhibit-startup-screen t)


;; Additional packages
;; Auto complete
(require 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)
;; Delete selected text
(delete-selection-mode 1)
;; yasnippet
(require 'yasnippet)
(yas-global-mode 1)
;; Delete selected text
(delete-selection-mode 1)
;; Enable Multiple-cursors features
(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
;; helm mode
(helm-mode 1)
(global-set-key (kbd "M-x") #'helm-M-x)
(global-set-key (kbd "C-x r b") #'helm-filtered-bookmarks)
(global-set-key (kbd "C-x C-f") #'helm-find-files)
;; Compile shortcut key
(global-set-key (kbd "C-c u") #'compile)
;; restart emacs
(global-set-key (kbd "C-x c") #'restart-emacs)
;; Save last session
(desktop-save-mode 1)
;; spaceline mode
(require 'spaceline-config)
(spaceline-spacemacs-theme)
(setq powerline-image-apple-rgb t)
;; Golden ratio
(require 'golden-ratio)
(golden-ratio-mode 1)
;; Show Line Numbers
(global-linum-mode 1)
(setq linum-format "%4d \u2502 ")
;; exec-path-from-shell This fix the PATH issue.
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))
;; Dart analysis support
(require 'flycheck)
(require 'dart-mode)
(setq dart-format-path "dartfmt")
(setq dart-executable-path "/Users/sems/flutter/bin/cache/dart-sdk/bin/dart")
(setq dart-analysis-server-snapshot-path "/Users/sems/flutter/bin/cache/dart-sdk/bin/snapshots/analysis_server.dart.snapshot")
(setq dart-debug t)
(setq dart-sdk-path "/Users/sems/flutter/bin/cache/dart-sdk/")
(setq dart-enable-analysis-server t)
(add-to-list 'auto-mode-alist '("\\.dart\\'" . dart-mode))
(add-hook 'dart-mode-hook 'dart-file-handle)
(add-hook 'dart-mode-hook 'flycheck-mode)
;; (add-to-list 'load-path "~/.emacs.d/lisp/company-dart/")
;; (load "company-dart.el")
;; (add-hook 'dart-mode-hook (lambda ()
;; 			    (set (make-local-variable 'company-backends)
;; 				 '(company-dart (company-dabbrev company-yankpad)))))



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (dracula)))
 '(custom-safe-themes
   (quote
    ("aaffceb9b0f539b6ad6becb8e96a04f2140c8faa1de8039a343a4f1e009174fb" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" default)))
 '(package-selected-packages
   (quote
    (pos-tip dracula-theme magit dart-mode restart-emacs company auto-complete-c-headers spaceline-all-the-icons spaceline exec-path-from-shell helm-core helm yasnippet-snippets multiple-cursors golden-ratio auto-complete))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
