**Contents**  
+ <a href="https://github.com/mattische/emacs/blob/master/README.md#get-latest-version-of-emacs-snapshot-on-ubuntu">get emacs snapshot for ubuntu</a> 
+ <a href="https://github.com/mattische/emacs/blob/master/README.md#go-autocomplete-in-emacs24-nox-ubuntu">emacs + go == true</a>
+ <a href="https://github.com/mattische/emacs/blob/master/README.md#other-stuff">go stuff for emacs</a>
+ <a href="https://github.com/mattische/emacs/blob/master/README.md#line-number-and-increasing-font-size">Increase font size and enable line numbering</a>

_if on windows, your .emacs and .emacs.d resides in c:\Users\username\AppData\Roaming_



#get latest version of emacs (snapshot) on ubuntu  

Get the latest version (snapshot) of emacs by adding elisp repo:  
	`$ sudo add-apt-repository -y ppa:ubuntu-elisp`  
	`$ sudo apt-get update`  
	`$ sudo apt-get install emacs-snapshot-nox`

The process of enabling go support in emacs snapshot, should be the same as for older versions (follow instrunctions below i.e)  
<br>
<br>

#go-autocomplete in emacs24-nox (ubuntu)
+ **go-code**  
   It is assumed that you have a working go environment, including GOPATH. Also, we need `gocode` - follow url below.    
   See setup for GOPATH and gocode here; https://github.com/nsf/gocode#setup  
   `$ go get -u -v github.com/nsf/gocode`  

   It is recommended to have your GOPATH/bin dir in your path to make gocode work correctly.  
   Example in ~/.bashrc or ~/.profile;  
   
		export PATH=$PATH:/usr/local/go/bin  
		export GOPATH=~/go                       # ~/go is the go workspace
		export PATH=$PATH:$GOPATH/bin            # recommended to add bin   

+ **Install auto-complete**  
   Make sure you have the correct entries for melpa in your .emacs. Enter this into your ~/.emacs;  

		(require 'package) ;; You might already have this line  
		(add-to-list 'package-archives    
			'("melpa" . "https://melpa.org/packages/"))    
		(when (< emacs-major-version 24)  
			;; For important compatibility libraries like cl-lib  
			(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))    
		(package-initialize) ;; You might already have this line  
		
	(_source: http://stable.melpa.org/#/getting-started_)
	
	Now install `auto-complete` from within emacs with;  
	`M-x package-install <ret> auto-complete <ret>`  
	Also, install go-mode;  
	`M-x package-install <ret> go-mode <ret>`  

+ **copy go-autocomplete.el**  
   When you installed `gocode` in the first step, it installed go-autocomplete in your go workspace dir.  
   You should copy the go-autocomplete.el to a directory available in your emacs loadpath. A standard way of adding own stuff is to add a lisp directory inside your ~/.emacs.d    
  `$mkdir -p ~/.emacs.d/lisp`  
   then copy go-autocomplete into it;  
   `$ cp ~/your_go_workspace/src/github.com/nsf/gocode/emacs/go-autocomplete.el ~/.emacs.d/lisp/`  
   To add that directory to emacs loadpath, open up your ~/.emacs and add this line;  
   `(add-to-list 'load-path "~/.emacs.d/lisp/")`  
    
   Now add these lines to your ~/.emacs (load go-autocomplete);  
		`(require 'go-autocomplete)`  
		`(require 'auto-complete-config)`  
		`(ac-config-default)` 

Look here; https://github.com/nsf/gocode#emacs-setup  
<br>
Example of complete ~/.emacs;  

		(require 'package) ;; You might already have this line
		(add-to-list 'package-archives
		             '("melpa" . "https://melpa.org/packages/"))
		(when (< emacs-major-version 24)
		  ;; For important compatibility libraries like cl-lib
		  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
		(package-initialize) ;; You might already have this line
		
		(add-to-list 'load-path "~/.emacs.d/lisp/")
		
		(require 'go-autocomplete)
		(require 'auto-complete-config)
		(ac-config-default)





#other stuff  
You might also want to add hooks for building when saving and the go-oracle.  
<br>
<br>
Some other useful stuff;  

			go get -u -v github.com/nsf/gocode  
			go get -u -v github.com/rogpeppe/godef  
			go get -u -v github.com/golang/lint/golint  
			go get -u -v github.com/lukehoban/go-find-references  
			go get -u -v github.com/lukehoban/go-outline  
			go get -u -v sourcegraph.com/sqs/goreturns  
			go get -u -v golang.org/x/tools/cmd/gorename  

#line number and increasing font size  
**increase font size**  
from emacs 23 and above increasing font size is easy with this command inside emacs;
	`C-x C-+`  

**enable line numbers**  
1. turn it on or off with  `M-x global-linum-mode`  
2. or in your ~/emacs: `(global-linum-mode 't)`  


