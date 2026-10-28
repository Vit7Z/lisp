;///////////////////рисование пустой строки заказной спецификации//////////////////////////////////
(defun c:05-table-ssipvp-str

( / adoc dlt-y-rctgl drctn-y line-1 line-10 line-11 line-12 line-13 line-14 line-15 line-16 line-17 line-18 line-19 line-2 line-20 line-21 line-3 line-4 line-5 line-6 line-7 line-8 line-9 nmbr-ln pnt-1 pnt-ins xpnt-ins ypnt-1 
ypnt-ins y-tmp)

(setvar	"cmdecho" 0)

(if (= (tblsearch "block" "ссвп-таблица-ссипвп-строка" ) nil)
	(progn				; если данного блока нет
		(setvar	"OSMODE" 0)
		(setvar "CELWEIGHT" 60)						; рисование вертикальных отрезков толщиной 0,6 мм
		(command "_line" '(0 0) '(0 -8) "")
		(setq line-1 (entlast))
		(command "_line" '(45 0) '(45 -8) "")
		(setq line-2 (entlast))
		(command "_line" '(90 0) '(90 -8) "")
		(setq line-3 (entlast))
		(command "_line" '(150 0) '(150 -8) "")
		(setq line-4 (entlast))
		(command "_line" '(200 0) '(200 -8) "")
		(setq line-5 (entlast))
		(command "_line" '(220 0) '(220 -8) "")
		(setq line-6 (entlast))
		(command "_line" '(240 0) '(240 -8) "")
		(setq line-7 (entlast))
		(command "_line" '(290 0) '(290 -8) "")
		(setq line-8 (entlast))
		(command "_line" '(310 0) '(310 -8) "")
		(setq line-18 (entlast))
		(command "_line" '(330 0) '(330 -8) "")
		(setq line-19 (entlast))
		
		(setvar "CELWEIGHT" -1)			; рисование горизонтальных отрезков толщиной по слою
		(command "_line" '(-25 -8) '(0 -8) "")
		(setq line-9 (entlast))
		(command "_line" '(0 -8) '(45 -8) "")
		(setq line-10 (entlast))
		(command "_line" '(45 -8) '(90 -8) "")
		(setq line-11 (entlast))
		(command "_line" '(90 -8) '(150 -8) "")
		(setq line-12 (entlast))
		(command "_line" '(150 -8) '(200 -8) "")
		(setq line-21 (entlast))			
		(command "_line" '(200 -8) '(220 -8) "")
		(setq line-13 (entlast))
		(command "_line" '(220 -8) '(240 -8) "")
		(setq line-14 (entlast))
		(command "_line" '(240 -8) '(290 -8) "")
		(setq line-15 (entlast))
		(command "_line" '(290 -8) '(310 -8) "")
		(setq line-16 (entlast))
		(command "_line" '(310 -8) '(330 -8) "")
		(setq line-17 (entlast))
		(command "_line" '(330 -8) '(370 -8) "")
		(setq line-20 (entlast))
		
		(command "_block" "ссвп-таблица-ссипвп-строка" '(0 0)	line-1 line-2 line-3 line-4 line-5 line-6 line-7  line-8 line-9 line-10	line-11 line-12 line-13 line-14 line-15 line-16 line-17 line-18 line-19 line-20 line-21
		"")
		); end progn
); end if

(setvar	"OSMODE" 6199)

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
		(command "_insert" "ссвп-таблица-ссипвп-строка" "_X" 1 "_Y" 1 "_Z" 1 "_R" 0 pnt-ins)
		(setq ypnt-ins (+ ypnt-ins dlt-y-rctgl)
		);setq
	);progn
);repeat

(setvar "ORTHOMODE" 1)
(setvar "cmdecho" 1)
(setvar "osmode" 6199)
(vla-endundomark adoc)
(princ)


(setvar "osmode" 6199)
(setvar	"cmdecho" 1)
(princ)
)
;///////////////////////////////////// конец программы ///////////////////////////////////
