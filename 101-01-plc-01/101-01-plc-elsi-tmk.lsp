;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////                                                              ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun 101-01-controllers-elsi-tmk

( / adoc dcl-id list-01 list-01-read-file list-02 list-02-read-file list-03 list-03-read-file list-04 list-04-read-file list-05 list-06 list-07 list-08 list-801 list-802 list-901 list-902 list-99 list-hdr str-01 type-list)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(read-file-for-dialog-box "101-01-controllers-elsi-tmk-01-general.txt" 3)

(setq list-01 list-01-read-file
			list-801 list-02-read-file
			list-802 list-03-read-file
			
			list-901 nil
      list-902 nil
      
      str-01 nil
);setq

(txt-01-101-01-controllers-elsi-tmk)

(if (< (setq dcl-id (load_dialog "dia-101-01-controllers-elsi-tmk.dcl")) 0) ;ищем диалог
	(progn
		(alert "Не найден dcl-файл")
		(exit)
	);progn
);if

(if (not (new_dialog "dia_101_controllers_elsi_tmk" dcl-id))
	(exit)
);if

(list-filling "txt-01" list-01)
(list-filling "txt-02" list-02)
(list-filling "txt-03" list-03)
(list-filling "txt-04" list-04)
(list-filling "txt-99" list-99)

(set_tile "txt-01" "0")
(set_tile "txt-02" "0")
(set_tile "txt-03" "0")
(set_tile "txt-04" "0")
(set_tile "txt-99" "0")

(action_tile "txt-01"
  (strcat "(txt-01-101-01-controllers-elsi-tmk)");srcat
);action_tile

(action_tile "txt-02"
  (strcat "(set_tile \"txt-03\" $value)"
  				"(set_tile \"txt-04\" $value)"
  				"(set_tile \"txt-99\" $value)"
  );srcat
);action_tile

(action_tile "txt-03"
  (strcat "(set_tile \"txt-02\" $value)"
  				"(set_tile \"txt-04\" $value)"
  				"(set_tile \"txt-99\" $value)"
  );srcat
);action_tile

(action_tile "txt-04"
  (strcat "(set_tile \"txt-02\" $value)"
  				"(set_tile \"txt-03\" $value)"
  				"(set_tile \"txt-99\" $value)"
  );srcat
);action_tile

(action_tile "but1"
  (strcat "(but1-101-01-controllers-elsi-tmk)");strcat
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

(if (= type-list "le") (le-101-01-controllers-elsi-tmk));if

(if (= type-list "spcf") (spcf-101-01-controllers-elsi-tmk));if

(if (= type-list "lecgv") (lecgv-101-01-controllers-elsi-tmk));if

(setvar "osmode" 6199)
(setvar "cmdecho" 1)

(vla-endundomark adoc)
(gc)
(princ)
)
;/////// конец программы //////////////////////////////////////////////////////////////////////////////////////////

;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрогамма чтения данных из файлов             ///////////////////////////////////////////////////////////////
(defun txt-01-101-01-controllers-elsi-tmk

( / list-01-read-file list-02-read-file list-03-read-file list-08-read-file name-file num-flds)

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

;поля диалога
(read-file-for-dialog-box name-file num-flds)

(setq list-02 list-01-read-file
			list-03 list-02-read-file
			list-04 list-03-read-file
			list-99 list-04-read-file
);setq

(list-filling "txt-02" list-02)
(list-filling "txt-03" list-03)
(list-filling "txt-04" list-04)
(list-filling "txt-99" list-99)

(set_tile "txt-02" "0")
(set_tile "txt-03" "0")
(set_tile "txt-04" "0")
(set_tile "txt-99" "0")

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма формирования данных/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun but1-101-01-controllers-elsi-tmk

( / str-01 str-02 str-03 str-04 str-99 tmp-list-902)

(setq str-01 (nth (atoi (get_tile "txt-01")) list-01)
			str-02 (nth (atoi (get_tile "txt-02")) list-02)
			str-03 (nth (atoi (get_tile "txt-03")) list-03)
			str-04 (nth (atoi (get_tile "txt-04")) list-04)
			str-99 (nth (atoi (get_tile "txt-99")) list-99)
);setq

(if (/= list-902 nil) 
	(setq list-902 (reverse list-902)
				list-901 (reverse list-901)
	);setq
);if

(setq list-901 (vl-list* (strcat str-01 "  " str-02 "  " str-04) list-901)
			tmp-list-902 (list (cons 1 str-01) (cons 2 str-02) (cons 3 str-03) (cons 4 str-04) (cons 99 str-99))

			list-901 (reverse list-901)
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
(defun le-101-01-controllers-elsi-tmk

( / cntr-1 pnt-ins str-01 str-02 str-03 str-04 str-04-1 str-701 str-702 str-tmp)

(setq cntr-1 0);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-01 (cdr (assoc 1 str-tmp))
				str-02 (cdr (assoc 2 str-tmp))
				str-03 (cdr (assoc 3 str-tmp))
				str-04 (cdr (assoc 4 str-tmp))
	);setq
	
	(setvar "osmode" 6199)
	
	(setq pnt-ins (getpoint "\nУкажите точку вставки\n"));setq
	
	;;;;;;;///////////////////////////////////////////////////////////////////////////////////////////
	(if (= str-01 "Модуль процессора")		
		(setq str-701 (strcat "Модуль процессора ЭЛСИ-ТМК " str-02 ", код заказа " str-03)
					str-702 nil
		);setq
	);if

	;;;;;;;///////////////////////////////////////////////////////////////////////////////////////////
	(if (= str-01 "Модуль питания")		
		(setq str-04-1 (substr str-04 1 (vl-string-search ";" str-04))
					str-701 (strcat "Модуль питания ЭЛСИ-ТМК " str-02 ", код заказа " str-03 ", " str-04-1)
					str-702 nil
		);setq
	);if


	;;;;;;;///////////////////////////////////////////////////////////////////////////////////////////
	(if (or (= str-01 "Модуль аналогового ввода, термо") (= str-01 "Модуль аналогового ввода, U/I"));or
		(setq str-04-1 (substr str-04 1 (vl-string-search ";" str-04))
					str-701 (strcat "Модуль аналогового ввода ЭЛСИ-ТМК " str-02 ", код заказа " str-03 ", " str-04-1)
					str-702 nil
		);setq
	);if

	;;;;;;;///////////////////////////////////////////////////////////////////////////////////////////
	(if (= str-01 "Аналоговый вывод")
		(setq str-701 (strcat "Модуль аналогового вывода ОВЕН " str-02)
					str-702 nil
		);setq
	);if

	;;;;;;;///////////////////////////////////////////////////////////////////////////////////////////
	(if (or (= str-01 "Модуль дискретного ввода") (= str-01 "Модуль дискретного вывода"))
		(setq str-04-1 (substr str-04 1 (vl-string-search ";" str-04))
					str-701 (strcat str-01 " ЭЛСИ-ТМК " str-02 ", код заказа " str-03 ", " str-04-1)
					str-702 nil
		);setq
	);if

	;;;;;;;///////////////////////////////////////////////////////////////////////////////////////////
	(if (= str-01 "Кабель подключения к модулю")
		(setq str-04 (vl-string-subst "для" "Для" str-04)
					str-701 (strcat "Кабель ЭЛСИ-ТМК " str-02 ", код заказа " str-03 ", " str-04)
					str-702 nil
		);setq
	);if


	(split-str-parts-le-01-general str-701 str-702 pnt-ins);

	(setq cntr-1 (1+ cntr-1));setq
);repeat

(princ)
)
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в спцф                   ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun spcf-101-01-controllers-elsi-tmk

( / cntr-1 dlt-y pnt-ins str-01 str-02 str-701 str-702 str-99 str-crtf str-manufact str-order str-tmp str-unit x-pnt-ins y-pnt-ins y-pnt-ins-1)

(setq cntr-1 0);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-01 (cdr (assoc 1 str-tmp))
				str-02 (cdr (assoc 2 str-tmp))
				str-99 (cdr (assoc 99 str-tmp))
	);setq
	
	(setvar "osmode" 6199)
	
	(setq pnt-ins		(getpoint "\nУкажите точку вставки\n"));setq

	;;;;;;;///////////////////////////////////////////////////////////////////////////////////////////
	(if (= str-01 "Контроллер")
		(setq str-701 "Контроллер"
					str-702 nil
					str-crtf nil			
		);setq
	);if

	;;;;;;;///////////////////////////////////////////////////////////////////////////////////////////
	(if (= str-01 "Аналоговый ввод")
		(setq str-701 "Модуль ввода аналоговых сигналов"
					str-702 nil
					str-crtf "№ 48323"			
		);setq
	);if
			
	;;;;;;;///////////////////////////////////////////////////////////////////////////////////////////
	(if (= str-01 "Аналоговый вывод")
		(setq str-701 "Модуль вывода аналоговых сигналов"
					str-702 nil
					str-crtf "№ 48323"			
		);setq
	);if

	;;;;;;;///////////////////////////////////////////////////////////////////////////////////////////
	(if (= str-01 "Дискретный ввод")
		(setq str-701 "Модуль ввода дискретных сигналов"
					str-702 nil
					str-crtf nil			
		);setq
	);if
		
	;;;;;;;///////////////////////////////////////////////////////////////////////////////////////////
	(if (= str-01 "Дискретный вывод")		
		(setq str-701 "Модуль вывода дискретных сигналов"
					str-702 nil
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
(defun lecgv-101-01-controllers-elsi-tmk

( / cntr-1 pnt-ins str-01 str-02 str-03 str-04 str-04-1 str-701 str-702 str-703 str-99 str-tmp)

(setq cntr-1 0);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
	 			str-01 (cdr (assoc 1 str-tmp))
				str-02 (cdr (assoc 2 str-tmp))
				str-03 (cdr (assoc 3 str-tmp))
				str-04 (cdr (assoc 4 str-tmp))
	 			str-99 (cdr (assoc 99 str-tmp))
	);setq
	
	(setvar "osmode" 6199)
	
	(setq pnt-ins (getpoint "\nУкажите точку вставки\n"));setq



	;;;;;;;///////////////////////////////////////////////////////////////////////////////////////////
	(if (= str-01 "Модуль процессора")		
		(setq str-701 (strcat "Модуль процессора ЭЛСИ-ТМК " str-02 ", код заказа " str-03)
					str-702 nil
					str-703 nil
		);setq
	);if

	;;;;;;;///////////////////////////////////////////////////////////////////////////////////////////
	(if (or (= str-01 "Модуль аналогового ввода, термо")
					(= str-01 "Модуль аналогового ввода, U/I"));or
		(setq str-04-1 (substr str-04 1 (vl-string-search ";" str-04))
					str-701 (strcat "Модуль аналогового ввода ЭЛСИ-ТМК " str-02 ", код заказа " str-03 ", " str-04-1)
					str-702 nil
					str-703 nil
		);setq
	);if

	;;;;;;;///////////////////////////////////////////////////////////////////////////////////////////
	(if (or (= str-01 "Модуль дискретного ввода") (= str-01 "Модуль дискретного вывода") (= str-01 "Модуль питания"))
		(setq str-04-1 (substr str-04 1 (vl-string-search ";" str-04))
					str-701 (strcat str-01 " ЭЛСИ-ТМК " str-02 ", код заказа " str-03 ", " str-04-1)
					str-702 nil
					str-703 nil
		);setq
	);if	

	;;;;;;;///////////////////////////////////////////////////////////////////////////////////////////
	(if (= str-01 "Модуль коммуникационный")		
		(setq str-701 (strcat "Модуль коммуникационный ЭЛСИ-ТМК " str-02 ", код заказа " str-03 ", " str-04)
					str-702 nil
					str-703 nil
		);setq
	);if

	;;;;;;;///////////////////////////////////////////////////////////////////////////////////////////
	(if (= str-01 "Панель коммутационная")		
		(setq str-04-1 (substr str-04 1 (vl-string-search ";" str-04))
					str-04-1 (vl-string-subst "кол" "Кол" str-04-1)
					str-701 (strcat "Панель коммутационная ЭЛСИ-ТМК " str-02 ", код заказа " str-03 ", " str-04-1)
					str-702 nil
					str-703 nil
		);setq
	);if



	;;;;;;;///////////////////////////////////////////////////////////////////////////////////////////
	(if (= str-01 "Кабель подключения к модулю")
		(setq str-04 (vl-string-subst "для" "Для" str-04)
					str-701 (strcat "Кабель ЭЛСИ-ТМК " str-02 ", код заказа " str-03 ", " str-04)
					str-702 nil
					str-703 nil
		);setq
	);if


	(split-str-parts-lecgv-01-general str-701 str-702 str-703 str-99 pnt-ins);

	(setq cntr-1 (+ cntr-1 1));setq
);repeat

(princ)
)
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////