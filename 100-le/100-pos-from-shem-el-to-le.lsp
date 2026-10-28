;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// перенос поз. обозначений с листа схемы в графу "Поз." ПЭ ////////////////////////////////////////////////////////////////////////////////////////////////////////
;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun c:100-pos-from-shem-el-to-le

( / adoc box-txt counter current-primitive current-txt len-current-txt length-set-txt len-txt lngth-set-primitive pnt-ins-1 pnt-ins-11 pnt-txt prmtv-del scale-len-txt 
scale-txt set-primitive set-txt txt txt-1 xp1-box-txt xp2-box-txt xpnt-ins-1 xpnt-ins-11 xpnt-tmp ypnt-ins-1 ypnt-ins-11 ypnt-txt)

(vl-load-com)

(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(prompt "\nВыберите текст\n") ; создаем набор

(setq	set-primitive (ssget '((0 . "*text")))
			lngth-set-primitive (sslength set-primitive) ; количество элементов в наборе
			counter 0
			scale-txt 1
);setq

(repeat	lngth-set-primitive
  (setq	current-primitive	(ssname set-primitive counter)
  			current-txt (cdr (assoc 1 (entget current-primitive))) ; извлекаем текст из примитива
  );setq

	(cond
		((< (+ counter 1) lngth-set-primitive) (setq current-txt (strcat current-txt ",")));=, прибавляем запятую и пробел к примитву текста, кроме последнего
	);cond

  (setq	set-txt (vl-list* current-txt set-txt);список текстов
	
  			counter (+ counter 1)
  );setq
);repeat

(setq	set-txt (reverse set-txt)
			counter 0
			len-txt 0
			len-current-txt 0
			txt ""
			length-set-txt (length set-txt)
);setq

(setvar "osmode" 6199)

(setq	pnt-ins-1			(getpoint "\nУкажите верхнюю точку\n")
			xpnt-ins-1	(nth 0 pnt-ins-1)
			ypnt-ins-1	(nth 1 pnt-ins-1)
			
			pnt-ins-11		(getpoint "\nУкажите нижнюю точку\n")
			xpnt-ins-11	(nth 0 pnt-ins-11)
			ypnt-ins-11	(nth 1 pnt-ins-11)
			
			ypnt-txt (- ypnt-ins-1 4)
);setq

(if (< xpnt-ins-1 xpnt-ins-11)
	(setq xpnt-tmp xpnt-ins-1
				xpnt-ins-1 xpnt-ins-11
				xpnt-ins-11 xpnt-tmp
	);setq
);if

(setq pnt-txt (list (- xpnt-ins-1 10) ypnt-txt));setq

;удаляем примитивы в графе поз
(setvar "osmode" 0)

(setq	prmtv-del (ssget "_w" pnt-ins-1 pnt-ins-11 '((0 . "*TEXT"))));setq

(if (/= prmtv-del nil) (command "_erase" prmtv-del ""));if

(if (= 1 length-set-txt)
	(progn		
		(setq current-txt (nth counter set-txt)
					current-txt (vl-string-left-trim " " current-txt)
					counter 1000
		);setq
				
		(setvar "osmode" 0)

		(setq	box-txt (textbox (list (cons 1 current-txt) (cons 40 2.5) (cons 50 0) (cons 41 scale-txt)));textbox? определяем длину текста, для подбора коэффициента ширины
					scale-len-txt (- (car (nth 1 box-txt)) (car (nth 0 box-txt)));длина текста
		);setq

		(while (> scale-len-txt 19);подбираем коэффициент ширины
						
			(setq scale-txt (- scale-txt 0.1));setq
						
			(setq	box-txt (textbox (list (cons 1 current-txt) (cons 40 2.5) (cons 50 0) (cons 41 scale-txt)));textbox
						xp1-box-txt (car (nth 0 box-txt)); х, левая нижняя точка
						xp2-box-txt (car (nth 1 box-txt)); х, правая верхняя точка
						scale-len-txt (- xp2-box-txt xp1-box-txt);длина текста
			);setq
				
			(if (<= scale-txt 0.6) (setq scale-len-txt 18));if, коэффициент ширины не должен быть меньше 0.6
		);while (> scale-len-txt 19)

		(setq txt-1 
			(entmakex
				(list
					'(0 . "TEXT")
					'(100 . "AcDbEntity")
					'(100 . "AcDbText")
					 (cons 10 pnt-txt) ; нач точка текста
					 (cons 11 pnt-txt) ; нач точка текста
					 (cons 1 current-txt) ; содержание текста
					'(40 . 2.5) ; высота текста
					 (cons 41 scale-txt) ; растяжение текста
					'(50 . 0) ; поворот текста
					'(72 . 1) ; гориз выравнивание текста
					'(73 . 2) ; верт выравнивание текста
					'(370 . -1) ; толщина текста
					 (cons 7 "Standard") ; стиль текста
				) ;list
			);entmakex
		);setq
	);progn
);if


(while (< counter length-set-txt)
	(setq scale-txt 1
				current-txt (nth counter set-txt)
	);setq
		
	(setq	box-txt (textbox (list (cons 1 current-txt) (cons 40 2.5) (cons 50 0) (cons 41 scale-txt)));textbox
				xp1-box-txt (car (nth 0 box-txt)); х, левая нижняя точка
				xp2-box-txt (car (nth 1 box-txt)); х, правая верхняя точка
				len-current-txt (- xp2-box-txt xp1-box-txt);длина текста
	);setq
		
	(setq	box-txt (textbox (list (cons 1 (strcat txt " " current-txt)) (cons 40 2.5) (cons 50 0) (cons 41 scale-txt)));textbox
				xp1-box-txt (car (nth 0 box-txt)); х, левая нижняя точка
				xp2-box-txt (car (nth 1 box-txt)); х, правая верхняя точка
				len-txt (- xp2-box-txt xp1-box-txt);длина текста
	);setq
	
	(if (and (< len-txt 19) (< counter length-set-txt))
		(setq txt (strcat txt " " current-txt));setq
	);if
	
	(if (and (> len-txt 19) (< counter length-set-txt))
		(progn
			(if (and (> len-current-txt 19) (= txt ""))	;если первая строка больше 19
				(setq txt current-txt
							current-txt ""
				);setq
			);if
				
			(setq	box-txt (textbox (list (cons 1 txt) (cons 40 2.5) (cons 50 0) (cons 41 scale-txt)));textbox? определяем длину текста, для подбора коэффициента ширины
						xp1-box-txt (car (nth 0 box-txt)); х, левая нижняя точка
						xp2-box-txt (car (nth 1 box-txt)); х, правая верхняя точка
						scale-len-txt (- xp2-box-txt xp1-box-txt);длина текста
			);setq
				
			(while (> scale-len-txt 19);подбираем коэффициент ширины
				
				(setq scale-txt (- scale-txt 0.1));setq
				
				(setq	box-txt (textbox (list (cons 1 txt) (cons 40 2.5) (cons 50 0) (cons 41 scale-txt)));textbox
							xp1-box-txt (car (nth 0 box-txt)); х, левая нижняя точка
							xp2-box-txt (car (nth 1 box-txt)); х, правая верхняя точка
							scale-len-txt (- xp2-box-txt xp1-box-txt);длина текста
				);setq
		
				(if (<= scale-txt 0.6) ;коэффициент ширины не должен быть меньше 0.6
					(setq scale-len-txt 18);setq
				);if
			);while (> scale-len-txt 19)
		
			(setq txt (vl-string-left-trim " " txt));setq
		
			(setq txt-1 
				(entmakex
					(list
						'(0 . "TEXT")
						'(100 . "AcDbEntity")
						'(100 . "AcDbText")
						 (cons 10 pnt-txt) ; нач точка текста
						 (cons 11 pnt-txt) ; нач точка текста
						 (cons 1 txt) ; содержание текста
						'(40 . 2.5) ; высота текста
						 (cons 41 scale-txt) ; растяжение текста
						'(50 . 0) ; поворот текста
						'(72 . 1) ; гориз выравнивание текста
						'(73 . 2) ; верт выравнивание текста
						'(370 . -1) ; толщина текста
						 (cons 7 "Standard") ; стиль текста
					);list
				);entmakex
			);setq

			(setq len-txt 0
						txt current-txt
						ypnt-txt (- ypnt-txt 8)
						pnt-txt (list (- xpnt-ins-1 10) ypnt-txt)	
						scale-txt 1
			);setq
		);progn
	);if

	(setq	counter (+ counter 1));счетчик
);while

(setq scale-txt 1);setq

(if (/= txt "")
	(progn
		(setq	box-txt (textbox (list (cons 1 txt) (cons 40 2.5) (cons 50 0) (cons 41 scale-txt)));textbox? определяем длину текста, для подбора коэффициента ширины
					xp1-box-txt (car (nth 0 box-txt)); х, левая нижняя точка
					xp2-box-txt (car (nth 1 box-txt)); х, правая верхняя точка
					scale-len-txt (- xp2-box-txt xp1-box-txt);длина текста
		);setq
		
		(while (> scale-len-txt 19);подбираем коэффициент ширины
						
			(setq scale-txt (- scale-txt 0.1));setq
						
			(setq	box-txt (textbox (list (cons 1 txt) (cons 40 2.5) (cons 50 0) (cons 41 scale-txt)));textbox
						xp1-box-txt (car (nth 0 box-txt)); х, левая нижняя точка
						xp2-box-txt (car (nth 1 box-txt)); х, правая верхняя точка
						scale-len-txt (- xp2-box-txt xp1-box-txt);длина текста
			);setq
				
			(if (<= scale-txt 0.6) (setq scale-len-txt 18));коэффициент ширины не должен быть меньше 0.6
				
		);while (> scale-len-txt 19)
		
		(setq txt (vl-string-left-trim " " txt));setq
		
		(setq txt-1 
			(entmakex
				(list
				 '(0 . "TEXT")
				 '(100 . "AcDbEntity")
				 '(100 . "AcDbText")
					(cons 10 pnt-txt) ; нач точка текста
					(cons 11 pnt-txt) ; нач точка текста
					(cons 1 txt) ; содержание текста
				 '(40 . 2.5) ; высота текста
					(cons 41 scale-txt) ; растяжение текста
				 '(50 . 0) ; поворот текста
				 '(72 . 1) ; гориз выравнивание текста
				 '(73 . 2) ; верт выравнивание текста
				 '(370 . -1) ; толщина текста
					(cons 7 "Standard") ; стиль текста
				) ; end of list
			); entmakex
		); setq
		
	);progn
);if

(vla-endundomark adoc)
(setvar "CMDECHO" 1)
(setvar	"ORTHOMODE" 1)
(setvar	"OSMODE" 6199)
(princ)
)
;///////////////////////////////////// конец программы    ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////