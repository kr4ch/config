(setq inhibit-startup-screen t)

(load-theme 'tango-dark t)

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
)

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
  (setq desktop-path (list "~/proj"))
  (desktop-save-mode 1);; is x window
  ())
;; Add variables to desktop saving
(add-to-list 'desktop-globals-to-save 'register-alist)


(setq vhdl-basic-offset 2)


(global-set-key (kbd "M-p") 'ace-window)

;; Multiple-Cursors:
(global-set-key (kbd "C-c m c") 'mc/edit-lines)


