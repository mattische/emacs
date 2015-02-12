;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; PACKAGE MANAGEMENT
;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Use package manager
(require 'package)

; Sets package manager sources
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)

(when (< emacs-major-version 24)
  ;; For important compability libs like cl-lib
  (add-to-list 'package-archives
               '("gnu" . "http://elpa.gnu.org/packages/")))

; Initialize the package manager
(package-initialize)

;; END PACKAGE MANAGEMENT

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Take a look at:
;; http://tleyden.github.io/blog/2014/05/22/configure-emacs-as-a-go-editor-from-scratch/
;; before installing Autocomplete and golang support.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; AUTOCOMPLETE
;; 1) Create a dir inside ~/.emacs.d/, name it lisp (or similar) -> ~/.emacs.d/lisp/
;; 2) Download the tar from http://auto-complete.org/ or http://cx4a.org/pub/auto-complete/auto-complete-1.3.1.tar.bz2
;; 3) Extract tar with tar xjf auto-complete-1.3.1.tar.bz2.
;; 4) Open emacs and load the file auto-complete-X.Y.Z/etc/install.el
;;    Choose install location to be ~/.emacs.d/lisp
;;    Paste the code shown into your ~/.emacs
;;                          OR
;;    install with emacs -batch -l auto-complete-X.Y.Z/etc/install.el
;;    (this will install it directly in ~/.emacs.d which is not recommended
;; 5) Paste the code shown from install into ~/.emacs (the code beneath this comment)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-to-list 'load-path "~/.emacs.d/lisp")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/lisp/ac-dict")
(ac-config-default)

;; END AUTOCOMPLETE

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; GOLANG SUPPORT
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;To make GODOC work, we explicitly need to add PATH and GOPATH;
(setenv "PATH" "/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/go/bin:/home/mattische/go_workspace/bin")
(setenv "GOPATH" "/home/mattische/go_workspace")

;; GOFMT on save
;; To automatically call gofmt on save (make adjustments for your paths)
;; this formats go-file according to the golang convention
(setq exec-path (cons "/usr/bin/go" exec-path))
(add-to-list 'exec-path "/home/mattische/go_workspace/bin")
(add-hook 'before-save-hook 'gofmt-before-save)


;; AUTOCOMPLETE FOR GO
;; First install go and autocomplete (as described above).
;; In a terminal install gocode;
;; $ go get -u -v github.com/nsf/gocode
;; and copy it into ~/.emacs.d/lisp
;; $ cp go_workspace/src/github.com/nsf/gocode/emacs/go-autocomplete.el ~/.emacs.d/lisp
(require 'go-autocomplete)
(require 'auto-complete-config)

; Go Oracle
(load-file "$GOPATH/src/code.google.com/p/go.tools/cmd/oracle/oracle.el")

(defun my-go-mode-hook ()
  ; Use goimports instead of go-fmt
  (setq gofmt-command "goimports")
  ; Call Gofmt before saving
  (add-hook 'before-save-hook 'gofmt-before-save)
  ; Customize compile command to run go build
  (if (not (string-match "go" compile-command))
      (set (make-local-variable 'compile-command)
           "go build -v && go test -v && go vet"))
  ; Godef jump key binding
  (local-set-key (kbd "M-.") 'godef-jump))
(add-hook 'go-mode-hook 'my-go-mode-hook)
