;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////                                                              ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun 101-04-ups-eaton-01-general

( / adoc dcl-id list-01 list-01-read-file list-02 list-02-read-file list-03 list-03-read-file list-04 list-05 list-06 list-801 list-802 list-900 list-901 list-902 str-01 type-list)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(read-file-for-dialog-box-01 "101-04-ups-eaton-01-general.txt" 3)

(setq list-901 nil
      list-902 nil
			
			str-01 "0"

			list-01 list-01-read-file
			list-801 list-02-read-file
			list-802 list-03-read-file
);setq

(txt-01-101-04-ups-eaton-01-general str-01)

(if (< (setq dcl-id (load_dialog "dia-101-04-ups-eaton-01-general.dcl")) 0) ;ищем диалог
		(progn
			(alert "Не найден dcl-файл")
			(exit)
		);progn
);if

(if (not (new_dialog "dia_01_04_ups_eaton_01_general" dcl-id))
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
  				"(txt-01-101-04-ups-eaton-01-general str-01)"
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
  (strcat "(set_tile \"txt-02\" $value)"
          "(set_tile \"txt-04\" $value)"
          "(set_tile \"txt-05\" $value)"
          "(set_tile \"txt-06\" $value)"
  );srcat
);action_tile

(action_tile "txt-05"
  (strcat "(set_tile \"txt-02\" $value)"
          "(set_tile \"txt-03\" $value)"
          "(set_tile \"txt-04\" $value)"
          "(set_tile \"txt-06\" $value)"
  );srcat
);action_tile

(action_tile "but1"
  (strcat "(fil-fields-101-04-ups-eaton-01-general)"
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

(action_tile "but5"
  (strcat "(list-delete-item)");strcat
);action_tile

(action_tile "accept"
  (strcat "(done_dialog)"
          "(exit)"
  );strcat
);action_tile

(start_dialog)
(unload_dialog dcl-id)

(if (= type-list "le") (le-101-04-ups-eaton-01-general));if

(if (= type-list "spcf") (spcf-101-04-ups-eaton-01-general));if

(if (= type-list "lecgv") (lecgv-101-04-ups-eaton-01-general));if

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
(defun txt-01-101-04-ups-eaton-01-general

(str-01 / list-01-read-file list-02-read-file list-03-read-file list-04-read-file list-05-read-file list-06-read-file list-900-dscr list-900-menu list-900-read-file 
name-file-1 num-flds str-01-1)

(setq name-file-1 (nth (atoi str-01) list-801)
			num-flds (atoi (nth (atoi str-01) list-802))
			str-01-1 (nth (atoi str-01) list-01)
);setq

(read-file-for-dialog-box-01 name-file-1 num-flds)

(set_tile "htxt-041" (nth 0 list-900-menu))
(set_tile "htxt-042" (nth 1 list-900-menu))

(set_tile "htxt-051" (nth 2 list-900-menu))
(set_tile "htxt-052" (nth 3 list-900-menu))

(divide-text-into-parts list-900-dscr 150)

(setq list-02 list-01-read-file
			list-03 list-02-read-file
			list-04 list-03-read-file
			list-05 list-04-read-file
			list-06 list-05-read-file
			list-900 list-900-read-file
);setq

(cond
	((= str-01-1 "Батарея")
		(setq list-06 list-05
					list-05 nil
		);setq
	);=

	((= str-01-1 "Кабели для байпаса")
		(setq list-06 list-04
					list-04 nil
		);setq
	);=

	((= str-01-1 "Байпас")
		(setq list-06 list-05
					list-05 nil
		);setq
	);=
);cond

(list-filling "txt-02" list-02)
(list-filling "txt-03" list-03)
(list-filling "txt-04" list-04)
(list-filling "txt-05" list-05)
(list-filling "txt-06" list-06)
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
(defun fil-fields-101-04-ups-eaton-01-general

( / str-01 str-02 str-03 str-04 str-04-l str-04-r str-05 str-99 tmp-str-902)

(setq str-01 (nth (atoi (get_tile "txt-01")) list-01)
			str-02 (nth (atoi (get_tile "txt-02")) list-02)
			str-03 (nth (atoi (get_tile "txt-03")) list-03)
			
			str-99 (nth (atoi (get_tile "txt-06")) list-06)
);setq

(if (/= list-901 nil) 
	(setq list-901 (reverse list-901)
				list-902 (reverse list-902)
	);setq
);if

;;;;;;;///////////////////////////////////////////
(if (= str-01 "ИБП")
	(setq str-04 (nth (atoi (get_tile "txt-04")) list-04)
				str-04-l (substr str-04 1 (vl-string-search "," str-04));Uном
				str-04-r (substr str-04 (+ (vl-string-search "," str-04) 3));Pном

				str-05 (nth (atoi (get_tile "txt-05")) list-05)
				
				str-05 (vl-string-subst " и " ", " str-05)
				
				list-901 (vl-list* (strcat str-01 "  " str-02 "  " str-04 "  Разъемы " str-05) list-901)
				
				tmp-str-902 (list (cons 1 str-01) (cons 2 str-02) (cons 3 str-03) (cons 4 str-04-l) (cons 5 str-04-r) (cons 6 str-05) (cons 99 str-99))
	);setq
);if

;;;;;;;///////////////////////////////////////////
(if (= str-01 "Батарея")
	(setq str-04 (nth (atoi (get_tile "txt-04")) list-04)
					
				list-901 (vl-list* (strcat str-01 "  " str-02 "  Для " str-04) list-901)
				
				tmp-str-902 (list (cons 1 str-01) (cons 2 str-02) (cons 3 str-03) (cons 4 str-04) (cons 99 str-99))
	);setq
);if

;;;;;;;///////////////////////////////////////////
(if (= str-01 "Байпас")
	(setq str-04 (nth (atoi (get_tile "txt-04")) list-04)
				str-04-l (substr str-04 1 3);Iном
				str-04-r (substr str-04 6)
				
				list-901 (vl-list* (strcat str-01 "  " str-02 "  Iном " str-04-l "  Разъемы " str-04-r) list-901)
				
				tmp-str-902 (list (cons 1 str-01) (cons 2 str-02) (cons 3 str-03) (cons 4 str-04-l) (cons 5 str-04-r) (cons 99 str-99))
	);setq
);if

;;;;;;;///////////////////////////////////////////
(if (= str-01 "Кабели для байпаса")
	(setq list-901 (vl-list* (strcat str-01 "  " str-02) list-901)
				
				tmp-str-902 (list (cons 1 str-01) (cons 2 str-02) (cons 3 str-03) (cons 99 str-99))
	);setq
);if

(setq list-902 (vl-list* tmp-str-902 list-902)
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
(defun le-101-04-ups-eaton-01-general

( / cntr-1 pnt-ins str-01 str-02 str-03 str-04 str-05 str-06 str-701 str-702 str-tmp)

(setq cntr-1 0);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-01 (cdr (assoc 1 str-tmp))
				str-02 (cdr (assoc 2 str-tmp))
				str-03 (cdr (assoc 3 str-tmp))				
	);setq
	
	(setvar "osmode" 6199)
	
	(setq pnt-ins (getpoint "\nУкажите точку вставки\n"));setq

	;;;;;;;;;/////////
	(if (= str-01 "ИБП")
		(setq str-04 (cdr (assoc 4 str-tmp))
					str-05 (cdr (assoc 5 str-tmp))
					str-06 (cdr (assoc 6 str-tmp))
					
					str-701 (strcat "Источник бесперебойного питания Eaton " str-02 ", артикул " str-03 ", Uвх " str-04 ", Pном " str-05 ", разъемы " str-06)
					str-702 nil
		);setq
	);if

	;;;;;;;;;/////////
	(if (= str-01 "Батарея")
		(setq str-04 (cdr (assoc 4 str-tmp))
		
					str-701 (strcat "Батарея для источника бесперебойного питания Eaton " str-02 ", артикул " str-03 ", для ИБП модели " str-04)
					str-702 nil
		);setq
	);if

	;;;;;;;;;/////////
	(if (= str-01 "Байпас")
		(setq str-04 (cdr (assoc 4 str-tmp))
					str-05 (cdr (assoc 5 str-tmp))
					
					str-701 (strcat "Байпас Eaton " str-02 ", артикул " str-03 ", Iном " str-04 ", разъемы " str-05)
					str-702 nil
		);setq
	);if

	;;;;;;;;;/////////
	(if (= str-01 "Кабели для байпаса")
		(setq str-04 (cdr (assoc 4 str-tmp))
					str-05 (cdr (assoc 5 str-tmp))
					
					str-701 (strcat "Набор кабелей Eaton " str-02 ", артикул " str-03 ", для подключения байпаса к ИБП до 1000 ВА")
					str-702 nil
		);setq
	);if

	(split-str-parts-le-01-general str-701 str-702 pnt-ins "**1**");
	
	(setq cntr-1 (1+ cntr-1));setq
);repeat

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в спцф                   ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

(defun spcf-101-04-ups-eaton-01-general

( / cntr-1 dlt-y nmbr-ln pnt-ins str-01 str-02 str-03 str-04 str-05 str-99 str-not str-patrn str-txt str-unt x-pnt-ins y-pnt-ins y-pnt-ins-1)

(setq cntr-1 0);setq

(setvar "textstyle" "Standard")

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-01 (cdr (assoc 1 str-tmp))
				str-02 (cdr (assoc 2 str-tmp))
				str-03 (cdr (assoc 3 str-tmp))
				str-04 (cdr (assoc 4 str-tmp))
				str-05 (cdr (assoc 5 str-tmp))
				str-99 (cdr (assoc 99 str-tmp))
	);setq
	
(princ "\n         str-tmp = ") (princ str-tmp);Erase_DV
(getstring "\nPress Enter to continue...");Erase_DV
	

	(setvar "osmode" 6199)
	
	(setq pnt-ins (getpoint "\nУкажите точку вставки\n"));setq

	;;;;;;;;;/////////
	(if (= str-01 "ИБП")	
		(setq str-701 "Источник бесперебойного питания"
	
					str-702 (list (cons 1 (strcat "Uвх. " str-04 ", мощность " str-05))
									);list
											
					str-manufact "Eaton"
				
					str-order (list (cons 1 str-03) 
													(cons 2 ",") 
													(cons 3 nil) ;;;  здесь обозначение ТУ или НТД
										);list
				
				str-unit "шт."
				str-note nil ;;;;;;; примечание, текстовая строка
		);setq
	);if

	;;;;;;;;;/////////
	(if (= str-01 "Батарея")
		(progn
			(setq nmbr-ln 3
						str-txt (strcat "Артикул " str-03)
						str-not nil
						str-patrn " "
						str-unt "компл."
			);setq
			
			(1000-delete-items-spcf nmbr-ln pnt-ins)
			(1000-delete-items-spcf-crtf nmbr-ln pnt-ins)
	
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 (strcat "Батарея для источника бесперебойного питания"))
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "- совместимость " str-02))
		);progn
	);if

	(split-str-parts-spcf-01-general str-701 str-702 str-order str-manufact str-unit str-99 str-note pnt-ins);
 
	(setq cntr-1 (+ cntr-1 1));setq
);repeat

(princ)
)
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в овш               ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun lecgv-101-04-ups-eaton-01-general

( / cntr-1 pnt-ins str str-01 str-02 str-03 str-04 str-05 str-701 str-702 str-703 str-99)

(setq cntr-1 0);setq

(repeat (length list-902)

	(setq str (nth cntr-1 list-902)
				str-01 (cdr (assoc 1 str))
				str-02 (cdr (assoc 2 str))
				str-03 (cdr (assoc 3 str))
				str-04 (cdr (assoc 4 str))
				str-05 (cdr (assoc 5 str))
				str-99 (cdr (assoc 99 str))
	);setq

	(setvar "osmode" 6199)
	
	(setq pnt-ins (getpoint "\nУкажите точку вставки\n"));setq

	;;;;;;;;;/////////
	(if (= str-01 "ИБП")
		(setq str-701 (strcat "Источник бесперебойного питания, " str-02 ", артикул " str-03 ", Uвх. " str-04 "В, мощность " str-05)
					str-702 nil
					str-703 nil
		);setq
	);if

	;;;;;;;;;/////////
	(if (= str-01 "Батарея")
		(setq str-701 (strcat "Батарея для источника бесперебойного питания, " str-02 ", артикул " str-03)
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










