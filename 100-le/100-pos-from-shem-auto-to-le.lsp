;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// перенос позиционных обозначений с листа ФСА в графу "Поз." ПЭ //////////////////////////////////////////////////////////////////////////////////////////////////////////
;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun c:100-pos-from-shem-auto-to-le

( / adoc box-txt btxt counter crnt-prmtv-btxt crnt-prmtv-ttxt current-primitive current-txt data-primitive len-current-txt length-set-txt len-txt lngth-set-primitive p11-c 
p12-c p1-del p21-c p22-c p2-del pnt-ins-1 pnt-ins-11 pnt-txt prmtv-del scale-len-txt scale-txt set-primitive set-txt ttxt txt txt-1 xp1-box-txt xp2-box-txt xpins-crnt 
xpnt-ins-1 xpnt-ins-11 ypins-crnt ypnt-ins-1 ypnt-ins-11 ypnt-txt)

(vl-load-com)

(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));undo

(setvar	"OSMODE" 0)

(prompt "\nВыберите прибор\n")

(setq	set-primitive (ssget '((0 . "circle")))
			lngth-set-primitive (sslength set-primitive) ; количество элементов в наборе
			counter 0
			scale-txt 1
);setq

(repeat	lngth-set-primitive
  (setq	current-primitive	(ssname set-primitive counter)
				data-primitive (entget current-primitive) ;получаем данные текущего примитива
				xpins-crnt (nth 1 (assoc 10 (entget current-primitive)));точка вставки круга
				ypins-crnt (nth 2 (assoc 10 (entget current-primitive)))
	
  			p11-c (list (+ xpins-crnt 4) (+ ypins-crnt 1));cекущая рамка, верхний текст
  			p12-c (list (- xpins-crnt 4) (+ ypins-crnt 2))
      	p21-c (list (+ xpins-crnt 4) (- ypins-crnt 2));cекущая рамка, нижний текст
  			p22-c (list (- xpins-crnt 4) (- ypins-crnt 1))
	);setq
	  
  (setq	crnt-prmtv-ttxt (ssget "_C" p11-c p12-c '((0 . "TEXT")));верхний текст
        crnt-prmtv-btxt (ssget "_C" p21-c p22-c '((0 . "TEXT")));нижний текст
  );setq

	(setq ttxt (cdr (assoc 1 (entget (ssname crnt-prmtv-ttxt 0))));извлекаем данные из текстов
	      btxt (cdr (assoc 1 (entget (ssname crnt-prmtv-btxt 0))))
	      current-txt (strcat ttxt btxt)	
  );setq
   
	(cond
		((< (+ counter 1) lngth-set-primitive) (setq current-txt (strcat current-txt ",")));=, прибавляем запятую и пробел к примитву текста, кроме последнего
	);cond 
  
  (setq	set-txt (vl-list* current-txt set-txt));setq, ;создаем список текстов
  
  (setq	counter (+ counter 1));счетчик
);repeat

(setq	set-txt (reverse set-txt));setq

(setq	counter 0
			len-txt 0
			len-current-txt 0
			txt ""
			length-set-txt (length set-txt)
);setq

(setvar "osmode" 6199)

(setq	pnt-ins-1			(getpoint "\nУкажите точку 1\n")
			xpnt-ins-1	(nth 0 pnt-ins-1)
			ypnt-ins-1	(nth 1 pnt-ins-1)
			pnt-ins-11		(getpoint "\nУкажите точку 2\n")
			xpnt-ins-11	(nth 0 pnt-ins-11)
			ypnt-ins-11	(nth 1 pnt-ins-11)
			ypnt-txt (- ypnt-ins-1 4)
			pnt-txt (list (- xpnt-ins-1 10) ypnt-txt)
);setq

;удаляем примитивы в графе поз
(setvar "osmode" 0)
(setq	p1-del (list (- xpnt-ins-1 20) ypnt-ins-1);точки рамки
      p2-del (list xpnt-ins-1 ypnt-ins-11)
);setq

(setvar "osmode" 0)

(setq	prmtv-del (ssget "_w" p1-del p2-del '((0 . "*TEXT"))));setq

(if (/= prmtv-del nil) (command "_erase" prmtv-del ""));if
;//////////////////////////////////////////////////////////////////

(if (= 1 length-set-txt)
	(progn	
		(setq current-txt (nth counter set-txt)
					counter 1000
		);setq
		
		(setq current-txt (vl-string-left-trim " " current-txt));удаляем пробел слева
		
		(setvar "osmode" 0)

		(setq	box-txt (textbox (list (cons 1 current-txt) (cons 40 2.5) (cons 50 0) (cons 41 scale-txt)));textbox? определяем длину текста, для подбора коэффициента ширины
					xp1-box-txt (car (nth 0 box-txt)); х, левая нижняя точка
					xp2-box-txt (car (nth 1 box-txt)); х, правая верхняя точка
					scale-len-txt (- xp2-box-txt xp1-box-txt);длина текста
		);setq

		(while (> scale-len-txt 19);подбираем коэффициент ширины
						
			(setq scale-txt (- scale-txt 0.1));setq
						
			(setq	box-txt (textbox (list (cons 1 current-txt) (cons 40 2.5) (cons 50 0) (cons 41 scale-txt)));textbox
						xp1-box-txt (car (nth 0 box-txt)); х, левая нижняя точка
						xp2-box-txt (car (nth 1 box-txt)); х, правая верхняя точка
						scale-len-txt (- xp2-box-txt xp1-box-txt);длина текста
			);setq
				
			(if (<= scale-txt 0.6) ;коэффициент ширины не должен быть меньше 0.6
				(setq scale-len-txt 18);setq
			);if
		);while (> scale-len-txt 19)
		
		(setq current-txt (vl-string-left-trim " " current-txt));удаляем пробел слева

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
				) ; end of list
			); entmakex
		); setq
		
	);progn
);if


(while (< counter length-set-txt)
	
	(setq scale-txt 1);setq

	(setq current-txt (nth counter set-txt));setq
		
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
				
				(setq scale-txt (- scale-txt 0.01));setq
				
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
		) ; end of list
	); entmakex
); setq


(vla-endundomark adoc)

(setvar "CMDECHO" 1)

(setvar	"ORTHOMODE" 1)

(setvar	"OSMODE" 6199)

(princ)
)
;///////////////////////////////////// конец программы    //////////////////////////

