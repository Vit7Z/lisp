;/////// ************************************************************ /////////////////////////////////////////////////////////////////////////////////////////////////
;/////// выбор ссылочных и прилагаемых документов, са                 /////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ /////////////////////////////////////////////////////////////////////////////////////////////////
(defun c:02-reference-doc-03-ins-empty-line

( / adoc dlt-y-rctgl drctn-y nmbr-ln pnt-1 pnt-ins xpnt-ins ypnt-1 ypnt-ins y-tmp)

;устанавливаем системные переменные
(setvar	"OSMODE" 6199)
(setvar	"CMDECHO" 0)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(if (= (tblsearch "block" "вед-осн-компл-рч-строка" ) nil)
	(progn				; если данного блока нет
		(setvar	"OSMODE" 0)
		(setvar	"CLAYER" "0")
		(setvar "CELWEIGHT" 60)
		(command "_.line" '(-60 0) '(-60 -8) "")
		(setq lin-1 (entlast))
		(command "_.line" '(0 0) '(0 -8) "")
		(setq lin-2 (entlast))
		(command "_.line" '(95 0) '(95 -8) "")
		(setq lin-3 (entlast))
		(command "_.line" '(125 0) '(125 -8) "")
		(setq lin-4 (entlast))
		
		(setvar "CELWEIGHT" -1)
		(command "_.line" '(-60 -8) '(0 -8) "")
		(setq lin-5 (entlast))
		(command "_.line" '(0 -8) '(95 -8) "")
		(setq lin-6 (entlast))
		(command "_.line" '(95 -8) '(125 -8) "")
		(setq lin-7 (entlast))
				
		(command "_block" "вед-осн-компл-рч-строка" '(0 0)  lin-1 lin-2 lin-3 lin-4 lin-5 lin-6 lin-7 "")
	);progn
);if

;только строка ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

(setvar	"osmode" 6199)
		
(setq	pnt-ins (getpoint "\nУкажите точку вставки\n")
			xpnt-ins (nth 0 pnt-ins)
			ypnt-ins (nth 1 pnt-ins)
			pnt-1 (getpoint "\nУкажите точку направления\n")
			ypnt-1 (nth 1 pnt-1)
			y-tmp nil		
			dlt-y-rctgl -8
);setq
		
(setq	drctn-y (- ypnt-ins ypnt-1));направление вставки по вертикали

(if	(< drctn-y 0)
	(setq y-tmp ypnt-ins
				ypnt-ins ypnt-1
				ypnt-1 y-tmp
	);setq
);if
		
(setq nmbr-ln (fix (/ drctn-y 8)));setq
		
(if	(< (abs nmbr-ln) 1)
	(setq nmbr-ln 1);setq
);if
		
(repeat (abs nmbr-ln)
	(setq pnt-ins (list xpnt-ins ypnt-ins));setq
	(setvar "osmode" 0)
	(command "_insert" "вед-осн-компл-рч-строка" "_X" 1 "_Y" 1 "_Z" 1 "_R" 0 pnt-ins)
	(command "_TEXT" "_MC" (list (- xpnt-ins 30) (- ypnt-ins 4)) 2.5 0 "****")
	(command "_TEXT" "_ML" (list (+ xpnt-ins 1) (- ypnt-ins 4)) 2.5 0 "****")
	(setq ypnt-ins (+ ypnt-ins dlt-y-rctgl));setq
);repeat

(vla-endundomark adoc)

(setvar "CMDECHO" 1)
(setvar	"ORTHOMODE" 1)
(setvar	"OSMODE" 6199)
(princ)
)
;/////// *************************************************************///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// КОНЕЦ ПРОГРАММЫ                                              ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// *************************************************************///////////////////////////////////////////////////////////////////////////////////////////////////////////

