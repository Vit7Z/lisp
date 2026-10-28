;///////////////////////////////////// рисование стрелки ///////
;///////////////////////////////////////////////////////////////////////////
(defun c:09-cgv-arrow

( / pnt-2 pnt-drctn pnt-ins xpnt-drctn xpnt-ins ypnt-2 ypnt-drctn ypnt-ins)

(setvar "osmode" 6199)
(setvar "textsize" 2.5)
(setvar "textstyle" "standard")
(command "_.undo" "_begin")

(while (/= (setq pnt-ins (getpoint "\n”кажите точку вставки\n")) nil)

	(setq	pnt-drctn		(getpoint "\n”кажите верхнюю точку на детали\n")
				xpnt-ins		(nth 0 pnt-ins)
				ypnt-ins		(nth 1 pnt-ins)
				xpnt-drctn	(nth 0 pnt-drctn)
				ypnt-drctn	(nth 1 pnt-drctn)
	);setq
	
	(setq ypnt-2	(- (nth 1 pnt-drctn) 3)
				pnt-2 (list xpnt-ins ypnt-2)
	);setq
	
	(setvar "osmode" 0)
	
	;рисуем срелку
	(command "_pline" pnt-ins "_w" 0 0 pnt-2 "_w" 1.5 0 (list xpnt-ins ypnt-drctn) "")
	
	;рисуем горизонтальную линию
	(command "_line" pnt-drctn (list (- xpnt-ins 2) ypnt-drctn) "")
	
	;рисуем текст
	(command "_text" "_mr" (list (- xpnt-ins 3) ypnt-drctn) 2.5 0 "***")
	
	
	(setvar "osmode" 6199)

);while

(command "_.undo" "_end")

(princ)
)
;/////////////////////////////////////////////// конец программы /////////////////////////////////////////////////////////////
