;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////                                                              ///////////////////////////////////////////////////////////////////////////////////////////////////////////

(defun 01-formats-spds-02-page-2

(data-format / block-name dlt-x dlt-y name-of-format pnt_12 pnt_31 pnt_32 pnt_txt_5 rctn-1 rctn-2 rctn-3 rctn-4 rctn-5 rctn-6 rctn-7 rctn-8 rctn-9 txt-1 txt-2 txt-3 txt-5)

(setvar "cmdecho" 0)
(setvar "osmode" 0)

;создаем слой wspom
(if (= (tblsearch "layer" "wspom") nil)
	(command "_layer" "Создать" "wspom" "Тип" "Continuous" "wspom" "Цвет" 3 "wspom" "")
);if

(setq block-name (cdr (assoc 1 data-format))
			dlt-y (cdr (assoc 2 data-format));высота формата
			dlt-x (cdr (assoc 3 data-format));ширина формата
			name-of-format (cdr (assoc 4 data-format))
			
			pnt_12 (list (+ 40 dlt-x) dlt-y)			
			pnt_31 (list 60 (- dlt-y 5))			
			pnt_32 (list (+ 35 dlt-x) 5)			
			pnt_txt_5 (list (+ 35 dlt-x) 2.5) ;точка вставки обозначения формата
);setq

(if (= (tblsearch "block" block-name) nil)
	(progn
		(setvar	"CLAYER" "wspom")
		(command "_RECTANGLE" '(0 0) '(40 -40));вспом квадрат в левом нижнем углу
		(setq rctn-1 (entlast))		
		(command "_RECTANGLE" '(40 0) pnt_12);внешняя рамка формата, на слое wspom
		(setq rctn-2 (entlast))
		
		(setvar	"CLAYER" "0")
		(setvar "CELWEIGHT" 60)
		(command "_RECTANGLE" pnt_31 pnt_32);внешняя рамка формата
		(setq rctn-3 (entlast))
		(command "_RECTANGLE" '(48 30) '(53 5))
		(setq rctn-4 (entlast))	
		(command "_RECTANGLE" '(53 30) '(60 5))	
		(setq rctn-5 (entlast))
		(command "_RECTANGLE" '(48 65) '(53 30))
		(setq rctn-6 (entlast))
		(command "_RECTANGLE" '(53 65) '(60 30))
		(setq rctn-7 (entlast))
		(command "_RECTANGLE" '(48 90) '(53 65))
		(setq rctn-8 (entlast))
		(command "_RECTANGLE" '(53 90) '(60 65))
		(setq rctn-9 (entlast))
					
  	(setvar "CELWEIGHT" -1)
		(command "_TEXT" "_ML" '(50.5 6) 2.5 90 "Инв. № подл.") ; рисование текста
		(setq txt-1 (entlast))
		(command "_TEXT" "_ML" '(50.5 31) 2.5 90 "Подп. и дата")
		(setq txt-2 (entlast))
		(command "_TEXT" "_ML" '(50.5 66) 2.5 90 "Взам. инв. №")
		(setq txt-3 (entlast))
		(command "_TEXT" "_MR" pnt_txt_5 2.5 0 name-of-format)
		(setq txt-5 (entlast))
		(command "_block" block-name '(0 0)  
			rctn-1 rctn-2 rctn-3 rctn-4 rctn-5  rctn-6  rctn-7  rctn-8  rctn-9 txt-1  txt-2  txt-3  txt-5  "")
	);progn
);if

(setvar "osmode" 6199)
(setvar "cmdecho" 0)
(princ)
)
;///////                                                              ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
