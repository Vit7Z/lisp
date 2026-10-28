;;; /////// рисование знака заземлени€ /////////////////////////////
(defun c:05-sgn-grndng-01

( / crcl-1 line-1 line-2 line-3 line-4 line-5 name-blck pnt-ins x-pnt-ins y-pnt-ins)

(setvar "osmode" 6199)
(setvar "cmdecho" 0)
	
(vl-load-com)

(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));undo
	
(setq pnt-ins (getpoint "\n”кажите точку вставки\n")
			name-blck "ссвп-знак-заземлени€-01"
);setq

(setvar "osmode" 0)

(if (= (tblsearch "block" name-blck) nil)
	(progn														
		(setvar "osmode" 0)
		(command "_.circle" (list 0.5 1) 0.5 "")
		(setq crcl-1 (entlast))
		(command "_.line" (list 1 1) (list 4.5 1) "")
		(setq line-1 (entlast))
		(command "_line" (list 4.5 1) (list 4.5 -6) "")
		(setq line-2 (entlast))
		(command "_line" (list 2 -6) (list 7 -6) "")
		(setq line-3 (entlast))
		(command "_line" (list 3 -7) (list 6 -7) "")
		(setq line-4 (entlast))
		(command "_line" (list 4 -8) (list 5 -8) "")
		(setq line-5 (entlast))
		(command "_block" name-blck '(0 0) crcl-1 line-1 line-2 line-3 line-4 line-5 "")	
	);progn
);if

(command "_insert" name-blck "_x" 1 "_y" 1 "_z" 1 "_r" 0 pnt-ins)

(vla-endundomark adoc)
(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(princ)
)
;;; //////////////////////////// конец программы /////////////////////////////