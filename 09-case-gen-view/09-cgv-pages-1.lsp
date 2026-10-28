;/////// ************************************************************ //////////////////////////////////////////////////////////////////////
;/////// первый лист овш                                              //////////////////////////////////////////////////////////////////////
;/////// ************************************************************ //////////////////////////////////////////////////////////////////////
(defun 09-cgv-pages-1

(block-name / adoc angl pnt-2 pnt-ins pnt-ins-head pnt-ins-stamp pnt-txt30 pnt-txt32 rctn-1 rctn-2 rctn-3 rctn-4 rctn-5 rctn-6 txt-1 txt-2 
txt-3 txt-30 txt-32 txt-4 txt-5 txt-6 xpnt-2 x-pnt-ins ypnt-2 y-pnt-ins)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

;создаем шапку перечня составных частей
(if (= (tblsearch "block" "чро-шапка-спцф" ) nil)
	(progn				; если данного блока нет
		(setvar	"OSMODE" 0)						
		(setvar	"CLAYER" "0")
		(setvar "CELWEIGHT" 60)
		(command "_RECTANGLE" '(-185 0) '(-170 -15))
		(setq rctn-1 (entlast))
		(command "_RECTANGLE" '(-170 0) '(-110 -15))
		(setq rctn-2 (entlast))
		(command "_RECTANGLE" '(-110 0) '(-45 -15))
		(setq rctn-3 (entlast))
		(command "_RECTANGLE" '(-45 0) '(-35 -15))
		(setq rctn-4 (entlast))	
		(command "_RECTANGLE" '(-35 0) '(-20 -15))
		(setq rctn-5 (entlast))
		(command "_RECTANGLE" '(-20 0) '(0 -15))
		(setq rctn-6 (entlast))	
						
		(setvar "CELWEIGHT" -1) 
		(setvar "TEXTSTYLE" "Standard")
		(command "_TEXT" "_MC" '(-177.5 -7.5) 2.5 0 "Поз.")
		(setq txt-1 (entlast))
		(command "_TEXT" "_MC" '(-140 -7.5) 2.5 0 "Обозначение")
		(setq txt-2 (entlast))
		(command "_TEXT" "_MC" '(-77.5 -7.5) 2.5 0 "Наименование")
		(setq txt-3 (entlast))
		(command "_TEXT" "_MC" '(-40 -7.5) 2.5 0 "Кол.")
		(setq txt-4 (entlast))
		(command "_MTEXT" '(-35 0) "_H" 2.5 "_j" "_mc" '(-20 -15) "Масса, ед., кг." "")
		(setq txt-5 (entlast))
		(command "_MTEXT" '(-20 0) "_H" 2.5 "_j" "_mc" '(0 -15) "Приме- чание" "")
		(setq txt-6 (entlast))
		(command "_block" "чро-шапка-спцф"  '(0 0) rctn-1 rctn-2 rctn-3 rctn-4 rctn-5 rctn-6 txt-1 txt-2 txt-3 txt-4 txt-5 txt-6 "")
  ); end progn
); end if

(setvar "osmode" 6199)

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
	(setq x-pnt-ins (- x-pnt-ins 250)
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
			pnt-ins-stamp (list (+ x-pnt-ins 245) (+ y-pnt-ins 5))
			pnt-ins-head (list (+ x-pnt-ins 245) (+ y-pnt-ins 292))
      pnt-txt30 (list (+ x-pnt-ins 160) (+ y-pnt-ins 12.5))
      pnt-txt32 (list (+ x-pnt-ins 235) (+ y-pnt-ins 25))
);setq

(setvar "osmode" 0)

(command "_insert" "а4-спдс-лист-1-верт" "_X" 1 "_Y" 1 "_Z" 1 "_R" 0 pnt-ins) ; если блок существует
(command "_insert" "чро-шапка-спцф" "_X" 1 "_Y" 1 "_Z" 1 "_R" 0 pnt-ins-head) ; если блок существует
(command "_insert" block-name "_X" 1 "_Y" 1 "_Z" 1 "_R" 0 pnt-ins-stamp) ; вставка блока

(setq txt-30
  (entmakex
    (list
      '(0 . "MTEXT")
      '(100 . "AcDbEntity")
      '(100 . "AcDbMText")
       (cons 10 pnt-txt30) ; нач точка текста
      '(1 . "*********. Общий вид") ; содержание текста
      '(40 . 2.5) ; высота текста
      '(41 . 70) ; растяжение текста
      '(42 . 70) ; ширина текста
      '(71 . 5) ; гориз выравнивание текста
      '(370 . -1) ; толщина текста
       (cons 7 (getvar "textstyle")) ; стиль текста
    ) ; end of list
  ); entmakex
); setq

(setq txt-32
  (entmakex
    (list
      '(0 . "TEXT")
      '(100 . "AcDbEntity")
      '(100 . "AcDbText")
       (cons 10 pnt-txt32) ; нач точка текста
       (cons 11 pnt-txt32) ; нач точка текста
      '(1 . "**") ; содержание текста
      '(40 . 3.5) ; высота текста
      '(41 . 1) ; растяжение текста
      '(50 . 0) ; поворот текста
      '(72 . 1) ; гориз выравнивание текста
      '(73 . 2) ; верт выравнивание текста
      '(370 . -1) ; толщина текста
       (cons 7 (getvar "textstyle")) ; стиль текста
    ) ; end of list
  ); entmakex
); setq

(vla-endundomark adoc)

(setvar "osmode" 6199)

(setvar "orthomode" 1)

(princ)
(gc)
)
;/////// конец программы /////////////////////////////////////////////////////////////////
