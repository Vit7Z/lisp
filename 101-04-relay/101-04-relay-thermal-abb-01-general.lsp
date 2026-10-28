;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////                                                              ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun 101-04-relay-thermal-abb-01-general

( / adoc dcl-id list-01 list-01-read-file list-02 list-02-read-file list-03 list-03-read-file list-04 list-04-read-file list-05 list-06 list-07 list-801 list-802 list-900 
list-900-dscr list-900-menu list-901 list-902 list-99 str-01 type-list)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(read-file-for-dialog-box-01 "101-04-relay-thermal-abb-01-general.txt" 3)

(setq list-01 list-01-read-file
			list-801 list-02-read-file
			list-802 list-03-read-file
			list-99 list-04-read-file
			
      list-901 nil
      list-902 nil
      
      list-900-menu nil
      list-900-dscr nil
      
      str-01 "0"
);setq

(txt-01-101-04-relay-thermal-abb-01-general str-01)

(if (< (setq dcl-id (load_dialog "dia-101-04-relay-thermal-abb-01-general.dcl")) 0) ;ищем диалог
		(progn
			(alert "Не найден dcl-файл")
			(exit)
		);progn
);if

(if (not (new_dialog "dia_101_04_relay_abb_overload" dcl-id))
		(exit)
);if

(list-filling "txt-01" list-01)
(list-filling "txt-02" list-02)
(list-filling "txt-03" list-03)
(list-filling "txt-04" list-04)
(list-filling "txt-05" list-05)
(list-filling "txt-06" list-06)
(list-filling "txt-07" list-07)
(list-filling "txt-900" list-900)

(set_tile "txt-01" "0")
(set_tile "txt-02" "0")
(set_tile "txt-03" "0")
(set_tile "txt-04" "0")
(set_tile "txt-05" "0")
(set_tile "txt-06" "0") 
(set_tile "txt-07" "0")

(action_tile "txt-01"
  (strcat "(setq str-01 (get_tile \"txt-01\"))"
  				"(txt-01-101-04-relay-thermal-abb-01-general str-01)"
  );srcat
);action_tile

(action_tile "txt-02"
  (strcat "(setq str-txt (get_tile \"txt-02\"))"
  				"(set_tile \"txt-03\" str-txt)"
  				"(set_tile \"txt-04\" str-txt)"
  				"(set_tile \"txt-05\" str-txt)"
  				"(set_tile \"txt-06\" str-txt)"
  				"(set_tile \"txt-07\" str-txt)"
  );srcat
);action_tile

(action_tile "txt-04"
  (strcat "(setq str-txt (get_tile \"txt-04\"))"
  				"(set_tile \"txt-02\" str-txt)"
  				"(set_tile \"txt-03\" str-txt)"
  				"(set_tile \"txt-05\" str-txt)"
  				"(set_tile \"txt-06\" str-txt)"
  				"(set_tile \"txt-07\" str-txt)"
  );srcat
);action_tile

(action_tile "but1"
  (strcat "(but1-101-04-relay-thermal-abb-01-general)"
  				"(list-filling \"txt-02\" list-02)"
					"(list-filling \"txt-03\" list-03)"
					"(list-filling \"txt-04\" list-04)"
					"(list-filling \"txt-05\" list-05)"
					"(set_tile \"txt-02\" \"0\")"
          "(set_tile \"txt-03\" \"0\")"
          "(set_tile \"txt-04\" \"0\")"
          "(set_tile \"txt-05\" \"0\")"
          "(set_tile \"txt-07\" \"0\")"
  );strcat
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

(if (= type-list "le") (le-101-04-relay-thermal-abb-01-general));if
(if (= type-list "spcf") (spcf-101-04-relay-thermal-abb-01-general));if
(if (= type-list "lecgv") (lecgv-101-04-relay-thermal-abb-01-general));if

(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(vla-endundomark adoc)
(gc)
(princ)
)
;/////// конец программы ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun txt-01-101-04-relay-thermal-abb-01-general

(str-01 / list-01-read-file list-02-read-file list-03-read-file list-04-read-file list-05-read-file list-900-dscr list-900-menu list-900-read-file name-file-1 num-flds)

(setq name-file-1 (nth (atoi str-01) list-801)
			num-flds (atoi (nth (atoi str-01) list-802))
);setq

(read-file-for-dialog-box-01 name-file-1 num-flds)

(set_tile "menu-31" (nth 0 list-900-menu))
(set_tile "menu-32" (nth 1 list-900-menu))

(set_tile "menu-41" (nth 2 list-900-menu))
(set_tile "menu-42" (nth 3 list-900-menu))

(set_tile "menu-51" (nth 4 list-900-menu))
(set_tile "menu-52" (nth 5 list-900-menu))

(set_tile "menu-61" (nth 6 list-900-menu))
(set_tile "menu-62" (nth 7 list-900-menu))

(set_tile "menu-71" (nth 8 list-900-menu))
(set_tile "menu-72" (nth 9 list-900-menu))

(setq list-02 list-01-read-file
			list-03 list-02-read-file
			list-04 list-03-read-file
			list-05 list-04-read-file
			list-07 list-05-read-file
);setq

(cond
	((= (nth (atoi str-01) list-01) "TF42")
		(setq list-06 (list "DIN-рейка" "Контактор"));setq
	);=

	((setq list-06 nil));setq
);cond

(divide-text-into-parts list-900-dscr 100)

(setq list-900 list-900-read-file);setq

(list-filling "txt-02" list-02)
(list-filling "txt-03" list-03)
(list-filling "txt-04" list-04)
(list-filling "txt-05" list-05)
(list-filling "txt-06" list-06)
(list-filling "txt-07" list-07)
(list-filling "txt-900" list-900)

(set_tile "txt-02" "0")
(set_tile "txt-03" "0")
(set_tile "txt-04" "0")
(set_tile "txt-05" "0")
(set_tile "txt-06" "0")

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма формирования данных/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun but1-101-04-relay-thermal-abb-01-general

( / str-01 str-02 str-03 str-04 str-06 str-99 tmp-list-902)

(setq str-01 (nth (atoi (get_tile "txt-01")) list-01)

			str-02 (nth (atoi (get_tile "txt-02")) list-02)
			
			str-03 (nth (atoi (get_tile "txt-03")) list-03)
);setq

(if (/= list-901 nil)
	(setq list-902 (reverse list-902)
	
				list-901 (reverse list-901)
	);setq
);if

;;;;;;;////////////////////////////////////////////////////////////////////////
(if (= str-01 "TF42")
	(setq str-04 (nth (atoi (get_tile "txt-04")) list-04)
	
				str-06 (nth (atoi (get_tile "txt-06")) list-06)
				
				str-06 (vl-string-subst "контактор" "Контактор" str-06)
				
				str-06 (vl-string-subst "DIN-рейку" "DIN-рейка" str-06)

				str-99 (nth (atoi (get_tile "txt-07")) list-07)
				
				list-901 (vl-list* (strcat str-02 "  Iуст " str-04 "А  Монтаж на " str-06) list-901)
  	
				tmp-list-902 (list (cons 2 str-02) (cons 3 str-03) (cons 4 str-04) (cons 6 str-06) (cons 99 str-99))
	);setq
);if

;;;;;;;////////////////////////////////////////////////////////////////////////
(if (= str-01 "Монтажн. компл")
	(setq str-99 (nth (atoi (get_tile "txt-04")) list-04)
				
				list-901 (vl-list* (strcat str-01 "  " str-02) list-901)
  	
				tmp-list-902 (list (cons 1 str-01) (cons 2 str-02) (cons 3 str-03) (cons 99 str-99))
	);setq
);if

(setq list-902 (vl-list*  tmp-list-902 list-902)

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
(defun le-101-04-relay-thermal-abb-01-general

( / cntr-1 pnt-ins str-02 str-04 str-06 str-701 str-702 str-tmp)

(setq cntr-1 0);setq

(repeat (length list-902)
	(setvar "osmode" 6199)
	
	(setq str-tmp (nth cntr-1 list-902)
	
				str-02 (cdr (assoc 2 str-tmp))

				pnt-ins (getpoint "\nУкажите точку вставки\n")
	);setq

	;;;;////////////////////////////////////////////////////////////////////////
	(if (wcmatch str-02 "TF42*")
		(setq str-04 (cdr (assoc 4 str-tmp))
					str-06 (cdr (assoc 6 str-tmp))
			
					str-701 (strcat "Реле перегрузки (тепловое) ABB " str-02 ", диапазон уставок " str-04 "А, монтаж на " str-06)
					str-702 nil
			);setq
	);if
	

	;;;;////////////////////////////////////////////////////////////////////////
	(if (= str-02 "DB42")
		(setq str-701 (strcat "Монтажный комплект ABB " str-02 ", для монтажа реле TF42 (тепловое) на DIN-рейку")
					str-702 nil
		);setq
	);if
	
	(split-str-parts-le-01-general str-701 str-702 pnt-ins "**1**");
	
	(setq cntr-1 (1+ cntr-1));setq
);repeat

(princ)
)
;;;;//////////////////////////////////////////////////////////////////////////////////////
;;;;//////////////////////////////////////////////////////////////////////////////////////


;;;;//////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в спцф                   /////////////////////////////////////////
(defun spcf-101-04-relay-thermal-abb-01-general

( / cntr-1 pnt-ins str-02 str-03 str-04 str-07 str-701 str-702 str-99 str-crtf str-manufact str-order str-tmp str-unit)

(setq cntr-1 0);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-02 (cdr (assoc 2 str-tmp))
				str-03 (cdr (assoc 3 str-tmp))
				str-04 (cdr (assoc 4 str-tmp))
				str-07 (cdr (assoc 7 str-tmp))
				str-99 (cdr (assoc 99 str-tmp))
	);setq
	
	(setvar "osmode" 6199)
	
	(setq pnt-ins (getpoint "\nУкажите точку вставки\n"));setq

	;;;;//////////////////////////////////////////////////////////////////////////////////////////////
	(if (wcmatch str-02 "TF42*")
		(progn
			(cond
				((= str-07 "Контактор") (setq str-07 "контактор"));=
				((= str-07 "DIN-рейка") (setq str-07 "DIN-рейку"));=
			);cond
			
			(setq str-701 "Реле перегрузки по току (тепловое)"		
						str-702 (list (cons 1 (strcat "диапазон уставок " str-03 "А, монтаж на " str-07)));str-702
			);setq

			;заказ
			(setq str-manufact "ABB, г. Москва"			
						str-order (list (cons 1 (strcat str-02 ", код заказа " str-04))
														(cons 2 ",") 
														(cons 3 nil));list
						str-unit "шт."
						str-crtf nil
			);setq
			
			(split-str-parts-spcf-01-general str-701 str-702 str-order str-manufact str-unit str-99 str-crtf pnt-ins);
			
			(if (= str-07 "DIN-рейку")
				(progn
					(setvar "osmode" 6199)
					
					(setq pnt-ins (getpoint "\nУкажите точку вставки\n")				
								str-701 "Комплект для монтажа реле на DIN-рейку"		
								str-702 (list (cons 1 "для TF42"));str-702
								str-99 "0,09"
					);setq

					(setq str-manufact "ABB, г. Москва"			
								str-order (list (cons 1 "DB42, код заказа 1SAZ701902R0001")
																(cons 2 ",") 
																(cons 3 nil));list
								str-unit "шт."
								str-crtf nil
					);setq
				
					(split-str-parts-spcf-01-general str-701 str-702 str-order str-manufact str-unit str-99 str-crtf pnt-ins);
				);progn	
			);if
			
		);progn
	);if
			
	(setq cntr-1 (+ cntr-1 1));setq
);repeat

(princ)
)
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в овш               ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun lecgv-101-04-relay-thermal-abb-01-general

( / cntr-1 pnt-ins str-02 str-03 str-04 str-07 str-701 str-702 str-703 str-99 str-tmp)

(setq cntr-1 0);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-02 (cdr (assoc 2 str-tmp))
				str-03 (cdr (assoc 3 str-tmp))
				str-04 (cdr (assoc 4 str-tmp))
				str-07 (cdr (assoc 7 str-tmp))
				str-99 (cdr (assoc 99 str-tmp))
	);setq
	
	(setvar "osmode" 6199)
	
	(setq pnt-ins (getpoint "\nУкажите точку вставки\n"));setq
	
	;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	(if (wcmatch str-02 "TF42*")
		(progn
			(cond
				((= str-07 "Контактор") (setq str-07 "контактор"));=
				((= str-07 "DIN-рейка") (setq str-07 "DIN-рейку"));=
			);cond
			
			(setq str-701 (strcat "Реле перегрузки (тепловое) ABB, тип " str-02 ", диапазон уставок " str-03 "А, код заказа " str-04 ", монтаж на " str-07)
						str-702 nil
						str-703 nil
			);setq
			;
			(split-str-parts-lecgv-01-general str-701 str-702 str-703 str-99 pnt-ins);
			
			(if (= str-07 "DIN-рейку")
				(progn
					(setvar "osmode" 6199)
					
					(setq pnt-ins (getpoint "\nУкажите точку вставки\n")
								str-701 "Комплект для монтажа реле на DIN-рейку (для TF42), тип DB42, код заказа 1SAZ701902R0001"
								str-702 nil
								str-99 "0,09"
					);setq
			
					(split-str-parts-lecgv-01-general str-701 str-702 str-703 str-99 pnt-ins);
				);progn
			);if
		);progn	
	);if = str-00


 
	(setq cntr-1 (+ cntr-1 1));setq
);repeat

(princ)
)
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////