;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ведомость основных комплектов рабочих чертежей               ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun c:02-main-sets-working-drawings-03-ins-empty-line

( / adoc dlt-y-rctgl drctn-y lin-1 lin-2 lin-3 lin-4 lin-5 lin-6 lin-7 nmbr-ln pnt-1 pnt-ins xpnt-ins ypnt-1 ypnt-ins y-tmp)

(setvar	"cmdecho" 0)
(setvar	"osmode" 6199)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));undo

(load "d:\\yandexdisk\\my-sprt\\02-design\\02-main-sets-working-drawings-05-set-empty-line.lsp") (02-main-sets-working-drawings-05-set-empty-line) ;;;;;;;вед-осн-компл-рч-строка

(setq	pnt-ins (getpoint "\nУкажите точку вставки\n")
			xpnt-ins (nth 0 pnt-ins)
			ypnt-ins (nth 1 pnt-ins)
			pnt-1 (getpoint "\nУкажите точку направления\n")
			ypnt-1 (nth 1 pnt-1)
			y-tmp nil		
			dlt-y-rctgl -8
			drctn-y (- ypnt-ins ypnt-1)
);setq

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

(setvar "osmode" 6199)
(setvar "cmdecho" 1)

(vla-endundomark adoc)

(gc)

(princ)
)
;/////// *************************************************************///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// КОНЕЦ ПРОГРАММЫ                                              ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// *************************************************************///////////////////////////////////////////////////////////////////////////////////////////////////////////
