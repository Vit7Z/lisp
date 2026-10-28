;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////                                                              ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun 101-01-press-sens-dungs-01-general

( / adoc dcl-id list-01 list-01-read-file list-02 list-02-read-file list-03 list-03-read-file list-04 list-04-read-file list-05 list-05-read-file list-06 list-07 list-1001 list-801 list-802 list-901 list-902 list-99 str-01 type-list)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(setq str-01 nil

      list-901 nil
      list-902 nil
      list-1001 nil
);setq

(read-file-for-dialog-box "101-01-press-sens-dungs-01-general.txt" 5)

(setq list-01 list-01-read-file
			list-801 list-02-read-file
			list-802 list-03-read-file
			list-07 list-04-read-file
			list-99 list-05-read-file
);setq

(txt-01-101-01-press-sens-dungs-01-general)

(if (< (setq dcl-id (load_dialog "dia-101-01-press-sens-dungs-01-general.dcl")) 0) ;ищем диалог
		(progn
			(alert "Не найден dcl-файл")
			(exit)
		);progn
);if

(if (not (new_dialog "dia_101_dungs_gw_a6" dcl-id))
		(exit)
);if

(list-filling "txt-01" list-01)
(list-filling "txt-02" list-02)
(list-filling "txt-03" list-03)
(list-filling "txt-04" list-04)
(list-filling "txt-05" list-05)
(list-filling "txt-06" list-06)
(list-filling "txt-07" list-07)
(list-filling "txt-99" list-99)
(list-filling "txt-1001" list-1001)

(set_tile "txt-01" "0")
(set_tile "txt-02" "0")
(set_tile "txt-03" "0")
(set_tile "txt-04" "0")
(set_tile "txt-05" "0")
(set_tile "txt-06" "0")
(set_tile "txt-07" "0")
(set_tile "txt-99" "0")

(action_tile "txt-01"
  (strcat "(txt-01-101-01-press-sens-dungs-01-general)");strcat
);action_tile

(action_tile "txt-02"
  (strcat "(set_tile \"txt-03\" $value)"
  				"(set_tile \"txt-04\" $value)"
  				"(set_tile \"txt-05\" $value)"
  				"(set_tile \"txt-06\" $value)" 
  );strcat
);action_tile

(action_tile "txt-03"
  (strcat "(set_tile \"txt-02\" $value)"
  				"(set_tile \"txt-04\" $value)"
  				"(set_tile \"txt-05\" $value)"
  				"(set_tile \"txt-06\" $value)" 
  );strcat
);action_tile

(action_tile "txt-04"
  (strcat "(set_tile \"txt-02\" $value)"
  				"(set_tile \"txt-03\" $value)"
  				"(set_tile \"txt-05\" $value)"
  				"(set_tile \"txt-06\" $value)" 
  );strcat
);action_tile

(action_tile "txt-05"
  (strcat "(set_tile \"txt-02\" $value)"
  				"(set_tile \"txt-03\" $value)"
  				"(set_tile \"txt-04\" $value)"
  				"(set_tile \"txt-06\" $value)" 
  );strcat
);action_tile

(action_tile "txt-06"
  (strcat "(set_tile \"txt-02\" $value)"
  				"(set_tile \"txt-03\" $value)"
  				"(set_tile \"txt-04\" $value)"
  				"(set_tile \"txt-05\" $value)" 
  );strcat
);action_tile

(action_tile "but1"
  (strcat "(filling-fields-101-01-press-sens-dungs-01-general)");strcat
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

(action_tile "accept"
  (strcat "(done_dialog)"
          "(exit)"
  );strcat
);action_tile

(start_dialog)
(unload_dialog dcl-id)

(if (= type-list "le") (tmp-le-101-01-press-sens-dungs-01-general));if

(if (= type-list "spcf") (tmp-spcf-101-01-press-sens-dungs-01-general));if

(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(vla-endundomark adoc)
(princ)
(gc)
)
;/////// конец программы ///////


;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun txt-01-101-01-press-sens-dungs-01-general

( / file-1 file-2 flds-1 list-01-read-file list-02-read-file list-03-read-file list-04-read-file list-05-read-file name-1 str-01-1)

(if (= nil str-01) 
	(setq str-01 (nth 0 list-01)
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

(divide-text-into-parts list-1001-read-file 125)

(setq list-02 list-01-read-file
			list-03 list-02-read-file
			list-04 list-03-read-file
			list-05 list-04-read-file
			list-06 list-05-read-file
			list-1001 list-1001-read-file
);setq

(list-filling "txt-02" list-02)
(list-filling "txt-03" list-03)
(list-filling "txt-04" list-04)
(list-filling "txt-05" list-05)
(list-filling "txt-06" list-06)
(list-filling "txt-07" list-07)
(list-filling "txt-1001" list-1001)

(set_tile "txt-02" "0")
(set_tile "txt-03" "0")
(set_tile "txt-04" "0")
(set_tile "txt-05" "0")
(set_tile "txt-06" "0")
(set_tile "txt-07" "0")
(set_tile "txt-99" "0")

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма формирования данных/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun filling-fields-101-01-press-sens-dungs-01-general

( / str-01 str-02 str-03 str-06 str-07 str-99 tmp-list-902)

;заполняем поле "выбрано"
(setq str-01 (nth (atoi (get_tile "txt-01")) list-01)
			str-02 (nth (atoi (get_tile "txt-02")) list-02)
			str-03 (nth (atoi (get_tile "txt-03")) list-03)
			str-06 (nth (atoi (get_tile "txt-06")) list-06)
			str-07 (nth (atoi (get_tile "txt-07")) list-07)
			str-99 (nth (atoi (get_tile "txt-99")) list-99)
);setq

(if (/= list-901 nil) 
	(setq list-901 (reverse list-901)
				list-902 (reverse list-902)
	);setq
);if

(setq list-901 (vl-list* (strcat str-02 "  " str-03 " мбар  " str-06 "  " str-07) list-901)
  	
			tmp-list-902 (list (cons 1 str-01) (cons 2 str-02) (cons 3 str-03) (cons 6 str-06) (cons 7 str-07) (cons 99 str-99))
);setq

(setq list-902 (vl-list* tmp-list-902 list-902)
			list-902 (reverse list-902)
			list-901 (reverse list-901)
);setq

(list-filling "txt-901" list-901)

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в ПЭ                   //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun tmp-le-101-01-press-sens-dungs-01-general

( / cntr-1 pnt-ins str-01 str-02 str-03 str-701 str-702 str-tmp)

(setq cntr-1 0);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-01 (cdr (assoc 1 str-tmp))
				str-02 (cdr (assoc 2 str-tmp))
				str-03 (cdr (assoc 3 str-tmp))
	);setq

	(setvar "osmode" 6199)
	
	(setq pnt-ins (getpoint "\nУкажите точку вставки\n"));setq

	(setvar "osmode" 0)

	;;;;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////
	(if (= "GW..A6" str-01)
		(setq str-701 (strcat "Датчик-реле давления DUNGS " str-02 ", диапазон регулирования " str-03 " мбар, присоединение G1/4 (внутр.)")
					str-702 nil
		);setq
	);if

	;;;;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////
	(if (= "LGW..A2" str-01)
		(setq str-701 (strcat "Датчик-реле дифференциального давления DUNGS " str-02 ", диапазон регулирования " str-03 " мбар, присоединение" "штуцер %%c4,6 мм (2 шт)")
					str-702 nil
		);setq
	);if

	(split-str-parts-le-01-general str-701 str-702 pnt-ins);

	(setq cntr-1 (1+ cntr-1));setq
);repeat

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в спцф                   ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun tmp-spcf-101-01-press-sens-dungs-01-general

( / cntr-1 pnt-ins str-01 str-02 str-03 str-06 str-701 str-702 str-99 str-crtf str-manufact str-order str-tmp str-unit)

(setvar "textstyle" "Standard")

(setq cntr-1 0);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-01 (cdr (assoc 1 str-tmp))
				str-02 (cdr (assoc 2 str-tmp))
				str-03 (cdr (assoc 3 str-tmp))
				str-06 (cdr (assoc 6 str-tmp))
				str-99 (cdr (assoc 99 str-tmp))
	);setq

	(setvar "osmode" 6199)
	
	(setq pnt-ins (getpoint "\nУкажите точку вставки\n"));setq

	(setvar "osmode" 0)

	;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
	(if (= str-01 "GW..A6")
		(setq str-701 "Датчик-реле давления"
						
					str-702 (list (cons 1 (strcat "диапазон регулирования " str-03 " мбар"))
												(cons 2 "присоединение G1/4 (внутр.)"));list
																 
					str-order (list (cons 1 (strcat str-02 ", артикул " str-06)) 
													(cons 2 ",") 
													(cons 3 nil));list
		);setq
	);if

	;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
	(if (= str-01 "LGW..A2")
		(setq str-701 "Датчик-реле дифференциального давления"
						
					str-702 (list (cons 1 (strcat "диапазон регулирования " str-03 " мбар"))
												(cons 2 "присоед. штуцер %%c4,6 мм (2 шт)"));list
																 
					str-order (list (cons 1 (strcat str-02 ", артикул " str-06)) 
													(cons 2 ",") 
													(cons 3 nil));list
		);setq
	);if

	(setq str-manufact "ООО \"Karl Dungs\", г. Москва"
				str-unit "шт."
				str-crtf nil
	);setq
	
	(split-str-parts-spcf-01-general str-701 str-702 str-order str-manufact str-unit str-99 str-crtf pnt-ins);
	
	(setq cntr-1 (1+ cntr-1));setq
);repeat

(princ)
)
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
