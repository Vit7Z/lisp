;//////////////////////////////////////////////////////////////////подвал///////////////////////////////////////////////////////////////////////////////////////////////
;///////// Параметр первый /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun c:03-parametr-01

( / adoc angle-mtxt pnt-ins pnt-lin2 pnt-mtxt txt-1 txt-2 xpnt-ins ypnt-ins)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object)))); start undo

(setvar "osmode" 6199)

(setq	pnt-ins (getpoint "\nУкажите точку вставки\n")
			xpnt-ins (+ (nth 0 pnt-ins) 5)		
);setq

(setq	ypnt-ins (nth 1 pnt-ins)
			pnt-lin2 (list xpnt-ins (+ ypnt-ins 90))
			pnt-mtxt (list (- xpnt-ins 0.5) (+ ypnt-ins 2))
			angle-mtxt (angtof "90" 0)
			pnt-ins (list xpnt-ins ypnt-ins)
);setq

(setvar "osmode" 0)
(command "_line" pnt-ins pnt-lin2 "")

(setq txt-1
  (entmakex
    (list
      '(0 . "TEXT")
      '(100 . "AcDbEntity")
      '(100 . "AcDbText")
       (cons 10 pnt-lin2) ; нач точка текста
       (cons 11 pnt-lin2) ; нач точка текста
      '(1 . "**1") ; содержание текста
      '(40 . 2.5) ; высота текста
      '(41 . 1) ; растяжение текста
      '(50 . 0) ; поворот текста
      '(72 . 1) ; гориз выравнивание текста
      '(73 . 1) ; верт выравнивание текста
      '(370 . -1) ; толщина текста
       (cons 7 (getvar "textstyle")) ; стиль текста
    ) ; end of list
  ); entmakex
);setq

(setq txt-2
  (entmakex
    (list
      '(0 . "MTEXT")
      '(100 . "AcDbEntity")
      '(100 . "AcDbMText")
       (cons 10 pnt-mtxt) ; нач точка текста
      '(1 . "**2") ; содержание текста
      '(40 . 2.5) ; высота текста
       (cons 50 angle-mtxt) ; угол в радианах
      '(41 . 30) ; растяжение текста
      '(42 . 30) ; ширина текста
      '(71 . 7) ; гориз выравнивание текста, вниз влево
      '(370 . -1) ; толщина текста
       (cons 7 (getvar "textstyle")) ; стиль текста
    ) ; end of list
  ); entmakex
); setq

(vla-endundomark adoc)
(setvar	"ORTHOMODE" 1)
(setvar	"OSMODE" 6199)
(princ)
)
;//////////////////////// конец программы ///////////////////////////////////////