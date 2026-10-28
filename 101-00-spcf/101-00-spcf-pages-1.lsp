;/////// ************************************************************ //////////////////////////////////////////////////////////////////////
;/////// первый лист                                                  //////////////////////////////////////////////////////////////////////
;/////// ************************************************************ //////////////////////////////////////////////////////////////////////
(defun 101-00-spcf-page-1

(block-name / adoc angl pnt-2 pnt-ins pnt-ins-head pnt-ins-stamp pnt-txt32 txt-32 xpnt-2 x-pnt-ins ypnt-2 y-pnt-ins)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(setvar	"osmode" 6199)

(setq pnt-ins (getpoint "\nУкажите точку вставки\n")
      x-pnt-ins (nth 0 pnt-ins)
      y-pnt-ins (nth 1 pnt-ins)
      
      pnt-2 (getpoint "\nУкажите направление\n")
      xpnt-2 (nth 0 pnt-2)
      ypnt-2 (nth 1 pnt-2)
      
      angl (atoi (angtos (angle pnt-ins pnt-2))) ; угол направления
);setq


;;;; рисуем вертикально, вверх от точки указания
(if (and (<= angl 135) (>= angl 45)); условие
	(setq x-pnt-ins (- x-pnt-ins 40)
				y-pnt-ins (+ y-pnt-ins 40)
	); setq
); if

;;;; рисуем горизонтально, влево от точки указания
(if (and (>= angl 135) (<= angl 225))
	(setq x-pnt-ins (- x-pnt-ins 460)
				;y-pnt-ins (+ y-pnt-ins 40)
	); setq
); if

;;;; рисуем вертикально, вниз от точки указания
(if (and (>= angl 225) (<= angl 315))
	(setq x-pnt-ins (- x-pnt-ins 40)
				y-pnt-ins (- y-pnt-ins 297)
	); setq
); if

(setq pnt-ins (list x-pnt-ins y-pnt-ins)
			pnt-ins-stamp (list (+ x-pnt-ins 455) (+ y-pnt-ins 5))
			pnt-ins-head (list (+ x-pnt-ins 60) (+ y-pnt-ins 292))
      pnt-txt32 (list (+ x-pnt-ins 445) (+ y-pnt-ins 25))
);setq

(setvar "osmode" 0)

(command "_insert" "а3-спдс-лист-1-гориз" "_X" 1 "_Y" 1 "_Z" 1 "_R" 0 pnt-ins) ; если блок существует
(command "_insert" "зс-шапка" "_X" 1 "_Y" 1 "_Z" 1 "_R" 0 pnt-ins-head) ; если блок существует
(command "_insert" block-name "_X" 1 "_Y" 1 "_Z" 1 "_R" 0 pnt-ins-stamp) ; вставка блока

(setq txt-32
  (entmakex
    (list
      '(0 . "TEXT")
      '(100 . "AcDbEntity")
      '(100 . "AcDbText")
       (cons 10 pnt-txt32) ;нач точка текста
       (cons 11 pnt-txt32) ;нач точка текста
      '(1 . "**") ;содержание текста
      '(40 . 3.5) ;высота текста
      '(41 . 1) ;растяжение текста
      '(50 . 0) ;поворот текста
      '(72 . 1) ;гориз выравнивание текста
      '(73 . 2) ;верт выравнивание текста
      '(370 . -1) ; толщина текста
       (cons 7 (getvar "textstyle")) ; стиль текста
    );list
  );entmakex
);setq

(vla-endundomark adoc)

(setvar "osmode" 6199)

(setvar "orthomode" 1)

(princ)
)
;/////// *************************************************************//////////////////////////////////////////////////////////////////////
;/////// КОНЕЦ ПРОГРАММЫ                                              //////////////////////////////////////////////////////////////////////
;/////// *************************************************************//////////////////////////////////////////////////////////////////////
