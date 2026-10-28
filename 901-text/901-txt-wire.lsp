;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////////////////////////////////// рисование текста однострочного около точки ///////////////////////////////////////////////////////////////////////////////////////////////
;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun c:901-txt-wire

( / angl angl-txt crnt-color justify_text lngth-ln-h lngth-ln-v pnt-drctn pnt-ins pnt-ins-txt txt xpnt-ins ypnt-ins)

(setvar "cmdecho" 0)
(setvar "osmode" 6199)
(setvar "textstyle" "standard")
(command "_.undo" "_begin")
(setq crnt-color (getvar "cecolor"))

(while (/= (setq pnt-ins (getpoint "\nУкажите точку вставки\n")) nil)

  (setq	pnt-drctn		(getpoint "\nУкажите точку направления\n")
			  xpnt-ins		(nth 0 pnt-ins)
			  ypnt-ins		(nth 1 pnt-ins)
			  angl				(atoi (angtos (angle pnt-ins pnt-drctn)))
			  txt					"*****"
			  justify_text "_bl"
  );setq

	(cond ;сравниваем значение angl
	  ;вверх
		((and (<= angl 135) (>= angl 45))
		 (progn
			 (setq pnt-ins-txt (list xpnt-ins (+ ypnt-ins 1))	; точка вставки текста
						 angl-txt 90
						 justify_text "_bl"
			 );setq
		 );progn 
		);case

	  ;влево
		((and (<= angl 225) (>= angl 135))
		 (progn
			 (setq pnt-ins-txt (list (- xpnt-ins 1) ypnt-ins) ; точка вставки текста
						 angl-txt 0
						 justify_text "_br"
			 );setq
		 );progn
		);case

	 ;вниз
		((and (<= angl 315) (>= angl 225))
		 (progn
			 (setq pnt-ins-txt (list xpnt-ins (- ypnt-ins 1)) ; точка вставки текста
						 angl-txt 90
						 justify_text "_br"
			 );setq
		 );progn
		);case

		(progn
		  (setq pnt-ins-txt (list (+ xpnt-ins 1) ypnt-ins) ; точка вставки текста
					  angl-txt 0
					  justify_text "_bl"
		  );setq
		);progn
	);cond

	(setvar "osmode" 0)
	(command "_text" justify_text pnt-ins-txt 2.5 angl-txt txt)
	(setvar "osmode" 6199)
);while

(setvar "cecolor" crnt-color)
(setvar "cmdecho" 1)
(princ)
)
;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////////////////////////////////////////////// конец программы ////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
