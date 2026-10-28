;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////                                                              ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun 101-08-cable-connect-01-general

( / adoc dcl-id list-01 list-01-read-file list-02 list-02-read-file list-03 list-03-read-file list-04 list-05 list-06 list-801 list-802 list-900 list-901 list-902 str-01 type-list)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(setq	list-901 nil
      list-902 nil
      list-900 nil
      
			str-01 "0"
);setq

(read-file-for-dialog-box-01 "101-08-cable-connect-01-general.txt" 3)

(setq list-01 list-01-read-file
			list-801 list-02-read-file
			list-802 list-03-read-file
);setq

(txt-01-101-08-cable-connect-01-general str-01)

(if (< (setq dcl-id (load_dialog "dia-101-08-cable-connect-01-general.dcl")) 0) ;ищем диалог
		(progn
			(alert "Не найден dcl-файл")
			(exit)
		);progn
);if

(if (not (new_dialog "dia_101_08_cable_connect_01_general" dcl-id))
		(exit)
);if

(list-filling "txt-01" list-01)
(list-filling "txt-02" list-02)
(list-filling "txt-03" list-03)
(list-filling "txt-04" list-04)
(list-filling "txt-05" list-05)
(list-filling "txt-06" list-06)
(list-filling "txt-900" list-900)

(set_tile "txt-01" "0")
(set_tile "txt-02" "0")
(set_tile "txt-03" "0")
(set_tile "txt-04" "0")
(set_tile "txt-05" "0")
(set_tile "txt-06" "0")

(action_tile "txt-01"
  (strcat "(setq str-01 (get_tile \"txt-01\"))"
  				"(txt-01-101-08-cable-connect-01-general str-01)"
  );srcat
);action_tile

(action_tile "txt-02"
  (strcat "(set_tile \"txt-03\" $value)"
          "(set_tile \"txt-04\" $value)"
          "(set_tile \"txt-05\" $value)"
          "(set_tile \"txt-06\" $value)"        
  );srcat
);action_tile

(action_tile "txt-03"
  (strcat "(set_tile \"txt-01\" $value)"
          "(set_tile \"txt-02\" $value)"
          "(set_tile \"txt-04\" $value)"
          "(set_tile \"txt-05\" $value)"
          "(set_tile \"txt-06\" $value)"
  );srcat
);action_tile

(action_tile "txt-04"
  (strcat "(set_tile \"txt-01\" $value)"
          "(set_tile \"txt-02\" $value)"
          "(set_tile \"txt-03\" $value)"
          "(set_tile \"txt-05\" $value)"
          "(set_tile \"txt-06\" $value)"
  );srcat
);action_tile

(action_tile "but1"
  (strcat "(fill-fields-101-08-cable-connect-01-general)");strcat
);action_tile

(action_tile "but2"
  (strcat "(setq type-list \"le\")"
          "(done_dialog)"
  );strcat
);action_tile

(action_tile "but3"
  (strcat "(setq type-list \"spcf\")"
          "(done_dialog)"
  );strcat
);action_tile

(action_tile "but4"
  (strcat "(setq type-list \"lecgv\")"
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

(if (= type-list "le") (le-101-08-cable-connect-01-general list-902));if

(if (= type-list "spcf") (spcf-101-08-cable-connect-01-general list-902));if

(if (= type-list "lecgv") (lecgv-101-08-cable-connect-01-general list-902));if

(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(vla-endundomark adoc)
(princ)
)
;/////// конец программы ///////

;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun txt-01-101-08-cable-connect-01-general

(str-01 / list-01-read-file list-02-read-file list-03-read-file list-04-read-file list-05-read-file list-900-dscr list-900-menu list-900-read-file name-file num-flds)

(setq name-file (nth (atoi str-01) list-801)
			num-flds (atoi (nth (atoi str-01) list-802))
);setq

(read-file-for-dialog-box-01 name-file num-flds)

(if (/= list-900-dscr nil)
	(divide-text-into-parts list-900-dscr 150)
);

(setq list-02 list-01-read-file
			list-03 list-02-read-file
			list-04 list-03-read-file
			list-05 list-04-read-file
      list-06 list-05-read-file
			list-900 list-900-read-file
);setq

(set_tile "mln-31" (nth 0 list-900-menu))
(set_tile "mln-32" (nth 1 list-900-menu))
(set_tile "mln-41" (nth 2 list-900-menu))
(set_tile "mln-42" (nth 3 list-900-menu))
(set_tile "mln-51" (nth 4 list-900-menu))
(set_tile "mln-52" (nth 5 list-900-menu))
(set_tile "mln-61" (nth 6 list-900-menu))
(set_tile "mln-62" (nth 7 list-900-menu))

(list-filling "txt-02" list-02)
(list-filling "txt-03" list-03)
(list-filling "txt-04" list-04)
(list-filling "txt-05" list-05)
(list-filling "txt-06" list-06)

(set_tile "txt-02" "0")
(set_tile "txt-03" "0")
(set_tile "txt-04" "0")
(set_tile "txt-05" "0")
(set_tile "txt-06" "0")

(princ)
)
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма формирования данных///////////////////////////////////////////////////////////////////////////////
(defun fill-fields-101-08-cable-connect-01-general

( / str-01 str-02 str-03 str-04 str-05 str-99 tmp-902)

(setq str-01 (nth (atoi (get_tile "txt-01")) list-01));setq
  
(if (/= list-901 nil) 
	(setq list-901 (reverse list-901)
				list-902 (reverse list-902)
	);setq
);if

;;;;;;;;;///////////////////////////////////////////////////////////////////////////////////////////
(if (= str-01 "Коннектор RJ45 (8P8C)")
	(progn
		(setq str-02 (nth (atoi (get_tile "txt-02")) list-02)
					str-03 (nth (atoi (get_tile "txt-03")) list-03)
					str-04 (nth (atoi (get_tile "txt-04")) list-04)
					str-05 (nth (atoi (get_tile "txt-05")) list-05)
					str-99 (nth (atoi (get_tile "txt-06")) list-06)
			
					list-901 (vl-list* (strcat str-01 "  " str-02 "  " str-03 "  Экран " str-04) list-901)
		);setq
	
		(cond		
			((= str-04 "Да") (setq str-04 "экран"));=
			((= str-04 "Нет") (setq str-04 "без экрана"));=
		);cond
	
		(setq tmp-902 (list (cons 1 str-01) (cons 2 str-02) (cons 3 str-03) (cons 4 str-04) (cons 5 str-05) (cons 99 str-99)));setq
	);progn
);if

(setq list-902 (vl-list*  tmp-902 list-902)
			list-902 (reverse list-902)
);setq

(list-filling "txt-901" (reverse list-901))

(princ)
)
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;вывод в ПЭ                   //////////////////////////////////////////////////////////////////////////////////
(defun le-101-08-cable-connect-01-general

(list-902 / cntr-1 pnt-ins str-01 str-02 str-03 str-04 str-701 str-702 str-tmp)

(setq cntr-1 0
			str-702 nil
);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-01 (cdr (assoc 1 str-tmp))
	);setq


	(setvar "osmode" 6199)
	
	(setq pnt-ins (getpoint "\nУкажите точку вставки\n"));setq
	
	;/////////////////////////////////////////////////////////////////////////////////////////////////
	(if (= str-01 "Коннектор RJ45 (8P8C)")
		(setq str-02 (cdr (assoc 2 str-tmp))
					str-03 (cdr (assoc 3 str-tmp))
					str-04 (cdr (assoc 4 str-tmp))
						
					str-701 (strcat str-01 ", артикул " str-02 ", " str-03 ", " str-04)	
		);setq
	);if
	
	
	
	(split-str-parts-le-01-general str-701 str-702 pnt-ins "**1**");

	(setq cntr-1 (1+ cntr-1));setq
);repeat

(princ)
)
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;вывод в спцф                   ////////////////////////////////////////////////////////////////////////////////
(defun spcf-101-08-cable-connect-01-general

(list-902 / cntr-1 pnt-ins str-01 str-02 str-03 str-04 str-05 str-701 str-702 str-99 str-manufact str-note str-order str-tmp str-unit)

(setq cntr-1 0
			str-note nil
);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-01 (cdr (assoc 1 str-tmp))
				str-99 (cdr (assoc 99 str-tmp))
	);setq
		
	(setvar "osmode" 6199)
	
	(setq pnt-ins (getpoint "\nУкажите точку вставки\n"));setq
	
	;/////////////////////////////////////////////////////////////////////////////////////////////////
	(if (= str-01 "Коннектор RJ45 (8P8C)")
		(setq str-02 (cdr (assoc 2 str-tmp))
					str-03 (cdr (assoc 3 str-tmp))
					str-04 (cdr (assoc 4 str-tmp))
					str-05 (cdr (assoc 5 str-tmp))
					
					str-manufact str-05
						
					str-701 str-01
					
					str-702 (list (cons 1 str-03)
												(cons 2 str-04)
									);list
												
					str-order (list (cons 1 str-02) 
													(cons 2 "-") 
													(cons 3 nil) ;;;ТУ или НТД
										);list
					str-unit "шт."
		);setq
	);if
	
	(split-str-parts-spcf-01-general str-701 str-702 str-order str-manufact str-unit str-99 str-note pnt-ins);

	(setq cntr-1 (+ cntr-1 1));setq
);repeat

(princ)
)
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в овш               ///////////////////////////////////////////////////////////////////////
(defun lecgv-101-08-cable-connect-01-general

(list-902 / cntr-1 pnt-ins str-01 str-02 str-03 str-04 str-701 str-702 str-703 str-99 str-tmp)

(setq cntr-1 0);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-01 (cdr (assoc 1 str-tmp))
				str-99 (cdr (assoc 99 str-tmp))
	);setq
	
	(setvar "osmode" 6199)
	
	(setq pnt-ins (getpoint "\nУкажите точку вставки\n"));setq
	
	;/////////////////////////////////////////////////////////////////////////////////////////////////
	(if (= str-01 "Коннектор RJ45 (8P8C)")
		(setq str-02 (cdr (assoc 2 str-tmp))
					str-03 (cdr (assoc 3 str-tmp))
					str-04 (cdr (assoc 4 str-tmp))
						
					str-701 (strcat str-01 ", артикул " str-02 ", " str-03 ", " str-04)
		);setq
	);if
	
	;;;;;;;;;/////////
	(setq str-702 nil
				str-703 nil
	);setq

	(split-str-parts-lecgv-01-general str-701 str-702 str-703 str-99 pnt-ins);
	
	(setq cntr-1 (+ cntr-1 1));setq
);repeat

(princ)
)
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////