;////////****************/////////////////////////////////////////////////////////////////
;/////// шапка таблицы экспликации ///////////////////////////////////////////////////////
;////////****************/////////////////////////////////////////////////////////////////
(defun c:08-explication-head

( / rctgl-1 rctgl-2 rctgl-3 rctgl-4 txt-1 txt-2 txt-3 txt-4 txt-5)

(command "_.undo" "_begin")
(setvar "osmode" 0)
(setvar "CMDECHO" 0)

(if (= (tblsearch "block" "экспл-заголовок" ) nil)
	(progn
		(setvar "CELWEIGHT" 60)
		(command "_.RECTANGLE" '(0 0) '(15 -20))
		(setq rctgl-1 (entlast))
		(command "_.RECTANGLE" '(15 -20) '(95 0))
		(setq rctgl-2 (entlast))
		(command "_.RECTANGLE" '(95 0) '(115 -20))
		(setq rctgl-3 (entlast))
		(command "_.RECTANGLE" '(115 0) '(125 -20))
		(setq rctgl-4 (entlast))

		(setvar "CELWEIGHT" -1)
		(command "_TEXT" "_BL" '(0 0) 3.5 0 "Экспликация помещений" )
		(setq txt-5 (entlast))
		(command "_TEXT" "_MC" '(55 -10) 2.5 0 "Наименование" )
		(setq txt-2 (entlast))
		(command "_MTEXT" '(5 0) "_j" "_mc" '(10 -20) "Номер поме-" "щения" "")
		(setq txt-1 (entlast))
		(command "_MTEXT" '(95 0) "_j" "_mc" '(115 -20) "Площадь, м2" "")
		(setq txt-3 (entlast))
		(command "_MTEXT" '(115 0) "_j" "_mc" '(125 -20) "Кат. пом." "")
		(setq txt-4 (entlast))

		(command "_block" "экспл-заголовок" '(0 0) rctgl-1 rctgl-2 rctgl-3 rctgl-4 txt-1 txt-2 txt-3 txt-4 txt-5 "")
	) ;конец progn
) ;конец if

(command "_insert" "экспл-заголовок" "_X" 1 "_Y" 1 "_Z" 1 "_R" 0 pause)
(setvar "osmode" 6199)
(setvar "CMDECHO" 1)
(command "_.undo" "_end")
(princ)
)
;/////////////////////////////////////////////////////////////////////////////////////////
;/////// конец программы /////////////////////////////////////////////////////////////////
;/////////////////////////////////////////////////////////////////////////////////////////