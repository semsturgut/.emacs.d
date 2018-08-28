;; Melpa Package
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(package-initialize)
;; Visual Settings
(set-frame-font "Source Code Pro 18" nil t)
(setq-default truncate-lines t)
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



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (spacemacs-dark)))
 '(custom-safe-themes
   (quote
    ("bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" default)))
 '(package-selected-packages
   (quote
    (restart-emacs company auto-complete-c-headers spaceline-all-the-icons spacemacs-theme spaceline exec-path-from-shell helm-core helm yasnippet-snippets multiple-cursors golden-ratio auto-complete))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
