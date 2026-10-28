;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////                                                              ///////////////////////////////////////////////////////////////////////////////////////////////////////////

(defun 01-formats-spds-02-page-1

(data-format / block-name dlt-x dlt-y name-of-format pnt_12 pnt_31 pnt_32 pnt_txt_5 rctn-1 rctn-10 rctn-11 rctn-12 rctn-13 rctn-14 rctn-15 rctn-16 rctn-17 rctn-18 rctn-19 
rctn-2 rctn-20 rctn-21 rctn-22 rctn-3 rctn-4 rctn-5 rctn-6 rctn-7 rctn-8 rctn-9 txt-1 txt-2 txt-3 txt-4 txt-5)

;создаем слой wspom
(if (= (tblsearch "layer" "wspom") nil)
	(command "_layer" "—оздать" "wspom" "“ип" "Continuous" "wspom" "÷вет" 3 "wspom" "")
);if

;pnt_11 - лева€ верхн€€ точка формата, рамка на слое wspom
;pnt_12 - права верхн€€ точка формата, рамка на слое wspom
;pnt_21 - лева€ нижн€€ точка формата, рамка на слое wspom
;pnt_22 - права нижн€€ точка формата, рамка на слое wspom

;pnt_31 - лева€ нижн€€ точка формата, рамка толщиной 0.6 на слое "0"
;pnt_32 - права верхн€€ точка формата, рамка толщиной 0.6 на слое "0"

(setq block-name (cdr (assoc 1 data-format))
			dlt-y (cdr (assoc 2 data-format));высота формата
			dlt-x (cdr (assoc 3 data-format));ширина формата
			name-of-format (cdr (assoc 4 data-format))
			
			pnt_12 (list (+ 40 dlt-x) dlt-y)
			
			pnt_31 (list 60 (- dlt-y 5))
			
			pnt_32 (list (+ 35 dlt-x) 5)
			
			pnt_txt_5 (list (+ 35 dlt-x) 2.5) ;точка вставки обозначени€ формата
);setq


(setvar "cmdecho" 0)
(setvar "osmode" 0)

(if (= (tblsearch "block" block-name) nil)
	(progn
		(setvar	"CLAYER" "wspom")

		(command "_RECTANGLE" '(0 0) '(40 -40));вспом квадрат в левом нижнем углу
		(setq rctn-1 (entlast))
		
		(command "_RECTANGLE" '(40 0) pnt_12);внешн€€ рамка формата, на слое wspom
		(setq rctn-2 (entlast))
		
		(setvar	"CLAYER" "0")
		(setvar "CELWEIGHT" 60)
		(command "_RECTANGLE" pnt_31 pnt_32);внешн€€ рамка формата
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
		(command "_RECTANGLE" '(40 155) '(45 90))
		(setq rctn-10 (entlast))
		(command "_RECTANGLE" '(45 110) '(50 90))
		(setq rctn-11 (entlast))
		(command "_RECTANGLE" '(50 110) '(55 90))
		(setq rctn-12 (entlast))
		(command "_RECTANGLE" '(55 110) '(60 90))
		(setq rctn-13 (entlast))
		(command "_RECTANGLE" '(45 130) '(50 110))
		(setq rctn-14 (entlast))
		(command "_RECTANGLE" '(50 130) '(55 110))
		(setq rctn-15 (entlast))
		(command "_RECTANGLE" '(55 130) '(60 110))
		(setq rctn-16 (entlast))
		(command "_RECTANGLE" '(45 145) '(50 130))
		(setq rctn-17 (entlast))
		(command "_RECTANGLE" '(50 145) '(55 130))
		(setq rctn-18 (entlast))
		(command "_RECTANGLE" '(55 145) '(60 130))
		(setq rctn-19 (entlast))
		(command "_RECTANGLE" '(45 155) '(50 145))
		(setq rctn-20 (entlast))
		(command "_RECTANGLE" '(50 155) '(55 145))
		(setq rctn-21 (entlast))
		(command "_RECTANGLE" '(55 155) '(60 145))
		(setq rctn-22 (entlast))
		
  	(setvar "CELWEIGHT" -1)
		(command "_TEXT" "_ML" '(50.5 6) 2.5 90 "»нв. є подл.") ;текст
		(setq txt-1 (entlast))
		(command "_TEXT" "_ML" '(50.5 31) 2.5 90 "ѕодп. и дата")
		(setq txt-2 (entlast))
		(command "_TEXT" "_ML" '(50.5 66) 2.5 90 "¬зам. инв. є")
		(setq txt-3 (entlast))
		(command "_TEXT" "_ML" '(42.5 91) 2.5 90 "—огласовано")
		(setq txt-4 (entlast))
		(command "_TEXT" "_MR" pnt_txt_5 2.5 0 name-of-format)
		(setq txt-5 (entlast))
		(command "_block" block-name '(0 0) rctn-1  rctn-2  rctn-3  rctn-4  rctn-5  rctn-6  rctn-7  rctn-8  rctn-9  rctn-10
			 																	rctn-11	rctn-12  rctn-13	rctn-14  rctn-15  rctn-16  rctn-17  rctn-18  rctn-19  rctn-20
			 																	rctn-21  rctn-22 txt-1 txt-2 txt-3 txt-4 txt-5 "")
		
	);progn
);if

(setvar "osmode" 6199)
(setvar "cmdecho" 0)
(princ)
)
;///////                                                              ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
