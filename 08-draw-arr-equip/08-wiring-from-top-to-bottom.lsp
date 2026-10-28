;////////****************/////////////////////////////////////////////////////////////////
;//////// Проводка приходит с более высокой отметки //////////////////////////////////////
;////////****************/////////////////////////////////////////////////////////////////
(defun c:08-wiring-from-top-to-bottom

( / circle-1 hatch-1 line-1 line-2)

(command "_.undo" "_begin")

(setvar "osmode" 0)

(setvar "cmdecho" 0)

(if (= (tblsearch "layer" "arngment-equip") nil)
	(command "_layer" "Создать" "arngment-equip" "Тип" "Continuous" "arngment-equip" "Цвет" 4 "arngment-equip" "Установить" "arngment-equip" "");создаем слой
	(command "_layer" "Установить" "arngment-equip" "") ;устанавливаем слой
);if

(if (= (tblsearch "block" "чро-проводки-сверху-вниз" ) nil)
	(progn
		(command "_circle" '(-5 -5) 0.5)
		(setq circle-1 (entlast))
		(command "_hatch" "solid" circle-1 "")
		(setq hatch-1 (entlast))
		(command "_.LINE" '(0 0) '(-2 -2) "")
		(setq line-1 (entlast))
		(command "_.PLINE" '(-2 -2) "_w" 2 0 '(-5 -5) "")
		(setq line-2 (entlast))
		(command "_block" "чро-проводки-сверху-вниз" '(0 0) circle-1 hatch-1 line-1 line-2 "")
	) ;конец progn
) ;конец if
(setvar "osmode" 6199)

(command "_insert" "чро-проводки-сверху-вниз" "_X" 1 "_Y" 1 "_Z" 1 "_R" 0 pause)

(setvar "clayer" "0")

(command "_.undo" "_end")

(setvar "osmode" 6199)
(princ)
)
;////////****************/////////////////////////////////////////////////////////////////
;/////// конец программы /////////////////////////////////////////////////////////////////
;////////****************/////////////////////////////////////////////////////////////////