;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["black" "#d55e00" "#009e73" "#f8ec59" "#0072b2" "#cc79a7" "#56b4e9" "white"])
 '(custom-enabled-themes (quote (synthwave-light)))
 '(custom-safe-themes
   (quote
    ("467e6fe74d7c4f68dbe5906ebe33b6fb3d014468cfd89825a525140c66171570" "e1dc0e8e17412a5431aaf72ad3781f21b2af9a0deb825ad262a3cb96badef816" "3c2796a12f2df46336557a354ed96ce95a9d5604cd639b16993cda35d00e4d23" "f179fb3ecd774c228a02754c6cd068a840d8ed1766a0832a434680401de1c9dc" "bb4937669f95469793ea0ed799173269833a3906f0d2739eaccb1a282b57d6e0" "022a1891ffedc066006d2ee51f64c12fa607d38570cad45a863c15fd81399945" "ad2a566ba6dde63d9d8492a3274255d3675fccf66a3f90a1e6a4900e2dd7ff89" "c99dae69962b7cb1a30ddbeff233bb947e92eedd5c1946d5871a70aa6cae0689" "0772f8417961c92129d0476438453ba7564907e277bac387113feaa739c0976d" "69399e220a8743d5fd6f4768929a718d35a272e4f1988a4394e3d633d3aca0bc" "95fb6fa3dcd1ed151fbbbc55b8d61429c892d44a67405b04aab053e521305d4e" "e52d74cdd8fbe17792c88d61f5ba3f0a491a0cbef935bd2e45f06faa605bf7c6" "ba0bb7b310e031b5b7d0de4ea897cda6e0884217156c82edca8cb9205d8c36bf" "fb4f7405d3accc7ecad022b0008cb239e9203944df7b27aa7fd212eb276e263d" "53afd50661954b54863b3ded816f59b813c8b5fc084af06ccef863f5634e3dc5" "0a4711747514ebd96b535821fb8e456b36b35e3568d6e30ec6f9231be70f6fa9" "3fc22d63e7f5eb1d60a0f7d71a543297a68e6bc5f578b7acb0e77e9ab3b0779d" "8e84cd6781225a82ab8f7b2dc965e1d7a852fbc3959c45435fdd0686ed869277" "7cb32fa6b1d3c38df58ebe88d5c2d34eaa98119abfe0da5963bc3170cafeeed8" "fc7a9eee0ea854b5abbbbe51704d8cfd3d2da7fa921fa1a9edcb43834a88a1ab" default)))
 '(indent-tabs-mode nil)
 '(package-selected-packages
   (quote
    (iedit anzu ws-butler dtrt-indent clean-aindent-mode yasnippet undo-tree volatile-highlights helm-gtags helm-projectile helm-swoop helm zygospore projectile company use-package)))
 '(tab-always-indent t)
 '(tab-width 4))

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)

; Determine the underlying operating system
(setq win32 (or (eq system-type 'ms-dos)
                (eq system-type 'windows-nt)))
(setq macos (featurep 'aquamacs))
(setq linux (or (eq system-type 'gnu)
                (eq system-type 'gnu/linux)
                (eq system-type 'gnu/kfreebsd)
                (eq system-type 'cygwin)))

(when linux
  (setq makescript "./build.sh")
  (display-battery-mode 1))

(when win32
  (setq makescript "./build.bat"))

(defun find-project-directory-recursive ()
  "Recursively search for a buildfile."
  (interactive)
  (if (file-exists-p makescript) t
    (cd "../")
    (find-project-directory-recursive)))

(defun lock-compilation-directory ()
  "The compilation process should NOT hunt for a makefile"
  (interactive)
  (setq compilation-directory-locked t)
  (message "Compilation directory is locked."))

(defun unlock-compilation-directory ()
  "The compilation process SHOULD hunt for a makefile"
  (interactive)
  (setq compilation-directory-locked nil)
  (message "Compilation directory is roaming."))

(defun find-project-directory ()
  "Find the project directory."
  (interactive)
  (setq find-project-from-directory default-directory)
  (switch-to-buffer-other-window "*compilation*")
  (if compilation-directory-locked (cd last-compilation-directory)
  (cd find-project-from-directory)
  (find-project-directory-recursive)
  (setq last-compilation-directory default-directory)))

; improved symlink handeling
(setq vc-follow-symlinks t)

; disable backup
(setq backup-inhibited t)

; disable auto save
(setq auto-save-default nil)

; enable system copy paste
(setq x-select-enable-clipboard t)

; Navigation
(defun previous-blank-line ()
  "Moves to the previous line containing nothing but whitespace."
  (interactive)
  (search-backward-regexp "^[ \t]*\n")
)

(defun next-blank-line ()
  "Moves to the next line containing nothing but whitespace."
  (interactive)
  (forward-line)
  (search-forward-regexp "^[ \t]*\n")
  (forward-line -1)
)

(define-key global-map [C-right] 'forward-word)
(define-key global-map [C-left] 'backward-word)
(define-key global-map [C-up] 'previous-blank-line)
(define-key global-map [C-down] 'next-blank-line)
(define-key global-map [home] 'beginning-of-line)
(define-key global-map [end] 'end-of-line)
(define-key global-map [pgup] 'forward-page)
(define-key global-map [pgdown] 'backward-page)
(define-key global-map [C-next] 'scroll-other-window)
(define-key global-map [C-prior] 'scroll-other-window-down)

; ALT-alternatives
(defadvice set-mark-command (after no-bloody-t-m-m activate)
  "Prevent consecutive marks activating bloody `transient-mark-mode'."
  (if transient-mark-mode (setq transient-mark-mode nil)))

(defadvice mouse-set-region-1 (after no-bloody-t-m-m activate)
  "Prevent mouse commands activating bloody `transient-mark-mode'."
  (if transient-mark-mode (setq transient-mark-mode nil)))

; \377 is alt-backspace
(define-key global-map "\377" 'backward-kill-word)
(define-key global-map [M-delete] 'kill-word)

(defun append-as-kill ()
  "Performs copy-region-as-kill as an append."
  (interactive)
  (append-next-kill)
  (copy-region-as-kill (mark) (point))
)

; formatting key bindings
(define-key global-map "\M- "      'set-mark-command)
(define-key global-map "\M-q"      'append-as-kill)
(define-key global-map "\C-v"      'yank)
(define-key global-map "\M-z"      'kill-region)
(define-key global-map "\C-c"      'kill-ring-save)
(define-key global-map [Esc-up]    'previous-blank-line)
(define-key global-map [Esc-down]  'next-blank-line)
(define-key global-map [Esc-right] 'forward-word)
(define-key global-map [Esc-left]  'backward-word)

(define-key global-map "\M-:" 'View-back-to-mark)
(define-key global-map "\M-;" 'exchange-point-and-mark)

; magit and git keybindings
(global-set-key (kbd "C-x g") 'magit-status)

; Compile program using <F5>
; save all unsaved files here, then compile
(defun save-all-and-compile ()
  "Make the current build."
  (save-some-buffers 1)
  (interactive)
  (if (find-project-directory) (compile makescript))
  (other-window 1))
(global-set-key [f5] 'save-all-and-compile)

(defun replace-string (FromString ToString)
  "Replace a string without moving point."
  (interactive "sReplace: \nsReplace: %s  With: ")
  (save-excursion
    (replace-string FromString ToString)
    ))
(define-key global-map [f8] 'replace-string)

(define-key global-map [f9] 'first-error)
(define-key global-map [f10] 'previous-error)
(define-key global-map [f11] 'next-error)

(define-key global-map "\M-n" 'next-error)
(define-key global-map "\M-N" 'previous-error)

(define-key global-map "\M-g" 'goto-line)
(define-key global-map "\M-j" 'imenu)

; Buffers
(define-key global-map "\M-r" 'revert-buffer)
(define-key global-map "\M-k" 'kill-this-buffer)
(define-key global-map "\C-s" 'save-buffer)
(define-key global-map "\M-w" 'other-window)

2; Setup my find-files
(define-key global-map "\M-f" 'find-file)
(define-key global-map "\M-F" 'find-file-other-window)

; searches
(define-key global-map "\C-f" 'search-forward)

(global-set-key (read-kbd-macro "\M-b")  'ido-switch-buffer)
(global-set-key (read-kbd-macro "\M-B")  'ido-switch-buffer-other-window)

(global-set-key "\S-r" 'self-insert-command)

; Turn off the toolbar, scroll bar, and menu bar
(if window-system (tool-bar-mode -1))
(if window-system (scroll-bar-mode -1))
(menu-bar-mode -1)

(load-library "view")
(require 'cc-mode)
(require 'ido)
(require 'compile)
(ido-mode t)

(require 'magit)

(setq compilation-directory-locked nil)
(setq shift-select-mode nil)
(setq enable-local-variables nil)

; Stop Emacs from losing undo information by
; setting very high limits for undo buffers
(setq undo-limit 20000000)
(setq undo-strong-limit 40000000)

; Smooth scroll
(setq scroll-step 3)

; Clock
(display-time)

; Bright-red TODOs
(setq fixme-modes '(c++-mode c-mode emacs-lisp-mode))
(make-face 'font-lock-fixme-face)
(make-face 'font-lock-study-face)
(make-face 'font-lock-important-face)
(make-face 'font-lock-note-face)
(mapc (lambda (mode)
        (font-lock-add-keywords
         mode
         '(("\\<\\(TODO\\)" 1 'font-lock-fixme-face t)
           ("\\<\\(STUDY\\)" 1 'font-lock-study-face t)
           ("\\<\\(IMPORTANT\\)" 1 'font-lock-important-face t)
           ("\\<\\(NOTE\\)" 1 'font-lock-note-face t))))
      fixme-modes)
(modify-face 'font-lock-fixme-face "Yellow" nil nil t nil t nil nil)
(modify-face 'font-lock-study-face "Red" nil nil t nil t nil nil)
(modify-face 'font-lock-important-face "Blue" nil nil t nil t nil nil)
(modify-face 'font-lock-note-face "Green" nil nil t nil t nil nil)

; Accepted file extensions and their appropriate modes
(setq auto-mode-alist
      (append
       '(("\\.cpp$"    . c++-mode)
         ("\\.hin$"    . c++-mode)
         ("\\.cin$"    . c++-mode)
         ("\\.inl$"    . c++-mode)
         ("\\.rdc$"    . c++-mode)
         ("\\.h$"    . c++-mode)
         ("\\.c$"   . c++-mode)
         ("\\.cc$"   . c++-mode)
         ("\\.c8$"   . c++-mode)
         ("\\.txt$" . indented-text-mode)
         ("\\.emacs$" . emacs-lisp-mode)
         ("\\.gen$" . gen-mode)
         ("\\.ms$" . fundamental-mode)
         ("\\.m$" . objc-mode)
         ("\\.mm$" . objc-mode)
         ) auto-mode-alist))

; C++ indentation style
(defconst emacs-fancy-c-style
  '((c-electric-pound-behavior   . nil)
    (c-tab-always-indent         . t)
    (c-comment-only-line-offset  . 0)
    (c-hanging-braces-alist      . ((class-open)
                                    (class-close)
                                    (defun-open)
                                    (defun-close)
                                    (inline-open)
                                    (inline-close)
                                    (brace-list-open)
                                    (brace-list-close)
                                    (brace-list-intro)
                                    (brace-list-entry)
                                    (block-open)
                                    (block-close)
                                    (substatement-open . (after))
                                    (statement-case-open)
                                    (class-open)))
    (c-hanging-colons-alist      . ((inher-intro)
                                    (case-label)
                                    (label)
                                    (access-label)
                                    (access-key)
                                    (member-init-intro)))
    (c-cleanup-list              . (scope-operator
                                    list-close-comma
                                    defun-close-semi))
    (c-offsets-alist             . ((arglist-close         .  c-lineup-arglist)
                                    (topmost-intro         .  0)
                                    (label                 . -4)
                                    (access-label          . -4)
                                    (substatement-open     .  0)
                                    (statement-case-intro  .  4)
                                    (statement-block-intro .  1)
                                    (case-label            .  4)
                                    (block-open            .  0)
                                    (inline-open           .  0)
                                    (topmost-intro-cont    .  0)
                                    (knr-argdecl-intro     . -4)
                                    (brace-list-open       .  4)
                                    (brace-list-intro      .  4)))
    (c-echo-syntactic-information-p . t)F)
     "Emacs Fancy C++ Style")

; C/C++ mode handling
(defun fancy-c-hook ()
  ; Set my style for the current buffer
  ;(c-add-style "Custom C++" emacs-fancy-c-style t)

                                        ; 4-space tabs
  (setq c-basic-offset 4)
  (setq tab-width 4
        indent-tabs-mode nil)

  ; Additional style stuff
  (c-set-offset 'member-init-intro '++++)

  ; No hungry backspace
  (c-toggle-auto-hungry-state -1)

  ; Newline indents, semi-colon doesn't
  (define-key c++-mode-map "RET" 'newline-and-indent)
  (setq c-hanging-semi&comma-criteria '((lambda () 'stop)))

  ; Handle super-tabbify (TAB completes, shift-TAB actually tabs)
  (setq dabbrev-case-replace t)
  (setq dabbrev-case-fold-search t)
  (setq dabbrev-upcase-means-case-search t)


  ; line wrap off when in c++ mode
  (setq-default truncate-lines 1)
  
  ;; Abbrevation expansion
  (abbrev-mode 1)

  (defun header-format ()
    "Format the given file as a header file."
    (interactive)
    (setq BaseFileName (file-name-sans-extension (file-name-nondirectory buffer-file-name)))
    (insert "#ifndef ")
    (push-mark)
    (insert BaseFileName)
    (upcase-region (mark) (point))
    (pop-mark)
    (insert "_H\n")    
    (insert "#define ")
    (push-mark)
    (insert BaseFileName)
    (upcase-region (mark) (point))
    (pop-mark)
    (insert "_H")
    (insert "\n\n")
    (insert "#endif /* ")
    (push-mark)
    (insert BaseFileName)
    (upcase-region (mark) (point))
    (pop-mark)
    (insert "_H */\n")) 
    
  (cond ((file-exists-p buffer-file-name) t)
        ((string-match "[.]h" buffer-file-name)
         (header-format)))
        
  (defun find-corresponding-file ()
    "Find the file that corresponds to this one."
    (interactive)
    (setq CorrespondingFileName nil)
    (setq BaseFileName (file-name-sans-extension buffer-file-name))
    (if (string-match "\\.c" buffer-file-name)
        (setq CorrespondingFileName (concat BaseFileName ".h")))
    (if (string-match "\\.h" buffer-file-name)
        (if (file-exists-p (concat BaseFileName ".c")) (setq CorrespondingFileName (concat BaseFileName ".c"))
          (setq CorrespondingFileName (concat BaseFileName ".cpp"))))
    (if (string-match "\\.hin" buffer-file-name)
        (setq CorrespondingFileName (concat BaseFileName ".cin")))
    (if (string-match "\\.cin" buffer-file-name)
        (setq CorrespondingFileName (concat BaseFileName ".hin")))
    (if (string-match "\\.cpp" buffer-file-name)
        (setq CorrespondingFileName (concat BaseFileName ".h")))
    (if CorrespondingFileName (find-file CorrespondingFileName)
      (error "Unable to find a corresponding file")))
  (defun find-corresponding-file-other-window ()
    "Find the file that corresponds to this one."
    (interactive)
    (find-file-other-window buffer-file-name)
    (find-corresponding-file)
    (other-window -1))
  (define-key c++-mode-map "\M-h" 'find-corresponding-file-other-window)

  ;(define-key c++-mode-map "\t" 'dabbrev-expand)
  (define-key c++-mode-map "\t" 'indent-for-tab-command)
  ;(define-key c++-mode-map "\C-y" 'indent-for-tab-command)
  (define-key c++-mode-map [C-tab] 'indent-region)
  (define-key c++-mode-map "" 'indent-region)

  (define-key c++-mode-map "\M-j" 'imenu)

  (define-key c++-mode-map "\M-." 'c-fill-paragraph)

  (define-key c++-mode-map "\M-/" 'c-mark-function)

  (define-key c++-mode-map "\M- " 'set-mark-command)
  (define-key c++-mode-map "\M-q" 'append-as-kill)
  (define-key c++-mode-map "\M-a" 'yank)
  (define-key c++-mode-map "\M-z" 'kill-region)
  (define-key c++-mode-map "\C-c" 'kill-ring-save)
  
  ; Turn on line numbers
  ;(linum-mode)
)

(add-hook 'c-mode-common-hook 'fancy-c-hook)

; Startup windowing
(setq next-line-add-newlines nil)
(setq-default truncate-lines t)
(setq truncate-partial-width-windows nil)
(split-window-horizontally)

(defun never-split-a-window
    "Never, ever split a window.  Why would anyone EVER want you to do that??"
  nil)
(setq split-window-preferred-function 'never-split-a-window)
