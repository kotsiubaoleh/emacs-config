(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(all-the-icons-scale-factor 1)
 '(ansi-color-names-vector
   ["#232530" "#99324b" "#4f894c" "#9a7500" "#3b6ea8" "#97365b" "#398eac" "#2a2a2a"])
 '(pdf-view-midnight-colors (cons "#2a2a2a" "#fafafa")))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-lock-comment-face ((t (:inherit italic :foreground "dim gray"))))
 '(helm-selection ((t (:inherit bold :background "purple4"))))
 '(line-number ((t (:inherit default :foreground "dim gray" :strike-through nil :underline nil :slant normal :weight normal))))
 '(line-number-current-line ((t (:inherit (hl-line default) :foreground "dark gray" :strike-through nil :underline nil :slant normal :weight normal)))))

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
(add-hook 'prog-mode-hook 'display-line-numbers-mode)
(electric-pair-mode 1)
(run-with-idle-timer 0.1 nil 'toggle-frame-maximized)

;;Helm
(straight-use-package 'helm)
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
(straight-use-package 'doom-themes)
(load-theme 'doom-horizon t)

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
(setq highlight-indent-guides-method 'character)
(setq highlight-indent-guides-auto-character-face-perc 20)
