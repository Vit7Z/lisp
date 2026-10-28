;/////// ************************************************************ //////////////////////////////
;/////// ведомость ссылочных и прилагаемых документов, строка         //////////////////////////////
;/////// ************************************************************ //////////////////////////////
(defun 02-main-sets-working-drawings-05-set-empty-line

( / lin-1 lin-2 lin-3 lin-4 lin-5 lin-6 lin-7)

;устанавливаем системные переменные
(setvar	"CMDECHO" 0)

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

(setvar "CMDECHO" 1)
(setvar	"ORTHOMODE" 1)
(setvar	"OSMODE" 6199)
(princ)
)
;/////// *************************************************************//////////////////////////////
;/////// КОНЕЦ ПРОГРАММЫ                                              //////////////////////////////
;/////// *************************************************************//////////////////////////////