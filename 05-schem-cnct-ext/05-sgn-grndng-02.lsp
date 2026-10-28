;;; /////// рисование знака заземлени€ /////////////////////////////
(defun c:05-sgn-grndng-02

( / adoc angl crcl-1 line-1 line-2 line-3 line-4 name-blck pnt-angl pnt-drctn pnt-ins)

(setvar "osmode" 6199)
	
(vl-load-com)

(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));undo
	
(setq pnt-ins (getpoint "\n”кажите точку вставки\n")
			pnt-drctn (getpoint "\n”кажите точку направление\n")
			angl (atoi (angtos (angle pnt-ins pnt-drctn)))
			
			name-blck "ссвп-знак-заземлени€-02"
);setq

(setvar "osmode" 0)

(if (= (tblsearch "block" name-blck) nil)
	(progn														
		(setvar "osmode" 0)
		(command "_.circle" (list 0 -2.5) 2.5 "")
		(setq crcl-1 (entlast))
		(command "_.line" (list -2.5 -2.5) (list 2.5 -2.5) "")
		(setq line-1 (entlast))
		(command "_line" (list -1.5 -3.5) (list 1.5 -3.5) "")
		(setq line-2 (entlast))
		(command "_line" (list -0.5 -4.5) (list 0.5 -4.5) "")
		(setq line-3 (entlast))
		(command "_line" (list 0 0) (list 0 -2.5) "")
		(setq line-4 (entlast))
	
		(command "_block" name-blck '(0 0) crcl-1 line-1 line-2 line-3 line-4 "")	
	);progn
);if

(cond
	;вверх
	((and (<= angl 135) (>= angl 45)) (setq pnt-angl 180));=

	;влево
	((and (<= angl 225) (>= angl 135)) (setq pnt-angl 270));=

	;вниз
	((and (<= angl 315) (>= angl 225)) (setq pnt-angl 0));=
	
	;вправо
	( (setq pnt-angl 90));=
);while

(command "_insert" name-blck "_x" 1 "_y" 1 "_z" 1 "_r" pnt-angl pnt-ins)

(vla-endundomark adoc)
(setvar "osmode" 6199)
(gc)
(princ)
)
;;; //////////////////////////// конец программы /////////////////////////////