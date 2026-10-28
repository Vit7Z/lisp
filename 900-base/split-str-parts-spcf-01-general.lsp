;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////  обрезка по заказанному символу str-patrn                    ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun split-str-parts-spcf-01-general

(str-701 str-702 str-order str-manufact str-unit str-99 str-note pnt-ins / box-txt cntr len-1 len-2 len-3 len-4 len-txt nmbr-ln num-lin-crtf num-lin-manufact num-lin-order 
pnt-txt scale-txt str-lst str-txt txt-1 x-pnt-ins y-pnt-ins y-pnt-txt)

;str-701 - строка наименования
;str-702 - список тех характеристик
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

(setq num-lin-crtf nil
			num-lin-manufact nil
			num-lin-order nil
			str-lst nil
			
			len-1 0
			len-2 0
			len-3 0
			len-4 0
			
			x-pnt-ins (nth 0 pnt-ins)
	 		y-pnt-ins (nth 1 pnt-ins)
);setq

(101-00-spcf-empty-line)

;наименование и тех характеристика
(cond 
	((/= str-702 nil) (split-str-parts-spcf-130-01 str-702) (setq str-702 str-lst));=
	((= str-702 nil) (setq str-702 0));=
);cond

(setq str-lst nil);setq

;код заказа или обозначение
(cond 
	((/= str-order nil) (split-str-parts-spcf-060-01 str-order) (setq str-order str-lst));=
	((= str-order nil) (setq str-order 0));=
);cond

(setq str-lst nil);setq

;производитель
(cond 
	((/= str-manufact nil) (split-str-parts-spcf-045-01 str-manufact) (setq str-manufact str-lst));=	
	((= str-manufact nil) (setq str-manufact 0));=
);cond

(setq str-lst nil);setq

;примечание
(cond 
	((/= str-note nil) (split-str-parts-spcf-040-01 str-note) (setq str-note str-lst));=	
	((= str-note nil) (setq str-note 0));=
);cond

(setq str-lst nil);setq

;;;;;;;///////////////////////////////////////////
(if (/= str-702 0) 
	(setq len-1 (length str-702));setq
	(setq len-1 0);setq
);=

(if (/= str-order 0) 
	(setq len-2 (length str-order));setq
	(setq len-2 0);setq
);=

(if (/= str-manufact 0) 
	(setq len-3 (length str-manufact));setq
	(setq len-3 0);setq
);=

(if (/= str-note 0) 
	(setq len-4 (length str-note));setq
	(setq len-4 0);setq
);=

(setq nmbr-ln (+ (max (+ len-1 1) len-2 len-3 len-4) 1));setq

(900-delete-items-spcf nmbr-ln pnt-ins)
(900-delete-items-spcf-crtf nmbr-ln pnt-ins)

(command "_text" "_ML" (list (+ x-pnt-ins 1) (- y-pnt-ins 4)) 2.5 0 str-701)

;наименование и тех хар-ка////////////////////////
(setq cntr 1);setq
		
(repeat len-1
	(setq str-txt (cdr (assoc cntr str-702)));setq
	(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* 8 cntr)) 4)) 2.5 0 str-txt)
	(setq cntr (+ cntr 1));setq
);repeat

	
;печать код заказа////////////////////////////////
(setq cntr 1);setq

(repeat len-2
	(setq str-txt (cdr (assoc cntr str-order)));setq
	(command "_text" "_MC" (list (+ x-pnt-ins 160) (- (- y-pnt-ins (* 8 (- cntr 1))) 4)) 2.5 0 str-txt)
	(setq cntr (+ cntr 1));setq
);repeat


;печать производитель/////////////////////////////
(setq cntr 1
			y-pnt-txt (- y-pnt-ins 4)
);setq

(repeat len-3
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

;печать примечания ///////////////////////////////
(setq cntr 1);setq

(repeat len-4
	(setq str-txt (cdr (assoc cntr str-note)));setq
	(command "_text" "_ML" (list (+ x-pnt-ins 336) (- (- y-pnt-ins (* 8 (- cntr 1))) 4)) 2.5 0 str-txt)
	(setq cntr (1+ cntr));setq
);repeat

(command "_text" "_MC" (list (+ x-pnt-ins 280) (- y-pnt-ins 4)) 2.5 0 str-unit)

(command "_text" "_MC" (list (+ x-pnt-ins 322.5) (- y-pnt-ins 4)) 2.5 0 str-99)

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
