;/////////////////////// выравнивание текста по середине, внутри прямоугольной области //////////////////////////
(defun c:901-algn-txt-rctngl

( / adoc algn-new algn-new-h algn-new-v algn-old algn-old-h algn-old-v angl-txt data-txt dimx-new dimx-old 
pnt-1 pnt-2 pnt-new pnt-new1 pnt-new2 pnt-old1 pnt-old2 txt txt-selct type-obj xpnt-1 xpnt-2 xpnt-new ypnt-1 ypnt-2 ypnt-new)

(setvar "osmode" 6199)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(setq pnt-1 (getpoint "\nУкажите лев. нижнюю точку\n")
			xpnt-1 (nth 0 pnt-1) 
			ypnt-1 (nth 1 pnt-1)
			
			pnt-2 (getpoint "\nУкажите прав. верхнюю точку\n")	
			xpnt-2 (nth 0 pnt-2) 
			ypnt-2 (nth 1 pnt-2)
);setq

(setvar "osmode" 0)

(setq	txt-selct (ssget "_c" pnt-2 pnt-1 '((0 . "*TEXT"))));setq

;если в рамке есть объект
(if (/= txt-selct nil)
	(progn
		(setq	txt (ssname txt-selct 0) ; извлекаем данные текста
					data-txt (entget txt)
					type-obj (cdr (assoc 0 data-txt))
  	);setq
	);progn
);if

;проверяем правильность выбора
(if (= txt-selct nil)
	(progn
		(setq	txt-selct (car (entsel "\nВыберите текст\n")) ; извлекаем данные текста
					data-txt (entget txt-selct)
					type-obj (cdr (assoc 0 data-txt))
  	);setq
  
		(if (and (/= type-obj "TEXT") ; повторяем ввод
	        	 (/= type-obj "MTEXT")
      	);and
	    (alert "Неправильный объект, повторите выбор")
		);if
	);progn
);if

;точка середины области
(setq xpnt-new (/ (+ xpnt-1 xpnt-2) 2)
     	ypnt-new (/ (+ ypnt-1 ypnt-2) 2)
			pnt-new (list xpnt-new ypnt-new)
);setq

(if (= type-obj "TEXT")
	(progn
		(setq pnt-new1 (cons 10 pnt-new)
					pnt-new2 (cons 11 pnt-new)
					
					pnt-old1 (assoc 10 data-txt)
					pnt-old2 (assoc 11 data-txt)
					
					algn-old-h (assoc 72 data-txt)
					algn-old-v (assoc 73 data-txt)
					
					algn-new-h (cons 72 1)
					algn-new-v (cons 73 2)
					
					
					data-txt (subst pnt-new1 pnt-old1 data-txt) ;заменяем точку текста новой точкой
					data-txt (subst pnt-new2 pnt-old2 data-txt)
					
					data-txt (subst algn-new-h algn-old-h data-txt)
					data-txt (subst algn-new-v algn-old-v data-txt)
		);setq
	
		(entmod data-txt);обновляем данные примитива
	);progn
);if


;определяем угол для многострочного текста
(if (= type-obj "MTEXT")
	(setq angl-txt (cdr (assoc 50 data-txt)));setq
);if

(if (= type-obj "MTEXT")
	(if (/= angl-txt 0.0)
		(setq dimx-new (abs (- ypnt-2 ypnt-1)));setq
		
		(setq dimx-new (abs (- xpnt-2 xpnt-1)));setq
	);if
);if

(if (= type-obj "MTEXT")
	(progn
		(setq pnt-new1 (cons 10 pnt-new)
					pnt-old1 (assoc 10 data-txt)
					data-txt (subst pnt-new1 pnt-old1 data-txt);заменяем точку текста новой точкой
					
					dimx-new (- dimx-new 2)
					dimx-new (cons 41 dimx-new)				
					dimx-old (assoc 41 data-txt)
					data-txt (subst dimx-new dimx-old data-txt);заменяем точку текста новой точкой
					
					algn-old (assoc 71 data-txt)
					algn-new (cons 71 5)
					data-txt (subst algn-new algn-old data-txt)
		);setq
	
		(entmod data-txt);обновляем данные примитива
	);progn
);if

(vla-endundomark adoc)

(setvar "osmode" 6199)
(princ) 
)
;///////////////////////////////////// конец программы    //////////////////////////
