;///////////////////рисование пустой строки перечн€ элементов//////////////////////////////////
(defun c:100-le-empty-line-01

( / adoc dlt-y-rctgl drctn-y line-1 line-11 line-2 line-3 line-4 line-5 line-6 line-7 nmbr-ln pnt-1 pnt-ins xpnt-ins ypnt-1 ypnt-ins y-tmp)

(setvar	"OSMODE" 0)
(setvar	"cmdecho" 0)
(vl-load-com)
(vla-startundomark
	(setq adoc (vla-get-activedocument (vlax-get-acad-object)))
);undo

(if (= (tblsearch "block" "пэ-пуста€-строка" ) nil)
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
				
		(command "_block" "пэ-пуста€-строка" '(0 0) line-1 line-2 line-3 line-4 line-5 line-6 line-7 line-11 "")
	); end progn
); end if
(setvar "osmode" 6199)

(setq	pnt-ins (getpoint "\n”кажите точку вставки\n")
			xpnt-ins (nth 0 pnt-ins)
			ypnt-ins (nth 1 pnt-ins)
			pnt-1 (getpoint "\n”кажите точку направлени€\n")
			ypnt-1 (nth 1 pnt-1)
			y-tmp nil		
);setq

(setq	drctn-y (- ypnt-ins ypnt-1);направление вставки по вертикали
);setq

(if	(> drctn-y 0)
  (setq dlt-y-rctgl -8
  );setq
);if

(if	(< drctn-y 0)
  (setq y-tmp ypnt-ins
				ypnt-ins ypnt-1
				ypnt-1 y-tmp
				dlt-y-rctgl -8
	);setq
);if

(setq nmbr-ln (fix (/ drctn-y 8))
);setq

(if	(< (abs nmbr-ln) 1)
  (setq nmbr-ln 1
  );setq
);if

(repeat (abs nmbr-ln)
	(progn
		(setq pnt-ins (list xpnt-ins ypnt-ins)
		);setq
		(setvar "osmode" 0)
		(command "_insert" "пэ-пуста€-строка" "_X" 1 "_Y" 1 "_Z" 1 "_R" 0 pnt-ins)
		(setq ypnt-ins (+ ypnt-ins dlt-y-rctgl)
		);setq
	);progn
);repeat

(setvar "ORTHOMODE" 1)
(setvar "cmdecho" 1)
(setvar "osmode" 6199)
(vla-endundomark adoc)
(princ)
)
;///////////////////////////////////// конец программы ///////////////////////////////////
