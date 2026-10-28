;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// прибор фса 15 мм.                                            ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun 03-symbols-devices-02-15-mm

(str-01 txt-up / angl arc-1 arc-2 lin-1 lin-2 pnt-2 pnt-3 pnt-drctn pnt-ins xpnt-ins ypnt-ins)

(setvar "cmdecho" 0)
(setvar "osmode" 0)

(if	(= (tblsearch "block" "прибор-15мм-са") nil);создаем блок
  (progn
    (setvar "osmode" 0)
    (command "_arc" "_c" '(-2.5 5) '(-2.5 10) '(-2.5 0))
    (setq arc-1 (entlast))
    (command "_arc" "_c" '(2.5 5) '(2.5 0) '(2.5 10))
    (setq arc-2 (entlast))
    (command "_line" '(-2.5 10) '(2.5 10) "")
    (setq lin-1 (entlast))
    (command "_line" '(-2.5 0) '(2.5 0) "")
    (setq lin-2 (entlast))
		(command "_block" "прибор-15мм-са" '(0 0) arc-1 arc-2 lin-1 lin-2 "");command
  );progn
);if

(setvar "osmode" 6199)

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
			(setq pnt-2 (list (- xpnt-ins 7.5) ypnt-ins)
						pnt-3 (list (- xpnt-ins 7.5) (+ ypnt-ins 5))
						pnt-ins (list (- xpnt-ins 7.5) (- ypnt-ins 5))
			);setq
		);=
		
		;вверх
		((and (<= angl 135) (>= angl 45))
			(setq pnt-2 (list xpnt-ins (+ ypnt-ins 5))
						pnt-3 (list xpnt-ins (+ ypnt-ins 10))
						pnt-ins (list xpnt-ins ypnt-ins)
			);setq
		);=
			
		;вправо
		((setq pnt-2 (list (+ xpnt-ins 7.5) ypnt-ins)
					 pnt-3 (list (+ xpnt-ins 7.5) (+ ypnt-ins 5))
					 pnt-ins (list (+ xpnt-ins 7.5) (- ypnt-ins 5))
		));=

	);cond

	(if (/= txt-up nil) (command "_text" "_bc" pnt-3 2.5 0 txt-up));if

	(command "_text" "_bc" pnt-2 2.5 0 str-01)	
	(command "_text" "_tc" pnt-2 2.5 0 "***")
	(command "_insert" "прибор-15мм-са" "_x" 1 "_y" 1 "_z" 1 "_r" 0 pnt-ins)
	
	(setvar "osmode" 6199)
);while

(princ)
)
;/////// *************************************************************///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// КОНЕЦ ПРОГРАММЫ                                              ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// *************************************************************///////////////////////////////////////////////////////////////////////////////////////////////////////////