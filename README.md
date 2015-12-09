# emacs
this is my emacs config files.

## emacs and loadpath
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
Installing autocomplete is pretty straightforward:
We will install autocomplete into ~/.emacs.d/lisp/<br>
<br>Download the latest tar from http://cx4a.org/pub/auto-complete/
<br>
Extract the archive:

```bash
$ tar xjf auto-complete-X.Y.Z.tar.bz2.
```

Open emacs and load the file auto-complete-X.Y.Z/etc/install.el;<br>
in emacs, run <br>
M-x load-file
<br>
and specify the path to the file
<br>
Of course you will choose install location to be ~/.emacs.d/lisp<br>
Paste the code shown into your ~/.emacs<br>
The code will look something like;<br>

```lisp
(add-to-list 'load-path "~/.emacs.d/lisp")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/lisp/ac-dict")
(ac-config-default)
```

<br>
Autocomplete is now installed. To make it work with go, we also need to get go-autocomplete.
<br>
Run:<br>


```bash
$ go get -u -v github.com/nsf/gocode
```

<br>
copy the go-autocomplete to your ~/.emacs.d/lisp folder;

```bash
$ cp $GOPATH/src/github.com/nsf/gocode/emacs/go-autocomplete.el ~/.emacs.d/lisp
```
	  
<br>
insert the following into your .emacs:
<br>

```lisp
(require 'go-autocomplete)
(require 'auto-complete-config)
```
<br>
<br>
You might also want to add hooks for building when saving and the go-oracle.  
<br>
<br>
Some other useful stuff;  

```go get -u -v github.com/nsf/gocode  
go get -u -v github.com/rogpeppe/godef  
go get -u -v github.com/golang/lint/golint  
go get -u -v github.com/lukehoban/go-find-references  
go get -u -v github.com/lukehoban/go-outline  
go get -u -v sourcegraph.com/sqs/goreturns  
go get -u -v golang.org/x/tools/cmd/gorename  
```
