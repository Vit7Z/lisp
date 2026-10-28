;;; ///////// рисование шапки ——¬ѕ по трем точкам крайн€€ лева€, крайн€€ верхн€€€(
(defun c:05-cap-table-scec

( / adoc dist-x pnt-l pnt-r pnt-t pnt-txt-1 pnt-txt-2 pnt-txt-3 pnt-txt-4 txt-1 txt-2 txt-3 
txt-4 x-dlt x-mdl-txt xpnt-l xpnt-r xpnt-t ypnt-l ypnt-r ypnt-t); переменные

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(setvar "cmdecho" 0)
(setvar "osmode" 6199)

(setq pnt-l (getpoint "\n”кажите крайнюю левую точку\n")
			pnt-t (getpoint "\n”кажите крайнюю верхнюю точку\n")
			pnt-r (getpoint "\n”кажите крайнюю правую точку\n")

			xpnt-l (nth 0 pnt-l)
			xpnt-r (nth 0 pnt-r)
			xpnt-t (nth 0 pnt-t)
			
			ypnt-l (nth 1 pnt-l)	
			ypnt-r (nth 1 pnt-r)
			ypnt-t (nth 1 pnt-t)
			
			dist-x (- xpnt-r xpnt-l)			
			x-mdl-txt (+ xpnt-l (* dist-x 0.5))
);setq

(if (< dist-x 26)
	(setq ;x-dlt (* (- 26 dist-x) 0.5)
	      x-dlt 13.5
	);setq
	
	(setq dist-x (fix dist-x)
	      x-dlt (+ (/ dist-x 2) 2)
	);setq
);setq

(setq xpnt-l (- x-mdl-txt x-dlt)
			xpnt-r (+ x-mdl-txt x-dlt)

			;x-mdl-txt (* (+ xpnt-r xpnt-l) 0.5)
			pnt-txt-1 (list x-mdl-txt (+ ypnt-t 38))
			pnt-txt-2 (list x-mdl-txt (+ ypnt-t 26))
			pnt-txt-3 (list x-mdl-txt (+ ypnt-t 18))
			pnt-txt-4 (list x-mdl-txt (+ ypnt-t 8))
);setq

(setvar "osmode" 0)

(command "_rectangle" (list xpnt-l (+ ypnt-t 46)) (list xpnt-r (+ ypnt-t 30)))		
(command "_rectangle" (list xpnt-l (+ ypnt-t 30)) (list xpnt-r (+ ypnt-t 22)))
(command "_rectangle" (list xpnt-l (+ ypnt-t 22)) (list xpnt-r (+ ypnt-t 14)))			
(command "_rectangle" (list xpnt-l (+ ypnt-t 14)) (list xpnt-r (+ ypnt-t 2)))

(setvar "textsize" 2.5)

(setq txt-1
	(entmakex
			(list
			'(0 . "MTEXT")
			'(100 . "AcDbEntity")
			'(100 . "AcDbMText")
			(cons 10 pnt-txt-1) ; нач точка текста
			'(1 . "****1") ; содержание текста
			'(8 . "0")
			'(40 . 2.5) ; высота текста
			(cons 41 dist-x) ; раст€жение текста
			(cons 42 dist-x) ; ширина текста
			'(71 . 5) ; гориз выравнивание текста
			'(370 . -1) ; толщина текста
			(cons 7 (getvar "textstyle")) ; стиль текста
		);list
	);entmakex
);setq

(setq txt-2
  (entmakex
    (list
      '(0 . "TEXT")
      '(100 . "AcDbEntity")
      '(100 . "AcDbText")
      (cons 10 pnt-txt-2) ; нач точка текста
      (cons 11 pnt-txt-2) ; нач точка текста
      '(1 . "-") ; содержание текста
      '(40 . 2.5) ; высота текста
      '(41 . 1) ; раст€жение текста
      '(50 . 0) ; поворот текста
      '(72 . 1) ; гориз выравнивание текста
      '(73 . 2) ; верт выравнивание текста
      '(370 . -1) ; толщина текста
       (cons 7 (getvar "textstyle")) ; стиль текста
    ) ;list
  );entmakex
);setq

(setq txt-3
  (entmakex
    (list
      '(0 . "TEXT")
      '(100 . "AcDbEntity")
      '(100 . "AcDbText")
      (cons 10 pnt-txt-3) ; нач точка текста
      (cons 11 pnt-txt-3) ; нач точка текста
      '(1 . "-") ; содержание текста
      '(40 . 2.5) ; высота текста
      '(41 . 1) ; раст€жение текста
      '(50 . 0) ; поворот текста
      '(72 . 1) ; гориз выравнивание текста
      '(73 . 2) ; верт выравнивание текста
      '(370 . -1) ; толщина текста
       (cons 7 (getvar "textstyle")) ; стиль текста
    ) ;list
  );entmakex
);setq

(setq txt-4
  (entmakex
    (list
      '(0 . "TEXT")
      '(100 . "AcDbEntity")
      '(100 . "AcDbText")
      (cons 10 pnt-txt-4) ; нач точка текста
      (cons 11 pnt-txt-4) ; нач точка текста
      '(1 . "***2") ; содержание текста
      '(40 . 2.5) ; высота текста
      '(41 . 1) ; раст€жение текста
      '(50 . 0) ; поворот текста
      '(72 . 1) ; гориз выравнивание текста
      '(73 . 2) ; верт выравнивание текста
      '(370 . -1) ; толщина текста
       (cons 7 (getvar "textstyle")) ; стиль текста
    ) ; end of list
  ); entmakex
); setq


(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(vla-endundomark adoc)

(princ)
(gc)
)
;;; //////////////////////// конец программы ///////////////////////////////////////
