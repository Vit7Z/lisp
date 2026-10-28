;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////                                                              ///////////////////////////////////////////////////////////////////////////////////////////////////////////

(defun 01-formats-spds-02-page-2-w-stamp-15mm

(data-stamp data-format / adoc block-name-format block-name-stamp dlt-x pnt-1 pnt-2 pnt-txt1 txt-011 txt-31 xpnt-1)

(setq block-name-stamp (cdr (assoc 1 data-stamp))
			txt-011 (cdr (assoc 2 data-stamp))
			
			block-name-format (cdr (assoc 1 data-format))
			dlt-x (cdr (assoc 3 data-format));ширина формата
);setq

(setvar "osmode" 6199)

(while (/= (setq pnt-1 (getpoint "\n”кажите точку вставки\n")) nil)	

	(setvar	"OSMODE" 0)
	(command "_insert" block-name-format "_X" 1 "_Y" 1 "_Z" 1 "_R" 0 pnt-1)
	
	(if (/= txt-011 0)
		(progn
			(setq xpnt-1 (+ (nth 0 pnt-1) 40)
						xpnt-1 (+ xpnt-1 dlt-x)
						pnt-2 (list (- xpnt-1 5) (+ (nth 1 pnt-1) 5));точка вставки штампа
						pnt-txt1 (list (- xpnt-1 10) (+ (nth 1 pnt-1) 9));точка вставки количества листов
			);setq
				
			(command "_insert" block-name-stamp "_X" 1 "_Y" 1 "_Z" 1 "_R" 0 pnt-2)
			
			(setq txt-31
				(entmakex
					(list
						'(0 . "TEXT")
						'(100 . "AcDbEntity")
						'(100 . "AcDbText")
						 (cons 10 pnt-txt1) ;нач точка
						 (cons 11 pnt-txt1) ;нач точка
						'(1 . "**") ;содержание
						'(40 . 2.5) ;высота
						'(41 . 1) ;раст€жение
						'(50 . 0) ;поворот
						'(72 . 1) ;гориз выравнивание
						'(73 . 2) ;верт выравнивание
						'(370 . -1) ;толщина
						 (cons 7 (getvar "textstyle")) ;стиль
					);list
				);entmakex
			);setq
		);progn
	);if
	
	(setvar	"OSMODE" 6199)
);while

(command "_regenall")

(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(princ)
)
;///////                                                              ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
