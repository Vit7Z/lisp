;/////// ************************************************************ //////////////////////////////////////////////////////////////////
;/////// редактирование подвала на сх элпитани€                       //////////////////////////////////////////////////////////////////
;/////// ************************************************************ //////////////////////////////////////////////////////////////////
(defun c:04-installation-site

( / adoc counter data-obj len-set-primitive lngth name-obj p1 p2 pnt-1 pnt-2 pnt-mv rctn-1 set-primitive txt txt-1 type-obj xpnt-1 xpnt-2 xpnt-mv ypnt-1 ypnt-2 ypnt-mv)

(vl-load-com)
(vla-startundomark
  (setq adoc (vla-get-activedocument (vlax-get-acad-object)));setq
);start undo

(setvar "cmdecho" 0)
(setvar "osmode" 6199)

(setq pnt-1 (getpoint "\n”кажите левую нижнюю точку\n")
			xpnt-1 (nth 0 pnt-1) 
			ypnt-1 (nth 1 pnt-1)
			pnt-2 (getpoint "\n”кажите правую верхнюю точку\n")	
			xpnt-2 (nth 0 pnt-2) 
			ypnt-2 (nth 1 pnt-2)
			lngth (abs (- xpnt-1 xpnt-2))
);setq

(setq xpnt-mv (/ (+ xpnt-1 xpnt-2) 2) ;точки середины текста
      ypnt-mv (/ (+ ypnt-1 ypnt-2) 2)
      pnt-mv (list xpnt-mv ypnt-mv)
);setq

(setvar "osmode" 0)

(setq p1 (list (+ xpnt-1 2) (- ypnt-1 2));точки секущей линии
			p2 (list (+ xpnt-2 2) (- ypnt-2 2))
);setq
    
(setq	set-primitive (ssget "_C" p2 p1);ssget
      len-set-primitive (sslength set-primitive)
      counter 0
);setq

(repeat len-set-primitive
  (setq	data-obj (entget (ssname set-primitive counter))
        type-obj (cdr (assoc 0 (entget (ssname set-primitive counter))))
        name-obj (cdr (car (entget (ssname set-primitive counter))))
  );setq
	
	(command "_erase" name-obj "")
	
	(if (= type-obj "MTEXT")
		(progn
			(setq	txt (cdr (assoc 1 data-obj)) ; точка вставки текста, извлекли из списка
			);setq
			(setq txt-1
				(entmakex
					(list
						'(0 . "MTEXT")
						'(100 . "AcDbEntity")
						'(100 . "AcDbMText")
						(cons 10 pnt-mv) ; нач точка текста
						(cons 1 txt) ; содержание текста
						(cons 40 2.5) ; высота текста
						(cons 41 lngth) ; раст€жение текста
						(cons 42 lngth) ; ширина текста
						'(71 . 5) ; гориз выравнивание текста
						'(370 . -1) ; толщина текста
						(cons 7 (getvar "textstyle")) ; стиль текста
					);list
				);entmakex
			);setq
		);progn
	);if

	(if (= type-obj "TEXT")
		(progn
			(setq	txt (cdr (assoc 1 data-obj)) ; точка вставки текста, извлекли из списка
			);setq
			(setq txt-1
				(entmakex
					(list
          '(0 . "TEXT")
          '(100 . "AcDbEntity")
          '(100 . "AcDbText")
           (cons 10 pnt-mv) ; нач точка текста
           (cons 11 pnt-mv) ; нач точка текста
           (cons 1 txt) ; содержание текста
           (cons 40 2.5) ; высота текста
          '(41 . 1) ; раст€жение текста
           (cons 50 0) ; поворот текста
          '(72 . 1) ; гориз выравнивание текста
          '(73 . 2) ; верт выравнивание текста
          '(370 . -1) ; толщина текста
           (cons 7 (getvar "textstyle")) ; стиль текста
        );list
				);entmakex
			);setq
		);progn
	);if

	(if (= type-obj "LWPOLYLINE")	
		(setq rctn-1
      (entmakex
        (list
          '(0 . "LWPOLYLINE")
          '(100 . "AcDbEntity")
          '(100 . "AcDbPolyline")
          '(70 . 1) ; замкнутость
          '(90 . 4) ; числ сторон
          '(43 . 0.0)
          '(8 . "0") ; слой
           (cons 10  (list xpnt-1 ypnt-1)) ; точки вершин
           (cons 10  (list xpnt-1 ypnt-2))
           (cons 10  (list xpnt-2 ypnt-2))
           (cons 10  (list xpnt-2 ypnt-1))
           (cons 10  (list xpnt-1 ypnt-1))
           (cons 370 -1) ; толщина линии
        ) ;list
      );entmakex
    );setq
	);if

	(setq counter (+ counter 1)
	);setq
	
);repeat

(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(vla-endundomark adoc)
(princ)
)
;/////// конец программы ///////
