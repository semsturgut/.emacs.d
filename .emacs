;; Melpa Package
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(package-initialize)
;; Visual Settings
(set-frame-font "Source Code Pro 12" nil t)
(setq-default truncate-lines t)
;; (global-visual-line-mode t)
;; mac frame issue solver
(setq frame-resize-pixelwise t)
(show-paren-mode 1)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(electric-pair-mode 1)
(menu-bar-mode -1)
(setq electric-pair-preserve-balance nil)
;; (add-to-list 'default-frame-alist '(height . 43))
;; (add-to-list 'default-frame-alist '(width . 74))
(setq inhibit-startup-screen t)
;; >-< >-< >-< >-< >-< >-< >-< >-< >-< >-< >-< >-< >-< >-< >-< 
;; Additional packages
;; >-< >-< >-< >-< >-< >-< >-< >-< >-< >-< >-< >-< >-< >-< >-< 
;; Add headers location into file name given below.
;; File name: .clang_complete
;; Example: -I/home/user/Your_Header_Location/
;; Required for c-mode/c++-mode
(require 'cc-mode)
;; irony-mode
(use-package irony
  :ensure t
  :defer t
  :init
  (add-hook 'c++-mode-hook 'irony-mode)
  (add-hook 'c-mode-hook 'irony-mode)
  (add-hook 'objc-mode-hook 'irony-mode)
  :config
  ;; replace the `completion-at-point' and `complete-symbol' bindings in
  ;; irony-mode's buffers by irony-mode's function
  (defun my-irony-mode-hook ()
    (define-key irony-mode-map [remap completion-at-point]
      'irony-completion-at-point-async)
    (define-key irony-mode-map [remap complete-symbol]
      'irony-completion-at-point-async))
  (add-hook 'irony-mode-hook 'my-irony-mode-hook)
  (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options))
;; company-mode
;; write a lisp function switching between headers and common (Use only TAB)
(use-package company
  :ensure t
  :defer t
  :init (add-hook 'after-init-hook 'global-company-mode)
  :config
  (use-package company-irony :ensure t :defer t)
  (setq company-idle-delay              1
	company-minimum-prefix-length   2
	company-show-numbers            t
	company-tooltip-limit           20
	company-dabbrev-downcase        nil
	company-backends                '((company-irony company-gtags))
	)
  :bind (([(C-tab)] . company-complete-common)))
;; company-irony-c-headers
(require 'company-irony-c-headers)
;; Load with `irony-mode` as a grouped backend
(eval-after-load 'company
  '(add-to-list
    'company-backends '(company-irony-c-headers company-irony)))
;; Delete selected text
(delete-selection-mode 1)
;; Jumping to definition w dumb-jump
(use-package dumb-jump
  :bind (("M-g o" . dumb-jump-go-other-window)
         ("M-g j" . dumb-jump-go)
         ("M-g i" . dumb-jump-go-prompt)
         ("M-g x" . dumb-jump-go-prefer-external)
         ("M-g z" . dumb-jump-go-prefer-external-other-window))
  :config  (setq dumb-jump-selector 'helm) ;; (setq dumb-jump-selector 'ivy)
  :ensure)
;; start yasnippet w emacs
(require 'yasnippet)
(yas-global-mode 1)
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
;; Show recent filesn
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
;; Uncomment only on Linux
(setq-default shell-file-name "/bin/bash")
;; Uncomment only on OS X
;; (setq powerline-image-apple-rgb t)
;; (exec-path-from-shell-copy-env "IDF_PATH")
;; (when (memq window-system '(mac ns x))
;;   (exec-path-from-shell-initialize))
;; Show Line Numbers
(global-linum-mode 1)
(setq linum-format "%4d \u2502 ")
;; Show bracket colors
(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
;; >-< >-< >-< >-< >-< >-< >-< >-< >-< >-< >-< >-< >-< >-< >-<
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
    (company-irony-c-headers company-irony irony use-package dumb-jump sudo-edit auto-sudoedit flycheck golden-ratio company-c-headers company rainbow-delimiters ag pos-tip dracula-theme magit restart-emacs spaceline-all-the-icons spaceline helm-core helm yasnippet-snippets multiple-cursors)))
 '(safe-local-variable-values
   (quote
    ((eval add-hook
	   (quote before-save-hook)
	   (quote time-stamp))))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'magit-clean 'disabled nil)
