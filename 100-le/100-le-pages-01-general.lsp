;;;;;;;/////// создание страниц перечня элементов //////////////////////////////
;;;;;;;/////////////////////////////////////////////////////////////////////////
(defun c:100-le-pages-01-general

( / adoc dcl-id draw-act rctn-1 rctn-2 rctn-3 rctn-4 txt-1 txt-2 txt-3 txt-4)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(setvar "textstyle" "standard")
(setvar "cmdecho" 0)
(setvar	"osmode" 6199)

(load "d:\\yandexdisk\\my-sprt\\01-formats\\01-formats-spds-02-page-1.lsp")

(load "d:\\yandexdisk\\my-sprt\\01-formats\\01-formats-spds-02-page-2.lsp")

(if (= (tblsearch "block" "пэ-шапка" ) nil);если данного блока нет
	(progn				
		(setvar	"CLAYER" "0")
		(setvar "CELWEIGHT" 60)
		(command "_RECTANGLE" '(-185 0) '(-165 -15))
		(setq rctn-1 (entlast))
		(command "_RECTANGLE" '(-165 0) '(-55 -15))
		(setq rctn-2 (entlast))
		(command "_RECTANGLE" '(-55 0) '(-45 -15))
		(setq rctn-3 (entlast))
		(command "_RECTANGLE" '(-55 0) '(0 -15))
		(setq rctn-4 (entlast))	
						
		(setvar "CELWEIGHT" -1)
		(command "_MTEXT" '(-180 0) "_H" 2.5 "_j" "_mc" '(-170 -15) "Поз. обозна- чение" "")
		(setq txt-1 (entlast))
		(command "_TEXT" "_MC" '(-110 -7.5) 2.5 0 "Наименование")
		(setq txt-2 (entlast))
		(command "_TEXT" "_MC" '(-50 -7.5) 2.5 0 "Кол.")
		(setq txt-3 (entlast))
		(command "_TEXT" "_MC" '(-22.5 -7.5) 2.5 0 "Примечание")
		(setq txt-4 (entlast))
				
		(command "_block" "пэ-шапка" '(0 0) rctn-1 rctn-2 rctn-3 rctn-4 txt-1 txt-2 txt-3 txt-4 "")
	);progn
);if

(if (< (setq dcl-id (load_dialog "dia-100-le-pages-01-general.dcl")) 0) ;ищем диалог
  (progn
    (alert "Не найден dcl-файл")
		(exit)
  );progn
);if

(if (not (new_dialog "dia_100_le_pages_01_general" dcl-id))
  (exit)
);if

(action_tile "but-01"
  (strcat "(setq draw-act \"but-01\")";setq
  				"(done_dialog)"
  );strcat
);action_tile

(action_tile "but-02"
  (strcat "(setq draw-act \"but-02\")";setq
  				"(done_dialog)"
  );strcat
);action_tile

(action_tile "but-03"
  (strcat "(setq draw-act \"but-03\")";setq
  				"(done_dialog)"
  );strcat
);action_tile

(action_tile "accept"
  (strcat "(done_dialog)");strcat
);action_tile

(start_dialog)
(unload_dialog dcl-id)

(cond 
	((= draw-act "but-01") (100-auto-le-page-1-a3))
	((= draw-act "but-02") (100-auto-le-page-1-a4))
	((= draw-act "but-03") (100-auto-le-page-2-a4))
);cond

(vla-endundomark adoc)

(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(gc)
(princ)

)
;;;;;;;/////// КОНЕЦ ПРОГРАММЫ /////////////////////////////////////////////////
;;;;;;;/////////////////////////////////////////////////////////////////////////


;;;;;;;/////// подпрограмма ////////////////////////////////////////////////////
;;;;;;;/////////////////////////////////////////////////////////////////////////
(defun 100-le-pages-01-general-a3

( / angl pnt-2 pnt-ins pnt-ins-head x-pnt-ins y-pnt-ins)

(setq data-format (list (cons 1 "а3-спдс-лист-1-гориз") 
												(cons 2 297) 
												(cons 3 420) 
												(cons 4 "Формат А3")) 
);setq

(01-formats-spds-02-page-1 data-format)

(setvar "cmdecho" 0)
(setvar	"osmode" 6199)

(setq pnt-ins (getpoint "\nУкажите точку вставки\n")
      x-pnt-ins (nth 0 pnt-ins)
      y-pnt-ins (nth 1 pnt-ins)      
      pnt-2 (getpoint "\nУкажите направление\n")      
      angl (atoi (angtos (angle pnt-ins pnt-2))) ;угол направления
);setq


;;;; рисуем вертикально, вверх от точки указания
(if (and (<= angl 135) (>= angl 45))
	(setq x-pnt-ins (- x-pnt-ins 40)
				y-pnt-ins (+ y-pnt-ins 40)
	);setq
);if

;;;; рисуем горизонтально, влево от точки указания
(if (and (>= angl 135) (<= angl 225))
	(setq x-pnt-ins (- x-pnt-ins 460)); setq
);if

;;;; рисуем вертикально, вниз от точки указания
(if (and (>= angl 225) (<= angl 315))
	(setq x-pnt-ins (- x-pnt-ins 40)
				y-pnt-ins (- y-pnt-ins 297)
	);setq
);if


(setq pnt-ins (list x-pnt-ins y-pnt-ins)
			pnt-ins-head (list (+ x-pnt-ins 455) (+ y-pnt-ins 292))
);setq

(setvar "osmode" 0)

(command "_insert" "а3-спдс-лист-1-гориз" "_X" 1 "_Y" 1 "_Z" 1 "_R" 0 pnt-ins) ; если блок существует
(command "_insert" "пэ-шапка" "_X" 1 "_Y" 1 "_Z" 1 "_R" 0 pnt-ins-head) ; если блок существует
	
(setvar "osmode" 6199)

(princ)
)
;;;;;;;/////// КОНЕЦ ПОДПРОГРАММЫ //////////////////////////////////////////////
;;;;;;;/////////////////////////////////////////////////////////////////////////


;;;;;;;/////// подпрограмма ////////////////////////////////////////////////////
;;;;;;;/////////////////////////////////////////////////////////////////////////

(defun 100-auto-le-page-1-a4

( / angl data-format pnt-2 pnt-ins pnt-ins-head x-pnt-ins y-pnt-ins)
		
(setq data-format (list (cons 1 "а4-спдс-лист-1-верт") 
												(cons 2 297) 
												(cons 3 210) 
												(cons 4 "Формат А4")) 
);setq

(01-formats-spds-02-page-1 data-format)
		
(setvar "cmdecho" 0)
(setvar	"osmode" 6199)

(setq pnt-ins (getpoint "\nУкажите точку вставки\n")
      x-pnt-ins (nth 0 pnt-ins)
      y-pnt-ins (nth 1 pnt-ins)
      
      pnt-2 (getpoint "\nУкажите направление\n")
      
      angl (atoi (angtos (angle pnt-ins pnt-2))) ;угол направления
);setq


;;;; рисуем вертикально, вверх от точки указания
(if (and (<= angl 135) (>= angl 45))
	(setq x-pnt-ins (- x-pnt-ins 40)
				y-pnt-ins (+ y-pnt-ins 40)
	); setq
); if

;;;; рисуем горизонтально, влево от точки указания
(if (and (>= angl 135) (<= angl 225))
	(setq x-pnt-ins (- x-pnt-ins 250)); setq
); if

;;;; рисуем вертикально, вниз от точки указания
(if (and (>= angl 225) (<= angl 315))
	(setq x-pnt-ins (- x-pnt-ins 40)
				y-pnt-ins (- y-pnt-ins 297)
	); setq
); if


(setq pnt-ins (list x-pnt-ins y-pnt-ins)
			pnt-ins-head (list (+ x-pnt-ins 245) (+ y-pnt-ins 292))
);setq

(setvar "osmode" 0)

(command "_insert" "а4-спдс-лист-1-верт" "_X" 1 "_Y" 1 "_Z" 1 "_R" 0 pnt-ins) ; если блок существует
(command "_insert" "пэ-шапка" "_X" 1 "_Y" 1 "_Z" 1 "_R" 0 pnt-ins-head) ; если блок существует
	
(setvar "osmode" 6199)

(princ)
)
;;;;;;;/////// КОНЕЦ ПОДПРОГРАММЫ //////////////////////////////////////////////
;;;;;;;/////////////////////////////////////////////////////////////////////////


;;;;;;;/////// подпрограмма ////////////////////////////////////////////////////
;;;;;;;/////////////////////////////////////////////////////////////////////////

(defun 100-auto-le-page-2-a4

( / data-format pnt-ins pnt-ins-head x-pnt-ins y-pnt-ins)

(setq data-format (list (cons 1 "а4-спдс-лист-2-верт") 
												(cons 2 297) 
												(cons 3 210) 
												(cons 4 "Формат А4")) 
);setq

(01-formats-spds-02-page-2 data-format)

(setvar "cmdecho" 0)

(setvar "osmode" 6199)

(while (/= (setq pnt-ins (getpoint "\nУкажите точку вставки\n")) nil)
	(setq x-pnt-ins (nth 0 pnt-ins)
				y-pnt-ins (nth 1 pnt-ins)
				pnt-ins-head (list (+ x-pnt-ins 245) (+ y-pnt-ins 292))
	);setq

	(setvar "osmode" 0)
		
	(command "_insert" "а4-спдс-лист-2-верт" "_X" 1 "_Y" 1 "_Z" 1 "_R" 0 pnt-ins)
	(command "_insert" "пэ-шапка" "_X" 1 "_Y" 1 "_Z" 1 "_R" 0 pnt-ins-head)

	(setvar "osmode" 6199)
);while

(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(princ)
)
;;;;;;;/////// КОНЕЦ ПОДПРОГРАММЫ //////////////////////////////////////////////
;;;;;;;/////////////////////////////////////////////////////////////////////////

