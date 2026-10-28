;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// прибор с параметром сверху                                   ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun 03-symbols-devices-02-10-mm

(str-01 txt-up / adoc angl pnt-2 pnt-3 pnt-drctn pnt-ins xpnt-ins ypnt-ins)

(setvar "osmode" 6199)
(setvar "cmdecho" 0)

(while (/= (setq pnt-ins (getpoint "\nУкажите точку вставки\n")) nil)
	(setq	pnt-drctn (getpoint "\nУкажите точку направления\n")
				xpnt-ins (nth 0 pnt-ins)
				ypnt-ins (nth 1 pnt-ins)
				angl (atoi (angtos (angle pnt-ins pnt-drctn)))
	);setq
	
	;вниз
	(if (and (<= angl 315) (>= angl 225))
		(progn
			(alert "Не рисуется! Повторите ввод!")
			
			(setq pnt-ins (getpoint "\nУкажите точку вставки\n")
						pnt-drctn (getpoint "\nУкажите точку направления\n")
						xpnt-ins (nth 0 pnt-ins)
						ypnt-ins (nth 1 pnt-ins)
						angl (atoi (angtos (angle pnt-ins pnt-drctn)))
			);setq
		);progn	
	);if

	(setvar "osmode" 0)

	;опеределяем угол поворота
	(cond		
		;влево
		((and (<= angl 225) (>= angl 135))
			(setq pnt-2 (list (- xpnt-ins 5) ypnt-ins)
						pnt-3 (list (- xpnt-ins 5) (+ ypnt-ins 5))
			);setq
		);=
		
		;вверх
		((and (<= angl 135) (>= angl 45))
			(setq pnt-2 (list xpnt-ins (+ ypnt-ins 5))
						pnt-3 (list xpnt-ins (+ ypnt-ins 10))
			);setq
		);=
			
		;вправо
		((setq pnt-2 (list (+ xpnt-ins 5) ypnt-ins)
					pnt-3 (list (+ xpnt-ins 5) (+ ypnt-ins 5))
		));=

	);cond

	(if (/= txt-up nil) (command "_text" "_bc" pnt-3 2.5 0 txt-up));if

	(command "_circle" pnt-2 5)
	(command "_text" "_bc" pnt-2 2.5 0 str-01)	
	(command "_text" "_tc" pnt-2 2.5 0 "***")
	
	(setvar "osmode" 6199)
);while

(setvar "cmdecho" 1)
(princ)
)

;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// конец программы                                              ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
