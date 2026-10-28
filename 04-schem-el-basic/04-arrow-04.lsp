;/////// ************************************************************ //////////////////////////////////////////////////////////////////////////////
;/////// рисование проводника PE                                      //////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ //////////////////////////////////////////////////////////////////////////////
(defun 04-arrow-04

( / adoc angl pnt-2 pnt-3 pnt-drctn pnt-ins xpnt-drctn xpnt-ins ypnt-drctn ypnt-ins)

(setvar "textstyle" "standard")

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(setvar "cmdecho" 0)

(while (/= (setq pnt-ins (getpoint "\nУкажите точку вставки\n")) nil)
	(setq pnt-drctn		(getpoint "\nУкажите точку направления\n")
				xpnt-ins		(nth 0 pnt-ins)
				ypnt-ins		(nth 1 pnt-ins)
				xpnt-drctn	(nth 0 pnt-drctn)
				ypnt-drctn	(nth 1 pnt-drctn)
				angl				(atoi (angtos (angle pnt-ins pnt-drctn)))
	);setq
	
	(cond ;сравниваем значение angl 
		((and (<= angl 135) (>= angl 45)); вверх
			(setq pnt-2 (list xpnt-ins (+ ypnt-ins 3)) ; начало стрелки
						pnt-3 (list xpnt-ins (+ ypnt-ins 5)) 	; конец стрелки
				 );setq
			);=
	
		; влево
			((and (<= angl 225) (>= angl 135))
				(setq pnt-2 (list (- xpnt-ins 3) ypnt-ins) ; начало стрелки
							pnt-3 (list (- xpnt-ins 5) ypnt-ins) ; конец стрелки
				 );setq
			);=
	
		; dybp
			((and (<= angl 315) (>= angl 225)) ; третья четверть
				(setq pnt-2 (list xpnt-ins (- ypnt-ins 3)) ; начало стрелки
							pnt-3 (list xpnt-ins (- ypnt-ins 5)) ; конец стрелки
				);setq
			);=
			
			(
			 (setq pnt-2 (list (+ xpnt-ins 3) ypnt-ins); начало стрелки
						 pnt-3 (list (+ xpnt-ins 5) ypnt-ins) ; конец стрелки
				);setq
			);=
		);cond
	(setvar "osmode" 0)
	(setvar "CELWEIGHT" 60)
	(command "_line" pnt-ins pnt-2 "")
	(command "_line" pnt-2 pnt-3 "")
	(setvar "CELWEIGHT" -1)
	(setvar "osmode" 6199)
);while


(setvar "cmdecho" 1)
(setvar "osmode" 6199)
(vla-endundomark adoc)
(princ)
)

;/////// *************************************************************///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// КОНЕЦ ПРОГРАММЫ                                              ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// *************************************************************///////////////////////////////////////////////////////////////////////////////////////////////////////////