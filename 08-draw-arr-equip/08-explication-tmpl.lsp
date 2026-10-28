;/////////////////////////////////////////////////////////////////////////////////////////
;/////// шаблон строки экспликации ///////////////////////////////////////////////////////
;/////////////////////////////////////////////////////////////////////////////////////////

(defun c:08-explication-tmpl

( / crnt-celweight ln-1 ln-2 ln-3 ln-4 ln-5 ln-6 ln-7 ln-8 ln-9 pnt-1 pnt-ins pnt-txt1 pnt-txt2 pnt-txt3 pnt-txt4 xpnt-ins ypnt-ins)

(command "_.undo" "_begin")
(setq crnt-celweight (getvar "CELWEIGHT"));setq
(setvar "osmode" 0)
(if (= (tblsearch "block" "экспл-пустая-строка" ) nil)
	(progn
		(setq pnt-1 (list 0 0));setq
		
		(setvar "CELWEIGHT" 60)
		
		(command "_.LINE" (list -15 0) (list -15 -8) "")
		(setq ln-1 (entlast))
		(command "_.LINE" (list 0 0) (list 0 -8) "")
		(setq ln-2 (entlast))
		(command "_.LINE" (list 80 0) (list 80 -8) "")
		(setq ln-3 (entlast))
		(command "_.LINE" (list 100 0) (list 100 -8) "")
		(setq ln-4 (entlast))
		(command "_.LINE" (list 110 0) (list 110 -8) "")
		(setq ln-5 (entlast))
		
		(setvar "CELWEIGHT" -1)
		
		(command "_.LINE" (list -15 -8) (list 0 -8) "")
		(setq ln-6 (entlast))
		(command "_.LINE" (list 0 -8) (list 80 -8) "")
		(setq ln-7 (entlast))
		(command "_.LINE" (list 80 -8) (list 100 -8) "")
		(setq ln-8 (entlast))
		(command "_.LINE" (list 100 -8) (list 110 -8) "")
		(setq ln-9 (entlast))

		(command "_block" "экспл-пустая-строка" '(0 0) ln-1 ln-2 ln-3 ln-4 ln-5 ln-6
															ln-7 ln-8 ln-9	"")
	);progn
);if

(setvar "osmode" 6199)

(setq pnt-ins (getpoint "\nУкажите точку вставки\n")
			xpnt-ins (nth 0 pnt-ins)
			ypnt-ins (nth 1 pnt-ins)
			pnt-txt1 (list (- xpnt-ins 7.5) (- ypnt-ins 4))
			pnt-txt2 (list (+ xpnt-ins 1) (- ypnt-ins 4))
			pnt-txt3 (list (+ xpnt-ins 90) (- ypnt-ins 4))
			pnt-txt4 (list (+ xpnt-ins 105) (- ypnt-ins 4))
);setq

(setvar "osmode" 0)

(command "_insert" "экспл-пустая-строка" "_X" 1 "_Y" 1 "_Z" 1 "_R" 0 pnt-ins)

(command "_TEXT" "_MC" pnt-txt1 2.5 0 "***")
(command "_TEXT" "_ML" pnt-txt2 2.5 0 "***")
(command "_TEXT" "_MC" pnt-txt3 2.5 0 "***")
(command "_TEXT" "_MC" pnt-txt4 2.5 0 "***")

(command "_.undo" "_end")
(setvar "osmode" 6199)
(princ)
)
;/////////////////////////////////////////////////////////////////////////////////////////
;/////// конец программы /////////////////////////////////////////////////////////////////
;/////////////////////////////////////////////////////////////////////////////////////////
