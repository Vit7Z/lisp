;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// резистор                                                     ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun c:04-resistance

( / adoc angl angl-blck pnt-1 pnt-drct rctn-1 xpnt-1 xpnt-drct ypnt-1 ypnt-drct)

(setvar "cmdecho" 0)
(setvar "textstyle" "standard")

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));undo

(if	(= (tblsearch "block" "резистор-спэ") nil);создаем блок
  (progn
    (setvar "osmode" 0)
    (setvar	"CLAYER" "0")
    (command "_RECTANGLE" '(0 2) '(10 -2))
		(setq rctn-1 (entlast))
		(command "_block" "резистор-спэ" '(0 0) rctn-1 "");command
  );progn
);if

(while (/= (setq pnt-1 (getpoint "\n”кажите начальную точку\n")) nil)

	(setq pnt-drct (getpoint "\n”кажите направление\n")
				angl (atoi (angtos (angle pnt-1 pnt-drct)))
	);setq
	
	;вставл€ем диод
	(if (and (<= angl 135) (>= angl 45)) ;вверх
		(setq angl-blck 270);setq
	);if
	
	(if (and (<= angl 315) (>= angl 225)) ;вниз
		(setq angl-blck 90);setq
	);if
	
	(if (or (>= angl 315) (<= angl 45))
		(setq angl-blck 180);setq
	);if

	(if (and (>= angl 135) (<= angl 225))
		(setq angl-blck 0);setq
	);if
	(setvar "osmode" 6199)

	(command "_insert" "резистор-спэ" "_X" 1 "_Y" 1 "_Z" 1 "_R" angl-blck pnt-1)
);while

(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(vla-endundomark adoc)
(princ)
)
;/////// конец программы ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

