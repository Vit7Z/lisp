
;/////// ************************************************************ //////////////////////////////////////////////////////////////////
;/////// Ћини€ св€зи на Ё»ћ                                           //////////////////////////////////////////////////////////////////
;/////// ************************************************************ //////////////////////////////////////////////////////////////////
(defun c:03-communication-line-eem

( / adoc align-72 align-73 angl pnt-drctn pnt-ins pnt-lin2 pnt-lin3 pnt-lin4 txt-1 txt-2 xpnt-ins ypnt-ins)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object)))); start undo

(setvar "osmode" 6199)

(setq pnt-ins (getpoint "\n”кажите точку вставки\n")
      xpnt-ins (nth 0 pnt-ins)
	  	ypnt-ins (nth 1 pnt-ins)
	  	pnt-drctn (getpoint "\n”кажите точку направлени€\n")
	  	angl (atoi (angtos (angle pnt-ins pnt-drctn)))
);setq

; опередел€ем угол поворота
(cond
  ; вниз
  ((and (<= angl 315) (>= angl 225));and
    (setq pnt-lin2 (list xpnt-ins (- ypnt-ins 5))
          pnt-lin3 (list (+ xpnt-ins 6) ypnt-ins)
          pnt-lin4 (list (+ xpnt-ins 6) (- ypnt-ins 5))
          align-72 1
          align-73 3
    );setq
  );end услови€
  
  ;влево
  ((and (<= angl 225) (>= angl 135));and
    (setq pnt-lin2 (list (- xpnt-ins 5) ypnt-ins)
          pnt-lin3 (list xpnt-ins (- ypnt-ins 6))
          pnt-lin4 (list (- xpnt-ins 5) (- ypnt-ins 6))
          align-72 2
          align-73 2
    );setq
  );end услови€
	
  ; вверх
  ((and (<= angl 135) (>= angl 45));and
    (setq pnt-lin2 (list xpnt-ins (+ ypnt-ins 5))
          pnt-lin3 (list (+ xpnt-ins 6) ypnt-ins)
          pnt-lin4 (list (+ xpnt-ins 6) (+ ypnt-ins 5))
          align-72 1
          align-73 1     
    );setq
  );end услови€  	
	  
  ; вправо	
  (progn													
    (setq pnt-lin2 (list (+ xpnt-ins 5) ypnt-ins)
          pnt-lin3 (list xpnt-ins (- ypnt-ins 6))
          pnt-lin4 (list (+ xpnt-ins 5) (- ypnt-ins 6))
          align-72 0
          align-73 2  
	);setq
  );progn
);cond

(setvar "osmode" 0)
(command "_line" pnt-ins pnt-lin2 "")
(command "_line" pnt-ins pnt-lin3 "")
(command "_line" pnt-lin3 pnt-lin4 "")

(setq txt-1
  (entmakex
    (list
      '(0 . "TEXT")
      '(100 . "AcDbEntity")
      '(100 . "AcDbText")
       (cons 10 pnt-lin2) ; нач точка текста
       (cons 11 pnt-lin2) ; нач точка текста
      '(1 . "****") ; содержание текста
      '(40 . 2.5) ; высота текста
      '(41 . 1) ; раст€жение текста
      '(50 . 0) ; поворот текста
       (cons 72 align-72) ; гориз выравнивание текста
       (cons 73 align-73) ; верт выравнивание текста
      '(370 . -1) ; толщина текста
       (cons 7 (getvar "textstyle")) ; стиль текста
    ) ; end of list
  ); entmakex
);setq

(setq txt-2
  (entmakex
    (list
      '(0 . "TEXT")
      '(100 . "AcDbEntity")
      '(100 . "AcDbText")
       (cons 10 pnt-lin4) ; нач точка текста
       (cons 11 pnt-lin4) ; нач точка текста
      '(1 . "****") ; содержание текста
      '(40 . 2.5) ; высота текста
      '(41 . 1) ; раст€жение текста
      '(50 . 0) ; поворот текста
       (cons 72 align-72) ; гориз выравнивание текста
       (cons 73 align-73) ; верт выравнивание текста
      '(370 . -1) ; толщина текста
       (cons 7 (getvar "textstyle")) ; стиль текста
    ) ; end of list
  ); entmakex
);setq

(vla-endundomark adoc)
(setvar	"ORTHOMODE" 1)
(setvar	"OSMODE" 6199)
(princ)
)
;//////////////////////// конец программы ///////////////////////////////////////