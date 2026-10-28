;/////// ************************************************************ //////////////////////////////////////////////////////////////////
;/////// рисование сальника                                           //////////////////////////////////////////////////////////////////
;/////// ************************************************************ //////////////////////////////////////////////////////////////////

(defun c:05-cbl-eppln 

( / angl angl-block line-1 line-2 line-3 line-4 line-5 pnt-drct pnt-ins)

(setvar "osmode" 6199)
(setvar "cmdecho" 0)

(command "_.undo" "_begin")	
	
(if (= (tblsearch "block" "ссвп-сальник") nil)
	(progn												
		(setvar "osmode" 0)
		(command "_line" '(-2 0) '(2 0) "")
		(setq line-1 (entlast))
		(command "_line" '(2 0) '(1 2) "")
		(setq line-2 (entlast))
		(command "_line" '(1 2) '(-1 2) "")
		(setq line-3 (entlast))
		(command "_line" '(-1 2) '(-2 0) "")
		(setq line-4 (entlast))
		(command "_line" '(0 0) '(0 2) "")
		(setq line-5 (entlast))
		(command "_block" "ссвп-сальник" '(0 0) line-1 line-2 line-3 line-4 line-5 "");command
	);progn
);if

(while (/= (setq pnt-ins (getpoint "\n”кажите точку вставки\n")) nil)
	(setq pnt-drct (getpoint "\n”кажите направление знака\n")
				angl (atoi (angtos (angle pnt-ins pnt-drct))) ; угол вставки
	);setq

	(setvar "osmode" 0)
	
	(cond																			 
		((and (<= angl 135) (>= angl 45)) ;сальник вверху
			(setq angl-block 0)							
		);условие
																			 
		((and (<= angl 225) (>= angl 135)) ;сальник влево
		 (setq angl-block 90)						 
		);условие
																			 
		((and (<= angl 315) (>= angl 225)) ;сальник вниз
			(setq angl-block 180)						 
		);условие
		
		(setq angl-block 270) ;сальник вправо, по умочанию

	);end cond
																			 
	(command "_insert" "ссвп-сальник" "_x" 1 "_y" 1 "_z" 1 "_r" angl-block pnt-ins)
	(setvar "osmode" 6199)
);while

(command "_.undo" "_end")

(setvar "cmdecho" 1)
(gc)
(princ)
)
;;; /////////////////////// конец программы /////////////////////////////////