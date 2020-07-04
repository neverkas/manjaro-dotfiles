;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(javascript
     yaml
     haskell
     prolog
     sh
     html
     markdown
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     ivy
     ;; helm
     latex
     bibtex
    auto-completion
       (auto-completion :variables
                        company-math
                       auto-completion-return-key-behavior nil
                       auto-completion-tab-key-behavior 'complete
                        auto-completion-enable-sort-by-usage t
                     ;;auto-completion-tab-key-behavior nil
                        auto-completion-enable-snippets-in-popup t)
     ;; better-defaults
     emacs-lisp
     git
     ;; markdown
     ;; org-mode
     org
     ;; similar al dired pero ocupa menos espacio
     treemacs
     ;; Variedades de themes
                                        ; themes-megapack
     ;; Shell personalizada
     (shell :variables
            shell-default-term-shell "/bin/zsh"
             shell-default-height 30
             shell-default-position 'bottom)
     ;; spell-checking
      syntax-checking
     ;; version-control
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(
                                      cdlatex
                                      auctex
                                      yasnippet-snippets
                                      magit
                                      dashboard
                                      org-starter
                                      org-fancy-priorities
                                      olivetti
                                      org-bullets
                                      all-the-icons
                                      all-the-icons-dired
                                      org-gcal
   )
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '(
                                    company-tern
                                    )
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-but-keep-unused))
;;dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   ;;   dotspacemacs-editing-style 'emacs
	dotspacemacs-editing-style 'hybrid

   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   ;; dotspacemacs-startup-banner 'official
   dotspacemacs-startup-banner nil
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(spacemacs-dark
                         spacemacs-light)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 16
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   ;;dotspacemacs-fullscreen-at-startup nil
   dotspacemacs-fullscreen-at-startup t
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;;dotspacemacs-maximized-at-startup t
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
   ;;dotspacemacs-line-numbers nil
   dotspacemacs-line-numbers t
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   ;; dotspacemacs-persistent-server nil
   dotspacemacs-persistent-server t
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  ;(setq configuration-layer-elpa-archives '(("melpa" . "melpa.org/packages/")
  ;;(setq inhibit-startup-screen nil)
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."


;  (setq org-publish-project-alist
;        '(("org"
;           :base-directory "~/Dropbox/neverkas.github.io/utn/"
;           :base-extension "org"
;           :publishing-directory "~/Dropbox/neverkas.github.io/utn/hello"
;           :recursive t
;           :publishing-function org-html-publish-to-html
;           :headline-levels 4             ; Just the default for this project.
;           :auto-preamble t
;   )))
  ;; Permitir a org-mode que compile lenguajes en los bloques de codigo
  ;;(add-to-list 'load-path "/home/jelou/Documentos/git/ob-prolog")

  ;; Agenda - Estados
  (with-eval-after-load 'org
    (setq org-todo-keywords
          '((sequence "[TODO]" "[DOING]" "[WAITING]" "|" "[DONE]"))))

  (with-eval-after-load 'org
    (setq org-todo-keyword-faces
          '(("[TODO]" . "orange")
            ("[DOING]" . "yellow")
            ("[WAITING]" . "magenta")
            ("[DONE]" . "green"))))

  ;; Agenda - Prioridades
  (use-package org-fancy-priorities
    :ensure t
    :hook
    (org-mode . org-fancy-priorities-mode)
    :config
    (setq org-fancy-priorities-list '("[HIGH]" "[MID]" "[LOW]" "[OPTIONAL]")))
  ;;(setq org-src-fontify-natively t)

  ;; tira error por la t, hay q arreglarlo..
  ;; (with-eval-after-load 'org
  ;;             (org-babel-do-load-languages
  ;;              'org-babel-load-languages
  ;;              '(
  ;;               (emacs-lisp . t)
  ;;               (haskell . t)
  ;;               (latex . t)
  ;;               (haskell . t)
  ;;               (sh . t)
  ;;               (prolog . t)
  ;;               ;;(bash . t)
  ;;               )))

  ;; Para que al usar C-x o no te lleve al buffer de treemacs (gestor de directorios)
  (use-package treemacs
    :ensure t
    ;; agregamos shortcuts
    :bind(:map global-map
               ([f8] . treemacs)
               ("C-<f8>" . treemacs-select-window)
               )
    ;; configuraciones
    :config(
            ;;(setq treemacs-is-never-other-window t) ;; que no funcione con C-x o
            )
    )

  ;; habilitar compilar codigo
  ;;  (setq haskell-process-type 'stack-ghci)

  ;; https://cestlaz.github.io/posts/using-emacs-26-gcal/
  ;; https://www.youtube.com/watch?v=vO_RF2dK7M0
  ;; 4/zgEkxNWLele2wdgZHDb7UEHFepbGcZ5C0q_vgHReukBvVxJbQAvM1Qs
  ;;(setq package-check-signature nil)
  ;;(use-package org-gcal
  ;;  :ensure t
  ;;  :config
  ;;  (setq org-gcal-client-id "611095646838-kag0845tliqu8sqnesbv5sutseuvq2ps.apps.googleusercontent.com"
  ;;        org-gcal-client-secret "sZTQqGN7tt_lkkfZyzQlc7Wp"
  ;;        org-gcal-file-alist '(("emmanuel.lazarte.012@gmail.com" .  "~/Dropbox/orgfiles/gcal.org"))))

  ;;(setq org-agenda-files (directory-files-recursively "~/Dropbox/neverkas.github.io/utn/" "\.org$"))
  (setq org-agenda-files (list "~/Dropbox/neverkas.github.io/utn/index.org"
                               "~/Dropbox/neverkas.github.io/utn/ads.org"
                               "~/Dropbox/neverkas.github.io/utn/ami.org"
                               "~/Dropbox/neverkas.github.io/utn/fisica.org"
                               "~/Dropbox/neverkas.github.io/utn/pdep.org"
                               "~/Dropbox/neverkas.github.io/utn/sintaxis.org"
                               ))

  ;;(setq org-agenda-files (list "~/Dropbox/orgfiles/gcal.org"
  ;;                             "~/Dropbox/orgfiles/i.org"
  ;;                             "~/Dropbox/orgfiles/schedule.org"))


  ;;(add-hook 'org-agenda-mode-hook (lambda () (org-gcal-sync) ))
  ;;(add-hook 'org-capture-after-finalize-hook (lambda () (org-gcal-sync) ))
  ;;

  ;;(setq-default org-html-with-latex `dvipng)
  ;(global-set-key (kbd "TAB") 'hippie-expand)
  ;(global-set-key (kbd "<tab>") 'hippie-expand)
  ;(global-set-key (kbd "\t") 'hippie-expand)

  (setq org-format-latex-options (plist-put org-format-latex-options :scale 2.0))

 ;; (setq org-latex-create-formula-image-program 'imagemagick)
  ;;(setq org-latex-create-formula-image-program 'dvipng)
  (add-hook 'doc-view-mode-hook 'auto-revert-mode)

  ;; Ruta hasta el jar de Ditaa
  ;; (setq org-ditaa-jar-path "/usr/bin/ditaa")
  ;;(setq org-ditaa-jar-path "RUTA/ditaaXXX.jar")

  ;; (eval-after-load "org"
  ;;   '(require 'ox-md nil t))

  ;; para evitar conflictos entre la shell zsh y evil mode
  (evil-set-initial-state 'term-mode 'emacs) ;; turn off evil-mode for ansi-term
  (setq term-char-mode-point-at-process-mark nil) ;; allow editing in normal mode

  ;; Format: "(icon title help action face prefix suffix)"
  ;;
  ;;(setq org-agenda-window-setup (quote current-window))
  ;; To add all org files in a repository to the agenda


  ;; Package Olivietti
  ;; Text takes up 85% of the buffer
  (setq olivetti-body-width 0.95)
  ;; Starts text files (like .org .txt .md) in olivetti mode
  (add-hook 'text-mode-hook 'olivetti-mode)
  ;; Modificar las viñetas
  (setq org-bullets-bullet-list '("■" "◆" "▲" "▶"))
  ;; Modificar checkboxes
  (add-hook 'org-mode-hook (lambda ()
                             "Beautify Org Checkbox Symbol"
                             (push '("[ ]" .  "☐") prettify-symbols-alist)
                             (push '("[X]" . "☑" ) prettify-symbols-alist)
                             (push '("[-]" . "❍" ) prettify-symbols-alist)
                             (prettify-symbols-mode)))
  (defface org-checkbox-done-text
    '((t (:foreground "#71696A")))
    "Face for the text part of a checked org-mode checkbox.")
  ;


)

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (web-mode tagedit slim-mode scss-mode sass-mode pug-mode mmm-mode markdown-toc markdown-mode helm-css-scss haml-mode gh-md emmet-mode ws-butler winum which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline powerline restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox spinner org-plus-contrib org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint indent-guide hydra lv hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation helm-themes helm-swoop helm-projectile projectile pkg-info epl helm-mode-manager helm-make helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido flx fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist highlight evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg undo-tree eval-sexp-fu elisp-slime-nav dumb-jump f dash s diminish define-word column-enforce-mode clean-aindent-mode bind-map bind-key auto-highlight-symbol auto-compile packed aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line helm avy helm-core popup async))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#2e3436" "#a40000" "#4e9a06" "#c4a000" "#204a87" "#5c3566" "#729fcf" "#eeeeec"])
 '(company-quickhelp-color-background "#4F4F4F")
 '(company-quickhelp-color-foreground "#DCDCCC")
 '(compilation-message-face (quote default))
 '(cua-global-mark-cursor-color "#689d6a")
 '(cua-normal-cursor-color "#a89984")
 '(cua-overwrite-cursor-color "#d79921")
 '(cua-read-only-cursor-color "#98971a")
 '(custom-enabled-themes (quote (spacemacs-dark)))
 '(custom-safe-themes
   (quote
    ("fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "d74c5485d42ca4b7f3092e50db687600d0e16006d8fa335c69cf4f379dbd0eee" "51ec7bfa54adf5fff5d466248ea6431097f5a18224788d0bd7eb1257a4f7b773" "830877f4aab227556548dc0a28bf395d0abe0e3a0ab95455731c9ea5ab5fe4e1" "89536596ee5bdc5ef9ea3d3d5b515ea616285fa9274c836263024f1993f6b3dd" "76c5b2592c62f6b48923c00f97f74bcb7ddb741618283bdb2be35f3c0e1030e3" default)))
 '(evil-want-Y-yank-to-eol nil)
 '(fci-rule-color "#32302f")
 '(highlight-changes-colors (quote ("#d3869b" "#b16286")))
 '(highlight-symbol-colors
   (quote
    ("#51d941b82b0f" "#37ea42e437b4" "#5b6434562bc9" "#47f636913db1" "#437d4142298e" "#533d35ed2652" "#31483d9f3e1f")))
 '(highlight-symbol-foreground-color "#bdae93")
 '(highlight-tail-colors
   (quote
    (("#32302f" . 0)
     ("#747400" . 20)
     ("#2e7d33" . 30)
     ("#14676b" . 50)
     ("#a76e00" . 60)
     ("#a53600" . 70)
     ("#9f4d64" . 85)
     ("#32302f" . 100))))
 '(hl-bg-colors
   (quote
    ("#a76e00" "#a53600" "#b21b0a" "#9f4d64" "#8b2a58" "#14676b" "#2e7d33" "#747400")))
 '(hl-fg-colors
   (quote
    ("#282828" "#282828" "#282828" "#282828" "#282828" "#282828" "#282828" "#282828")))
 '(hl-todo-keyword-faces
   (quote
    (("TODO" . "#dc752f")
     ("NEXT" . "#dc752f")
     ("THEM" . "#2d9574")
     ("PROG" . "#4f97d7")
     ("OKAY" . "#4f97d7")
     ("DONT" . "#f2241f")
     ("FAIL" . "#f2241f")
     ("DONE" . "#86dc2f")
     ("NOTE" . "#b1951d")
     ("KLUDGE" . "#b1951d")
     ("HACK" . "#b1951d")
     ("TEMP" . "#b1951d")
     ("FIXME" . "#dc752f")
     ("XXX+" . "#dc752f")
     ("\\?\\?\\?+" . "#dc752f"))))
 '(jdee-db-active-breakpoint-face-colors (cons "#1B2229" "#FD971F"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#1B2229" "#A6E22E"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#1B2229" "#525254"))
 '(lsp-ui-doc-border "#bdae93")
 '(nrepl-message-colors
   (quote
    ("#fb4933" "#d65d0e" "#d79921" "#747400" "#b9b340" "#14676b" "#689d6a" "#d3869b" "#b16286")))
 '(objed-cursor-color "#E74C3C")
 '(org-agenda-files
   (quote
    ("~/Dropbox/neverkas.github.io/utn/sintaxis.org" "~/Dropbox/neverkas.github.io/utn/pdep.org")))
 '(package-selected-packages
   (quote
    (tide typescript-mode tern nodejs-repl livid-mode skewer-mode js2-refactor multiple-cursors js2-mode js-doc import-js grizzl helm-gtags ggtags dap-mode lsp-treemacs bui counsel-gtags add-node-modules-path web-mode tagedit slim-mode scss-mode sass-mode pug-mode mmm-mode markdown-toc markdown-mode helm-css-scss haml-mode gh-md emmet-mode ws-butler winum which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline powerline restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox spinner org-plus-contrib org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint indent-guide hydra lv hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation helm-themes helm-swoop helm-projectile projectile pkg-info epl helm-mode-manager helm-make helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido flx fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist highlight evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg undo-tree eval-sexp-fu elisp-slime-nav dumb-jump f dash s diminish define-word column-enforce-mode clean-aindent-mode bind-map bind-key auto-highlight-symbol auto-compile packed aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line helm avy helm-core popup async)))
 '(pdf-view-midnight-colors (quote ("#DCDCCC" . "#383838")))
 '(pos-tip-background-color "#32302f")
 '(pos-tip-foreground-color "#bdae93")
 '(rustic-ansi-faces
   ["#272822" "#E74C3C" "#A6E22E" "#E6DB74" "#268bd2" "#F92660" "#66D9EF" "#F8F8F2"])
 '(smartrep-mode-line-active-bg (solarized-color-blend "#98971a" "#32302f" 0.2))
 '(term-default-bg-color "#282828")
 '(term-default-fg-color "#a89984")
 '(vc-annotate-background nil)
 '(vc-annotate-background-mode nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#fb4933")
     (40 . "#ea9077602ba7")
     (60 . "#e13d890d26e5")
     (80 . "#d79921")
     (100 . "#c25f98e11e8d")
     (120 . "#b7f4989b1d5e")
     (140 . "#ad7198331c37")
     (160 . "#a2cd97aa1b17")
     (180 . "#98971a")
     (200 . "#8b4b99073ab0")
     (220 . "#84009a084776")
     (240 . "#7bdf9b065366")
     (260 . "#72aa9c035ed9")
     (280 . "#689d6a")
     (300 . "#5c5b933c7677")
     (320 . "#55928e6e7c70")
     (340 . "#4de689af8246")
     (360 . "#458588"))))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   (quote
    (unspecified "#282828" "#32302f" "#b21b0a" "#fb4933" "#747400" "#98971a" "#a76e00" "#d79921" "#14676b" "#458588" "#9f4d64" "#d3869b" "#2e7d33" "#689d6a" "#a89984" "#282828")))
 '(xterm-color-names
   ["#32302f" "#fb4933" "#98971a" "#d79921" "#458588" "#d3869b" "#689d6a" "#a89984"])
 '(xterm-color-names-bright
   ["#282828" "#d65d0e" "#7c6f64" "#282828" "#a89984" "#b16286" "#bdae93" "#fbf1c7"]))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
)
