
;///////////////// Обозначения контактов //////////////////////////
(defun c:04-designations-contacts

( / adoc circle-1 hatch-1 pnt-1 pnt-2 pnt-3 pnt-ins pnt-txt-l pnt-txt-r txt-1 txt-2 xpnt-ins ypnt-ins)

(setvar "cmdecho" 0)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object)))); start undo

(if	(= (tblsearch "block" "точка-1мм") nil)
		(progn ; создаем блок
			(setvar "osmode" 0)
			(command "_circle" '(0 0) 0.5)
			(setq circle-1 (entlast))
			(command "_hatch" "solid" circle-1 "")
			(setq hatch-1 (entlast))
			(command "_block" "точка-1мм" '(0 0) circle-1 hatch-1 "")
		);progn
);if

(setvar "osmode" 6199)
(setq	pnt-ins (getpoint "\nУкажите точку вставки\n")
      xpnt-ins (nth 0 pnt-ins)
      ypnt-ins (nth 1 pnt-ins)
			pnt-1 (list (- xpnt-ins 3) ypnt-ins)
			pnt-txt-l (list xpnt-ins (- ypnt-ins 0.5))
			pnt-txt-r (list (+ xpnt-ins 12) (- ypnt-ins 0.5))
			pnt-2 (list (+ xpnt-ins 12) ypnt-ins)
			pnt-3 (list (+ xpnt-ins 15) ypnt-ins)
);setq

(setvar "osmode" 0)
(command "_insert" "точка-1мм" "_x" 1 "_y" 1 "_z" 1 "_r" 0 pnt-ins)
(command "_insert" "точка-1мм" "_x" 1 "_y" 1 "_z" 1 "_r" 0 pnt-2)

(command "_line" pnt-ins pnt-1 "")
(command "_line" pnt-2 pnt-3 "")

(setq txt-1
  (entmakex
    (list
      '(0 . "TEXT")
      '(100 . "AcDbEntity")
      '(100 . "AcDbText")
       (cons 10 pnt-txt-l) ; нач точка текста
       (cons 11 pnt-txt-l) ; нач точка текста
      '(1 . "****") ; содержание текста
      '(40 . 2.5) ; высота текста
      '(41 . 1) ; растяжение текста
      '(50 . 0) ; поворот текста
      '(72 . 1) ; гориз выравнивание текста
      '(73 . 3) ; верт выравнивание текста
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
       (cons 10 pnt-txt-r) ; нач точка текста
       (cons 11 pnt-txt-r) ; нач точка текста
      '(1 . "****") ; содержание текста
      '(40 . 2.5) ; высота текста
      '(41 . 1) ; растяжение текста
      '(50 . 0) ; поворот текста
      '(72 . 1) ; гориз выравнивание текста
      '(73 . 3) ; верт выравнивание текста
      '(370 . -1) ; толщина текста
       (cons 7 (getvar "textstyle")) ; стиль текста
    ) ; end of list
  ); entmakex
);setq

(vla-endundomark adoc)
(setvar "osmode" 6199)
(setvar "orthomode" 1)
(setvar "cmdecho" 1)
(princ)
)
;/////////////////////// конец программы //////////////////////////////////////////////////////////////////////