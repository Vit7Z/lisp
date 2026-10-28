;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////                                                              ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun 101-04-resistors-01-general

( / adoc dcl-id list-01 list-01-read-file list-02 list-02-read-file list-03-read-file list-1001 list-901 list-902 list-99 str-01 type-list)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(read-file-for-dialog-box-01 "101-04-resistors-01-general.txt" 4)

(setq list-01 list-01-read-file
			list-02 list-02-read-file
			list-99 list-03-read-file
									
			list-901 nil
			list-902 nil
			str-01 "0"
);setq

(txt-01-101-04-resistors-01-general str-01)

(if (< (setq dcl-id (load_dialog "dia-101-04-resistors-01-general.dcl")) 0) ;ищем диалог
		(progn
			(alert "Не найден dcl-файл")
			(exit)
		);progn
);if

(if (not (new_dialog "dia_101_04_resistors_01_general" dcl-id))
		(exit)
);if

(list-filling "txt-01" list-01)
(list-filling "txt-02" list-02)
(list-filling "txt-99" list-99)
(list-filling "txt-900" list-900)

(set_tile "txt-01" "0")
(set_tile "txt-02" "0")
(set_tile "txt-99" "0")

(action_tile "txt-01"
  (strcat "(setq str-01 (get_tile \"txt-01\"))"
  				"(txt-01-101-04-resistors-01-general str-01)"
  );srcat
);action_tile

(action_tile "txt-02"
  (strcat "(setq str-02 (get_tile \"txt-02\"))"
  				"(txt-02-101-04-resistors-01-general str-02)"
  );srcat
);action_tile

(action_tile "but1"
  (strcat "(filling-fields-101-04-resistors-01-general)");strcat
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

(if (= type-list "le") (le-101-04-resistors-01-general));if

(if (= type-list "spcf") (spcf-101-04-resistors-01-general));if

(if (= type-list "lecgv") (lecgv-101-04-resistors-01-general));if

(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(vla-endundomark adoc)
(gc)
(princ)
)
;/////// конец программы //////////////////////////////////////////////////////////////////////////////////////////

;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun txt-01-101-04-resistors-01-general

(str-01 / list-900-read-file str-900)

(setq str-900 (nth (atoi str-01) list-04-read-file));setq

(divide-text-into-parts str-900 74)

(setq list-900 list-900-read-file);setq

(list-filling "txt-900" list-900)

(set_tile "txt-02" str-01)
(set_tile "txt-99" str-01)

(princ)
)
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun txt-02-101-04-resistors-01-general

(str-02 / list-1001-read-file str-1001)

(setq str-1001 (nth (atoi str-02) list-04-read-file));setq

(divide-text-into-parts str-1001 60)

(setq list-1001 list-1001-read-file);setq

(list-filling "txt-1001" list-1001)

(set_tile "txt-01" str-02)
(set_tile "txt-99" str-02)

(princ)
)
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма формирования данных///////////////////////////////////////////////////////////////////////////////
(defun filling-fields-101-04-resistors-01-general

( / str-01 str-02 str-99 swtch tmp-list-902)

(setq swtch list-901
			str-01 (nth (atoi (get_tile "txt-01")) list-01)
			str-02 (nth (atoi (get_tile "txt-02")) list-02)
			str-99 (nth (atoi (get_tile "txt-99")) list-99)
);setq

(if (/= list-901 nil) 
	(setq list-901 (reverse list-901)
				list-902 (reverse list-902)
	);setq
);if

(setq str-01 (nth (atoi (get_tile "txt-01")) list-01)		
  		list-901 (vl-list* str-01 list-901)
  	
			tmp-list-902 (list (cons 1 str-01) (cons 99 str-99))
			list-902 (vl-list* tmp-list-902 list-902)
);setq

(setq list-901 (reverse list-901)
			list-902 (reverse list-902)
);setq

(list-filling "txt-901" list-901)

(princ)
)
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в ПЭ                   /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun le-101-04-resistors-01-general

( / cntr-1 pnt-ins str-01 str-02 str-701 str-702 str-tmp)

(setq cntr-1 0
			str-702 nil
);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-01 (cdr (assoc 1 str-tmp))
				str-02 (cdr (assoc 2 str-tmp))
	);setq
	
	(setvar "osmode" 6199)
	
	(setq pnt-ins (getpoint "\nУкажите точку вставки\n"));setq
	
	;;;;;;;;;/////////
	(setq str-701 (strcat "Резистор  " str-01));setq

	(split-str-parts-le-01-general str-701 str-702 pnt-ins "**1**");

	(setq cntr-1 (1+ cntr-1));setq
);repeat

(princ)
)
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в спцф                   ///////////////////////////////////////////////////////////////////////
(defun spcf-101-04-resistors-01-general

( / cntr-1 pnt-ins str-01 str-701 str-702 str-99 str-manufact str-note str-order str-tmp str-unit)

(setq cntr-1 0);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-01 (cdr (assoc 1 str-tmp))
				str-99 (cdr (assoc 99 str-tmp))
	);setq
	
	(setvar "osmode" 6199)
		
	(setq pnt-ins		(getpoint "\nУкажите точку вставки\n"));setq
	


	(setq str-701 "Резистор"
					
				str-702 nil
							
				str-manufact nil
		
				str-order (list (cons 1 str-01) 
												(cons 2 "-") 
												(cons 3 nil) ;;;  здесь обозначение ТУ или НТД
									);list
				
				str-unit "шт."
					
				str-note nil ;;;;;;; примечание, текстовая строка
	);setq
	
	(split-str-parts-spcf-01-general str-701 str-702 str-order str-manufact str-unit str-99 str-note pnt-ins);
 
	(setq cntr-1 (+ cntr-1 1));setq
);repeat

(princ)
)
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в овш               ////////////////////////////////////////////////////////////////////////////
(defun lecgv-101-04-resistors-01-general

( / cntr-1 dlt-y nmbr-ln pnt-ins str-00 str-01 str-02 str-99 str-tmp str-tmp-0 str-tmp-1 str-txt str-txt-01 str-txt-02 x-pnt-ins y-pnt-ins)

(setq cntr-1 0);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-01 (cdr (assoc 1 str-tmp))
				str-02 (cdr (assoc 2 str-tmp))
				str-99 (cdr (assoc 99 str-tmp))
	);setq
	
	(setvar "osmode" 6199)
	
	(setq pnt-ins (getpoint "\nУкажите точку вставки\n"));setq

	;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	(if (= "Диод" str-00)
		(progn
			(setq nmbr-ln 2);setq
			
			(1000-delete-items-le-cgv nmbr-ln x-pnt-ins y-pnt-ins)
			
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 (strcat str-tmp-0 " " str-tmp-1))
			(command "_TEXT" "_MC" (list (+ x-pnt-ins 142.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "0,002")
		);progn
	);if

	;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	(if (= "Резистор" str-01)
		(setq str-txt (strcat str-01 ", " str-02)
					str-txt-01 nil
					str-txt-02 nil
		);setq
	);if



	(split-str-parts-lecgv-065-01 str-txt str-txt-01 str-txt-02 str-99 pnt-ins)
 
	(setq cntr-1 (+ cntr-1 1));setq
);repeat

(princ)
)
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////