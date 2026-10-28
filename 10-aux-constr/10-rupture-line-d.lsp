;/////// ************************************************************ //////////////////////////////////////////////////////////////////
;/////// рисование линии разрыва двойной                              //////////////////////////////////////////////////////////////////
;/////// ************************************************************ //////////////////////////////////////////////////////////////////
(defun c:10-rupture-line-d

( / adoc angl-blck angl-lin1 angl-lin2 line-1 line-2 line-3 pi pnt-1 pnt-2 pnt-31 pnt-32 pnt-41 pnt-42)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object)))); start undo

(setvar "cmdecho" 1)
(setvar "osmode" 6199)
(setvar "auprec" 7)

(command "_layer" "”становить" "0" "")

(setvar "osmode" 0)
(if (= (tblsearch "block" "лин-разрыв-вар-1" ) nil)
	(progn				;если данного блока нет
		(command "_line" '(-1 0) '(-0.5 -1) "")
		(setq line-1 (entlast))
		(command "_line" '(-0.5 -1) '(0.5 1) "")
		(setq line-2 (entlast))
		(command "_line" '(0.5 1) '(1 0) "")
		(setq line-3 (entlast))
		(command "_block" "лин-разрыв-вар-1" '(0 0) line-1 line-2 line-3 "")
	); end progn
); end if

(setvar "osmode" 6199)
(setq pnt-1 (getpoint "\n”кажите точку 1\n")
      pnt-2 (getpoint "\n”кажите точку 2\n")
);setq

(setvar "osmode" 0)

(setq angl-blck (angtos (angle pnt-1 pnt-2))
      angl-blck (+ (atof angl-blck) 90)
      pi 3.1415926535     
);setq

(setq angl-lin1 (+ (angle pnt-1 pnt-2) (* 0.5 pi));углы дл€ линий
      angl-lin2 (+ (angle pnt-1 pnt-2) (* 1.5 pi))      
);setq

(setq pnt-31 (polar pnt-1 angl-lin1 1);точки первой пары линий
      pnt-41 (polar pnt-1 angl-lin1 3)
      pnt-32 (polar pnt-1 angl-lin2 1);точки второй пары линий
      pnt-42 (polar pnt-1 angl-lin2 3)
);setq

(command "_insert" "лин-разрыв-вар-1" "_X" 1 "_Y" 1 "_Z" 1 "_R" angl-blck pnt-1)
(command "_.line" pnt-31 pnt-41 "")
(command "_.line" pnt-32 pnt-42 "")

(setq pnt-1 (polar pnt-1 (angle pnt-1 pnt-2) 2)
      pnt-31 (polar pnt-1 angl-lin1 1);точки первой пары линий
      pnt-41 (polar pnt-1 angl-lin1 3)
      pnt-32 (polar pnt-1 angl-lin2 1);точки второй пары линий
      pnt-42 (polar pnt-1 angl-lin2 3)
);setq

(command "_insert" "лин-разрыв-вар-1" "_X" 1 "_Y" 1 "_Z" 1 "_R" angl-blck pnt-1)
(command "_.line" pnt-31 pnt-41 "")
(command "_.line" pnt-32 pnt-42 "")

(command "_.trim" "" )

(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(vla-endundomark adoc)
(princ)
)
;/////// конец программы ///////