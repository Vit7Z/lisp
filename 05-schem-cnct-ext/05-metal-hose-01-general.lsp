;/////// ************************************************************ //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////                                                              //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun c:05-metal-hose-01-general

( / adoc cbl-1 cbl-2 dcl-id list-01 list-01-read-file list-02 list-02-read-file list-03 list-03-read-file list-801 list-802 list-900 list-900-dscr str-01)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(read-file-for-dialog-box-01 "05-metal-hose-01-general.txt" 3)

(setq list-01 list-01-read-file
			list-801 list-02-read-file
			list-802 list-03-read-file
			
      list-900 nil
      list-900-dscr nil
      
      str-01 "0"
);setq

(start-05-metal-hose-01-general str-01 list-01 list-801 list-802)

(if (< (setq dcl-id (load_dialog "dia-05-metal-hose-01-general.dcl")) 0) ;ищем диалог
		(progn
			(alert "Ќе найден dcl-файл")
			(exit)
		);progn
);if

(if (not (new_dialog "dia_05_metal_hose" dcl-id))
		(exit)
);if

(list-filling "txt-01" list-01)
(list-filling "txt-02" list-02)
(list-filling "txt-03" list-03)
(list-filling "txt-900" list-900)

(set_tile "txt-01" "0")
(set_tile "txt-02" "0")
(set_tile "txt-03" "0")

(action_tile "txt-01"
  (strcat "(setq str-01 (get_tile \"txt-01\"))" 
  				"(start-05-metal-hose-01-general str-01 list-01 list-801 list-802)" 
  );srcat
);action_tile

(action_tile "txt-02"
  (strcat "(set_tile \"txt-03\" $value)");srcat
);action_tile

(action_tile "txt-03"
  (strcat "(set_tile \"txt-02\" $value)");srcat
);action_tile

(action_tile "but1"
  (strcat "(setq cbl-1 (nth (atoi (get_tile \"txt-01\")) list-01))"
					"(setq cbl-2 (nth (atoi (get_tile \"txt-02\")) list-02))"
  				"(done_dialog)"
  );strcat
);action_tile

(action_tile "accept"
  (strcat "(done_dialog)"
          "(exit)"
  );strcat
);action_tile

(start_dialog)
(unload_dialog dcl-id)

(but1-05-metal-hose-01-general cbl-1 cbl-2)

(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(vla-endundomark adoc)
(princ)
(gc)
)
;/////// конец программы ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun start-05-metal-hose-01-general

(str-01 list-01 list-801 list-802 / list-01-read-file list-02-read-file list-900-dscr name-file-1 num-flds)

(setq name-file-1 (nth (atoi str-01) list-801)
			num-flds (atoi (nth (atoi str-01) list-802))
);setq

(read-file-for-dialog-box-01 name-file-1 num-flds)

(setq list-02 list-01-read-file
			list-03 list-02-read-file
			list-900 list-900-dscr
);setq

(list-filling "txt-02" list-02)
(list-filling "txt-03" list-03)
(list-filling "txt-900" list-900)

(set_tile "txt-02" "0")
(set_tile "txt-03" "0")

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun but1-05-metal-hose-01-general

(cbl-1 cbl-2 / ln-dlt ln-size-cbl pnt-drctn pnt-end pnt-ins pnt-txt-down pnt-txt-up txt-down txt-up x1-box-txt x2-box-txt xpnt-drctn xpnt-ins ypnt-ins)

;;;;;;;;обрабатываем текст дл€ создани€ имени блока
(setq  txt-up (strcat cbl-1 "-" cbl-2)
			 txt-down "** м"

			ln-size-cbl (textbox (list (cons 1 txt-up)));;;;;;;;вычисл€ем длину текста
			x1-box-txt (car (nth 0 ln-size-cbl)); х, лев нижн€€ точка
 			x2-box-txt (car (nth 1 ln-size-cbl)); х, права€ верхн€€ точка
 			ln-dlt (fix (+ (- x2-box-txt x1-box-txt) 8)) ;длина текста + 6мм
);setq
	
(setvar "osmode" 6199)

(while (setq pnt-ins (getpoint "\n”кажите точку вставки\n"))
	(setq pnt-drctn (getpoint "\n”кажите точку направлени€\n")
				xpnt-ins (nth 0 pnt-ins)
				ypnt-ins (nth 1 pnt-ins)
				xpnt-drctn (nth 0 pnt-drctn)
	);setq
	
	(if (< xpnt-ins xpnt-drctn)
		(setq pnt-end (list (+ xpnt-ins ln-dlt) ypnt-ins)
					pnt-txt-up (list (+ xpnt-ins 4) ypnt-ins)
					pnt-txt-down (list (+ xpnt-ins 4) (- ypnt-ins 1))
		);setq
	);if
	
	(if (> xpnt-ins xpnt-drctn)
		(setq pnt-end (list (- xpnt-ins ln-dlt) ypnt-ins)
					pnt-txt-up (list (+ (- xpnt-ins ln-dlt) 2) ypnt-ins)
					pnt-txt-down (list (+ (- xpnt-ins ln-dlt) 2) (- ypnt-ins 1))
		);setq
	);if
	
	(setvar "osmode" 0)

	(command "_text" "_bl" pnt-txt-up 2.5 0 txt-up)
			
	(command "_text" "_tl" pnt-txt-down 2.5 0 txt-down)
			
	(command "_line" pnt-ins pnt-end "")
	
	(setvar "osmode" 6199)
);while






















;(while (/= (setq pnt-ins (getpoint "\n”кажите точку\n")) nil)
;  (progn
;    (setq x-pnt-ins (nth 0 pnt-ins)
;    	    y-pnt-ins (nth 1 pnt-ins)
;    			pnt-txt (list (+ x-pnt-ins 4) (- y-pnt-ins (abs y-txt-1)))
;    );setq)
;    
;    (setvar "osmode" 0)
;    (command "_insert" name-block "_x" 1 "_y" 1 "_z" 1 "_r" 0 pnt-ins)
;    (command "_text" "_bl" pnt-txt 2.5 90 "*** м")
;    (setvar "osmode" 6199)
;  );progn
;);while

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

