;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////                                                              ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun 101-01-plc-owen-01-general

( / adoc dcl-id list-01 list-01-read-file list-02 list-02-read-file list-03 list-03-read-file list-04 list-04-read-file list-05 list-06 list-07 list-08 list-801 list-802 
list-901 list-902 list-99 list-hdr str-01 type-list)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(read-file-for-dialog-box-01 "101-01-plc-owen-01-general.txt" 3)

(setq list-01 list-01-read-file
			list-801 list-02-read-file
			list-802 list-03-read-file
			
			list-901 nil
      list-902 nil
      
      str-01 nil
);setq

(txt-01-101-01-plc-owen-01-general)

(if (< (setq dcl-id (load_dialog "dia-101-01-plc-owen-01-general.dcl")) 0) ;ищем диалог
	(progn
		(alert "Не найден dcl-файл")
		(exit)
	);progn
);if

(if (not (new_dialog "dia_101_plc_owen" dcl-id))
	(exit)
);if

(list-filling "txt-01" list-01)
(list-filling "txt-02" list-02)
(list-filling "txt-03" list-03)
(list-filling "txt-04" list-04)
(list-filling "txt-05" list-05)
(list-filling "txt-06" list-06)
(list-filling "txt-07" list-07)
(list-filling "txt-08" list-08)
(list-filling "txt-99" list-99)

(set_tile "txt-01" "0")
(set_tile "txt-02" "0")
(set_tile "txt-03" "0")
(set_tile "txt-04" "0")
(set_tile "txt-05" "0")
(set_tile "txt-06" "0")
(set_tile "txt-07" "0")
(set_tile "txt-08" "0")
(set_tile "txt-99" "0")

(action_tile "txt-01"
  (strcat "(txt-01-101-01-plc-owen-01-general)");srcat
);action_tile

(action_tile "txt-02"
  (strcat "(set_tile \"txt-03\" $value)"
  			  "(set_tile \"txt-04\" $value)"
  			  "(set_tile \"txt-05\" $value)"
  			  "(set_tile \"txt-06\" $value)"
  			  "(set_tile \"txt-07\" $value)"
  			  "(set_tile \"txt-08\" $value)"
  			  "(set_tile \"txt-99\" $value)"
  );srcat
);action_tile

(action_tile "txt-03"
  (strcat "(set_tile \"txt-02\" $value)"
  			  "(set_tile \"txt-04\" $value)"
  			  "(set_tile \"txt-05\" $value)"
  			  "(set_tile \"txt-06\" $value)"
  			  "(set_tile \"txt-07\" $value)"
  			  "(set_tile \"txt-08\" $value)"
  			  "(set_tile \"txt-99\" $value)"
  );srcat
);action_tile

(action_tile "txt-07"
  (strcat "(set_tile \"txt-02\" $value)"
  			  "(set_tile \"txt-03\" $value)"
  			  "(set_tile \"txt-04\" $value)"
  			  "(set_tile \"txt-05\" $value)"
  			  "(set_tile \"txt-06\" $value)"
  			  "(set_tile \"txt-08\" $value)"
  			  "(set_tile \"txt-99\" $value)"
  );srcat
);action_tile

(action_tile "but1"
  (strcat "(but1-101-01-plc-owen-01-general)");strcat
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

(if (= type-list "le") (le-101-01-plc-owen-01-general));if

(if (= type-list "spcf") (spcf-101-01-plc-owen-01-general));if

(if (= type-list "lecgv") (lecgv-101-01-plc-owen-01-general));if

(setvar "osmode" 6199)
(setvar "cmdecho" 1)

(vla-endundomark adoc)
(gc)
(princ)
)
;/////// конец программы //////////////////////////////////////////////////////////////////////////////////////////

;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрогамма чтения данных из файлов             ///////////////////////////////////////////////////////////////
(defun txt-01-101-01-plc-owen-01-general

( / list-01-read-file list-02-read-file list-03-read-file list-04-read-file list-05-read-file list-06-read-file list-07-read-file list-08-read-file list-900-menu name-file num-flds)

(if (= nil str-01) 
	(setq str-01 (nth 0 list-01)
				name-file (nth 0 list-801)
				num-flds (atoi (nth 0 list-802))
	);setq
	
	(setq str-01 (nth (atoi (get_tile "txt-01")) list-01)
				name-file (nth (atoi (get_tile "txt-01")) list-801)
				num-flds (atoi (nth (atoi (get_tile "txt-01")) list-802))
	);setq
);if

(read-file-for-dialog-box-01 name-file num-flds)

(set_tile "ptxt-031" (nth 0 list-900-menu))
(set_tile "ptxt-032" (nth 1 list-900-menu))

(set_tile "ptxt-041" (nth 2 list-900-menu))
(set_tile "ptxt-042" (nth 3 list-900-menu))

(set_tile "ptxt-051" (nth 4 list-900-menu))
(set_tile "ptxt-052" (nth 5 list-900-menu))

(set_tile "ptxt-061" (nth 6 list-900-menu))
(set_tile "ptxt-062" (nth 7 list-900-menu))

(if (= str-01 "Контроллер")
	(setq list-02 list-01-read-file
				list-03 list-02-read-file
				list-04 list-03-read-file
				list-05 list-04-read-file
				list-06 list-05-read-file
				list-07 list-06-read-file
				list-08 list-07-read-file
				list-99 list-08-read-file
	);setq
);if

(if (or (= str-01 "Аналоговый ввод")
				(= str-01 "Аналоговый вывод")
				(= str-01 "Дискретный ввод")
				(= str-01 "Дискретный вывод"))
	(setq list-02 list-01-read-file
				list-03 list-02-read-file
				list-04 nil
				list-05 nil
				list-06 nil
				list-07 list-03-read-file
				list-08 list-04-read-file
				list-99 list-05-read-file
	);setq
);if


(list-filling "txt-02" list-02)
(list-filling "txt-03" list-03)
(list-filling "txt-04" list-04)
(list-filling "txt-05" list-05)
(list-filling "txt-06" list-06)
(list-filling "txt-07" list-07)
(list-filling "txt-08" list-08)
(list-filling "txt-99" list-99)

(set_tile "txt-02" "0")
(set_tile "txt-03" "0")
(set_tile "txt-04" "0")
(set_tile "txt-05" "0")
(set_tile "txt-06" "0")
(set_tile "txt-07" "0")
(set_tile "txt-08" "0")
(set_tile "txt-99" "0")

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма формирования данных/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun but1-101-01-plc-owen-01-general

( / str-01 str-02 str-03 str-04 str-05 str-06 str-07 str-99 tmp-list-902)

(setq str-01 (nth (atoi (get_tile "txt-01")) list-01)
			str-02 (nth (atoi (get_tile "txt-02")) list-02)
			str-07 (nth (atoi (get_tile "txt-07")) list-07)
			str-99 (nth (atoi (get_tile "txt-99")) list-99)
);setq

(if (/= list-902 nil) (setq list-902 (reverse list-902)));if

(if (= str-01 "Контроллер")
	(setq str-03 (nth (atoi (get_tile "txt-03")) list-03)
			str-04 (nth (atoi (get_tile "txt-04")) list-04)
			str-05 (nth (atoi (get_tile "txt-05")) list-05)
			str-06 (nth (atoi (get_tile "txt-06")) list-06)
				
			list-901 (vl-list* (strcat str-01 "  " str-02 "  Ain " str-03 "  Aout " str-04 "  Din " str-05 "  Dout " str-06 "  Uпит " str-07) list-901)
			tmp-list-902 (list (cons 1 str-01) (cons 2 str-02) (cons 3 str-03) (cons 4 str-04) (cons 5 str-05) (cons 6 str-06) (cons 7 str-07) (cons 99 str-99))
	);setq
);if

(if (= str-01 "Аналоговый ввод")
	(setq str-03 (nth (atoi (get_tile "txt-03")) list-03)
				
			list-901 (vl-list* (strcat str-01 "  " str-02 "  Ain " str-03 "  Uпит " str-07) list-901)
			tmp-list-902 (list (cons 1 str-01) (cons 2 str-02) (cons 3 str-03) (cons 7 str-07) (cons 99 str-99))
	);setq
);if

(if (= str-01 "Аналоговый вывод")
	(setq str-03 (nth (atoi (get_tile "txt-03")) list-03)
				
			list-901 (vl-list* (strcat str-01 "  " str-02 "  Aout " str-03 "  Uпит " str-07) list-901)
			tmp-list-902 (list (cons 1 str-01) (cons 2 str-02) (cons 3 str-03) (cons 7 str-07) (cons 99 str-99))
	);setq
);if

(if (= str-01 "Дискретный ввод")
	(setq str-03 (nth (atoi (get_tile "txt-03")) list-03)
				
			list-901 (vl-list* (strcat str-01 "  " str-02 "  Din " str-03 "  Uпит " str-07) list-901)
			tmp-list-902 (list (cons 1 str-01) (cons 2 str-02) (cons 3 str-03) (cons 7 str-07) (cons 99 str-99))
	);setq
);if

(if (= str-01 "Дискретный вывод")				
	(setq str-03 (nth (atoi (get_tile "txt-03")) list-03)
				
			list-901 (vl-list* (strcat str-01 "  " str-02 "  Dout " str-03 "  Uпит " str-07) list-901)
			tmp-list-902 (list (cons 1 str-01) (cons 2 str-02) (cons 3 str-03) (cons 7 str-07) (cons 99 str-99))
	);setq
);if

(setq list-901 (reverse list-901)
		list-902 (vl-list* tmp-list-902 list-902)
		list-902 (reverse list-902)
);setq

(list-filling "txt-901" list-901)

(princ)
)
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в ПЭ                   /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun le-101-01-plc-owen-01-general

( / cntr-1 pnt-ins str-01 str-02 str-03 str-04 str-05 str-06 str-07 str-701 str-702 str-tmp str-txt-01)

(setq cntr-1 0);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-01 (cdr (assoc 1 str-tmp))
				str-02 (cdr (assoc 2 str-tmp))
				str-07 (cdr (assoc 7 str-tmp))
	);setq
	
	(setvar "osmode" 6199)
	
	(setq pnt-ins (getpoint "\nУкажите точку вставки\n"));setq
	
	;;;;;;;///////////////////////////////////////////////////////////////////////////////////////////
	(if (= str-01 "Контроллер")
		(progn
			(setq str-03 (cdr (assoc 3 str-tmp))
						str-04 (cdr (assoc 4 str-tmp))
						str-05 (cdr (assoc 5 str-tmp))
						str-06 (cdr (assoc 6 str-tmp))
						str-701 (strcat "Контроллер ОВЕН " str-02 ", Uпит " str-07)
						str-702 nil
			);setq

			(if (/= str-03 "Нет") (setq str-701 (strcat str-701 ", кол. аналог. входов " str-03)));if

			(if (/= str-04 "Нет") (setq str-701 (strcat str-701 ", кол. аналог. выходов " str-04)));if
			
			(if (/= str-05 "Нет") (setq str-701 (strcat str-701 ", кол. дискр. входов " str-05 ", ")));if
			
			(if (/= str-06 "Нет") (setq str-701 (strcat str-701 "кол. дискр. выходов " str-06)));if
		);progn
	);if

	;;;;;;;///////////////////////////////////////////////////////////////////////////////////////////
	(if (= str-01 "Аналоговый ввод")
		(setq str-701 (strcat "Модуль аналогового ввода ОВЕН " str-02", Uпит " str-07)
					str-702 nil
		);setq
	);if

	;;;;;;;///////////////////////////////////////////////////////////////////////////////////////////
	(if (= str-01 "Аналоговый вывод")
		(setq str-701 (strcat "Модуль аналогового вывода ОВЕН " str-02", Uпит " str-07)
					str-702 nil
		);setq
	);if

	;;;;;;;///////////////////////////////////////////////////////////////////////////////////////////
	(if (= str-01 "Дискретный ввод")
		(setq str-701 (strcat "Модуль дискретного ввода ОВЕН " str-02", Uпит " str-07)
					str-txt-01 nil
		);setq
	);if

	;;;;;;;///////////////////////////////////////////////////////////////////////////////////////////
	(if (= str-01 "Дискретный вывод")
		(setq str-701 (strcat "Модуль дискретного вывода ОВЕН " str-02", Uпит " str-07)
					str-702 nil
		);setq
	);if

	(split-str-parts-le-01-general str-701 str-702 pnt-ins "**1**");

	(setq cntr-1 (1+ cntr-1));setq
);repeat

(princ)
)
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в спцф                   ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun spcf-101-01-plc-owen-01-general

( / cntr-1 pnt-ins str-01 str-02 str-07 str-701 str-702 str-99 str-crtf str-manufact str-order str-tmp str-unit)

(setq cntr-1 0);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-01 (cdr (assoc 1 str-tmp))
				str-02 (cdr (assoc 2 str-tmp))
				str-07 (cdr (assoc 7 str-tmp))
				str-99 (cdr (assoc 99 str-tmp))
	);setq
	
;(princ "\n         str-tmp = ") (princ str-tmp);Erase_DV
;(getstring "\nPress Enter to continue...");Erase_DV
	
	(setvar "osmode" 6199)
	
	(setq pnt-ins		(getpoint "\nУкажите точку вставки\n"));setq

	;;;;;;;///////////////////////////////////////////////////////////////////////////////////////////
	(if (= str-01 "Контроллер")
		(setq str-701 "Контроллер"
					
					str-702 (list (cons 1 (strcat "Uпит. " str-07))
									);list
					str-crtf nil			
		);setq
	);if

	;;;;;;;///////////////////////////////////////////////////////////////////////////////////////////
	(if (= str-01 "Аналоговый ввод")
		(setq str-701 "Модуль ввода аналоговых сигналов"
					str-702 (list (cons 1 (strcat "Uпит. " str-07))
												(cons 2 "свидетельство СИ RU.C.34.004.A № 48323")
									);list
									
					str-crtf nil			
		);setq
	);if
			
	;;;;;;;///////////////////////////////////////////////////////////////////////////////////////////
	(if (= str-01 "Аналоговый вывод")
		(setq str-701 "Модуль вывода аналоговых сигналов"
					str-702 (list (cons 1 (strcat "Uпит. " str-07))
												(cons 2 "свидетельство RU.C.34.004.A № 48323")
									);list
									
					str-crtf nil			
		);setq
	);if

	;;;;;;;///////////////////////////////////////////////////////////////////////////////////////////
	(if (= str-01 "Дискретный ввод")
		(setq str-701 "Модуль ввода дискретных сигналов"
					str-702 (list (cons 1 (strcat "Uпит. " str-07))
									);list
					str-crtf nil			
		);setq
	);if
		
	;;;;;;;///////////////////////////////////////////////////////////////////////////////////////////
	(if (= str-01 "Дискретный вывод")		
		(setq str-701 "Модуль вывода дискретных сигналов"
					str-702 (list (cons 1 (strcat "Uпит. " str-07))
									);list
					str-crtf nil			
		);setq
	);if
								
	(setq str-manufact "ОВЕН, г. Москва"
				str-order (list (cons 1 str-02) 
									 			(cons 2 "-") 
									 			(cons 3 nil));list
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
(defun lecgv-101-01-plc-owen-01-general

( / cntr-1 pnt-ins str-01 str-02 str-701 str-702 str-703 str-99 str-tmp str-txt str-txt-01 str-txt-02)

(setq cntr-1 0);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
	 		str-01 (cdr (assoc 1 str-tmp))
	 		str-02 (cdr (assoc 2 str-tmp))
	 		str-99 (cdr (assoc 99 str-tmp))
	);setq
	
	(setvar "osmode" 6199)
	
	(setq pnt-ins (getpoint "\nУкажите точку вставки\n"));setq

	;;;;;;;///////////////////////////////////////////////////////////////////////////////////////////
	(if (= str-01 "Контроллер")
		(setq str-701 (strcat "Контроллер ОВЕН " str-02)
				str-702 nil
				str-703 nil
		);setq
	);if

	;;;;;;;///////////////////////////////////////////////////////////////////////////////////////////
	(if (= str-01 "Аналоговый ввод")
		(setq str-txt (strcat "Модуль ввода аналоговых сигналов ОВЕН" str-02)
				str-txt-01 nil
				str-txt-02 nil
		);setq
	);if

	;;;;;;;///////////////////////////////////////////////////////////////////////////////////////////
	(if (= str-01 "Аналоговый вывод")
		(setq str-txt (strcat "Модуль вывода аналоговых сигналов ОВЕН " str-02)
				str-txt-01 nil
				str-txt-02 nil
		);setq
	);if
			
	;;;;;;;///////////////////////////////////////////////////////////////////////////////////////////
	(if (= str-01 "Дискретный ввод")
		(setq str-txt (strcat "Модуль ввода дискретных сигналов ОВЕН " str-02)
				str-txt-01 nil
				str-txt-02 nil
		);setq
	);if

	;;;;;;;///////////////////////////////////////////////////////////////////////////////////////////
	(if (= str-01 "Дискретный вывод")
		(setq str-txt (strcat "Модуль вывода дискретных сигналов ОВЕН " str-02)
				str-txt-01 nil
				str-txt-02 nil
		);setq
	);if

	(split-str-parts-lecgv-01-general str-701 str-702 str-703 str-99 pnt-ins);

	(setq cntr-1 (+ cntr-1 1));setq
);repeat

(princ)
)
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////