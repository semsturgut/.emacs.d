;; Melpa Package
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(package-initialize)
;; Visual Settings
(set-frame-font "Source Code Pro 18" nil t)
(setq-default truncate-lines t)
;; (global-visual-line-mode t)
;; mac frame issue solver
(setq frame-resize-pixelwise t)
(show-paren-mode 1)
(scroll-bar-mode -1)
(tool-bar-mode -1)
;; (add-to-list 'default-frame-alist '(height . 43))
;; (add-to-list 'default-frame-alist '(width . 74))
(setq inhibit-startup-screen t)
;; >-< >-< >-< >-< >-< >-< >-< >-< >-< >-< >-< >-< >-< >-< >-< 
;; Additional packages
;; Required for c-mode/c++-mode
(require 'cc-mode)
;; company-mode for auto complete c/c++
;; create .dir-locals.el at project_root
;; example ((nil . ((company-clang-arguments . ("-I/workspace/"))))
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)
(define-key c-mode-map [(tab)] 'company-complete)
(define-key c++-mode-map [(tab)] 'company-complete)
;; header file comletion with company-c-headers
(add-to-list 'company-backends 'company-c-headers)
;; Delete selected text
(delete-selection-mode 1)
;; yasnippet
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
;; Save last session
(desktop-save-mode 1)
;; spaceline mode
(require 'spaceline-config)
(spaceline-spacemacs-theme)
(setq powerline-image-apple-rgb t)
;; Show Line Numbers
(global-linum-mode 1)
(setq linum-format "%4d \u2502 ")
;; exec-path-from-shell This fix the PATH issue.
(exec-path-from-shell-copy-env "IDF_PATH")
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))
;; Show bracket colors
(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
;; This sets $MANPATH, $PATH and exec-path from your shell,
;; but only on OS X and Linux.
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))
;; >-< >-< >-< >-< >-< >-< >-< >-< >-< >-< >-< >-< >-< >-< >-<
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-c-headers-path-system
   (quote
    ("/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.14.sdk/usr/include/")))
 '(company-c-headers-path-user
   (quote
    ("/Users/sems/esp/ESP8266_RTOS_SDK/components/freertos/include/" "/Users/sems/esp/ESP8266_RTOS_SDK/components/esp8266/include/")))
 '(custom-enabled-themes (quote (dracula)))
 '(custom-safe-themes
   (quote
    ("aaffceb9b0f539b6ad6becb8e96a04f2140c8faa1de8039a343a4f1e009174fb" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" default)))
 '(package-selected-packages
   (quote
    (golden-ratio company-c-headers company rainbow-delimiters ag pos-tip dracula-theme magit restart-emacs spaceline-all-the-icons spaceline helm-core helm yasnippet-snippets multiple-cursors)))
 '(safe-local-variable-values
   (quote
    ((company-clang-arguments "-I/Users/sems/Documents/Workspace/mbed/ARM/TI/TMS570LS1224_Example/include/")
     (company-clang-arguments "-I/Users/sems/esp/ESP8266_RTOS_SDK/components/esp8266/include/" "-I/Users/sems/esp/ESP8266_RTOS_SDK/components/freertos/include/")
     (company-clang-arguments "-I/Users/sems/esp/ESP8266_RTOS_SDK/components/esp8266/include/" "-I/Users/sems/esp/ESP8266_RTOS_SDK/components/freertos/include/freertos/")
     (company-clang-arguments "-I/Users/sems/esp/ESP8266_RTOS_SDK/components/esp8266/include/
" "-I/Users/sems/esp/ESP8266_RTOS_SDK/components/freertos/include/freertos/")))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )