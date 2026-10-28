;/////// *************************************************************////////////////////
;/////// решетка                                                      ////////////////////
;/////// *************************************************************////////////////////
(defun c:08-grid

( / crnt-clayer line-1 line-2 line-3 line-4 line-5 line-6 line-7 line-8 pnt-1 pnt-1-1 pnt-1-2 pnt-2-1 pnt-2-2 pnt-3-1 pnt-3-2 pnt-4-1 pnt-4-2 pnt-5-1 pnt-5-2 pnt-6-1 pnt-6-2 
pnt-7-1 pnt-7-2 pnt-8-1 pnt-8-2 pnt-im-1 pnt-im-2)

(vl-load-com)

(vla-startundomark 
	(setq adoc (vla-get-activedocument (vlax-get-acad-object)))
);start undo

(setvar "cmdecho" 0)
(setvar "osmode" 0)

(setq crnt-clayer (getvar "clayer"));setq

(if (= (tblsearch "layer" "building") nil)
	(command "_layer" "Создать" "building" "Тип" "Continuous" "building" "Цвет" 2 "building" "Установить" "building" "");создаем слой
	(command "_layer" "Установить" "building" "") ;устанавливаем слой
);if

(setq pnt-1 (list 0 0)

			pnt-im-1 (polar pnt-1 (angtof "135" 0) 2.5)
			pnt-1-1 (polar pnt-im-1 (angtof "45" 0) 0.5)
			pnt-1-2 (polar pnt-1-1 (angtof "315" 0) 5)

			pnt-2-1 (polar pnt-im-1 (angtof "45" 0) 1.5)
			pnt-2-2 (polar pnt-2-1 (angtof "315" 0) 5)

			pnt-3-1 (polar pnt-im-1 (angtof "225" 0) 0.5)
			pnt-3-2 (polar pnt-3-1 (angtof "315" 0) 5)

			pnt-4-1 (polar pnt-im-1 (angtof "225" 0) 1.5)
			pnt-4-2 (polar pnt-4-1 (angtof "315" 0) 5)

			pnt-im-2 (polar pnt-1 (angtof "45" 0) 2.5)
			pnt-5-1 (polar pnt-im-2 (angtof "135" 0) 0.5)
			pnt-5-2 (polar pnt-5-1 (angtof "225" 0) 5)

			pnt-6-1 (polar pnt-im-2 (angtof "135" 0) 1.5)
			pnt-6-2 (polar pnt-6-1 (angtof "225" 0) 5)

			pnt-7-1 (polar pnt-im-2 (angtof "315" 0) 0.5)
			pnt-7-2 (polar pnt-7-1 (angtof "225" 0) 5)

			pnt-8-1 (polar pnt-im-2 (angtof "315" 0) 1.5)
			pnt-8-2 (polar pnt-8-1 (angtof "225" 0) 5)
);setq

(if (= (tblsearch "block" "решетка-чро" ) nil)
	(progn
		(command "_.LINE" pnt-1-1 pnt-1-2 "")
		(setq line-1 (entlast))
		(command "_.LINE" pnt-2-1 pnt-2-2 "")
		(setq line-2 (entlast))
		(command "_.LINE" pnt-3-1 pnt-3-2 "")
		(setq line-3 (entlast))
		(command "_.LINE" pnt-4-1 pnt-4-2 "")
		(setq line-4 (entlast))
		(command "_.LINE" pnt-5-1 pnt-5-2 "")
		(setq line-5 (entlast))
		(command "_.LINE" pnt-6-1 pnt-6-2 "")
		(setq line-6 (entlast))
		(command "_.LINE" pnt-7-1 pnt-7-2 "")
		(setq line-7 (entlast))
		(command "_.LINE" pnt-8-1 pnt-8-2 "")
		(setq line-8 (entlast))

		(command "_block" "решетка-чро" pnt-1 line-1 line-2 line-3 line-4	line-5 line-6 line-7 line-8 "")
	);progn
);if

(command "_insert" "решетка-чро" "_X" 1 "_Y" 1 "_Z" 1 "_R" 0 )

(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(setvar "clayer" crnt-clayer)

(vla-endundomark adoc)

(princ)
(gc)
)
;////////****************/////////////////////////////////////////////////////////////////
;/////// конец программы /////////////////////////////////////////////////////////////////
;////////****************/////////////////////////////////////////////////////////////////