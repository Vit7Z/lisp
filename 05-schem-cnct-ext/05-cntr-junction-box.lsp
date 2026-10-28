;/////////////////// рисование контура на расстоянии мм от крайних точек, расстояние вводится с клавиатуры ////////////////////////////////
(defun c:05-cntr-junction-box

( / adoc p1-txt pnt-1 pnt-11 pnt-12 pnt-2 pnt-21 pnt-22 pnt-3 pnt-4 rctn-1 x-pnt-1 x-pnt-2 y-pnt-1 y-pnt-2)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo
  
(setvar "osmode" 6199)
(setvar "cmdecho" 0)

(command "_layer" "Установить" "0" "")

(setq	pnt-1 (getpoint "\nУкажите верхнюю точку\n")
			pnt-2 (getpoint "\nУкажите левую точку\n")
			pnt-3 (getpoint "\nУкажите нижнюю точку\n")         
			pnt-4 (getpoint "\nУкажите правую точку\n")       

			y-pnt-1 (+ (nth 1 pnt-1) 3)
			x-pnt-1 (- (nth 0 pnt-2) 3)
			y-pnt-2 (- (nth 1 pnt-3) 3)
			x-pnt-2 (+ (nth 0 pnt-4) 3)
			
			pnt-11 (list x-pnt-1 y-pnt-1)
			pnt-12 (list x-pnt-2 y-pnt-2)
			
			p1-txt (list (- x-pnt-2 3) y-pnt-1)
);setq

(setvar "osmode" 0)
(setvar "celweight" 40)
  
(command "_rectangle" pnt-11 pnt-12)

(setvar "celweight" -1)
(setvar "celtype" "ByLayer")
(setvar "textstyle" "standard")

(command "_text" "_bl" p1-txt 2.5 0 "КС")

(setq	pnt-11 (list (- x-pnt-2 4) (+ y-pnt-1 5))
			pnt-12 (list (- x-pnt-2 4) (- y-pnt-1 2))
			pnt-21 (list (+ x-pnt-2 4) (- y-pnt-1 2))         
			pnt-22 (list (+ x-pnt-2 4) (+ y-pnt-1 5))
);setq

;рамка вокруг длины
(setq rctn-1
	(entmakex
  	(list '(0 . "LWPOLYLINE")
          '(100 . "AcDbEntity")
          '(100 . "AcDbPolyline")
          '(70 . 1) ;замкнутость
          '(90 . 4) ;числ сторон
          '(43 . 0.0)
          '(8 . "wspom") ;слой
          (cons 10  pnt-11) ;точки вершин
          (cons 10  pnt-12)
          (cons 10  pnt-21)
          (cons 10  pnt-22)
          (cons 10  pnt-11)
         '(370 . 60) ;толщина линии
         '(62 . 1)
  	);list
	);entmakex
);setq


(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(gc)
(vla-endundomark adoc)
)
; /////// конец программы /////////////////////////////////////////////////////////////////////////////////////////////////////////////////