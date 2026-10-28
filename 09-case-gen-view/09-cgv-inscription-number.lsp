;///////////////////////////////////// номер надписи в рамке         ///////
;///////////////////////////////////////////////////////////////////////////
(defun 09-cgv-inscription-number

( / adoc pnt-1 pnt-drct xpnt-1 xpnt-drct ypnt-1 ypnt-drct)

(setvar "cmdecho" 0)
(setvar "textsize" 2.5)
(setvar "textstyle" "standard")

(vl-load-com)

(vla-startundomark
  (setq adoc (vla-get-activedocument (vlax-get-acad-object)))
);start undo

(while (/= (setq pnt-1 (getpoint "\n”кажите точку\n")))
	(setq xpnt-1 (nth 0 pnt-1)
				ypnt-1 (nth 1 pnt-1)
				pnt-drct (getpoint "\n”кажите направление\n")
				xpnt-drct (nth 0 pnt-drct)
				ypnt-drct (nth 1 pnt-drct)
	);setq
	
	(cond
		((< ypnt-1 ypnt-drct);вверх
			(progn
				(setvar "osmode" 0)
  			(command "_rectangle" (list (- xpnt-1 2.5) (+ ypnt-1 3)) (list (+ xpnt-1 2.5) ypnt-1))
  			(command "_text" "_mc" (list xpnt-1 (+ ypnt-1 1.5)) 2.5 0 "***")
  			(setvar "osmode" 6199)
			);progn
		);=
		((> ypnt-1 ypnt-drct);вверх
			(progn
				(setvar "osmode" 0)
  			(command "_rectangle" (list (- xpnt-1 2.5) ypnt-1) (list (+ xpnt-1 2.5) (- ypnt-1 3)))
  			(command "_text" "_mc" (list xpnt-1 (- ypnt-1 1.5)) 2.5 0 "***")
  			(setvar "osmode" 6199)
			);progn
		);=
	);cond


	(setvar "osmode" 6199)
);while

(vla-endundomark adoc)

(setvar "cmdecho" 1)

(princ)
)
;/////////////////////////////////////////////// конец программы /////////////////////////////////////////////////////////////
