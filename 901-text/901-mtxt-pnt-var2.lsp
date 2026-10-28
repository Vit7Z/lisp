;///////////////////////////////////// рисование многострочного текста горизонтально, около точки, направление выбираем //////////////////////////
(defun c:901-mtxt-pnt-var2
			 
( / adoc angl jstf pnt-1 pnt-drctn pnt-ins rot txt-1 xpnt-ins ypnt-ins); переменные

(vl-load-com)
(vla-startundomark
  (setq adoc (vla-get-activedocument (vlax-get-acad-object)))
);start undo

(setvar "osmode" 6199)
(setvar "textstyle" "standard")

(setq	pnt-ins		 (getpoint "\nУкажите точку вставки\n")
			pnt-drctn	 (getpoint "\nУкажите точку направления\n")
			xpnt-ins	 (nth 0 pnt-ins)
			ypnt-ins	 (nth 1 pnt-ins)
			angl			 (atoi (angtos (angle pnt-ins pnt-drctn)))
) ; end setq

(setvar "osmode" 0)

;;;; рисуем горизонтально, вверх от точки указания
(if (and (>= angl 45) (<= angl 135))
  (setq pnt-1 (list xpnt-ins (+ ypnt-ins 1))
        jstf 8
        rot (angtof "0" 0)
  ); setq
); if

;;;; рисуем вертикально, вправо от точки указания
(if (or (<= angl 45) (>= angl 315)); условие
  (setq pnt-1 (list (+ xpnt-ins 1) ypnt-ins)
        jstf 2 
        rot (angtof "90" 0)
  ); setq
); if
	
;;;; рисуем горизонтально, вниз от точки указания
(if (and (>= angl 225) (<= angl 315))
  (setq pnt-1 (list xpnt-ins (- ypnt-ins 1))
        jstf 2
        rot (angtof "0" 0) 
  ); setq
); if

;;;; рисуем вертикально, влево от точки указания
(if (and (>= angl 135) (<= angl 225))
  (setq pnt-1 (list (- xpnt-ins 1) ypnt-ins)
        jstf 8
        rot (angtof "90" 0) 
  ); setq
); if

(setq txt-1
  (entmakex
    (list
      '(0 . "MTEXT")
      '(100 . "AcDbEntity")
      '(100 . "AcDbMText")
       (cons 10 pnt-1) ; нач точка текста
      '(1 . "*******") ; содержание текста
      '(40 . 2.5) ; высота текста
      '(41 . 15) ; растяжение текста
      '(42 . 15) ; ширина текста
       (cons 50 rot) ; поворот текста
       (cons 71 jstf) ; выравнивание текста
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
;///////////////////////////////////// конец программы    //////////////////////////
