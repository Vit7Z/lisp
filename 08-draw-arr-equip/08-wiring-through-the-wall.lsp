;////////****************/////////////////////////////////////////////////////////////////
;//////// проход через стену /////////////////////////////////////////////////////////////
;////////****************/////////////////////////////////////////////////////////////////

(defun c:08-wiring-through-the-wall

( / angl-1 angl-2 line-1 line-2 line-3 pnt-ins-1 pnt-ins-2)

(setvar "cmdecho" 0)
(command "_.undo" "_begin")

(if (= (tblsearch "layer" "arngment-equip") nil)
	(command "_layer" "Создать" "arngment-equip" "Тип" "Continuous" "arngment-equip" "Цвет" 4 "arngment-equip" "Установить" "arngment-equip" "");создаем слой
	(command "_layer" "Установить" "arngment-equip" "") ;устанавливаем слой
);if

(setvar "osmode" 0)

(if (= (tblsearch "block" "чро-проводки-через-стену" ) nil)
	(progn
		(setvar "CELWEIGHT" 60)
		(command "_.LINE" '(0 0) '(0.5 0) "")
		(setq line-1 (entlast))
		(command "_.LINE" '(0.5 1) '(0.5 0) "")
		(setq line-2 (entlast))
		(command "_.LINE" '(0.5 -1) '(0.5 0) "")
		(setq line-3 (entlast))
		(setvar "CELWEIGHT" -1)
		(command "_block" "чро-проводки-через-стену" '(0 0) line-1 line-2 line-3 "")
	) ;конец progn
) ;конец if

(setvar "osmode" 6199)

(setvar "orthomode" 0)

(setq pnt-ins-1 (getpoint "\nУкажите точку пересечения кабеля и стены\n")
			pnt-ins-2 (getpoint "\nУкажите точку пересечения кабеля и стены\n")
			angl-1 (+ (atof (angtos (angle pnt-ins-1 pnt-ins-2))) 180)
			angl-2 (+ angl-1 180)
);setq

(setvar "osmode" 0)

(command "_insert" "чро-проводки-через-стену" "_X" 1 "_Y" 1 "_Z" 1 "_R" angl-1 pnt-ins-1)

(command "_insert" "чро-проводки-через-стену" "_X" 1 "_Y" 1 "_Z" 1 "_R" angl-2 pnt-ins-2)

(setvar "CELWEIGHT" 60)

(command "_line" pnt-ins-1 pnt-ins-2 "")

(setvar "CELWEIGHT" -1)

(setvar "clayer" "0")

(command "_.undo" "_end")
(setvar "osmode" 6199)
(setvar "orthomode" 1)
(setvar "cmdecho" 1)
(princ)
)
;////////****************/////////////////////////////////////////////////////////////////
;/////// конец программы /////////////////////////////////////////////////////////////////
;////////****************/////////////////////////////////////////////////////////////////







































