;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// штамп 15 мм                                                  ///////////////////////////////////////////////////////////////////////////////////////////////////////////

(defun 01-formats-spds-only-stamp-15mm

(block-name-15 / adoc pnt-1 pnt-txt-31 st-1 txt-31 xpnt-1 ypnt-1)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(setvar "cmdecho" 0)
(setvar "osmode" 6199)

(while (/= (setq pnt-1 (getpoint "\n”кажите точку вставки\n")) nil)
	(setq xpnt-1 (nth 0 pnt-1)
      	ypnt-1 (nth 1 pnt-1)
      	pnt-txt-31 (list (- xpnt-1 5) (+ ypnt-1 4))
      	st-1 (ssget "_w" (list (- xpnt-1 10) (+ ypnt-1 8)) pnt-1) ;номер на месте вставки
	);setq
	
	(if (= st-1 nil)
		(setq txt-31
			(entmakex
				(list
					'(0 . "TEXT")
					'(100 . "AcDbEntity")
					'(100 . "AcDbText")
					(cons 10 pnt-txt-31) ; нач точка текста
					(cons 11 pnt-txt-31) ; нач точка текста
					'(1 . "***1") ; содержание текста
					'(40 . 3.5) ; высота текста
					'(41 . 1) ; раст€жение текста
					'(50 . 0) ; поворот текста
					'(72 . 1) ; гориз выравнивание текста
					'(73 . 2) ; верт выравнивание текста
					'(370 . -1) ; толщина текста
					(cons 7 (getvar "textstyle")) ; стиль текста
				);list
			);entmakex
		);setq
	);if
		
	(setvar "osmode" 0)
	(command "_insert" block-name-15 "_X" 1 "_Y" 1 "_Z" 1 "_R" 0 pnt-1)
	(setvar "osmode" 6199)
);while

(command "_regenall")

(setvar "osmode" 6199)
(setvar "cmdecho" 1)

(vla-endundomark adoc)
(princ)
)
;///////                                                              ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
