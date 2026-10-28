;/////// *************************************************************///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// датчик                                                       ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// *************************************************************///////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun c:08-gg-dae

( / angl angl-txt hatch-1 pnt-1 pnt-drctn pnt-ins pnt-ins-blck rctngl-1 rctngl-2 txt-align xpnt-ins ypnt-ins)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(setvar "cmdecho" 0)
(setvar "osmode" 0)

(if (= (tblsearch "layer" "arngment-equip") nil)
	(command "_layer" "Создать" "arngment-equip" "Тип" "Continuous" "arngment-equip" "Цвет" 152 "arngment-equip" "Установить" "arngment-equip" "");создаем слой
);if

(setvar "clayer" "arngment-equip")

(if (= (tblsearch "block" "датчик-чро" ) nil)
	(progn
		(command "_.RECTANGLE" '(-3 3) '(3 0))
		(setq rctngl-1 (entlast))
		
		(command "_.RECTANGLE" '(-3 1) '(3 0))
		(setq rctngl-2 (entlast))
		
		(command "_hatch" "solid" rctngl-2 "")
		(setq hatch-1 (entlast))

		(command "_block" "датчик-чро" '(-3 0) rctngl-1	rctngl-2 hatch-1 "")
	);progn
);if

(setvar "osmode" 6199)

(while (/= (setq pnt-ins-blck (getpoint "\nУкажите точку вставки\n")) nil)
	(setvar "orthomode" 1)
	(command "_insert" "датчик-чро" "_X" 1 "_Y" 1 "_Z" 1 pnt-ins-blck pause)

	(setq	pnt-ins (getpoint "\nУкажите точку вставки текста\n")
				pnt-drctn	 (getpoint "\nУкажите точку направления текста\n")
				xpnt-ins	 (nth 0 pnt-ins)
				ypnt-ins	 (nth 1 pnt-ins)
				angl			 (atoi (angtos (angle pnt-ins pnt-drctn)))
				angl-txt nil
	);setq

	(setvar "osmode" 0)

	;;;;рисуем горизонтально, вправо от точки указания
	(if (or (>= angl 315) (<= angl 45))
		(setq pnt-1 (list (+ xpnt-ins 1) ypnt-ins)
					txt-align "_ml"
					angl-txt 0
		);setq
	);if
	
	;;;;рисуем горизонтально, вверх от точки указания
	(if (and (<= angl 135) (>= angl 45));условие
		(setq pnt-1 (list xpnt-ins ypnt-ins)
					txt-align "_bc"
					angl-txt 0
		);setq
	);if
		
	;;;;рисуем горизонтально, влево от точки указания
	(if (and (>= angl 135) (<= angl 225))
		(setq pnt-1 (list (- xpnt-ins 1) ypnt-ins)
					txt-align "_mr"
					angl-txt 0
		);setq
	);if
	
	;;;;рисуем горизонтально, вниз от точки указания
	(if (and (>= angl 225) (<= angl 315))
		(setq pnt-1 (list xpnt-ins (- ypnt-ins 1))
					txt-align "_tc"
					angl-txt 0
		);setq
	);if

	(command "_text" txt-align pnt-1 2.5 angl-txt "****")
	(setvar "osmode" 6199)
);while

(setvar "clayer" "0")
(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(vla-endundomark adoc)
(princ)
)
;/////// *************************************************************///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// КОНЕЦ ПРОГРАММЫ                                              ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// *************************************************************///////////////////////////////////////////////////////////////////////////////////////////////////////////
