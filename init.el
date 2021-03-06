;; Melpa Package
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(package-initialize)
;; Use package
(require 'use-package)
;; Start server
(server-start)
;; Visual Settings
(set-frame-font "Source Code Pro 16" nil t)
;; Wrap toggle off
(setq-default truncate-lines t)
;; Wrap toggle on
;; (global-visual-line-mode t)
;; macOS frame issue solver  
(setq frame-resize-pixelwise t)
(show-paren-mode 1)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(electric-pair-mode 1)
(menu-bar-mode -1)
(setq electric-pair-preserve-balance nil)
(setq inhibit-startup-screen t)
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
;; delete file
(global-set-key (kbd "C-c x c") #'delete-file)
;; Show recent files
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)
;; Edit files by root
(require 'sudo-edit)
(global-set-key (kbd "C-c C-r") 'sudo-edit)
;; Save last session
(desktop-save-mode 1)
;; Prevent backup files from being created
(setq make-backup-files nil)
;; spaceline mode
(require 'spaceline-config)
(spaceline-spacemacs-theme)
;; Fix for bash configuration
;; Uncomment only on Linux
;; (setq-default shell-file-name "/bin/bash")
;; Uncomment only on macOS
(setq powerline-image-apple-rgb t)
(exec-path-from-shell-copy-env "IDF_PATH")
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))
;; Show Line Numbers
(global-linum-mode 1)
(setq linum-format "%4d \u2502 ")
;; Show bracket colors
(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
;; Delete selection
(delete-selection-mode 1)

;; ---===================---
;; ---Additional Packages---
;; ---===================---

;; (use-package lsp-mode :ensure t)
;; (use-package lsp-dart 
;;   :ensure t 
;;   :hook (dart-mode . lsp))

;; ;; Optional packages
;; (use-package projectile :ensure t) ;; project management
;; (use-package yasnippet
;;   :ensure t
;;   :config (yas-global-mode)) ;; snipets
;; (use-package lsp-ui :ensure t) ;; UI for LSP
;; (use-package company :ensure t) ;; Auto-complete

;; ;; Optional Flutter packages
;; (use-package hover :ensure t) ;; run app from desktop without emulator

;; (with-eval-after-load 'projectile
;;   (add-to-list 'projectile-project-root-files-bottom-up "pubspec.yaml")
;;   (add-to-list 'projectile-project-root-files-bottom-up "BUILD"))

;; ---===================---
;; ---End---
;; ---===================---

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'magit-clean 'disabled nil)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (dracula)))
 '(custom-safe-themes
   (quote
    ("aaffceb9b0f539b6ad6becb8e96a04f2140c8faa1de8039a343a4f1e009174fb" default)))
 '(package-selected-packages
   (quote
    (hover company lsp-ui yasnippet lsp-dart use-package-ensure-system-package sudo-edit spaceline restart-emacs request-deferred rainbow-delimiters projectile pos-tip multiple-cursors magit lsp-mode irony helm-mode-manager golden-ratio exec-path-from-shell dumb-jump dracula-theme all-the-icons))))
