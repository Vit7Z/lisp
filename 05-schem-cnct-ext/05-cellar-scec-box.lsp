;;; /////// шкаф для подвала ССВП /////////////////////////////
(defun c:05-cellar-scec-box

( / adoc obj-select pnt-ins pnt-txt str-01 txt-1 x-pnt y-pnt)

(vl-load-com)

(vla-startundomark
  (setq adoc (vla-get-activedocument (vlax-get-acad-object)));setq
);undo

(setvar "cmdecho" 0)
(setvar "osmode" 6199)
(setvar "textstyle" "standard")

(setq	obj-select (car (entsel "\nВыберите надпись\n"))
			str-01 (cdr (assoc 1 (entget obj-select)))
			
			pnt-ins (getpoint "\nУкажите точку вставки строк\n")
			x-pnt (nth 0 pnt-ins)
			y-pnt (nth 1 pnt-ins)
			
			pnt-txt (list (- x-pnt 21) (- y-pnt 4))		
);setq
			
(setvar "osmode" 0)

(command "_RECTANGLE" (list (- x-pnt 22) y-pnt) (list x-pnt (- y-pnt 8)))

(setq txt-1
  (entmakex
    (list
      '(0 . "MTEXT")
      '(100 . "AcDbEntity")
      '(100 . "AcDbMText")
       (cons 10 pnt-txt) ; нач точка текста
       (cons 1 str-01) ; содержание текста
      '(40 . 2.5) ; высота текста
      '(41 . 21) ; растяжение текста
      '(42 . 21) ; ширина текста
      '(71 . 4)   ; гориз выравнивание текста
      '(72 . 1) 
      '(370 . -1) ; толщина текста
       (cons 7 (getvar "textstyle")) ; стиль текста
    );list
  );entmakex
);setq

(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(vla-endundomark adoc)
(princ)
)
;;; //////////////////////////// конец программы /////////////////////////////
