;///////////////////////////////////// рисование однострочного текста около точки, направление выбираем //////////////////////////
(defun c:901-txt-pnt-02-hgt-2-5
			 
( / angl angl-txt pnt-1 pnt-drctn pnt-ins txt-align xpnt-drctn xpnt-ins ypnt-drctn ypnt-ins); переменные

(setvar "cmdecho" 0)
(setvar "osmode" 6199)
(setvar "textstyle" "standard")

(command "_.undo" "_begin")

(while (/= (setq pnt-ins (getpoint "\nУкажите точку вставки\n")) nil)
	(setq xpnt-ins (nth 0 pnt-ins)
				ypnt-ins (nth 1 pnt-ins)
	);setq

	(setvar "osmode" 0)
	
	(setq	pnt-drctn	 (getpoint "\nУкажите точку направления\n")
				xpnt-drctn (nth 0 pnt-drctn)
				ypnt-drctn (nth 1 pnt-drctn)
				angl			 (atoi (angtos (angle pnt-ins pnt-drctn)))		 
				angl-txt nil
	); end setq

	(setvar "osmode" 0)
	
	;;;; рисуем горизонтально, вправо от точки указания
	(if (or (>= angl 315) (<= angl 45))
		(setq pnt-1 (list (+ xpnt-ins 1) ypnt-ins)
					txt-align "_tc"
					angl-txt 90
		); setq
	); if

	;;;; рисуем горизонтально, вверх от точки указания
	(if (and (<= angl 135) (>= angl 45)); условие
		(setq pnt-1 (list xpnt-ins (+ ypnt-ins 1))
					txt-align "_ml"
					angl-txt 90
		); setq
	); if
	
	;;;; рисуем горизонтально, влево от точки указания
	(if (and (>= angl 135) (<= angl 225))
		(setq pnt-1 (list (- xpnt-ins 1) ypnt-ins)
					txt-align "_bc"
					angl-txt 90
		); setq
	); if

	;;;; рисуем горизонтально, вниз от точки указания
	(if (and (>= angl 225) (<= angl 315))
		(setq pnt-1 (list xpnt-ins (- ypnt-ins 1))
					txt-align "_mr"
					angl-txt 90
		); setq
	); if
	(setvar "osmode" 0)
	(command "_text" txt-align pnt-1 2.5 angl-txt "*****")
	(setvar "osmode" 6199)
);while
(setvar "cmdecho" 1)
(princ)
)
;///////////////////////////////////// конец программы    //////////////////////////
