;/////// ************************************************************ //////////////////////////////////////////////////////////////////
;/////// разбиение текста в точке                                     //////////////////////////////////////////////////////////////////
;/////// ************************************************************ //////////////////////////////////////////////////////////////////
(defun c:901-text-breakage-point-01

( / adoc align72 align73 counter data-crnt-obj data-obj len-txt-l list-txt p-ins-txt pnt-break txt txt-cut txt-height txt-l txt-r 
xp1-box-txt xp2-box-txt xp-ins-txt xp-ins-txt-1 xpnt-break xpnt-break-txt xpnt-strt-txt yp-ins-txt)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(setvar "CMDECHO" 1)
(setvar	"OSMODE" 0)

(while (/= (setq data-obj (entget (car (entsel "\nВыберите текст\n"))));setq
       nil)

	(setq pnt-break (getpoint "\nУкажите точку отсечения\n") ;точка обрезания
				xpnt-break (nth 0 pnt-break)
				list-txt (assoc 1 data-obj)
				txt (cdr list-txt) ;извлекли текст
				txt-height (cdr (assoc 40 data-obj))
	);setq
	
	;убираем двойные и больше пробелы, пробелы в начале и конце строки 
	(repeat (strlen txt) 
		(setq txt (vl-string-subst " " "  " txt 0)
					txt (vl-string-subst "," ",," txt 0)
					txt (vl-string-subst "," " ," txt 0)
					txt (vl-string-left-trim "  " txt)
					txt (vl-string-right-trim "  " txt)
		);setq
	);repeat
	
	;заменяем список текста
	(setq txt (cons 1 txt) 
				data-obj (subst	txt list-txt data-obj)
				list-txt (assoc 1 data-obj)
				xpnt-strt-txt (nth 0 (cdr (assoc 10 data-obj)))
				align72 (cdr (assoc 72 data-obj))
				align73 (cdr (assoc 73 data-obj))
	);setq
	
	(entmod data-obj) ;обновленный объект
	
	(setq txt (cdr (assoc 1 data-obj)) ;извлекли текст
				txt-r txt
				p-ins-txt (assoc 11 data-obj);точка вставки текста
				xp-ins-txt (nth 1 p-ins-txt)
				xp-ins-txt-1 xp-ins-txt
				yp-ins-txt (nth 2 p-ins-txt)
				p-ins-txt (cdr p-ins-txt)
	);setq
	
	;обновленный примитив текста
	(setq data-obj (subst (cons 1 txt-r) list-txt data-obj)
				list-txt (assoc 1 data-obj)
	);setq
	
	(if (and (= align72 1) (= align73 2));and
		(setq xpnt-break-txt xpnt-strt-txt
					xp-ins-txt xpnt-strt-txt
		);setq
	);if
	
	(setq xpnt-break-txt xp-ins-txt
				txt-l ""
				counter 0
	);setq

	;цикл по обрезке//////////////////////////////////////////////////////
	(while (< xpnt-break-txt xpnt-break)
		(setq counter (+ counter 1)
					txt-cut (substr txt-r 1 counter);отсекаем по пробел слева
		);setq
			
		;вычисление правой точки левого сегмента
		(setq data-crnt-obj (subst (cons 1 txt-cut) list-txt data-obj);заменяем список текста
					xp1-box-txt (car (nth 0 (textbox data-crnt-obj))); х, левая нижняя точка
					xp2-box-txt (car (nth 1 (textbox data-crnt-obj))); х, правая верхняя точка
					len-txt-l (- xp2-box-txt xp1-box-txt);длина текста
					xpnt-break-txt (+ len-txt-l xp-ins-txt)
		);setq
	);while///////////////////////////////////////////////////////////////
	
	(setq txt-cut (substr txt-r 1 (- counter 1));отсекаем текст
				txt-cut (vl-string-right-trim " " txt-cut)
				txt-l (substr txt-r counter)
	);setq

	(setq txt
		(entmakex
			(list
				'(0 . "TEXT")
				'(100 . "AcDbEntity")
				'(100 . "AcDbText")
				 (cons 10 p-ins-txt) ; нач точка текста
				 (cons 11 p-ins-txt) ; нач точка текста
				 (cons 1 txt-cut) ; содержание текста
				 (cons 40 txt-height) ; высота текста
				'(41 . 1) ; растяжение текста
				'(50 . 0) ; поворот текста
				 (cons 72 align72) ; гориз выравнивание текста
				 (cons 73 align73) ; верт выравнивание текста
				'(370 . -1) ; толщина текста
				 (cons 7 (getvar "textstyle")) ; стиль текста
			) ;list
		);entmakex
	);setq
	
	(if (and (= align72 1) (= align73 2));and
		(setq xp-ins-txt xp-ins-txt-1);setq
	);if
	
	(setq yp-ins-txt (- yp-ins-txt 8)
				p-ins-txt (list xp-ins-txt yp-ins-txt)
	);setq

	(setq txt
		(entmakex
			(list
				'(0 . "TEXT")
				'(100 . "AcDbEntity")
				'(100 . "AcDbText")
				 (cons 10 p-ins-txt) ; нач точка текста
				 (cons 11 p-ins-txt) ; нач точка текста
				 (cons 1 txt-l) ; содержание текста
				 (cons 40 txt-height) ; высота текста
				'(41 . 1) ; растяжение текста
				'(50 . 0) ; поворот текста
				 (cons 72 align72) ; гориз выравнивание текста
				 (cons 73 align73) ; верт выравнивание текста
				'(370 . -1) ; толщина текста
				 (cons 7 (getvar "textstyle")) ; стиль текста
			);list
		); entmakex
	); setq
		
	(command "_erase" (cdr (car data-obj)) "")
);while

(vla-endundomark adoc)
(setvar "CMDECHO" 1)
(setvar	"ORTHOMODE" 1)
(setvar	"OSMODE" 6199)
(princ)
)
;///////////////////////////////////////////////