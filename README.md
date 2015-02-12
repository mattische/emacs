# emacs
this is my emacs config files.

## emacs and autoload
Preferably, create a folder inside ~/.emacs.d. The convention is something like lisp.
This is the folder where you want to put/install your stuff.

```bash
$ mkdir -p ~/.emacs.d/lisp
```

## Package management
Nothing strange - Im fine with melpa.
<br>
<br>
## Autocomplete with Go support
have a look here for setting up emacs as you Go editor;
<br>http://tleyden.github.io/blog/2014/05/22/configure-emacs-as-a-go-editor-from-scratch/
<br>
<br>
Installing autocomplete is pretty straightforward:
<br>

<ol>
  <li>We will install autocomplete into ~/.emacs.d/lisp/
    <br>Download the latest tar from http://cx4a.org/pub/auto-complete/</li>

  <li>Extract tar with tar
  ```bash
  $ xjf auto-complete-X.Y.Z.tar.bz2.
  ```
  </li>
  
  <li>Open emacs and load the file auto-complete-X.Y.Z/etc/install.el                                                   <br>
   Of course you will choose install location to be ~/.emacs.d/lisp                                                     Paste the code shown into your ~/.emacs                                                                           
   The code will look something like;
  ```lisp
  (add-to-list 'load-path "~/.emacs.d/lisp")
  (require 'auto-complete-config)
  (add-to-list 'ac-dictionary-directories "~/.emacs.d/lisp/ac-dict")
  (ac-config-default)
  ```
  <br>
  Autocomplete is now installed. To make it work with go, we also need to get go-autocomplete.
  </li>
  
  <li>Run:<br>
  ```bash
  $ go get -u -v github.com/nsf/gocode
  ```
  </li>
  
  <li>copy the go-autocomplete to your ~/.emacs.d/lisp folder;
  ```bash
  $ cp $GOPATH/src/github.com/nsf/gocode/emacs/go-autocomplete.el ~/.emacs.d/lisp
  ```
  </li>
  
  <li>insert the following into your .emacs:
  ```lisp
  (require 'go-autocomplete)
  (require 'auto-complete-config)
  ```
  </li>
</ol>
<br>
You might also want to add hooks for building when saving and the go-oracle.
