;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////                                                              ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun 101-01-tempr-owen-dts-indust-air-01-general

( / adoc dcl-id list-01 list-01-read-file list-02 list-02-read-file list-03 list-04 list-05 list-06 list-801 list-900 list-900-dscr list-900-menu list-901 list-902 list-99 str-01 type-list)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(read-file-for-dialog-box-01 "101-01-tempr-owen-dts-indust-air-01-general.txt" 2)

(setq list-01 list-01-read-file
			list-801 list-02-read-file
						
      list-901 nil
      list-902 nil
      
      list-900-menu nil
      list-900-dscr nil
      
      str-01 "0"
);setq

(txt-01-01-temp-owen-dts-indust-air-01-general str-01)

(if (< (setq dcl-id (load_dialog "dia-101-01-tempr-owen-dts-indust-air-01-general.dcl")) 0) ;ищем диалог
		(progn
			(alert "Не найден dcl-файл")
			(exit)
		);progn
);if

(if (not (new_dialog "dia_101_temp_owen_dts" dcl-id))
		(exit)
);if

(list-filling "txt-01" list-01)
(list-filling "txt-02" list-02)
(list-filling "txt-03" list-03)
(list-filling "txt-04" list-04)
(list-filling "txt-05" list-05)
(list-filling "txt-06" list-06)
(list-filling "txt-99" list-99)
(list-filling "txt-900" list-900)

(set_tile "txt-01" "0")
(set_tile "txt-02" "0")
(set_tile "txt-03" "0")
(set_tile "txt-04" "0")
(set_tile "txt-05" "0")
(set_tile "txt-06" "0")
(set_tile "txt-99" "0")

(action_tile "txt-01"
  (strcat "(setq str-01 (get_tile \"txt-01\"))"
  				"(txt-01-01-temp-owen-dts-indust-air-01-general str-01)"
  );srcat
);action_tile

(action_tile "txt-06"
  (strcat "(set_tile \"txt-99\" $value)");srcat
);action_tile

(action_tile "but-1"
  (strcat "(filling-fields-101-01-tempr-owen-dts-indust-air-01-general)");strcat
);action_tile

(action_tile "but-2"
  (strcat "(setq type-list \"le\")"
          "(done_dialog)"
  );strcat
);action_tile

(action_tile "but-3"
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

(if (= type-list "le") (le-101-01-tempr-owen-dts-indust-air-01-general list-902));if

(if (= type-list "spcf") (spcf-101-01-tempr-owen-dts-indust-air-01-general list-902));if

(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(vla-endundomark adoc)
(gc)
(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// конец программы ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun txt-01-01-temp-owen-dts-indust-air-01-general

(str-01 / list-900-dscr list-900-menu list-902-read-file name-file)

(setq name-file (nth (atoi str-01) list-801));setq

(read-file-for-dialog-box-02 name-file);

(set_tile "ptxt-21" (nth 0 list-900-menu))
(set_tile "ptxt-22" (nth 1 list-900-menu))

(set_tile "ptxt-31" (nth 2 list-900-menu))
(set_tile "ptxt-32" (nth 3 list-900-menu))

(set_tile "ptxt-41" (nth 4 list-900-menu))
(set_tile "ptxt-42" (nth 5 list-900-menu))

(set_tile "ptxt-51" (nth 6 list-900-menu))
(set_tile "ptxt-52" (nth 7 list-900-menu))

(set_tile "ptxt-61" (nth 8 list-900-menu))
(set_tile "ptxt-62" (nth 9 list-900-menu))

(set_tile "ptxt-71" (nth 10 list-900-menu))
(set_tile "ptxt-72" (nth 11 list-900-menu))

(setq list-02 (cdr (nth 0 list-902-read-file))
			list-03 (cdr (nth 1 list-902-read-file))
			list-04 (cdr (nth 2 list-902-read-file))
			list-05 (cdr (nth 3 list-902-read-file))
			list-06 (cdr (nth 4 list-902-read-file))
			list-99 (cdr (nth 5 list-902-read-file))
			list-900 list-900-dscr
);setq

(list-filling "txt-02" list-02)
(list-filling "txt-03" list-03)
(list-filling "txt-04" list-04)
(list-filling "txt-05" list-05)
(list-filling "txt-06" list-06)
(list-filling "txt-99" list-99)
(list-filling "txt-900" list-900)

(set_tile "txt-02" "0")
(set_tile "txt-03" "0")
(set_tile "txt-04" "0")
(set_tile "txt-05" "0")
(set_tile "txt-06" "0")
(set_tile "txt-99" "0")

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма формирования данных/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun filling-fields-101-01-tempr-owen-dts-indust-air-01-general

( / str-01 str-02 str-03 str-04 str-05 str-06 str-99 tgl-01 tgl-01-901 tgl-01-902 tmp-902)

(if (/= list-901 nil) 
	(setq list-901 (reverse list-901)
				list-902 (reverse list-902)
	);setq
);if

(setq str-01 (nth (atoi (get_tile "txt-01")) list-01)

			str-02 (nth (atoi (get_tile "txt-02")) list-02)
			str-02 (vl-string-right-trim "*" str-02)
			
			str-03 (nth (atoi (get_tile "txt-03")) list-03)
			str-03 (vl-string-right-trim "*" str-03)
			
			str-04 (nth (atoi (get_tile "txt-04")) list-04)
			
			str-05 (nth (atoi (get_tile "txt-05")) list-05)
			str-05 (vl-string-right-trim "*" str-05)
			
			str-06 (nth (atoi (get_tile "txt-06")) list-06)
			str-06 (vl-string-right-trim "*" str-06)
			
			str-99 (nth (atoi (get_tile "txt-99")) list-99)

			tgl-01 (get_tile "tgl-01")
);setq

(if (= tgl-01 "0")
	(setq tgl-01-901 "Без защитного экрана"
				tgl-01-902 "без защитного экрана"
	);setq
	
	(setq tgl-01-901 "В компл. с защитным экраном"
				tgl-01-902 "в компл. с защитным экраном"
	);setq
);if

;;;;;;;/////////////////////////////////////////////////////////////////////////////////////////////
(if (= str-01 "ДТС125Л")
	(setq tmp-902 (list (cons 1 str-01)
											(cons 2 (strcat str-01 "-" str-02 "." str-03 "." (substr str-05 1 1) "." str-06))
											(cons 3 (strcat "кл. допуска " str-03)) 
											(cons 4 (strcat "диапазон температур " str-04 "%%dC")) 
											(cons 5 str-05) 
											(cons 6 (strcat str-06 "мм")) 
											(cons 7 tgl-01-902) 											 
											(cons 99 str-99))
															
				list-901 (vl-list* (strcat str-01 "  " str-02 "  Кл. допуска  " str-03 "  " str-04 " С  " str-05 "  " str-06 "мм  " tgl-01-901) list-901)
	);setq
);if

(setq list-902 (vl-list* tmp-902 list-902)
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
(defun le-101-01-tempr-owen-dts-indust-air-01-general

(list-902 / cntr-1 pnt-ins str-01 str-02 str-04 str-05 str-06 str-07 str-701 str-702 str-tmp)

(setq cntr-1 0);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-01 (cdr (assoc 1 str-tmp))
	);setq

	(setvar "osmode" 6199)
	
	(setq pnt-ins (getpoint "\nУкажите точку вставки\n"));setq
	
	;;;;;;;///////////////////////////////////////////////////////////////////////////////////////////
	(if (= str-01 "ДТС125Л")
		(setq str-02 (cdr (assoc 2 str-tmp))
					str-04 (cdr (assoc 4 str-tmp))
					str-05 (cdr (assoc 5 str-tmp))
					str-06 (cdr (assoc 6 str-tmp))
					str-07 (cdr (assoc 7 str-tmp))
			
					str-701 (strcat "Термометр сопротивления (изм. температуры воздуха) ОВЕН " str-02 ", " str-04 ", " str-05 ", L = " str-06 ", " str-07)
					str-702 nil
		);setq
	);if
			
	(split-str-parts-le-01-general str-701 str-702 pnt-ins "**22**");
	
	(setq cntr-1 (1+ cntr-1));setq
);repeat

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в спцф                   ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

(defun spcf-101-01-tempr-owen-dts-indust-air-01-general

(list-902 / cntr-1 pnt-ins str-01 str-02 str-03 str-04 str-05 str-06 str-07 str-701 str-702 str-99 str-crtf str-manufact str-order str-tmp str-unit)

(setq cntr-1 0);setq

(setvar "textstyle" "Standard")

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-01 (cdr (assoc 1 str-tmp))
				str-02 (cdr (assoc 2 str-tmp))
				str-03 (cdr (assoc 3 str-tmp))
				str-04 (cdr (assoc 4 str-tmp))
				str-05 (cdr (assoc 5 str-tmp))
				str-06 (cdr (assoc 6 str-tmp))
				str-07 (cdr (assoc 7 str-tmp))
				str-99 (cdr (assoc 99 str-tmp))
	);setq

	(setvar "osmode" 6199)
	
	(setq pnt-ins (getpoint "\nУкажите точку вставки\n"));setq
	
	;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	(if (= str-01 "ДТС125Л")
		(setq str-701 "Термометр сопротивления (изм. температуры воздуха)"
			
					str-702 (list (cons 1 str-03)													
												(cons 2 str-04)
												(cons 3 str-05)												
												(cons 4 (strcat "L = " str-06))
												(cons 5 str-07))												
						
					str-order (list (cons 1 str-02) 
													(cons 2 ".")
													(cons 3 nil))
					str-crtf "Свидетельство об утв. СИ № 39452/1"
		);setq
	);if

	(setq str-manufact "ОВЕН, г. Москва"
				str-unit "шт."			
	);setq
		
	(split-str-parts-spcf-01-general str-701 str-702 str-order str-manufact str-unit str-99 str-crtf pnt-ins)
 
	(setq cntr-1 (+ cntr-1 1));setq
);repeat

(princ)
)
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



