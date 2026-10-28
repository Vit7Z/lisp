;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////                                                              ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun 101-01-plc-logo

( / adoc dcl-id list-01 list-01-read-file list-02 list-02-read-file list-03 list-03-read-file list-04 list-05 list-801 list-802 list-901 list-902 list-99 str-01 type-list)

(vl-load-com)

(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(setq list-901 nil
      list-902 nil			
			str-01 nil
);setq

(read-file-for-dialog-box "101-01-plc-logo-01-general.txt" 3)

(setq list-01 list-01-read-file
			list-801 list-02-read-file
			list-802 list-03-read-file
);setq

(txt-01-101-01-plc-logo)

(if (< (setq dcl-id (load_dialog "dia-101-01-plc-logo.dcl")) 0) ;ищем диалог
		(progn
			(alert "Не найден dcl-файл")
			(exit)
		);progn
);if

(if (not (new_dialog "dia_101_01_controllers_siemens_logo" dcl-id))
		(exit)
);if

(list-filling "txt-01" list-01)
(list-filling "txt-02" list-02)
(list-filling "txt-03" list-03)
(list-filling "txt-04" list-04)
(list-filling "txt-05" list-05)
(list-filling "txt-99" list-99)

(set_tile "txt-01" "0")
(set_tile "txt-02" "0")
(set_tile "txt-03" "0")
(set_tile "txt-04" "0")
(set_tile "txt-05" "0")
(set_tile "txt-99" "0")

(action_tile "txt-01"
  (strcat "(txt-01-101-01-plc-logo)");srcat
);action_tile

(action_tile "txt-02"
  (strcat "(set_tile \"txt-03\" $value)"
  				"(set_tile \"txt-04\" $value)"
  				"(set_tile \"txt-99\" $value)"
  				"(set_tile \"txt-05\" $value)"
  );srcat
);action_tile

(action_tile "txt-03"
  (strcat "(set_tile \"txt-02\" $value)"
  				"(set_tile \"txt-04\" $value)"
  				"(set_tile \"txt-99\" $value)"
  				"(set_tile \"txt-05\" $value)"
  );srcat
);action_tile

(action_tile "txt-04"
  (strcat "(set_tile \"txt-02\" $value)"
  				"(set_tile \"txt-03\" $value)"
  				"(set_tile \"txt-99\" $value)"
  				"(set_tile \"txt-05\" $value)"
  );srcat
);action_tile

(action_tile "but1"
  (strcat "(but1-101-01-plc-logo)");srcat
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

(cond
	((= type-list "le") (le-101-01-plc-logo));=
	((= type-list "spcf") (spcf-101-01-plc-logo));=
	((= type-list "lecgv") (lecgv-101-01-plc-logo));=
);cond

(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(vla-endundomark adoc)
(princ)
(gc)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// конец программы ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun txt-01-101-01-plc-logo

( / flds-1 list-01-read-file list-02-read-file list-03-read-file list-04-read-file list-05-read-file name-1 str-01-1)

(if (= nil str-01) 
	(setq str-01 (nth 0 list-01)
				str-01-1 "0"
				name-1 (nth 0 list-801)
				flds-1 (atoi (nth 0 list-802))
	);setq
	
	(setq str-01 (nth (atoi (get_tile "txt-01")) list-01)
				str-01-1 (get_tile "txt-01")
				name-1 (nth (atoi (get_tile "txt-01")) list-801)
				flds-1 (atoi (nth (atoi (get_tile "txt-01")) list-802))
	);setq
);if

(read-file-for-dialog-box name-1 flds-1)

(setq list-02 list-01-read-file
			list-03 list-02-read-file
			list-04 list-03-read-file
			list-99 list-04-read-file
			list-05 list-05-read-file
);setq

(list-filling "txt-02" list-02)
(list-filling "txt-03" list-03)
(list-filling "txt-04" list-04)
(list-filling "txt-05" list-05)
(list-filling "txt-99" list-99)

(set_tile "txt-02" "0")
(set_tile "txt-03" "0")
(set_tile "txt-04" "0")
(set_tile "txt-05" "0")
(set_tile "txt-99" "0")

(princ)
)
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма формирования данных////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun but1-101-01-plc-logo

( / str-01 str-02 str-03 str-04 str-05 str-99 tmp-list-902)

(setq str-01 (nth (atoi (get_tile "txt-01")) list-01));setq

(if (/= list-901 nil) 
	(setq list-901 (reverse list-901)
				list-902 (reverse list-902)
	);setq
);if

(setq str-01 (nth (atoi (get_tile "txt-01")) list-01)
			str-02 (nth (atoi (get_tile "txt-02")) list-02)
			str-03 (nth (atoi (get_tile "txt-03")) list-03)
			str-04 (nth (atoi (get_tile "txt-04")) list-04)
			str-04 (substr str-04 1 (vl-string-search "," str-04))
			str-05 (nth (atoi (get_tile "txt-05")) list-05)
			str-99 (nth (atoi (get_tile "txt-99")) list-99)
);setq


(setq list-901 (vl-list* (strcat str-02 "  " str-03 "  Uпит " str-04 "  " str-05) list-901)
			tmp-list-902 (list (cons 1 str-01) (cons 2 str-02) (cons 3 str-03) (cons 4 str-04) (cons 5 str-05) (cons 99 str-99))					
			
			list-902 (vl-list* tmp-list-902 list-902)
			list-901 (reverse list-901)
			list-902 (reverse list-902)
);setq

(list-filling "txt-901" list-901)

(princ)
)
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в ПЭ                   /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun le-101-01-plc-logo

( / cntr-1 pnt-ins str-01 str-02 str-03 str-04 str-05 str-701 str-702 str-tmp)

(setq cntr-1 0);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-01 (cdr (assoc 1 str-tmp))
				str-02 (cdr (assoc 2 str-tmp))
				str-03 (cdr (assoc 3 str-tmp))
				str-04 (cdr (assoc 4 str-tmp))
				str-05 (cdr (assoc 5 str-tmp))
	);setq
		
	(setvar "osmode" 6199)
	
	(setq pnt-ins (getpoint "\nУкажите точку вставки\n"));setq
	
	(cond
		((= str-01 "Модуль расширения, DI") (setq str-01 "Модуль расширения (дискретные сигналы), "));
		((= str-01 "Модуль расширения, AI") (setq str-01 "Модуль расширения (аналоговые сигналы), "));
		((= str-01 "Модуль логический") (setq str-01 "Модуль логический, "));
	);cond
	
	(setq str-701 (strcat str-01 str-02 ", артикул " str-03 ", Uпит. " str-04 ", " str-05)
				str-702 nil
	);setq
	
	(split-str-parts-le-01-general str-701 str-702 pnt-ins)
	
	(setq cntr-1 (1+ cntr-1));setq
);repeat

(princ)
)
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в спцф                   ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun spcf-101-01-plc-logo

( / cntr-1 pnt-ins str-01 str-02 str-03 str-04 str-05 str-701 str-702 str-99 str-crtf str-manufact str-order str-tmp str-unit)

(setq cntr-1 0);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-01 (cdr (assoc 1 str-tmp))
				str-02 (cdr (assoc 2 str-tmp))
				str-03 (cdr (assoc 3 str-tmp))
				str-04 (cdr (assoc 4 str-tmp))
				str-05 (cdr (assoc 5 str-tmp))
				str-99 (cdr (assoc 99 str-tmp))
	);setq

	(setvar "osmode" 6199)
	
	(setq pnt-ins (getpoint "\nУкажите точку вставки\n"));setq

	(cond
		((= str-01 "Модуль расширения, DI") 
			(setq str-701 "Модуль расширения"
						str-05 (strcat "ввод/вывод дискр. сигналов, " str-05)
			);setq
		);
		
		((= str-01 "Модуль расширения, AI")
			(setq str-701 "Модуль расширения"
						str-05 (strcat "ввод аналог. сигналов, " str-05)
			);setq
		);

		((= str-01 "Модуль логический")
			(setq str-701 str-01);setq
		);
	);cond

	(setq str-702 (list (cons 1 (strcat "Uпит. " str-04)) 
											(cons 2 str-05))
				str-order (list (cons 1 (strcat str-02 ", артикул " str-03)) 
												(cons 2 ",") 
												(cons 3 nil));list
				str-manufact "Siemens, г. Москва"		
				str-unit "шт."
				str-crtf nil
	);setq

	(split-str-parts-spcf-01-general str-701 str-702 str-order str-manufact str-unit str-99 str-crtf pnt-ins);
								
	(setq cntr-1 (+ cntr-1 1));setq
);repeat

(princ)
)
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в овш               ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun lecgv-101-01-plc-logo

( / cntr-1 pnt-ins str-01 str-02 str-03 str-04 str-05 str-701 str-99 str-tmp)

(setq cntr-1 0);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-01 (cdr (assoc 1 str-tmp))
				str-02 (cdr (assoc 2 str-tmp))
				str-03 (cdr (assoc 3 str-tmp))
				str-04 (cdr (assoc 4 str-tmp))
				str-05 (cdr (assoc 5 str-tmp))
				str-99 (cdr (assoc 99 str-tmp))	
	);setq
	
	(setvar "osmode" 6199)
	
	(setq pnt-ins (getpoint "\nУкажите точку вставки\n"));setq
	
	(cond
		((= str-01 "Модуль расширения, DI") (setq str-01 "Модуль расширения (дискретные сигналы), "));
		((= str-01 "Модуль расширения, AI") (setq str-01 "Модуль расширения (аналоговые сигналы), "));
		((= str-01 "Модуль логический") (setq str-01 "Модуль логический, "));
	);cond	
	
	(setq str-701 (strcat str-01 str-02 ", артикул " str-03 ", Uпит. " str-04 ", " str-05))

	(split-str-parts-lecgv-01-general str-701 nil nil str-99 pnt-ins);
 
	(setq cntr-1 (+ cntr-1 1));setq
);repeat

(princ)
)
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////