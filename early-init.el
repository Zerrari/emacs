(setq frame-resize-pixelwise t
      frame-inhibit-implied-resize t
      use-dialog-box t ; only for mouse events, which I seldom use
      use-file-dialog nil
      inhibit-splash-screen t
      inhibit-startup-screen t
      inhibit-x-resources t
      inhibit-startup-echo-area-message user-login-name ; read the docstring
      inhibit-startup-buffer-menu t)

(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)

(setq package-enable-at-startup t)

(defvar my-emacs--gc-cons-threshold gc-cons-threshold)


(setq gc-cons-threshold most-positive-fixnum)

;; Same idea as above for the `file-name-handler-alist'.
(defvar my-emacs--file-name-handler-alist file-name-handler-alist)

(setq file-name-handler-alist nil)

(defvar my-emacs--vc-handled-backends vc-handled-backends)

(setq vc-handled-backends nil)

(add-hook 'emacs-startup-hook
          (lambda ()
            (setq gc-cons-threshold my-emacs--gc-cons-threshold
                  file-name-handler-alist my-emacs--file-name-handler-alist
                  vc-handled-backends my-emacs--vc-handled-backends)))
