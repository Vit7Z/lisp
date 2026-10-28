;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// диод                                                        ////////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun c:04-diode

( / adoc angl angl-blck angl-txt lin-1 lin-2 lin-3 lin-4 lin-5 pnt-1 pnt-drct pnt-drctn pnt-ins txt-align xpnt-1 xpnt-drct xpnt-ins ypnt-1 ypnt-drct ypnt-ins)

(setvar "cmdecho" 0)
(setvar "textstyle" "standard")

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));undo

(if	(= (tblsearch "block" "диод-спэ") nil);создаем блок
  (progn
    (setvar "osmode" 0)
    (command "_line" '(0 0) '(8 0) "")
    (setq lin-1 (entlast))
    (command "_line" '(2 2) '(2 -2) "")
    (setq lin-2 (entlast))
    (command "_line" '(6 2) '(6 -2) "")
    (setq lin-3 (entlast))
    (command "_line" '(2 0) '(6 2) "")
    (setq lin-4 (entlast))
    (command "_line" '(2 0) '(6 -2) "")
    (setq lin-5 (entlast))
		(command "_block" "диод-спэ" '(0 0) lin-1 lin-2 lin-3 lin-4 lin-5 "");command
  );progn
);if

(while (/= (setq pnt-1 (getpoint "\n”кажите начальную точку\n")) nil)
	(setq xpnt-1 (nth 0 pnt-1)
				ypnt-1 (nth 1 pnt-1)
				pnt-drct (getpoint "\n”кажите направление\n")
				xpnt-drct (nth 0 pnt-drct)
				ypnt-drct (nth 1 pnt-drct)
				angl (atoi (angtos (angle pnt-1 pnt-drct)))
	);setq
	
	;вставл€ем диод
	(if (and (<= angl 135) (>= angl 45)) ;вверх
		(setq angl-blck 270
					pnt-1 (list xpnt-1 (+ ypnt-1 8))
		);setq
	);if
	
	(if (and (<= angl 315) (>= angl 225)) ;вниз
		(setq angl-blck 90
					pnt-1 (list xpnt-1 (- ypnt-1 8))
		);setq
	);if
	
	(if (or (>= angl 315) (<= angl 45))
		(setq angl-blck 180
					pnt-1 (list (+ xpnt-1 8) ypnt-1)
		);setq
	);if

	(if (and (>= angl 135) (<= angl 225))
		(setq angl-blck 0
					pnt-1 (list (- xpnt-1 8) ypnt-1)
		);setq
	);if
	
	(command "_insert" "диод-спэ" "_X" 1 "_Y" 1 "_Z" 1 "_R" angl-blck pnt-1)
	
	(setvar "osmode" 6199)
	
	(setq	pnt-ins		 (getpoint "\n”кажите точку вставки текста\n")
				pnt-drctn	 (getpoint "\n”кажите точку направлени€ текста\n")
				xpnt-ins	 (nth 0 pnt-ins)
				ypnt-ins	 (nth 1 pnt-ins)
				angl			 (atoi (angtos (angle pnt-ins pnt-drctn)))
				angl-txt nil
	);setq
	

	;;;; рисуем горизонтально, вправо от точки указани€
	(if (or (>= angl 315) (<= angl 45))
		(setq pnt-1 (list (+ xpnt-ins 1) ypnt-ins)
					txt-align "_ml"
					angl-txt 0
		);setq
	);if
	
	;;;; рисуем горизонтально, вверх от точки указани€
	(if (and (<= angl 135) (>= angl 45)); условие
		(setq pnt-1 (list xpnt-ins ypnt-ins)
					txt-align "_bc"
					angl-txt 0
		);setq
	);if
		
	;;;; рисуем горизонтально, влево от точки указани€
	(if (and (>= angl 135) (<= angl 225))
		(setq pnt-1 (list (- xpnt-ins 1) ypnt-ins)
					txt-align "_mr"
					angl-txt 0
		);setq
	);if
	
	;;;; рисуем горизонтально, вниз от точки указани€
	(if (and (>= angl 225) (<= angl 315))
		(setq pnt-1 (list xpnt-ins (- ypnt-ins 1))
					txt-align "_tc"
					angl-txt 0
		);setq
	);if
	(setvar "osmode" 0)
	(command "_text" txt-align pnt-1 2.5 angl-txt "****")
	(setvar "osmode" 6199)	
);while

(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(vla-endundomark adoc)
(princ)
)
;/////// конец программы ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

