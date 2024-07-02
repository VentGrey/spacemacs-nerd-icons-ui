;;; packages.el --- nerd-icons-ui layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2024 Sylvain Benner & Contributors
;;
;; Author: VentGrey <omar@laesquinagris.com>
;; URL: https://github.com/VentGrey/spacemacs-nerd-icons-ui
;;
;; This file is not part of GNU Emacs.
;;
;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; nerd-icons-ui
;; Share under the GPL-3 please.
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `nerd-icons-ui-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `nerd-icons-ui/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `nerd-icons-ui/pre-init-PACKAGE' and/or
;;   `nerd-icons-ui/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst nerd-icons-ui-packages
  '(
    (nerd-icons :location (recipe :fetcher github
                                  :repo "rainstormstudio/nerd-icons.el"))

    (treemacs-nerd-icons (recipe :fetcher github
                                 :repo "rainstormstudio/treemacs-nerd-icons"))

    (nerd-icons-completion (recipe :fetcher github
                                   :repo "rainstormstudio/nerd-icons-completion"))

    (nerd-icons-ibuffer :location (recipe :fetcher github
                                          :repo "seagle0128/nerd-icons-ibuffer"))

    (centaur-tabs :location (recipe :fetcher github
                                    :repo "ema2159/centaur-tabs"))

    (nerd-icons-dired :location (recipe :fetcher github
                                        :repo "rainstormstudio/nerd-icons-dired"))

    )
  "The list of Lisp packages required by the nerd-icons-ui layer.

Each entry is either:

1. A symbol, which is interpreted as a package to be installed, or

2. A list of the form (PACKAGE KEYS...), where PACKAGE is the
    name of the package to be installed or loaded, and KEYS are
    any number of keyword-value-pairs.

    The following keys are accepted:

    - :excluded (t or nil): Prevent the package from being loaded
      if value is non-nil

    - :location: Specify a custom installation location.
      The following values are legal:

      - The symbol `elpa' (default) means PACKAGE will be
        installed using the Emacs package manager.

      - The symbol `local' directs Spacemacs to load the file at
        `./local/PACKAGE/PACKAGE.el'

      - A list beginning with the symbol `recipe' is a melpa
        recipe.  See: https://github.com/milkypostman/melpa#recipe-format")

(defun nerd-icons-ui/init-nerd-icons ()
  (use-package nerd-icons
    :ensure t
    :custom
    (nerd-icons-font-family "Symbols Nerd Font Mono")
    )
  )

(defun nerd-icons-ui/init-treemacs-nerd-icons ()
  (require 'nerd-icons)
  (use-package treemacs-nerd-icons
    :config
    (treemacs-load-theme "nerd-icons")
    )
  )

(defun nerd-icons-ui/init-nerd-icons-completion ()
  (require 'nerd-icons)
  (use-package nerd-icons-completion
    :config
    (nerd-icons-completion-mode))
  )

(defun nerd-icons-ui/init-centaur-tabs ()
  (require 'nerd-icons)
  (use-package centaur-tabs
    :demand
    :config
    (centaur-tabs-mode t)
    (centaur-tabs-headline-match)
    :custom
    (centaur-tabs-set-icons t)
    (centaur-tabs-icon-type 'nerd-icons)
    (centaur-tabs-gray-out-icons 'buffer)
    (centaur-tabs-set-bar 'under)
    (centaur-tabs-set-modified-marker t)
    (centaur-tabs-show-navigation-buttons t)
    (centaur-tabs-show-new-tab-button t)
    (centaur-tabs-show-navigation-buttons t)
    (centaur-tabs-close-button "✕")
    (centaur-tabs-modified-marker "•")
    (centaur-tabs-cycle-scope 'tabs)

    :hook
    (dashboard-mode . centaur-tabs-local-mode)
    (dired-mode . centaur-tabs-local-mode)
    (term-mode . centaur-tabs-local-mode)
    :bind
    (:map evil-normal-state-map
          ("g t"     . spacemacs/tabs-forward)
          ("g T"     . spacemacs/tabs-backward)
          ("g C-t"   . centaur-tabs-move-current-tab-to-right)
          ("g C-S-t" . centaur-tabs-move-current-tab-to-left))
    ("C-c t s" . centaur-tabs-counsel-switch-group)
    ("C-c t p" . centaur-tabs-group-by-projectile-project)
    ("C-c t g" . centaur-tabs-group-buffer-groups)
    )
  )

(defun nerd-icons-ui/init-nerd-icons-ibuffer ()
  (require 'nerd-icons)
  (use-package nerd-icons-ibuffer
    :ensure t
    :custom
    (nerd-icons-ibuffer-icon t)
    :hook (ibuffer-mode . nerd-icons-ibuffer-mode))
  )

(defun nerd-icons-ui/init-nerd-icons-dired ()
  (require 'nerd-icons)
  (use-package nerd-icons-dired
    :hook
    (dired-mode . nerd-icons-dired-mode)))
