# emacs
this is my emacs config files.

## emacs and autoload
Preferably, create a folder inside ~/.emacs.d. The convention is something like lisp.
This is the folder where you want to put/install your stuff.

$ mkdir -p ~/.emacs.d/lisp

## Package management
Nothing strange - Im fine with melpa.

## Autocomplete with Go support
have a look here for setting up emacs as you Go editor;
http://tleyden.github.io/blog/2014/05/22/configure-emacs-as-a-go-editor-from-scratch/


Installing autocomplete is pretty straightforward:

0) We will install autocomplete into ~/.emacs.d/lisp/                             
1) Download the latest tar from http://cx4a.org/pub/auto-complete/                                                   2) Extract tar with tar xjf auto-complete-X.Y.Z.tar.bz2.                                                             
3) Open emacs and load the file auto-complete-X.Y.Z/etc/install.el                                                   
   Of course you will choose install location to be ~/.emacs.d/lisp                                                     Paste the code shown into your ~/.emacs                                                                           
   The code will look something like;
   
   (add-to-list 'load-path "~/.emacs.d/lisp")
   (require 'auto-complete-config)
   (add-to-list 'ac-dictionary-directories "~/.emacs.d/lisp/ac-dict")
   (ac-config-default)

Autocomplete is now installed. To make it work with go, we also need to get go-autocomplete.
4) Run:
   $ go get -u -v github.com/nsf/gocode
5) copy the go-autocomplete to your ~/.emacs.d/lisp folder;
   $ cp $GOPATH/src/github.com/nsf/gocode/emacs/go-autocomplete.el ~/.emacs.d/lisp
6) insert the following into your .emacs:
   (require 'go-autocomplete)
   (require 'auto-complete-config)


You might also want to add hooks for building when saving and the go-oracle.
