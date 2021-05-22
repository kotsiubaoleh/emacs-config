(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;;Global
(menu-bar-mode -1)
(tool-bar-mode -1)
(toggle-scroll-bar -1)
(global-hl-line-mode 1)
(blink-cursor-mode 1)

(add-hook 'prog-mode-hook 'display-line-numbers-mode)
(electric-pair-mode 1)
;;(run-with-idle-timer 0.1 nil 'toggle-frame-maximized) ;;fullscreen mode on startup
(setq-default cursor-type 'box)

;;Helm
(straight-use-package 'helm)
(straight-use-package 'helm-ag)
(require 'helm-config)

;;Projectile
(straight-use-package 'projectile)
(projectile-mode 1)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

;;Helm Projectile
(straight-use-package 'helm-projectile)
(helm-projectile-on)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x b") 'helm-buffers-list)

;;js2-mode
(straight-use-package 'js2-mode)
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

;;vue-mode
(straight-use-package 'vue-mode)
(add-to-list 'auto-mode-alist '("\\.vue\\'" . vue-mode))
(add-hook 'mmm-mode-hook
          (lambda ()
            (set-face-background 'mmm-default-submode-face nil)))

;;Theme
(straight-use-package 'dracula-theme)
(load-theme 'dracula t)

;;Solaire
(straight-use-package 'solaire-mode)
(solaire-global-mode +1)

;;Helm-projectile
(straight-use-package 'helm-projectile)
(helm-projectile-on)

;;treemacs
(straight-use-package 'treemacs)
(straight-use-package 'treemacs-projectile)
(define-key global-map (kbd "M-0") #'treemacs-select-window)

;;which-key
(straight-use-package 'which-key)
(which-key-mode 1)

;;magit
(straight-use-package 'magit)
(global-set-key (kbd "C-x g") 'magit-status)

;;avy
(straight-use-package 'avy)
(avy-setup-default)
(global-set-key (kbd "M-g g") 'avy-goto-line)
(global-set-key (kbd "M-g w") 'avy-goto-word-1)

;;highlight-indent-guides
(straight-use-package 'highlight-indent-guides)
(add-hook 'prog-mode-hook 'highlight-indent-guides-mode)
(setq highlight-indent-guides-method 'bitmap)
(setq highlight-indent-guides-auto-character-face-perc 20)

;;all-the-icons
(straight-use-package 'all-the-icons)
;;(all-the-icons-install-fonts)

;;doom modeline
(straight-use-package 'doom-modeline)
(doom-modeline-mode 1)

;;turn off backup files
(setq make-backup-files nil)

;;SFCC
(add-to-list 'auto-mode-alist '("\\.isml\\'" . html-mode))
(add-to-list 'auto-mode-alist '("\\.hbs\\'" . html-mode))
