;/////// ************************************************************ //////////////////////////////////////////////////////////////////
;/////// подвал схемы автоматизации, сигналы                          //////////////////////////////////////////////////////////////////
;/////// ************************************************************ //////////////////////////////////////////////////////////////////
(defun c:03-basement-schem-auto-01-sig
( / adoc cntr dcl-id list-902 num-1 num-2 pnt-1 pnt-txt-tmp txt-1 txt-box txt-lgt txt-lgt-max txt-tmp x-pnt-1 x-pnt-2 x-pnt-txt y-pnt-1 y-pnt-2 y-pnt-txt)

(vl-load-com)
(vla-startundomark
  (setq adoc (vla-get-activedocument (vlax-get-acad-object)))
);start undo

(setvar "osmode" 0)
(setvar "cmdecho" 0)
(setvar "auprec" 7)

(setq list-902 nil);setq

(if (< (setq dcl-id (load_dialog "dia-03-basement-schem-auto-01-sig.dcl")) 0) ;ищем диалог
		(progn
			(alert "Не найден dcl-файл")
			(exit)
		);progn
);if

(if (not (new_dialog "dia_03_basement_schem_auto_01" dcl-id))
		(exit)
);if

(action_tile "tgl-11"
  (strcat "(tgl-03-basement-schem-auto 11 \"Ain (4...20)\")");srcat
);action_tile

(action_tile "tgl-12"
  (strcat "(tgl-03-basement-schem-auto 12 \"Ain Exi (4...20)\")");srcat
);action_tile

(action_tile "tgl-13"
  (strcat "(tgl-03-basement-schem-auto 13 \"Aout (4...20)\")");srcat
);action_tile

(action_tile "tgl-14"
  (strcat "(tgl-03-basement-schem-auto 14 \"Aout Exi (4...20)\")");srcat
);action_tile

(action_tile "tgl-21"
  (strcat "(tgl-03-basement-schem-auto 21 \"Din (=24)\")");srcat
);action_tile

(action_tile "tgl-22"
  (strcat "(tgl-03-basement-schem-auto 22 \"Din NAMUR\")");srcat
);action_tile

(action_tile "tgl-23"
  (strcat "(tgl-03-basement-schem-auto 23 \"Dout\")");srcat
);action_tile

(action_tile "tgl-31"
  (strcat "(tgl-03-basement-schem-auto 31 \"RS485\")");srcat
);action_tile

(action_tile "tgl-32"
  (strcat "(tgl-03-basement-schem-auto 32 \"Ethernet\")");srcat
);action_tile

(action_tile "accept"
  (strcat "(done_dialog)");strcat
);action_tile

(start_dialog)
(unload_dialog dcl-id)

(setq list-902 (vl-sort list-902 
	(function (lambda (num-1 num-2) (< (car num-1) (car num-2)))))
);setq

(setq cntr 0
			txt-lgt-max 0
);setq

(repeat (length list-902)
	(setq txt-tmp (cdr (nth cntr list-902))
				txt-box (textbox (list (cons 1 txt-tmp)))
				txt-lgt (- (car (nth 1 txt-box)) (car (nth 0 txt-box)))	
	);setq

	(if (> txt-lgt txt-lgt-max)
		(setq txt-lgt-max txt-lgt)
	);if

	(setq cntr (1+ cntr));setq
);repeat

(setvar	"osmode" 6199)

(setq txt-lgt-max (+ (fix txt-lgt-max) 3)
			pnt-1 (getpoint "\nУкажите точку вставки\n")
			
			x-pnt-1 (- (car pnt-1) txt-lgt-max)
			y-pnt-1 (nth 1 pnt-1)
			
			x-pnt-txt (+ x-pnt-1 1)
	 		y-pnt-txt (- y-pnt-1 2.5)
	 		
			cntr 0
);setq

(setvar "osmode" 0)

(repeat (length list-902)
	(setq txt-tmp (cdr (nth cntr list-902))
				pnt-txt-tmp (list x-pnt-txt y-pnt-txt)
	);setq

	(setq txt-1
		(entmakex
			(list
				'(0 . "TEXT")
				'(100 . "AcDbEntity")
				'(100 . "AcDbText")
				(cons 10 pnt-txt-tmp) ; нач точка текста
				(cons 11 pnt-txt-tmp) ; нач точка текста
				(cons 1 txt-tmp) ; содержание текста
				'(40 . 2.5) ; высота текста
				'(41 . 1) ; растяжение текста
				'(50 . 0) ; поворот текста
				'(72 . 0) ; гориз выравнивание текста
				'(73 . 2) ; верт выравнивание текста
				'(370 . -1) ; толщина текста
				 (cons 7 (getvar "textstyle")) ; стиль текста
			);list
		);entmakex
	);setq

	(setvar	"CLAYER" "0")
	(setvar "CELWEIGHT" -1)
	(command "_RECTANGLE" (list x-pnt-1 y-pnt-1) (list (+ x-pnt-1 txt-lgt-max) (- y-pnt-1 5)))

	(setq cntr (1+ cntr)
				y-pnt-txt (- y-pnt-txt 5)
				y-pnt-1 (- y-pnt-1 5)
	);setq
);repeat

(setq txt-box (textbox (list (cons 1 "ПЛК")))
			txt-lgt (- (car (nth 1 txt-box)) (car (nth 0 txt-box)))
			txt-lgt (+ (fix txt-lgt) 3)
			
			x-pnt-2 (- x-pnt-1 txt-lgt)
			y-pnt-2 (nth 1 pnt-1)
);setq

(command "_RECTANGLE" (list x-pnt-2 y-pnt-2) (list (+ x-pnt-2 txt-lgt) y-pnt-1))

(setq x-pnt-txt (+ x-pnt-2 1)
			y-pnt-txt (- y-pnt-2 (* (abs (- y-pnt-2 y-pnt-1)) 0.5))
			pnt-txt-tmp (list x-pnt-txt y-pnt-txt)
);setq

(setq txt-1
	(entmakex
		(list
			'(0 . "TEXT")
			'(100 . "AcDbEntity")
			'(100 . "AcDbText")
			(cons 10 pnt-txt-tmp) ; нач точка текста
			(cons 11 pnt-txt-tmp) ; нач точка текста
			(cons 1 "ПЛК") ; содержание текста
			'(40 . 2.5) ; высота текста
			'(41 . 1) ; растяжение текста
			'(50 . 0) ; поворот текста
			'(72 . 0) ; гориз выравнивание текста
			'(73 . 2) ; верт выравнивание текста
			'(370 . -1) ; толщина текста
			 (cons 7 (getvar "textstyle")) ; стиль текста
		);list
	);entmakex
);setq


(vla-endundomark adoc)
(setvar	"ORTHOMODE" 1)
(setvar	"OSMODE" 6199)
(setvar "CMDECHO" 1)
(princ)
)
;/////// *************************************************************//////////////////////////////
;/////// КОНЕЦ ПРОГРАММЫ                                              //////////////////////////////
;/////// *************************************************************//////////////////////////////


;;;;///////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма формирования данных///////////////////////////////////////////////////////////////
(defun tgl-03-basement-schem-auto

(indx-num str-902 / )

(setq str-902 (cons indx-num str-902)
			list-902 (vl-list* str-902 list-902)
);setq
  				
(princ)
)
;;;;////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////