;; ---===================---
;; ----Package  Settings----
;; ---===================---

;; Melpa Package
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(package-initialize)
;; Use package
(require 'use-package)
;; Start server
(server-start)

;; ---===================---
;; -----Visual Settings-----
;; ---===================---

(set-frame-font "Source Code Pro 16" nil t)
;; Wrap toggle off
(setq-default truncate-lines t)
;; Wrap toggle on
;; (global-visual-line-mode t)
;; macOS frame issue solver  
(setq frame-resize-pixelwise t)
;; Show parentheses
(show-paren-mode 1)
(setq show-paren-delay 0)
;; Close scroll bar
(scroll-bar-mode -1)
;; Close tool bar
(tool-bar-mode -1)
;; Auto brackets
(electric-pair-mode 1)
(setq electric-pair-preserve-balance nil)
;; Toggle menu bar off
(menu-bar-mode -1)
;; Hide welcome screen
(setq inhibit-startup-screen t)
;; Save last session
(desktop-save-mode 1)
;; Prevent backup files from being created
(setq make-backup-files nil)
;; Show Line Numbers
(global-linum-mode 1)
(setq linum-format "%4d \u2502 ")

;; ---===================---
;; ---Additional Packages---
;; ---===================---

;; Enable Multiple-cursors features
(require 'multiple-cursors)
;; helm mode
(helm-mode 1)
;; Show recent files
(recentf-mode 1)
;; Edit files by root
(require 'sudo-edit)
;; spaceline mode
(require 'spaceline-config)
;; Show bracket colors
(require 'rainbow-delimiters)

;; ---===================---
;; ---Additional  Configs---
;; ---===================---

;; Fix for bash configuration
;; Uncomment only on Linux
;; (setq-default shell-file-name "/bin/bash")
;; Uncomment only on macOS
(exec-path-from-shell-copy-env "IDF_PATH")
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))
;; Enable Multiple-cursors features
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
;; helm mode
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
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)
;; Edit files by root
(global-set-key (kbd "C-c C-r") 'sudo-edit)
;; spaceline mode
(spaceline-spacemacs-theme)
(setq powerline-image-apple-rgb t)
;; Show bracket colors
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

;; ---===================---
;; -----------End-----------
;; ---===================---

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cursor ((t (:background "SlateBlue1"))))
 '(region ((t (:background "alternatingContentBackgroundColor" :foreground "SlateBlue1"))))
 '(show-paren-match ((t (:background "DarkOrchid3")))))
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
