;/////// ************************************************************ //////////////////////////////////////////////////////////////////
;/////// отрисовка шкафа на чро                                       //////////////////////////////////////////////////////////////////
;/////// ************************************************************ //////////////////////////////////////////////////////////////////
(defun c:08-board-dae

( / adoc pnt-ins-blck rctngl-1 rctngl-2)

(vl-load-com)
(vla-startundomark
  (setq adoc (vla-get-activedocument (vlax-get-acad-object)));setq
);start undo

(setvar "cmdecho" 0)
(setvar "osmode" 0)

(if (= (tblsearch "layer" "arngment-equip") nil)
	(command "_layer" "Создать" "arngment-equip" "Тип" "Continuous" "arngment-equip" "Цвет" 4 "arngment-equip"
							"Установить" "arngment-equip" ""); создаем слой
	(command "_layer" "Установить" "arngment-equip" "") ; устанавливаем слой
);if

(if (= (tblsearch "block" "шкаф-1-сторонн-чро" ) nil)
	(progn
		(command "_.RECTANGLE" '(0 0) '(12 6))
		(setq rctngl-1 (entlast))
		(command "_.RECTANGLE" '(0 6) '(12 5))
		(setq rctngl-2 (entlast))
		(command "_block" "шкаф-1-сторонн-чро" '(0 0) rctngl-1 rctngl-2 "")
	);progn
);if

(setvar "osmode" 6199)

(while (/= (setq pnt-ins-blck (getpoint "\nУкажите точку вставки\n")) nil)
	(setvar "osmode" 0)
	(setvar "ORTHOMODE" 1)
	(command "_insert" "шкаф-1-сторонн-чро" "_X" 1 "_Y" 1 "_Z" 1 pnt-ins-blck pause)

	(setvar "osmode" 6199)
);while

(command "_layer" "Установить" "0" "")

(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(vla-endundomark adoc)
(princ)
)
;/////// конец программы ///////
