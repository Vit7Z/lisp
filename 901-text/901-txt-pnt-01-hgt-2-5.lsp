;///////////////////////////////////// рисование однострочного текста около точки, направление выбираем //////////////////////////
(defun c:901-txt-pnt-01-hgt-2-5
			 
( / angl angl-txt dcl-id pnt-1 pnt-drctn pnt-ins txt txt-align txt-height xpnt-drctn xpnt-ins ypnt-drctn ypnt-ins); переменные

(setvar "cmdecho" 0)
(setvar "osmode" 6199)
(setvar "textstyle" "standard")

(command "_.undo" "_begin")

(if (< (setq dcl-id (load_dialog "dia-901-txt-pnt-01-hgt-2-5.dcl")) 0) ;ищем диалог
		(progn
			(alert "Не найден dcl-файл")
			(exit)
		);progn
);if

(if (not (new_dialog "dia_901_txt_pnt_01" dcl-id))
		(exit)
);if


(action_tile "but-01"
  (strcat "(setq txt-height 2.5)"
  				"(done_dialog)"
  );srcat
);action_tile

(action_tile "but-02"
  (strcat "(setq txt-height 3.5)"
  				"(done_dialog)"
  );srcat
);action_tile

(action_tile "but-03"
  (strcat "(setq txt-height 1.6)"
  				"(done_dialog)"
  );srcat
);action_tile

(action_tile "accept"
  (strcat "(setq txt-height 2.5)"
  				"(done_dialog)"
  );strcat
);action_tile

(start_dialog)
(unload_dialog dcl-id)

(if (< (setq dcl-id (load_dialog "dia-901-txt-pnt-01-hgt-2-5.dcl")) 0) ;ищем диалог
		(progn
			(alert "Не найден dcl-файл")
			(exit)
		);progn
);if

(while (/= (setq pnt-ins (getpoint "\nУкажите точку вставки\n")) nil)
	(setq xpnt-ins (nth 0 pnt-ins)
				ypnt-ins (nth 1 pnt-ins)
	);setq

	(setvar "osmode" 0)
	
	(setq	pnt-drctn	 (getpoint "\nУкажите точку направления\n")
				xpnt-drctn (nth 0 pnt-drctn)
				ypnt-drctn (nth 1 pnt-drctn)
				angl (atoi (angtos (angle pnt-ins pnt-drctn)))
				txt "*****"
				angl-txt nil
	);setq

	(setvar "osmode" 0)
	
	;;;; рисуем горизонтально, вправо от точки указания
	(if (or (>= angl 315) (<= angl 45))
		(setq pnt-1 (list (+ xpnt-ins 1) ypnt-ins)
					txt-align "_ml"
					angl-txt 0
		);setq
	);if

	;;;; рисуем горизонтально, вверх от точки указания
	(if (and (<= angl 135) (>= angl 45)); условие
		(setq pnt-1 (list xpnt-ins ypnt-ins)
					txt-align "_bc"
					angl-txt 0
		);setq
	);if
	
	;;;; рисуем горизонтально, влево от точки указания
	(if (and (>= angl 135) (<= angl 225))
		(setq pnt-1 (list (- xpnt-ins 1) ypnt-ins)
					txt-align "_mr"
					angl-txt 0
		);setq
	);if

	;;;; рисуем горизонтально, вниз от точки указания
	(if (and (>= angl 225) (<= angl 315))
		(setq pnt-1 (list xpnt-ins (- ypnt-ins 1))
					txt-align "_tc"
					angl-txt 0
		);setq
	);if
	
	(setvar "osmode" 0)
	
	(command "_text" txt-align pnt-1 txt-height angl-txt txt)
	
	(setvar "osmode" 6199)
);while

(setvar "cmdecho" 1)

(princ)
)
;///////////////////////////////////// конец программы    //////////////////////////
