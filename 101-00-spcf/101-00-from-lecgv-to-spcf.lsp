;/////// ************************************************************ ////////////////////////////////////////////////////////////
;/////// перенос данных из пэ овш в спецификацию                      ////////////////////////////////////////////////////////////
;/////// ************************************************************ ////////////////////////////////////////////////////////////
(defun c:101-00-from-lecgv-to-spcf

( / adoc box-txt commas counter current-primitive current-txt len-txt len-txt-cut len-txt-tmp lngth-set-position nmbr 
number-commas number-last-primitive pnt-1 pnt-2 pnt-txt pos-blank prmtv-del set-position txt txt-cut txt-tmp xp1-txt xp2-txt 
x-pnt-1 x-pnt-2 y-pnt-1 y-pnt-2 y-pnt-txt)

(vl-load-com)

(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(setvar	"osmode" 6199)

(while (/= nil (setq pnt-1 (getpoint "\nУкажите правый верхний угол в графе \"Поз\"\n")))
	(setq pnt-2 (getpoint "\nУкажите левый нижний угол в графе \"Поз\"\n")
				x-pnt-1 (nth 0 pnt-1)
				y-pnt-1 (nth 1 pnt-1)
				
				x-pnt-2 (nth 0 pnt-2)
				y-pnt-2 (nth 1 pnt-2)	
	);setq

	(setvar	"osmode" 0)

	;точки рамки, для выбора в графе "обозначение"
	(setq pnt-2 (list (+ x-pnt-1 60) y-pnt-2)
				set-position (ssget "_w" pnt-1 pnt-2 '((0 . "*TEXT")));текст в графе "поз"
				
				pnt-1 (list (+ x-pnt-1 125) y-pnt-1) ;точки рамки, для выбора количества
				pnt-2 (list (+ x-pnt-1 135) (- y-pnt-1 8))
				nmbr (ssget "_w" pnt-1 pnt-2 '((0 . "*TEXT")));текст в графе "кол"
				nmbr (cdr (assoc 1 (entget (ssname nmbr 0))))
	);setq
	
	(setq	lngth-set-position (sslength set-position) ; количество элементов в наборе "поз"
				number-last-primitive (- lngth-set-position 1)
				txt ""
				counter 0
	);setq
	
	(repeat	lngth-set-position
		(setq	current-primitive	(ssname set-position counter)
					current-txt (cdr (assoc 1 (entget current-primitive))) ; получаем текст
					txt (strcat current-txt ", " txt) ; склеиваем в одну переменную "поз"
					counter (+ counter 1) ;счетчик номера примитива
		);setq
	);repeat

	(setq txt (vl-string-left-trim ", " txt)
				txt (vl-string-right-trim ", " txt)
	);setq
	
	(repeat 30
		(setq txt (vl-string-subst "," ",," txt));setq
	);repeat

	;вычисление длины всего текста
	(setq	box-txt (textbox (list (cons 1 txt) (cons 40 2.5) (cons 50 0) (cons 41 1)));textbox
				xp1-txt (car (nth 0 box-txt))
				xp2-txt (car (nth 1 box-txt))
				len-txt (- xp2-txt xp1-txt);длина текста
				number-commas 0 ;количество запятых в строке
				counter 0
				txt-tmp ""
	);setq

	(repeat (strlen txt)
		(setq commas (vl-string-mismatch "," txt 0 counter));setq
		
		(if (= commas 1) (setq number-commas (+ number-commas 1)));if
		
		(setq counter (+ counter 1));setq
	);repeat

	(setvar "osmode" 6199)

	;удаляем позиционные обозначения
	(setq	pnt-1			(getpoint "\nУкажите точку 1\n")
				x-pnt-1	(nth 0 pnt-1)
				y-pnt-1	(nth 1 pnt-1)
				
				pnt-2		(getpoint "\nУкажите точку 2\n")
				x-pnt-2	(nth 0 pnt-2)
				y-pnt-2	(nth 1 pnt-2)
				
				pnt-txt (list (- x-pnt-1 10) (- y-pnt-1 4))
				y-pnt-txt (- y-pnt-1 4)
	);setq
	
	;удаляем примитивы в графе "поз"
	(setvar "osmode" 0)
	
	(setq	pnt-1 (list (- x-pnt-1 1) (- y-pnt-1 1));точки рамки
				pnt-2 (list (- x-pnt-1 19) (- y-pnt-2 7))
				prmtv-del (ssget "_C" pnt-1 pnt-2 '((0 . "*TEXT")))
	);setq
	
	(if (/= prmtv-del nil) (command "_erase" prmtv-del ""));if
	
	;стираем  данные в графе "кол"
	(setq pnt-1 (list (+ x-pnt-1 290) y-pnt-1) ;точки секущей линии
				pnt-2 (list (+ x-pnt-1 310) (- y-pnt-1 8))
				prmtv-del (ssget "_w" pnt-1 pnt-2 '((0 . "*TEXT")))	
	);setq
	
	(command "_.erase" prmtv-del "")
	
	(prnt-txt-101-from-le-cgv-to-spcf-1 (list (+ x-pnt-1 300) y-pnt-txt) nmbr)

	(repeat number-commas

    (setq pos-blank (vl-string-search " " txt 0);находим позицию пробела
			  	txt-cut (substr txt 1 (+ 1 pos-blank));отсекаем по пробел слева
	  			txt (vl-string-left-trim " " (substr txt (+ 1 pos-blank)));убираем пробел слева в правой части текста? правая часть текста
    );setq

		(setq	box-txt (textbox (list (cons 1 txt-cut) (cons 40 2.5) (cons 50 0) (cons 41 1)));textbox
					xp1-txt (car (nth 0 box-txt))
					xp2-txt (car (nth 1 box-txt))
					len-txt-cut (- xp2-txt xp1-txt);длина отсеченного текста
		);setq

		(setq	box-txt (textbox (list (cons 1 (strcat txt-tmp txt-cut)) (cons 40 2.5) (cons 50 0) (cons 41 1)));textbox
					xp1-txt (car (nth 0 box-txt))
					xp2-txt (car (nth 1 box-txt))
					len-txt-tmp (- xp2-txt xp1-txt);длина отсеченного и существующего текста
		);setq
		
		(if (< len-txt-tmp 15) 
			(setq txt-tmp (strcat txt-tmp txt-cut))
		);if
			
		(if (and (> len-txt-tmp 15) (> len-txt-cut 15) (= txt-tmp ""))
			(progn		
				(setq txt-tmp txt-cut)
				
				(prnt-txt-101-from-le-cgv-to-spcf-1 pnt-txt txt-tmp)

				(setq txt-tmp ""
							y-pnt-txt (- y-pnt-txt 8)
				   		pnt-txt (list (- x-pnt-1 10) y-pnt-txt)					
				);setq
			);progn
		);if

		(if (and (> len-txt-tmp 15) (> len-txt-cut 15) (/= txt-tmp ""))
			(progn					
				(prnt-txt-101-from-le-cgv-to-spcf-1 pnt-txt txt-tmp)
				
				(setq txt-tmp txt-cut
							y-pnt-txt (- y-pnt-txt 8)
				   		pnt-txt (list (- x-pnt-1 10) y-pnt-txt)					
				);setq
			);progn
		);if
			
		(if (and (> len-txt-tmp 15) (< len-txt-cut 15))
			(progn
				(prnt-txt-101-from-le-cgv-to-spcf-1 pnt-txt txt-tmp)
				
				(setq y-pnt-txt (- y-pnt-txt 8)
				   		pnt-txt (list (- x-pnt-1 10) y-pnt-txt)
							txt-tmp txt-cut
				);setq
			);progn
		);if
	);repeat number-commas

	(prnt-txt-101-from-le-cgv-to-spcf-1 pnt-txt txt-tmp)

	(setq pnt-txt (list (- x-pnt-1 10) (- y-pnt-txt 8)));setq

	(prnt-txt-101-from-le-cgv-to-spcf-1 pnt-txt txt)

);while

(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(vla-endundomark adoc)
(princ)
)
;/////// *************************************************************////////////////////////////////////////////////////////////
;/////// КОНЕЦ ПРОГРАММЫ                                              ////////////////////////////////////////////////////////////
;/////// *************************************************************////////////////////////////////////////////////////////////


;/////// ************************************************************ ////////////////////////////////////////////////////////////
;/////// печать текста в графе                                        ////////////////////////////////////////////////////////////
;/////// ************************************************************ ////////////////////////////////////////////////////////////
(defun prnt-txt-101-from-le-cgv-to-spcf-1

(pnt-txt txt-for-prn / adoc pnt-txt txt-1 txt-cut)

(setvar	"osmode" 0)

(setq txt-1 
	(entmakex
		(list
			'(0 . "TEXT")
			'(100 . "AcDbEntity")
			'(100 . "AcDbText")
			 (cons 10 pnt-txt) ; нач точка текста
			 (cons 11 pnt-txt) ; нач точка текста
			 (cons 1 txt-for-prn) ; содержание текста
			'(40 . 2.5) ; высота текста
			 (cons 41 1) ; растяжение текста
			'(50 . 0) ; поворот текста
			'(72 . 1) ; гориз выравнивание текста
			'(73 . 2) ; верт выравнивание текста
			'(370 . -1) ; толщина текста
			 (cons 7 "Standard") ; стиль текста
		);list
	);entmakex
);setq

(setvar "osmode" 6199)
(setvar "cmdecho" 1)

(princ)
)
;/////// *************************************************************////////////////////////////////////////////////////////////
;/////// КОНЕЦ ПРОГРАММЫ                                              ////////////////////////////////////////////////////////////
;/////// *************************************************************////////////////////////////////////////////////////////////

