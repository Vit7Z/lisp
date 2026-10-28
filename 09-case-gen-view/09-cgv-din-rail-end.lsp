;/////// ************************************************************ //////////////////////////////////////////////////////////////////
;/////// отрисовка din-рейки, конец                                   //////////////////////////////////////////////////////////////////
;/////// ************************************************************ //////////////////////////////////////////////////////////////////
(defun c:09-cgv-din-rail-end

( / adoc pnt-1 pnt-2 pnt-3 pnt-4 pnt-ins pnt-ins2 rctn-1 x-pnt-ins x-pnt-ins2 y-pnt-ins)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(setvar "cmdecho" 0)
(setvar "osmode" 6199)

(setq pnt-ins (getpoint "\n”кажите начало\n")
		x-pnt-ins (nth 0 pnt-ins)
		y-pnt-ins (nth 1 pnt-ins)
		pnt-ins2 (getpoint "\n”кажите конец\n")
		x-pnt-ins2 (nth 0 pnt-ins2)
		pnt-1 (list x-pnt-ins (+ y-pnt-ins 1.35))
		pnt-2 (list x-pnt-ins2 (+ y-pnt-ins 1.35))
		pnt-3 (list x-pnt-ins2 (- y-pnt-ins 1.35))
		pnt-4 (list x-pnt-ins (- y-pnt-ins 1.35))
);setq

(setvar "osmode" 0)

(setq rctn-1 (entmakex (list
		'(0 . "LWPOLYLINE")
		'(100 . "AcDbEntity")
		'(100 . "AcDbPolyline")
		'(70 . 0) ; замкнутость
		'(90 . 3) ; числ сторон
		'(43 . 0.0)
		'(8 . "0") ; слой
  		(cons 10  pnt-1) ; точки вершин
  		(cons 10  pnt-2)
 		(cons 10  pnt-3)
  		(cons 10  pnt-4)
		(cons 10  pnt-1)
  		'(370 . 40) ;толщина линии
  		);list
	);entmakex
);setq

(setq	pnt-1 (list x-pnt-ins (+ y-pnt-ins 1.75))
		pnt-2 (list x-pnt-ins2 (+ y-pnt-ins 1.75))
		pnt-3 (list x-pnt-ins2 (- y-pnt-ins 1.75))
		pnt-4 (list x-pnt-ins (- y-pnt-ins 1.75))
);setq

(setq rctn-1 (entmakex (list
		'(0 . "LWPOLYLINE")
		'(100 . "AcDbEntity")
		'(100 . "AcDbPolyline")
		'(70 . 0) ; замкнутость
		'(90 . 3) ; числ сторон
		'(43 . 0.0)
		'(8 . "0") ; слой
 		(cons 10  pnt-1) ; точки вершин
  		(cons 10  pnt-2)
  		(cons 10  pnt-3)
  		(cons 10  pnt-4)
		(cons 10  pnt-1)
  		'(370 . 40) ;толщина линии
  	);list
	);entmakex
);setq

(setvar "celweight" -1)
(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(vla-endundomark adoc)
(princ)
)
;/////// конец программы ///////
