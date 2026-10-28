;/////// ************************************************************ //////////////////////////////////////////////////////////////////////////////
;/////// рисование проводника PE                                      //////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ //////////////////////////////////////////////////////////////////////////////

(defun 04-arrow-02

( / adoc angl angl-txt lngth-arrow lngth-ln-h lngth-ln-v pnt-2 pnt-3 pnt-drctn pnt-ins pnt-ins-txt xpnt-drctn xpnt-ins ypnt-drctn ypnt-ins)

(setvar "textstyle" "standard")

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(setvar "cmdecho" 0)

(setq	pnt-ins			(getpoint "\nУкажите точку вставки\n")
			pnt-drctn		(getpoint "\nУкажите точку направления\n")
			xpnt-ins		(nth 0 pnt-ins)
			ypnt-ins		(nth 1 pnt-ins)
			xpnt-drctn	(nth 0 pnt-drctn)
			ypnt-drctn	(nth 1 pnt-drctn)
			lngth-ln-v	6
			lngth-ln-h	6
			lngth-arrow	3
			angl				(atoi (angtos (angle pnt-ins pnt-drctn)))
);end setq

(cond ;сравниваем значение angl 
  ((and (<= angl 135) (>= angl 45)); вверх
    (progn
      (setq pnt-2			 (list xpnt-ins (+ ypnt-ins lngth-ln-v)) ; начало стрелки
						pnt-3			 (list xpnt-ins (+ ypnt-ins (+ lngth-ln-v lngth-arrow))) 	; конец стрелки
						pnt-ins-txt (list xpnt-ins (+ ypnt-ins 1)) 	; точка вставки текста
						angl-txt		 90
			 );end setq
		 );end progn 
		);end условия

	; влево
		((and (<= angl 225) (>= angl 135))
		 (progn
			 (setq pnt-2 (list (- xpnt-ins lngth-ln-h) (- ypnt-ins 0)) ; начало стрелки
						 pnt-3 (list (- xpnt-ins (+ lngth-ln-h lngth-arrow)) (- ypnt-ins 0)) ; конец стрелки
						 pnt-ins-txt (list (- xpnt-ins (- lngth-ln-h 1)) (- ypnt-ins 0)) ; точка вставки текста
						 angl-txt 0
			 );end setq
		 );end progn
		);end условия

	; dybp
		((and (<= angl 315) (>= angl 225)) ; третья четверть
		 (progn
			 (setq pnt-2 (list xpnt-ins (- ypnt-ins lngth-ln-v)) ; начало стрелки
						 pnt-3 (list xpnt-ins (- ypnt-ins (+ lngth-ln-v lngth-arrow))) ; конец стрелки
						 pnt-ins-txt (list xpnt-ins (- ypnt-ins (- lngth-ln-v 1))) ; точка вставки текста
						 angl-txt		 90
			 );end setq
		 );end progn
		);end условия
	;	
		(progn
		 (setq pnt-2 (list (+ xpnt-ins lngth-ln-h) (- ypnt-ins 0)); начало стрелки
					 pnt-3 (list (+ xpnt-ins (+ lngth-ln-h lngth-arrow)) (- ypnt-ins 0)) ; конец стрелки
           pnt-ins-txt (list (+ xpnt-ins 1) (- ypnt-ins 0)) ; точка вставки текста
					 angl-txt		 0
		 );end setq
		);end progn
	) ;end cond
(setvar "osmode" 0)
; рисуем
(command "_pline" pnt-ins "_w" 0 0 pnt-2 "_w" 1.5 0 pnt-3 "")
(command "_text" "_bl" pnt-ins-txt 2.5 angl-txt "PE")

(setvar "cmdecho" 1)
(vla-endundomark adoc)

(setvar "osmode" 6199)
(princ)
)

;/////// *************************************************************///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// КОНЕЦ ПРОГРАММЫ                                              ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// *************************************************************///////////////////////////////////////////////////////////////////////////////////////////////////////////