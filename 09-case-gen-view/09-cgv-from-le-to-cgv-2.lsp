;/////// ************************************************************ /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// Поз. ПЭ --> Обозн. ПЭОВШ                                     /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun c:09-cgv-from-le-to-cgv-2

( / adoc counter-txt current-primitive current-txt data-primitive lngth-set-txt number-last-primitive pnt-bot pnt-ins-1 pnt-top pnt-txt pnt-txt-q pos-old p-txt-bot p-txt-top set-primitive-txt txt txt-1 
txt-bot txt-q txt-top xpnt-ins-1 xp-txt-bot xp-txt-top ypnt-ins-1 yp-txt-bot yp-txt-top)

(vl-load-com)

(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(setvar "cmdecho" 0)

(while (/= nil (setq	txt-top (car (entsel "\nВыберите верхнее позиционное обозначение\n"))))

	(setq	txt-bot (car (entsel "\nВыберите нижнее позиционное обозначение\n")));setq

	(setq p-txt-top (assoc 11 (entget txt-top));верхняя точка
				xp-txt-top (nth 1 p-txt-top)
				yp-txt-top (nth 2 p-txt-top)
	);setq

	(setq p-txt-bot (assoc 11 (entget txt-bot));нижняя точка
				xp-txt-bot (nth 1 p-txt-bot)
				yp-txt-bot (nth 2 p-txt-bot)
	);setq
	
	(setq pnt-top (list (+ xp-txt-top 2) (+ yp-txt-top 2)) ;точки секущей линии
				pnt-bot (list (- xp-txt-bot 2) (- yp-txt-bot 2))
	);setq
		
	(setvar "osmode" 0)
	
	(setq	set-primitive-txt (ssget "_c" pnt-top pnt-bot '((0 . "*TEXT"))));ssget, создаем набор позиционных обозначений

	(setq pnt-top nil ;собираем данные в графе "кол"
				pnt-bot nil
				pnt-top (list (+ (+ xp-txt-top 2) 125) (+ yp-txt-top 2)) ;точки секущей линии
				pnt-bot (list (+ (- xp-txt-bot 2) 125) (- yp-txt-top 2))
				txt-q (ssget "_c" pnt-top pnt-bot '((0 . "TEXT")));ssget
				txt-q (entget (ssname txt-q 0))
				txt-q (cdr (assoc 1 txt-q))
	);setq

	(setq	lngth-set-txt (sslength set-primitive-txt) ; количество элементов в наборе
				number-last-primitive (- lngth-set-txt 1)
				txt ""
				counter-txt 0
	);setq
	
	(repeat	lngth-set-txt
		(setq	current-primitive	(ssname set-primitive-txt counter-txt)
					data-primitive (entget current-primitive) ; получаем данные текущего примитива текста
					current-txt (cdr (assoc 1 data-primitive)) ; получаем текст
					txt (strcat current-txt ", " txt) ; склеиваем в одну переменную
					counter-txt (+ counter-txt 1) ;счетчик номера примитива
		);setq
	);repeat

	(setq txt (vl-string-left-trim ", " txt)
				txt (vl-string-right-trim ", " txt)
	);setq
	
	(repeat 30
		(setq txt (vl-string-subst "," ",," txt));setq
	);repeat
	
	
	(setvar "osmode" 6199)
	
	(setq	pnt-ins-1			(getpoint "\nУкажите точку в графе Обозначение\n")
				xpnt-ins-1	(nth 0 pnt-ins-1)
				ypnt-ins-1	(nth 1 pnt-ins-1)
				pnt-txt (list (+ xpnt-ins-1 1) (- ypnt-ins-1 4))
				pnt-txt-q (list (+ xpnt-ins-1 130) (- ypnt-ins-1 4))
	);setq 

	(setvar "osmode" 0)

	;;стираем  данные в графе "обозначение"
	(setq pnt-top nil
				pnt-bot nil
				pnt-top (list (+ xpnt-ins-1 30) (- ypnt-ins-1 2)) ;точки секущей линии, для удаления текста в графе количества
				pnt-bot (list (+ xpnt-ins-1 1) (- ypnt-ins-1 6))
	);setq
	
	(setq	pos-old (ssget "_c" pnt-top pnt-bot '((0 . "TEXT"))));setq
	
	(if (/= pos-old nil) (command "_.erase" pos-old ""));if

	;;стираем  данные в графе "кол"
	(setq pos-old nil
				pnt-top nil
				pnt-bot nil	
				pnt-top (list (+ xpnt-ins-1 135) (- ypnt-ins-1 0)) ;точки рамки, для удаления текста в графе количества
				pnt-bot (list (+ xpnt-ins-1 125) (- ypnt-ins-1 8))
	);setq
	
	(setq	pos-old (ssget "_w" pnt-top pnt-bot '((0 . "TEXT"))));setq
	
	(if (/= pos-old nil) (command "_.erase" pos-old ""));if
	
	(setvar "osmode" 0)
	
	(setq txt-1 
		(entmakex
			(list
				'(0 . "TEXT")
				'(100 . "AcDbEntity")
				'(100 . "AcDbText")
				 (cons 10 pnt-txt) ;нач точка
				 (cons 11 pnt-txt) ;нач точка
				 (cons 1 txt) ;содержание
				'(40 . 2.5) ;высота текста
				'(41 . 1) ;растяжение
				'(50 . 0) ;поворот текста
				'(72 . 0) ;гориз выравнивание
				'(73 . 2) ;верт выравнивание
				'(370 . -1);толщина текста
				 (cons 7 (getvar "textstyle")) ; стиль текста
			) ; end of list
		); entmakex
	); setq

(setq txt-q 
  (entmakex
    (list
      '(0 . "TEXT")
      '(100 . "AcDbEntity")
      '(100 . "AcDbText")
       (cons 10 pnt-txt-q) ;нач точка
       (cons 11 pnt-txt-q) ;нач точка
       (cons 1 txt-q) ;содержание
      '(40 . 2.5) ;высота
      '(41 . 1) ;растяжение
      '(50 . 0) ;поворот
      '(72 . 1) ;гориз выравнивание
      '(73 . 2) ;верт выравнивание
      '(370 . -1) ;толщина
       (cons 7 (getvar "textstyle"));стиль
    ) ;list
  );entmakex
); setq

);while

(vla-endundomark adoc)
(setvar "osmode" 6199)
(setvar "orthomode" 1)
(princ)
)
;///////////////////////////////////// конец программы    ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


