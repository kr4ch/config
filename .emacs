(setq inhibit-startup-screen t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(custom-enabled-themes (quote (tango-dark)))
 '(font-use-system-font t)
 '(tool-bar-mode nil)
 '(vhdl-compiler "ModelSim")
 '(vhdl-compiler-alist
   (quote
    (("ADVance MS" "vacom" "-work \\1" "make" "-f \\1" nil "valib \\1; vamap \\2 \\1" "./" "work/" "Makefile" "adms"
      ("^\\s-+\\([0-9]+\\):\\s-+" nil 1 nil)
      ("^Compiling file \\(.+\\)" 1)
      ("ENTI/\\1.vif" "ARCH/\\1-\\2.vif" "CONF/\\1.vif" "PACK/\\1.vif" "BODY/\\1.vif" upcase))
     ("Aldec" "vcom" "-work \\1" "make" "-f \\1" nil "vlib \\1; vmap \\2 \\1" "./" "work/" "Makefile" "aldec"
      ("^.* ERROR [^:]+: \".*\" \"\\([^ 	
]+\\)\" \\([0-9]+\\) \\([0-9]+\\)" 1 2 3)
      ("" 0)
      nil)
     ("Cadence Leapfrog" "cv" "-work \\1 -file" "make" "-f \\1" nil "mkdir \\1" "./" "work/" "Makefile" "leapfrog"
      ("^duluth: \\*E,[0-9]+ (\\([^ 	
]+\\),\\([0-9]+\\)):" 1 2 nil)
      ("" 0)
      ("\\1/entity" "\\2/\\1" "\\1/configuration" "\\1/package" "\\1/body" downcase))
     ("Cadence NC" "ncvhdl" "-work \\1" "make" "-f \\1" nil "mkdir \\1" "./" "work/" "Makefile" "ncvhdl"
      ("^ncvhdl_p: \\*E,\\w+ (\\([^ 	
]+\\),\\([0-9]+\\)|\\([0-9]+\\)):" 1 2 3)
      ("" 0)
      ("\\1/entity/pc.db" "\\2/\\1/pc.db" "\\1/configuration/pc.db" "\\1/package/pc.db" "\\1/body/pc.db" downcase))
     ("GHDL" "ghdl" "-i --workdir=\\1 --ieee=synopsys -fexplicit " "make" "-f \\1" nil "mkdir \\1" "./" "work/" "Makefile" "ghdl"
      ("^ghdl_p: \\*E,\\w+ (\\([^ 	
]+\\),\\([0-9]+\\)|\\([0-9]+\\)):" 1 2 3)
      ("" 0)
      ("\\1/entity" "\\2/\\1" "\\1/configuration" "\\1/package" "\\1/body" downcase))
     ("IBM Compiler" "g2tvc" "-src" "precomp" "\\1" nil "mkdir \\1" "./" "work/" "Makefile" "ibm"
      ("^[0-9]+ COACHDL.*: File: \\([^ 	
]+\\), *line.column: \\([0-9]+\\).\\([0-9]+\\)" 1 2 3)
      (" " 0)
      nil)
     ("Ikos" "analyze" "-l \\1" "make" "-f \\1" nil "mkdir \\1" "./" "work/" "Makefile" "ikos"
      ("^E L\\([0-9]+\\)/C\\([0-9]+\\):" nil 1 2)
      ("^analyze +\\(.+ +\\)*\\(.+\\)$" 2)
      nil)
     ("ModelSim" "vcom" "-2008 -work \\1 -modelsimini /home/tobias/Projekte/09_ZI_RTSC/hdl/julier_eval_1.0/julier_eval_testing/simlib/modelsim.ini" "make" "-f \\1" nil "vlib \\1; vmap \\2 \\1" "./" "work/" "Makefile" "modelsim"
      ("^\\(ERROR\\|WARNING\\|\\*\\* Error\\|\\*\\* Warning\\)[^:]*:\\( *[[0-9]+]\\)? \\([^ 	
]+\\)(\\([0-9]+\\)):" 3 4 nil)
      ("" 0)
      ("\\1/_primary.dat" "\\2/\\1.dat" "\\1/_primary.dat" "\\1/_primary.dat" "\\1/body.dat" downcase))
     ("LEDA ProVHDL" "provhdl" "-w \\1 -f" "make" "-f \\1" nil "mkdir \\1" "./" "work/" "Makefile" "provhdl"
      ("^\\([^ 	
:]+\\):\\([0-9]+\\): " 1 2 nil)
      ("" 0)
      ("ENTI/\\1.vif" "ARCH/\\1-\\2.vif" "CONF/\\1.vif" "PACK/\\1.vif" "BODY/BODY-\\1.vif" upcase))
     ("Quartus" "make" "-work \\1" "make" "-f \\1" nil "mkdir \\1" "./" "work/" "Makefile" "quartus"
      ("^\\(Error\\|Warning\\): .* \\([^ 	
]+\\)(\\([0-9]+\\))" 2 3 nil)
      ("" 0)
      nil)
     ("QuickHDL" "qvhcom" "-work \\1" "make" "-f \\1" nil "mkdir \\1" "./" "work/" "Makefile" "quickhdl"
      ("^\\(ERROR\\|WARNING\\)[^:]*: \\([^ 	
]+\\)(\\([0-9]+\\)):" 2 3 nil)
      ("" 0)
      ("\\1/_primary.dat" "\\2/\\1.dat" "\\1/_primary.dat" "\\1/_primary.dat" "\\1/body.dat" downcase))
     ("Savant" "scram" "-publish-cc -design-library-name \\1" "make" "-f \\1" nil "mkdir \\1" "./" "work._savant_lib/" "Makefile" "savant"
      ("^\\([^ 	
:]+\\):\\([0-9]+\\): " 1 2 nil)
      ("" 0)
      ("\\1_entity.vhdl" "\\2_secondary_units._savant_lib/\\2_\\1.vhdl" "\\1_config.vhdl" "\\1_package.vhdl" "\\1_secondary_units._savant_lib/\\1_package_body.vhdl" downcase))
     ("Simili" "vhdlp" "-work \\1" "make" "-f \\1" nil "mkdir \\1" "./" "work/" "Makefile" "simili"
      ("^\\(Error\\|Warning\\): \\w+: \\([^ 	
]+\\): (line \\([0-9]+\\)): " 2 3 nil)
      ("" 0)
      ("\\1/prim.var" "\\2/_\\1.var" "\\1/prim.var" "\\1/prim.var" "\\1/_body.var" downcase))
     ("Speedwave" "analyze" "-libfile vsslib.ini -src" "make" "-f \\1" nil "mkdir \\1" "./" "work/" "Makefile" "speedwave"
      ("^ *ERROR[[0-9]+]::File \\([^ 	
]+\\) Line \\([0-9]+\\):" 1 2 nil)
      ("" 0)
      nil)
     ("Synopsys" "vhdlan" "-nc -work \\1" "make" "-f \\1" nil "mkdir \\1" "./" "work/" "Makefile" "synopsys"
      ("^\\*\\*Error: vhdlan,[0-9]+ \\([^ 	
]+\\)(\\([0-9]+\\)):" 1 2 nil)
      ("" 0)
      ("\\1.sim" "\\2__\\1.sim" "\\1.sim" "\\1.sim" "\\1__.sim" upcase))
     ("Synopsys Design Compiler" "vhdlan" "-nc -spc -work \\1" "make" "-f \\1" nil "mkdir \\1" "./" "work/" "Makefile" "synopsys_dc"
      ("^\\*\\*Error: vhdlan,[0-9]+ \\([^ 	
]+\\)(\\([0-9]+\\)):" 1 2 nil)
      ("" 0)
      ("\\1.syn" "\\2__\\1.syn" "\\1.syn" "\\1.syn" "\\1__.syn" upcase))
     ("Synplify" "n/a" "n/a" "make" "-f \\1" nil "mkdir \\1" "./" "work/" "Makefile" "synplify"
      ("^@[EWN]:\"\\([^ 	
]+\\)\":\\([0-9]+\\):\\([0-9]+\\):" 1 2 3)
      ("" 0)
      nil)
     ("Vantage" "analyze" "-libfile vsslib.ini -src" "make" "-f \\1" nil "mkdir \\1" "./" "work/" "Makefile" "vantage"
      ("^\\*\\*Error: LINE \\([0-9]+\\) \\*\\*\\*" nil 1 nil)
      ("^ *Compiling \"\\(.+\\)\" " 1)
      nil)
     ("VeriBest" "vc" "vhdl" "make" "-f \\1" nil "mkdir \\1" "./" "work/" "Makefile" "veribest"
      ("^ +\\([0-9]+\\): +[^ ]" nil 1 nil)
      ("" 0)
      nil)
     ("Viewlogic" "analyze" "-libfile vsslib.ini -src" "make" "-f \\1" nil "mkdir \\1" "./" "work/" "Makefile" "viewlogic"
      ("^\\*\\*Error: LINE \\([0-9]+\\) \\*\\*\\*" nil 1 nil)
      ("^ *Compiling \"\\(.+\\)\" " 1)
      nil)
     ("Xilinx XST" "xflow" "" "make" "-f \\1" nil "mkdir \\1" "./" "work/" "Makefile" "xilinx"
      ("^ERROR:HDLParsers:[0-9]+ - \"\\([^ 	
]+\\)\" Line \\([0-9]+\\)." 1 2 nil)
      ("" 0)
      nil))))
 '(vhdl-index-menu nil)
 '(vhdl-model-alist
   (quote
    (("seq_proc_no_reset" "<label> : process (<clock>)
begin<cursor>
  if rising_edge(<clock>) then
    if <enable> = '1' then  -- synchronous load
     
    end if;
  end if;
end process <label>;" "e" "seqproc"))))
 '(vhdl-source-file-menu t)
;; '(vhdl-speedbar-auto-open t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "DejaVu Sans Mono" :foundry "PfEd" :slant normal :weight normal :height 91 :width normal)))))

(defun toggle-window-split ()
  (interactive)
  (if (= (count-windows) 2)
      (let* ((this-win-buffer (window-buffer))
         (next-win-buffer (window-buffer (next-window)))
         (this-win-edges (window-edges (selected-window)))
         (next-win-edges (window-edges (next-window)))
         (this-win-2nd (not (and (<= (car this-win-edges)
                     (car next-win-edges))
                     (<= (cadr this-win-edges)
                     (cadr next-win-edges)))))
         (splitter
          (if (= (car this-win-edges)
             (car (window-edges (next-window))))
          'split-window-horizontally
        'split-window-vertically)))
    (delete-other-windows)
    (let ((first-win (selected-window)))
      (funcall splitter)
      (if this-win-2nd (other-window 1))
      (set-window-buffer (selected-window) this-win-buffer)
      (set-window-buffer (next-window) next-win-buffer)
      (select-window first-win)
      (if this-win-2nd (other-window 1))))))

(global-set-key (kbd "C-x |") 'toggle-window-split)
(global-set-key (kbd "C-x <up>") 'windmove-up)
(global-set-key (kbd "C-x <down>") 'windmove-down)
(global-set-key (kbd "C-x <right>") 'windmove-right)
(global-set-key (kbd "C-x <left>") 'windmove-left)


(require 'package) ;; You might already have this line
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (url (concat (if no-ssl "http" "https") "://melpa.org/packages/")))
  (add-to-list 'package-archives (cons "melpa" url) t))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) ;; You might already have this line

(add-to-list 'load-path "~/.emacs.d/emacs-git-gutter/")
(load "git-gutter")
(global-git-gutter-mode +1)
(git-gutter:linum-setup)

(require 'linum)
(global-linum-mode +1)

(require 'neotree)
(global-set-key [f8] 'neotree-toggle)

(global-set-key (kbd "C-x C-g") 'git-gutter)
(global-set-key (kbd "C-x v =") 'git-gutter:popup-hunk)

;; Jump to next/previous hunk
(global-set-key (kbd "C-x p") 'git-gutter:previous-hunk)
(global-set-key (kbd "C-x n") 'git-gutter:next-hunk)

;; Stage current hunk
(global-set-key (kbd "C-x v s") 'git-gutter:stage-hunk)

;; Revert current hunk
(global-set-key (kbd "C-x v r") 'git-gutter:revert-hunk)

;; Mark current hunk
(global-set-key (kbd "C-x v SPC") #'git-gutter:mark-hunk)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Save Windows and registers
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; don't use desktop mode for terminal
(when (display-graphic-p)
  (setq desktop-path (list "~/zhaw"))
  (desktop-save-mode 1);; is x window
  ())
;; Add variables to desktop saving
(add-to-list 'desktop-globals-to-save 'register-alist)


(setq vhdl-basic-offset 2)


(global-set-key (kbd "M-p") 'ace-window)

;; Multiple-Cursors:
(global-set-key (kbd "C-c m c") 'mc/edit-lines)


