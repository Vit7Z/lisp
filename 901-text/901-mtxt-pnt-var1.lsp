;///////////////////////////////////// рисование многострочного текста около точки, направление выбираем //////////////////////////
(defun c:901-mtxt-pnt-var1

( / adoc angl angl-txt pnt-1 pnt-drctn pnt-ins txt txt-1 txt-align xpnt-drctn xpnt-ins ypnt-drctn ypnt-ins) ;переменные
	
(vl-load-com)
(vla-startundomark
  (setq adoc (vla-get-activedocument (vlax-get-acad-object)))
);start undo

(setvar "cmdecho" 0)
(setvar "osmode" 6199)
(setvar "textstyle" "standard")

(setq	pnt-ins (getpoint "\nУкажите точку вставки\n"));setq

(setvar "osmode" 0)

(setq	pnt-drctn	 (getpoint "\nУкажите точку направления\n")
			xpnt-ins	 (nth 0 pnt-ins)
			ypnt-ins	 (nth 1 pnt-ins)
			xpnt-drctn (nth 0 pnt-drctn)
			ypnt-drctn (nth 1 pnt-drctn)
			angl			 (atoi (angtos (angle pnt-ins pnt-drctn)))
			txt				 "*****"
			angl-txt nil
);setq

(setvar "osmode" 0)

;;;; рисуем горизонтально, вправо от точки указания
(if (or (>= angl 315) (<= angl 45))
  (setq pnt-1 (list (+ xpnt-ins 1) ypnt-ins)
        txt-align 4
        angl-txt (angtof "0" 0)
  ); setq
); if

;;;; рисуем вертикально, вверх от точки указания
(if (and (<= angl 135) (>= angl 45)); условие
  (setq pnt-1 (list xpnt-ins (+ ypnt-ins 1))
        txt-align 4
        angl-txt (angtof "90" 0)
  ); setq
); if
	
;;;; рисуем горизонтально, влево от точки указания
(if (and (>= angl 135) (<= angl 225))
  (setq pnt-1 (list (- xpnt-ins 1) ypnt-ins)
        txt-align 6
        angl-txt (angtof "0" 0)
  ); setq
); if

;;;; рисуем вертикально, вниз от точки указания
(if (and (>= angl 225) (<= angl 315))
  (setq pnt-1 (list xpnt-ins (- ypnt-ins 1))
        txt-align 6
        angl-txt (angtof "90" 0)
  ); setq
); if

(setvar "osmode" 0)

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
       (cons 50 angl-txt) ; поворот текста
       (cons 71 txt-align) ; выравнивание текста
      '(370 . -1) ; толщина текста
       (cons 7 (getvar "textstyle")) ; стиль текста
    ) ; end of list
  ); entmakex
); setq

(vla-endundomark adoc)

(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(princ)
)
;///////////////////////////////////// конец программы    //////////////////////////
