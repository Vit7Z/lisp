;/////// *************************************************************//////////////////////////////////////////////////
;/////// название программы****************                           //////////////////////////////////////////////////
;/////// *************************************************************//////////////////////////////////////////////////
(defun c:05-connect-to-proc

( / adoc circle-1 dcl-id dlt-x dlt-x-txt drctn-x hatch-1 list-01 list-01-read-file list-02 list-02-read-file list-03 
list-03-read-file list-801 list-802 list-901 list-902 lst-pipe-arm pnt-1 pnt-2 pnt-ins str-01 str-alrt str-but-02 swtch 
x1-box-txt x2-box-txt xpnt-1 xpnt-2 xpnt-ins ypnt-1 ypnt-2)

(setvar "osmode" 6199)
(setvar "cmdecho" 0)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(read-file-for-dialog-box-01 "05-connect-to-proc-01-general.txt" 3)

(setq list-01 list-01-read-file
			list-801 list-02-read-file
			list-802 list-03-read-file
			
      list-901 nil
      list-902 nil
      
      str-01 "0"
      swtch ""
);setq

(txt-01-05-connect-to-proc str-01)

(if (< (setq dcl-id (load_dialog "dia-05-connect-to-proc.dcl")) 0) ;ищем диалог
		(progn
			(alert "Не найден dcl-файл")
			(exit)
		);progn
);if

(if (not (new_dialog "dia_05_connect_to_proc" dcl-id))
		(exit)
);if

(list-filling "txt-01" list-01)
(list-filling "txt-02" list-02)
(list-filling "txt-03" list-03)

(set_tile "txt-01" "0")
(set_tile "txt-02" "0")
(set_tile "txt-03" "0")

(action_tile "txt-01"
  (strcat "(setq str-01 (get_tile \"txt-01\"))"
  				"(txt-01-05-connect-to-proc str-01)"
  );strcat
);action_tile

(action_tile "txt-02"
  (strcat "(setq str-01 (get_tile \"txt-02\"))"
  				"(set_tile \"txt-03\" str-01)"
  );srcat
);action_tile

(action_tile "txt-03"
  (strcat "(setq str-01 (get_tile \"txt-03\"))"
  				"(set_tile \"txt-02\" str-01)"
  );srcat
);action_tile

(action_tile "but-02"
  (strcat "(setq str-but-02 (get_tile \"but-02\"))");srcat
);action_tile

(action_tile "but1"
  (strcat "(setq lst-pipe-arm (nth (atoi (get_tile \"txt-02\")) list-02))"
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

(if (= (tblsearch "block" "точка-1мм" ) nil) ; рисуем точку на конце выноски
	(progn
	  (command "_circle" '(0 0 ) 0.5)
	  (setq circle-1 (entlast))
	  (command "_hatch" "solid" circle-1 "")
	  (setq hatch-1 (entlast))
	  (command "_block" "точка-1мм" '(0 0 ) circle-1 hatch-1 "")
	);progn
);if

(setq dlt-x (textbox (list (cons 1 lst-pipe-arm)))
			x1-box-txt (car (nth 0 dlt-x)); х, левая нижняя точка
			x2-box-txt (car (nth 1 dlt-x)); х, правая верхняя точка
			dlt-x (fix (+ (- x2-box-txt x1-box-txt) 1)) ;длина текста + 2мм
			dlt-x-txt (* 0.5 dlt-x)
);setq

;;;;;;;/////////////////////////////////////////////////////////////////////////////////////////////
(if (= str-but-02 nil)
	(progn
		(setq str-alrt (strcat "Рисуется " lst-pipe-arm));setq
		
		(while (= swtch "")
			(alert str-alrt)
			
			(setq pnt-1 (getpoint "\nУкажите точку 1\n"));setq
			
			(command "_insert" "точка-1мм" "_X" 1 "_Y" 1 "_Z" 1 "_R" 0 pnt-1)
			
			(while (/= (setq pnt-2 (getpoint "\nУкажите точку 2\n")) nil)
				(setvar "osmode" 0)
				(setq xpnt-2 (nth 0 pnt-2)
							ypnt-2 (nth 1 pnt-2)
				);setq
				(command "_line" pnt-1 pnt-2 "")
				(setq pnt-1 pnt-2);setq
				(setvar "osmode" 0)
			);while	
		
			(setq pnt-ins (getpoint "\nУкажите точку направления\n")
						xpnt-ins (nth 0 pnt-ins)		
						drctn-x (- xpnt-ins xpnt-2);направление вставки по горизонтали
			);setq
		
			(if	(= pnt-2 nil) (setq pnt-2 pnt-1));if
		
			(if	(< drctn-x 0)
				(setq dlt-x (- 0 dlt-x)
							dlt-x-txt (* 0.5 dlt-x)
				);setq
			);if
		
			(command "_TEXT" "_BC" (list (+ xpnt-2 dlt-x-txt) ypnt-2) 2.5 0 lst-pipe-arm)
			(command "_line" pnt-2 (list (+ xpnt-2 dlt-x) ypnt-2) "")
			
			(setvar "osmode" 6199)
		
			(setq swtch (getstring "\nПродолжить?"));setq
		);while
	);progn	
);if


;;;;;;;/////////////////////////////////////////////////////////////////////////////////////////////
(if (= str-but-02 "1")
	(progn
		(setq str-alrt (strcat "Рисуется " lst-pipe-arm));setq
		
		(while (= swtch "")
			(alert str-alrt)
			
			(setq pnt-1 (getpoint "\nУкажите точку\n")
						xpnt-1 (nth 0 pnt-1)
						ypnt-1 (nth 1 pnt-1)
		
						pnt-ins (getpoint "\nУкажите точку направления\n")
						xpnt-ins (nth 0 pnt-ins)	
						drctn-x (- xpnt-ins xpnt-1);направление вставки по горизонтали
			);setq
		
			(if	(< drctn-x 0) (setq dlt-x (- 0 dlt-x)));if
			
			(setq dlt-x-txt (* 0.5 dlt-x));setq
							
			(command "_TEXT" "_BC" (list (+ xpnt-1 dlt-x-txt) ypnt-1) 2.5 0 lst-pipe-arm)
			(command "_line" pnt-1 (list (+ xpnt-1 dlt-x) ypnt-1) "")
			
			(setvar "osmode" 6199)
			
			(setq pnt-1 nil
						dlt-x (abs dlt-x)
						swtch (getstring "\nПродолжить?")
			);setq
		);while
	);progn	
);if


(vla-endundomark adoc)

(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(princ)
)
;/////// *************************************************************///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// КОНЕЦ ПРОГРАММЫ                                              ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// *************************************************************///////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun txt-01-05-connect-to-proc

(str-01 / list-01-read-file list-02-read-file name-file num-flds)

(setq name-file (nth (atoi str-01) list-801)
			num-flds (atoi (nth (atoi str-01) list-802))
);setq

(read-file-for-dialog-box-01 name-file num-flds)

(setq list-02 list-01-read-file
			list-03 list-02-read-file
);setq

(list-filling "txt-02" list-02)
(list-filling "txt-03" list-03)

(set_tile "txt-02" "0")
(set_tile "txt-03" "0")

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;считываем данные из поля                  ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun but1-05-connect-to-proc

( / )

(setq lst-pipe-arm (get_tile "txt-02"));setq

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////