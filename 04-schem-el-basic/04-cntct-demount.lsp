
;///////////////// рисование соединения контактного для спэ схем управления //////////////////////////
(defun c:04-cntct-demount

( / circle-1 line-1 pnt-ins xpnt-ins ypnt-ins)

(command "_.undo" "_begin")

(setvar "osmode" 0)
(setvar "cmdecho" 0)

(setq name-blck "клемма-разборн-спэ");setq

(if	(= (tblsearch "block" name-blck) nil)
  (progn
    (setvar "osmode" 0)
    (command "_line" '(-0.75 -0.75) '(0.75 0.75) "")
    (setq line-1 (entlast))
    (command "_circle" '(0 0) 0.75 "")
    (setq circle-1 (entlast))

		(command "_block" name-blck '(0 0) line-1 circle-1 "");command
  );progn
);if
(setvar "osmode" 6199)

(while (/= (setq pnt-ins (getpoint "\nУкажите точку вставки\n")) nil)
	(setq xpnt-ins (- (nth 0 pnt-ins) 0.75)
      	ypnt-ins (nth 1 pnt-ins)
      	pnt-ins (list xpnt-ins ypnt-ins)
	);setq
	(setvar "osmode" 0)
	(command "_insert" name-blck "_x" 1 "_y" 1 "_z" 1 "_r" 0 pnt-ins)
	(setvar "osmode" 6199)
);while

(setvar "orthomode" 1)
(setvar "cmdecho" 1)
(command "_.undo" "_end")
(princ)
)
;/////////////////////// конец программы //////////////////////////////////////////////////////////////////////
