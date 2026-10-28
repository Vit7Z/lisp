;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////  обрезка по заказанному символу str-patrn                    ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun split-str-parts-spcf-w-elem-2-01-general

(str-701 str-dscr str-part-1 str-part-2 str-manufact str-order str-note pnt-ins / box-txt cntr len-dscr len-manufact len-note len-order len-p1 len-p2 len-txt nmbr-ln 
num-lin-crtf num-lin-manufact num-lin-order pnt-txt scale-txt str-701-title str-701-unit str-99 str-lst str-p1-99 str-p1-unit str-p1-vol str-p2-99 str-p2-unit str-p2-vol 
str-txt txt-1 x-pnt-ins y-pnt-ins y-pnt-ins-parts y-pnt-txt)

;str-701 - строка наименования
;str-dscr - список общего описания


;str-order - сторка заказа, список
;str-manufact - строка производителя, список (потом может)
;str-unit - ед. изм.
;str-99 - масса
;str-note - примечание
;str-tech-std - текст ТУ или другого документа
;str-patrn - символ по которому разбиваем "пробел" или "-"

(setvar "textstyle" "Standard")
(setvar "cmdecho" 0)
(setvar "osmode" 0)

(101-empt-lin-spcf)

(setq num-lin-crtf nil
			num-lin-manufact nil
			num-lin-order nil
			str-lst nil
			
			len-dscr 0
			len-p1 0
			len-p2 0
			len-order 0
			len-manufact 0
			len-note 0
			
			x-pnt-ins (nth 0 pnt-ins)
	 		y-pnt-ins (nth 1 pnt-ins)
);setq


;наименование и тех характеристика общая
(cond 
	((/= str-dscr nil) 
		(split-str-parts-spcf-w-elem-2-130-01 str-dscr) 
		(setq str-dscr str-lst
					len-dscr (length str-dscr)
		);setq
	);=
	
	((= str-dscr nil) 
		(setq str-dscr 0
					len-dscr 0
		);setq
	);=
);cond

(setq str-lst nil);setq

(setq str-p1-unit (cdr (assoc 97 str-part-1))
			str-p1-vol (cdr (assoc 98 str-part-1))
			str-p1-99 (cdr (assoc 99 str-part-1))
			
			str-part-1 (vl-remove (assoc 97 str-part-1) str-part-1)
			str-part-1 (vl-remove (assoc 98 str-part-1) str-part-1)
			str-part-1 (vl-remove (assoc 99 str-part-1) str-part-1)
);setq

;(princ "\n        str-part-1 = ") (princ str-part-1);Erase_DV
;(getstring "\nPress Enter to continue...");Erase_DV

(split-str-parts-spcf-w-elem-2-130-02 str-part-1) 
(setq str-part-1 str-lst
			str-lst nil
			len-p1 (length str-part-1)
);setq

(setq str-p2-unit (cdr (assoc 97 str-part-2))
			str-p2-vol (cdr (assoc 98 str-part-2))
			str-p2-99 (cdr (assoc 99 str-part-2))
			
			str-part-2 (vl-remove (assoc 97 str-part-2) str-part-2)
			str-part-2 (vl-remove (assoc 98 str-part-2) str-part-2)
			str-part-2 (vl-remove (assoc 99 str-part-2) str-part-2)
);setq

;(princ "\n        str-part-2 = ") (princ str-part-2);Erase_DV
;(getstring "\nPress Enter to continue...");Erase_DV

(split-str-parts-spcf-w-elem-2-130-02 str-part-2)

(setq str-part-2 str-lst
			str-lst nil
			len-p2 (length str-part-2)
);setq

;код заказа или обозначение
(split-str-parts-spcf-060-01 str-order)
 
(setq str-order str-lst
			str-lst nil
			len-order (length str-order)
);setq

;производитель
(split-str-parts-spcf-045-01 str-manufact) 

(setq str-manufact str-lst
			str-lst nil
			len-manufact (length str-manufact)
);setq

;примечание
(cond 
	((/= str-note nil) 
		(split-str-parts-spcf-040-01 str-note) 
		(setq str-note str-lst
					len-note (length str-note)
		);setq
	);=
		
	((= str-note nil) 
		(setq str-note 0)
	);=
);cond

(setq str-lst nil
			nmbr-ln (+ (max (+ len-dscr len-p1 len-p2 1) len-order len-manufact len-note) 1)
);setq

(900-delete-items-spcf nmbr-ln pnt-ins)
(900-delete-items-spcf-crtf nmbr-ln pnt-ins)
(900-delete-items-spcf-parts nmbr-ln pnt-ins)

(setq str-701-title (cdr (assoc 1 str-701))
			str-701-unit (cdr (assoc 97 str-701))
			str-99 (cdr (assoc 99 str-701))
);setq

(command "_text" "_ML" (list (+ x-pnt-ins 1) (- y-pnt-ins 4)) 2.5 0 str-701-title)

(command "_text" "_MC" (list (+ x-pnt-ins 280) (- y-pnt-ins 4)) 2.5 0 str-701-unit)

(if (/= str-99 nil)
	(command "_text" "_MC" (list (+ x-pnt-ins 322.5) (- y-pnt-ins 4)) 2.5 0 str-99)
);if

;наименование и тех хар-ка////////////////////////
(setq cntr 1
			y-pnt-ins-parts (- y-pnt-ins 8)
);setq
		
(repeat len-dscr
	(setq str-txt (cdr (assoc cntr str-dscr)));setq
	(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* 8 cntr)) 4)) 2.5 0 str-txt)
	(setq cntr (+ cntr 1)
				y-pnt-ins-parts (- y-pnt-ins-parts 8)
	);setq
);repeat

;;;;;;;; печать составляющая 1///////////////////////////////////////////////
(setq cntr 1);setq

(command "_text" "_MC" (list (+ x-pnt-ins 280) (- y-pnt-ins-parts 4)) 2.5 0 str-p1-unit)
(command "_text" "_MC" (list (+ x-pnt-ins 300) (- y-pnt-ins-parts 4)) 2.5 0 str-p1-vol)
(command "_text" "_MC" (list (+ x-pnt-ins 322.5) (- y-pnt-ins-parts 4)) 2.5 0 str-p1-99)

(repeat len-p1
	(setq str-txt (cdr (assoc cntr str-part-1)));setq
	(command "_text" "_ML" (list (+ x-pnt-ins 5) (- y-pnt-ins-parts 4)) 2.5 0 str-txt)
	(setq cntr (+ cntr 1)
				y-pnt-ins-parts (- y-pnt-ins-parts 8)
	);setq
);repeat

;;;;;;;; печать составляющая 2///////////////////////////////////////////////
(setq cntr 1);setq

(command "_text" "_MC" (list (+ x-pnt-ins 280) (- y-pnt-ins-parts 4)) 2.5 0 str-p2-unit)
(command "_text" "_MC" (list (+ x-pnt-ins 300) (- y-pnt-ins-parts 4)) 2.5 0 str-p2-vol)
(command "_text" "_MC" (list (+ x-pnt-ins 322.5) (- y-pnt-ins-parts 4)) 2.5 0 str-p2-99)

(repeat len-p2
	(setq str-txt (cdr (assoc cntr str-part-2)));setq
	(command "_text" "_ML" (list (+ x-pnt-ins 5) (- y-pnt-ins-parts 4)) 2.5 0 str-txt)
	(setq cntr (+ cntr 1)
				y-pnt-ins-parts (- y-pnt-ins-parts 8)
	);setq
);repeat


;;;;;;;; печать код заказа//////////////////////////////////////////////////
(setq cntr 1);setq

(repeat len-order
	(setq str-txt (cdr (assoc cntr str-order)));setq
	(command "_text" "_MC" (list (+ x-pnt-ins 160) (- (- y-pnt-ins (* 8 (- cntr 1))) 4)) 2.5 0 str-txt)
	(setq cntr (+ cntr 1));setq
);repeat


;;;;;;;; печать производитель//////////////////////////////////////////////
(setq cntr 1
			y-pnt-txt (- y-pnt-ins 4)
);setq

(repeat len-manufact
	(setq str-txt (cdr (assoc cntr str-manufact))
				box-txt (textbox (list (cons 1 str-txt) (cons 40 2.5) (cons 50 0) (cons 41 1)))
				len-txt (- (car (nth 1 box-txt)) (car (nth 0 box-txt)))		
				pnt-txt (list (+ x-pnt-ins 247.5) y-pnt-txt)
				scale-txt 1
	);setq

	(while (> len-txt 43);подбираем коэффициент ширины
		(setq scale-txt (- scale-txt 0.01)				
					box-txt (textbox (list (cons 1 str-txt) (cons 40 2.5) (cons 50 0) (cons 41 scale-txt)));textbox
					len-txt (- (car (nth 1 box-txt)) (car (nth 0 box-txt)))
		);setq
	);while
	
	(setq txt-1
		(entmakex
			(list
				'(0 . "TEXT")
				'(100 . "AcDbEntity")
				'(100 . "AcDbText")
				 (cons 10 pnt-txt) ;нач точка текста
				 (cons 11 pnt-txt) ;нач точка текста
				 (cons 1 str-txt) ; содержание текста
				'(40 . 2.5) ; высота текста
				 (cons 41 scale-txt) ; растяжение текста
				'(50 . 0) ; поворот текста
				'(72 . 1) ; гориз выравнивание текста
				'(73 . 2) ; верт выравнивание текста
				'(370 . -1) ; толщина текста
				 (cons 7 (getvar "textstyle")) ; стиль текста
			);list
		);entmakex
	);setq

	(setq cntr (+ cntr 1)
				y-pnt-txt (- y-pnt-txt 8)
	);setq
);repeat

;;;;;;;; печать примечания ///////////////////////////////
(setq cntr 1);setq

(repeat len-note
	(setq str-txt (cdr (assoc cntr str-note)));setq
	(command "_text" "_ML" (list (+ x-pnt-ins 336) (- (- y-pnt-ins (* 8 (- cntr 1))) 4)) 2.5 0 str-txt)
	(setq cntr (1+ cntr));setq
);repeat

(setq cntr 0);setq

(repeat nmbr-ln
  (command "_insert" "зс-пустая-строка" "_X" 1 "_Y" 1 "_Z" 1 "_R" 0 (list x-pnt-ins (- y-pnt-ins (* 8 cntr))))
  (setq cntr (1+ cntr));setq
);repeat

(gc)
(princ)
)
;/////// *************************************************************///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// КОНЕЦ ПРОГРАММЫ                                              ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// *************************************************************///////////////////////////////////////////////////////////////////////////////////////////////////////////
