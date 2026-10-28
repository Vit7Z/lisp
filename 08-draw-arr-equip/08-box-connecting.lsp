;////////****************/////////////////////////////////////////////////////////////////
;/////// коробка соединительная //////////////////////////////////////////////////////////
;////////****************/////////////////////////////////////////////////////////////////

(defun c:08-box-connecting

( / crnt-clayer hatch-1 hatch-2 line-1 line-2 line-3 line-4 line-5 line-6 line-7)

(setvar "CMDECHO" 0)

(command "_.undo" "_begin")

(if (= (tblsearch "layer" "arngment-equip") nil)
	(command "_layer" "Создать" "arngment-equip" "Тип" "Continuous" "arngment-equip" "Цвет" 4 "arngment-equip" "Установить" "arngment-equip" "");создаем слой
);if

(setvar "clayer" "arngment-equip")

(setvar "osmode" 0)

(if (= (tblsearch "block" "коробка-соединит-чро" ) nil)
	(progn
		(command "_.LINE" '(0 0) '(-3 0) "")
		(setq line-1 (entlast))
		(command "_.LINE" '(-3 0) '(-3 3) "")
		(setq line-2 (entlast))
		(command "_.LINE" '(-3 3) '(0 0) "")
		(setq line-3 (entlast))
		(command "_.LINE" '(0 0) '(3 0) "")
		(setq line-4 (entlast))
		(command "_.LINE" '(3 0) '(3 3) "")
		(setq line-5 (entlast))
		(command "_.LINE" '(3 3) '(0 0) "")
		(setq line-6 (entlast))
		(command "_.LINE" '(-3 3) '(3 3) "")
		(setq line-7 (entlast))

		(command "_hatch" "solid" line-1 line-2 line-3 "")
		(setq hatch-1 (entlast))
		(command "_hatch" "solid" line-4 line-5 line-6 "")
		(setq hatch-2 (entlast))

		(command "_block" "коробка-соединит-чро"	'(0 0) line-1 line-2	line-3 line-4 line-5
																line-6	line-7 hatch-1 hatch-2 "")
	);progn
) ;if

(setvar "osmode" 6199)
(setvar "ORTHOMODE" 0)
(command "_insert" "коробка-соединит-чро" "_X" 1 "_Y" 1 "_Z" 1 pause pause)

(command "_TEXT" "_J" "_MC" pause 2.5 0 "****")

(setvar "clayer" "0")

(command "_.undo" "_end")
(setvar "osmode" 6199)
(setvar "CMDECHO" 1)
(princ)
)
;////////****************/////////////////////////////////////////////////////////////////
;/////// конец программы /////////////////////////////////////////////////////////////////
;////////****************/////////////////////////////////////////////////////////////////