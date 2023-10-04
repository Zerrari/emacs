(setq ring-bell-function 'ignore)
(setq use-short-answers t)
(setq native-comp-async-report-warnings-errors 'silent) ; Emacs 28 with native compilation
(setq native-compile-prune-cache t) ; Emacs 29
(setq make-backup-files nil)
(setq backup-inhibited nil) ; Not sure if needed, given `make-backup-files'
(setq create-lockfiles nil)

(blink-cursor-mode -1)

;; Disable the damn thing by making it disposable.
(setq custom-file (make-temp-file "emacs-custom-"))

;; Enable tab-line-mode
(global-tab-line-mode 1)

(global-display-line-numbers-mode 1)

(load-theme 'modus-vivendi t)

(add-to-list 'default-frame-alist '(fullscreen . maximized))

(set-face-attribute 'default nil :height 200)

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))

(defvar my-packages
  '(evil
    evil-collection
    ace-window
    multiple-cursors
    hydra))

;; activate all the packages (in particular autoloads)
(package-initialize)

;; fetch the list of packages available 
(or (file-exists-p package-user-dir)
    (package-refresh-contents))

;; install the missing packages
(dolist (package my-packages)
  (unless (package-installed-p package)
    (package-install package)))

(defvar my-emacs--config-dir "~/.config/emacs/modules")
(add-to-list 'load-path my-emacs--config-dir)

(require 'my-evil)
(require 'my-ido)
(require 'my-ibuffer)
(require 'my-dired)
(require 'my-window)
(require 'my-mc)
