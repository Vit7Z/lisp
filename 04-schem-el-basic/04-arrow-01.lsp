;/////// ************************************************************ //////////////////////////////////////////////////////////////////////////////
;/////// стрелки                                                      //////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ //////////////////////////////////////////////////////////////////////////////
(defun 04-arrow-01

(lngth-ln / angl angl-txt lngth-arrow pnt-2 pnt-3 pnt-drctn pnt-ins pnt-ins-txt xpnt-drctn xpnt-ins ypnt-drctn ypnt-ins)

(setvar "cmdecho" 0)
 
(setvar "textstyle" "standard")

(setvar "osmode" 6199)

(while (/= (setq pnt-ins (getpoint "\nУкажите точку вставки\n")) nil)
	(setq pnt-drctn (getpoint "\nУкажите точку направления\n")
				xpnt-ins (nth 0 pnt-ins)
				ypnt-ins (nth 1 pnt-ins)
				xpnt-drctn (nth 0 pnt-drctn)
				ypnt-drctn (nth 1 pnt-drctn)
				lngth-arrow	3
				angl (atoi (angtos (angle pnt-ins pnt-drctn))) 
	);setq

	(cond ;сравниваем значение angl 
	; вверх
		((and (<= angl 135) (>= angl 45))
		 (progn
			 (setq pnt-2			 (list xpnt-ins (+ ypnt-ins lngth-ln)) ; начало стрелки
						 pnt-3			 (list xpnt-ins (+ ypnt-ins (+ lngth-ln lngth-arrow))) 	; конец стрелки
						 pnt-ins-txt (list xpnt-ins (+ ypnt-ins 1)) 	; точка вставки текста
						 angl-txt 90
				);setq
			);progn 
		);=

	;влево
		((and (<= angl 225) (>= angl 135))
		 (progn
			 (setq pnt-2 (list (- xpnt-ins lngth-ln) (- ypnt-ins 0)) ; начало стрелки
						 pnt-3 (list (- xpnt-ins (+ lngth-ln lngth-arrow)) (- ypnt-ins 0)) ; конец стрелки
						 pnt-ins-txt (list (- xpnt-ins (- lngth-ln 1)) (- ypnt-ins 0)) ; точка вставки текста
						 angl-txt 0
				);setq
			);progn 
		);=

	;вниз
		((and (<= angl 315) (>= angl 225)) ; третья четверть
		 (progn
			 (setq pnt-2 (list xpnt-ins (- ypnt-ins lngth-ln)) ; начало стрелки
						 pnt-3 (list xpnt-ins (- ypnt-ins (+ lngth-ln lngth-arrow))) ; конец стрелки
						 pnt-ins-txt (list xpnt-ins (- ypnt-ins (- lngth-ln 1))) ; точка вставки текста
						 angl-txt 90
				);setq
			);progn 
		);=
		
		;вправо
		(progn
		 (setq pnt-2 (list (+ xpnt-ins lngth-ln) (- ypnt-ins 0)); начало стрелки
					 pnt-3 (list (+ xpnt-ins (+ lngth-ln lngth-arrow)) (- ypnt-ins 0)) ; конец стрелки
           pnt-ins-txt (list (+ xpnt-ins 1) (- ypnt-ins 0)) ; точка вставки текста
					 angl-txt 0
				);setq
			);progn 
		);=

	(setvar "osmode" 0)
	(command "_pline" pnt-ins "_w" 0 0 pnt-2 "_w" 1.5 0 pnt-3 "")
	(command "_text" "_bl" pnt-ins-txt 2.5 angl-txt "*****")

	(setvar "osmode" 6199)
);while

(setvar "cmdecho" 1)

(princ)
)

;/////// *************************************************************///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// КОНЕЦ ПРОГРАММЫ                                              ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// *************************************************************///////////////////////////////////////////////////////////////////////////////////////////////////////////
