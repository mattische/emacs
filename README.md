_OOPS!!!_
This is kinda obselete now - im running emacs live.
Remember - emacs-live does not play well with emacs-snapshot. Use 24.5 (or 25) instead.
- http://overtone.github.io/emacs-live/
  https://github.com/overtone/emacs-live
- http://learnlispthehardway.org/book/1-01-09-emacs-live/#set-up-and-learn-emacs-live



### Installing

If not using the *broscript*, beware to put aside your `~/.emacs.d and /.emacs`.
Create `~/.emacs-live`
Your stuff lives in `~/.live-packs/username-pack/`
In there you'll find init.el (to be used in conjunction with ~/.emacs-live).
i.e if your using ox-reveal with org-mode, load package archives in ~/.emacs-live (or, ~/.emacs.d/init.el);

```bash
(require 'package)
(add-to-list 'package-archives    
			'("marmalade" . "https://marmalade.org/packages/") t) 
(add-to-list 'package-archives    
			'("melpa" . "https://melpa.org/packages/")) 
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
;; load packages installed with package managers
(package-initialize)

;;create this directory
(live-append-packs '(~/.live-packs/yourUsername-pack))
```


### org-mode and org-reveal

**org-mode with emacs-live**
see http://jr0cket.co.uk/2013/08/configure-emacs-org-mode-to-manage-your-tasks.html.html for instructions where to put your org file and notes file (and where to add emacs config data for it).

In short, create this file;
`~/.live-packs/you-username/config/org-mode.el`
inside it, tell where your notes/org file lives. For example;
`(setq org-default-notes-file "~/my-org-files/my-todo-list.org")`

Now, add this `(live-load-config-file "org-mode.el")` to `~/.live-packs/yourUsername/init.el` 

Start adding notes and todos with `M-x org-capture`. Select default template t.




**org-reveal**
Download ox-reveal from https://github.com/yjwen/org-reveal
Place it in lib folder in ~/.live-packs/username-pack/lib/ox-reveal
Load it in ~/live-packs/mattische-pack/init.el;
```
(live-add-pack-lib "ox-reveal")
(require 'ox-reveal)
```
Either download reveal.js, and invoke it, or set the path to it in every .org-file with;

`#+REVEAL_ROOT: http://cdn.jsdelivr.net/reveal.js/3.0.0/`

and perhaps a title;

`#+TITLE: my title` 


### Windows
_On windows I had to use version >25._
Your home folder is:
`C:\Users\your-username\AppData\Roaming`

place emacs inside that folder (makes life a little easier).
Place package archives in `~/.emacs.d/init.el` rather than ~/.emacs-live.el.


---



# Contents  
+ <a href="https://github.com/mattische/emacs/blob/master/README.md#get-latest-version-of-emacs-snapshot-on-ubuntu">get emacs snapshot for ubuntu</a> 
+ <a href="https://github.com/mattische/emacs/blob/master/README.md#go-autocomplete-in-emacs24-nox-ubuntu">emacs + go == true</a>
+ <a href="https://github.com/mattische/emacs/blob/master/README.md#other-stuff">go stuff for emacs</a>
+ <a href="https://github.com/mattische/emacs/blob/master/README.md#line-number-and-increasing-font-size">Other emacs stuff (font size, line numbering etc)</a>

_if on windows, rememeber, your .emacs and .emacs.d resides in c:\Users\username\AppData\Roaming_

```bash
(require 'package)
		(add-to-list 'package-archives    
			'("melpa" . "https://melpa.org/packages/"))    
		(when (< emacs-major-version 24)  
			;; For important compatibility libraries like cl-lib  
			(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))    
		(package-initialize)

```

### get latest version of emacs (snapshot) on ubuntu  

Get the latest version (snapshot) of emacs by adding elisp repo:  
	`$ sudo add-apt-repository -y ppa:ubuntu-elisp`  
	`$ sudo apt-get update`  
	`$ sudo apt-get install emacs-snapshot-nox`

The process of enabling go support in emacs snapshot, should be the same as for older versions (follow instrunctions below i.e)  
<br>
<br>

### go-autocomplete in emacs24-nox (ubuntu)
+ **go-code**  
   It is assumed that you have a working go environment, including GOPATH. Also, we need `gocode` - follow url below.    
   For the curious - see setup for GOPATH and gocode here; https://github.com/nsf/gocode#setup  
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
	
	Now install `auto-complete` from within emacs;  
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

	Now you're good to go!


### other stuff  
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

### line number and increasing font size  
**increase font size**  
from emacs 23 and above increasing font size is easy with this command inside emacs;
	`C-x C-+`  
decrease with;
	`C-x C--`  
	
Or in emacs; `M-x text-scale-increase` and `M-x text-scale-decrase` respectivley.   


**enable line numbers**  
1. turn it on or off with  `M-x global-linum-mode`  
2. or in your ~/emacs: `(global-linum-mode 't)`  


**Smart paranthesis, brackets and curly braces**  
Check ot this repo: https://github.com/Fuco1/smartparens


