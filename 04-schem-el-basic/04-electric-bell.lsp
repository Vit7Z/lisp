
;///////////////// рисование уго - звонок электрический //////////////////////////
(defun c:04-electric-bell

( / adoc arc-1 line-1 line-2 line-3 name-blck pnt-ins)

(setq name-blck "звонок-электрический-спэ");setq

(setvar "cmdecho" 0)

(vl-load-com)

(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(if	(= (tblsearch "block" name-blck) nil)
  (progn
    (setvar "osmode" 0)
    (setvar	"CLAYER" "0")
    
    (command "_line" '(0 0) '(0 2) "")
    (setq line-1 (entlast))
    
    (command "_line" '(4 0) '(4 2) "")
    (setq line-2 (entlast))
    
    (command "_line" '(-2 2) '(6 2) "")
    (setq line-3 (entlast))
        
    (command "_arc" '(-2 2) '(2 6) '(6 2)  "")
    (setq arc-1 (entlast)) 
    
    (command "_block" name-blck '(0 0) line-1 line-2 line-3 arc-1 "");command
  );progn
);if

(setvar "osmode" 6199)

(setq	pnt-ins (getpoint "\nУкажите точку вставки\n"));setq

(setvar "osmode" 0)

(command "_insert" name-blck "_x" 1 "_y" 1 "_z" 1 "_r" 0 pnt-ins)

(vla-endundomark adoc)
(setvar "cmdecho" 1)
(setvar "osmode" 6199)
(setvar "orthomode" 1)
(gc)
(princ)
)
;/////////////////////// конец программы //////////////////////////////////////////////////////////////////////

