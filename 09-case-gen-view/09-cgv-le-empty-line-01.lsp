;/////////////////// рисование пустой строки перечня элементов, общего вида //////////////////////////////////
(defun c:09-cgv-le-empty-line-01

( / celwght_old line-1 line-10 line-11 line-12 line-2 line-3 line-4 line-5
line-6 line-7 line-8 line-9 osmode_old pnt_ins1)

(command "_.undo" "_begin")

(setvar "osmode" 0)
(setvar "cmdecho" 0)

(09-cgv-le-empty-line-02)

(setvar "cmdecho" 0)
(setvar "osmode" 6199)

(setq	pnt-ins (getpoint "\nУкажите точку вставки\n")
			xpnt-ins (nth 0 pnt-ins)
			ypnt-ins (nth 1 pnt-ins)
			pnt-1 (getpoint "\nУкажите точку направления\n")
			ypnt-1 (nth 1 pnt-1)
			y-tmp nil		
);setq

(setq	drctn-y (- ypnt-ins ypnt-1));направление вставки по вертикали

(if	(> drctn-y 0) (setq dlt-y-rctgl -8));if

(if	(< drctn-y 0)
  (setq y-tmp ypnt-ins
				ypnt-ins ypnt-1
				ypnt-1 y-tmp
				dlt-y-rctgl -8
	);setq
);if

(setq nmbr-ln (fix (/ drctn-y 8)));setq

(if	(< (abs nmbr-ln) 1) (setq nmbr-ln 1));if

(repeat (abs nmbr-ln)
	(progn
		(setq pnt-ins (list xpnt-ins ypnt-ins));setq
		(setvar "osmode" 0)
		(command "_insert" "овш-пэ-пустая-строка" "_X" 1 "_Y" 1 "_Z" 1 "_R" 0 pnt-ins)
		(setq ypnt-ins (+ ypnt-ins dlt-y-rctgl));setq
	);progn
);repeat

(command "_.undo" "_end")
(setvar "osmode" 6199)
(princ)
)
;///////////////////////////////////// конец программы ///////////////////////////////////

