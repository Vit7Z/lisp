;///////////////////рисование пустой строки перечня элементов//////////////////////////////////
(defun 100-le-empty-line-02

( / adoc dlt-y-rctgl drctn-y line-1 line-11 line-2 line-3 line-4 line-5 line-6 line-7 nmbr-ln pnt-1 pnt-ins xpnt-ins ypnt-1 ypnt-ins y-tmp)

(setvar	"OSMODE" 0)
(setvar	"cmdecho" 0)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));undo

(setvar "osmode" 0)
(if (= (tblsearch "block" "пэ-пустая-строка" ) nil)
	(progn				; если данного блока нет
		(setvar "CELWEIGHT" 60)
		(command "_line" '(-20 0) '(-20 -8) ""); рисование вертикальных отрезков толщиной 0,6 мм
		(setq line-1 (entlast))
		(command "_line" '(0 0) '(0 -8) "")
		(setq line-11 (entlast))
		(command "_line" '(110 0) '(110 -8) "")
		(setq line-2 (entlast))
		(command "_line" '(120 0) '(120 -8) "")
		(setq line-3 (entlast))
		(setvar "CELWEIGHT" -1)
		(command "_line" '(-20 -8) '(0 -8) ""); рисование горизонтальных отрезков толщиной по слою
		(setq line-4 (entlast))
		(command "_line" '(0 -8) '(110 -8) "")
		(setq line-5 (entlast))
		(command "_line" '(110 -8) '(120 -8) "")
		(setq line-6 (entlast))
		(command "_line" '(120 -8) '(165 -8) "")
		(setq line-7 (entlast))
				
		(command "_block" "пэ-пустая-строка" '(0 0) line-1 line-2 line-3 line-4 line-5 line-6 line-7 line-11 "")
	); end progn
); end if

(setvar "ORTHOMODE" 1)
(setvar "cmdecho" 1)
(setvar "osmode" 6199)
(vla-endundomark adoc)
(princ)
)
;///////////////////////////////////// конец программы ///////////////////////////////////