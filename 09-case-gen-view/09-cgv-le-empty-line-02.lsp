;/////////////////// рисование пустой строки перечня элементов, общего вида //////////////////////////////////
(defun 09-cgv-le-empty-line-02

( / line-1 line-10 line-11 line-12 line-2 line-3 line-4 line-5 line-6 line-7 line-8 line-9)

(command "_.undo" "_begin")

(setvar "osmode" 0)
(setvar "cmdecho" 0)

(if (= (tblsearch "block" "овш-пэ-пустая-строка" ) nil)
	(progn				
		(setvar	"OSMODE" 0)
		(setvar "CELWEIGHT" 60)
		(command "_line" '(-15 0) '(-15 -8) ""); рисование вертикальных отрезков толщиной 0,6 мм
		(setq line-1 (entlast))
		(command "_line" '(0 0) '(0 -8) "")
		(setq line-2 (entlast))
		(command "_line" '(60 0) '(60 -8) "")
		(setq line-3 (entlast))
		(command "_line" '(125 0) '(125 -8) "")
		(setq line-4 (entlast))
		(command "_line" '(135 0) '(135 -8) "")
		(setq line-5 (entlast))
		(command "_line" '(150 0) '(150 -8) "")
		(setq line-6 (entlast))
						
		(setvar "CELWEIGHT" -1)
		(command "_line" '(-15 -8) '(0 -8) ""); рисование горизонтальных отрезков толщиной по слою
		(setq line-7 (entlast))
		(command "_line" '(0 -8) '(60 -8) "")
		(setq line-8 (entlast))
		(command "_line" '(60 -8) '(125 -8) "")
		(setq line-9 (entlast))
		(command "_line" '(125 -8) '(135 -8) "")
		(setq line-10 (entlast))
		(command "_line" '(135 -8) '(150 -8) "")
		(setq line-11 (entlast))
		(command "_line" '(150 -8) '(170 -8) "")
		(setq line-12 (entlast))
		
		(command "_block" "овш-пэ-пустая-строка"
		                  '(0 0) 
		                  line-1 line-2 line-3 line-4 line-5 line-6 line-7 line-8 line-9 line-10
		                  line-11 line-12 "")
  );progn
);if

(setvar "osmode" 0)
(setvar "cmdecho" 0)

(command "_.undo" "_end")
(princ)
)
;///////////////////////////////////// конец программы ///////////////////////////////////