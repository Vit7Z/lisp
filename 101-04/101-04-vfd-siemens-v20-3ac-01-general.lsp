;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////                                                              ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun 101-04-vfd-siemens-v20-3ac-01-general

( / adoc dcl-id list-01 list-01-read-file list-02 list-02-read-file list-03 list-03-read-file list-04 list-04-read-file list-05 list-06 list-801 list-802 list-803 list-900 
list-901 list-902 str-01 type-list)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(read-file-for-dialog-box-01 "101-04-vfd-siemens-v20-3ac-01-general.txt" 4)

(setq list-901 nil
      list-902 nil
			
			str-01 "0"

			list-01 list-01-read-file
			list-801 list-02-read-file
			list-802 list-03-read-file
			list-803 list-04-read-file
);setq

(txt-01-101-04-vfd-siemens-v20-3ac-01-general str-01)

(if (< (setq dcl-id (load_dialog "dia-101-04-vfd-siemens-v20-3ac-01-general.dcl")) 0) ;ищем диалог
		(progn
			(alert "Не найден dcl-файл")
			(exit)
		);progn
);if

(if (not (new_dialog "dia_101_04_vfd_siemens_v20_3ac" dcl-id))
		(exit)
);if

(list-filling "txt-01" list-01)
(list-filling "txt-02" list-02)
(list-filling "txt-03" list-03)
(list-filling "txt-04" list-04)
(list-filling "txt-900" list-900)

(set_tile "txt-01" "0")
(set_tile "txt-02" "0")
(set_tile "txt-03" "0")
(set_tile "txt-04" "0")

(action_tile "txt-01"
  (strcat "(setq str-01 (get_tile \"txt-01\"))"
  				"(txt-01-101-04-vfd-siemens-v20-3ac-01-general str-01)"
  );srcat
);action_tile

(action_tile "txt-02"
  (strcat "(set_tile \"txt-03\" $value)"
          "(set_tile \"txt-04\" $value)"
          "(set_tile \"txt-05\" $value)"
          "(set_tile \"txt-99\" $value)"
  );srcat
);action_tile

(action_tile "txt-03"
  (strcat "(set_tile \"txt-02\" $value)"
          "(set_tile \"txt-04\" $value)"
          "(set_tile \"txt-05\" $value)"
          "(set_tile \"txt-99\" $value)"
  );srcat
);action_tile

(action_tile "txt-05"
  (strcat "(set_tile \"txt-02\" $value)"
          "(set_tile \"txt-03\" $value)"
          "(set_tile \"txt-04\" $value)"
          "(set_tile \"txt-99\" $value)"
  );srcat
);action_tile

(action_tile "but1"
  (strcat "(fil-fields-101-04-vfd-siemens-v20-3ac-01-general)"
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

(if (= type-list "le") (le-101-04-vfd-siemens-v20-3ac-01-general));if

(if (= type-list "spcf") (spcf-101-04-vfd-siemens-v20-3ac-01-general));if

(if (= type-list "lecgv") (lecgv-101-04-vfd-siemens-v20-3ac-01-general));if

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
(defun txt-01-101-04-vfd-siemens-v20-3ac-01-general

(str-01 / list-01-read-file list-02-read-file list-03-read-file list-900-read-file name-file-1 num-flds)

(setq name-file-1 (nth (atoi str-01) list-801)
			num-flds (atoi (nth (atoi str-01) list-802))
			list-900 (nth (atoi str-01) list-803)
);setq

(divide-text-into-parts list-900 130)

(read-file-for-dialog-box-01 name-file-1 num-flds)

(setq list-02 list-01-read-file
			list-03 list-02-read-file
			list-04 list-03-read-file
			list-900 list-900-read-file
);setq


(list-filling "txt-02" list-02)
(list-filling "txt-03" list-03)
(list-filling "txt-04" list-04)
(list-filling "txt-900" list-900)

(set_tile "txt-02" "0")
(set_tile "txt-03" "0")
(set_tile "txt-04" "0")

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма формирования данных/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun fil-fields-101-04-vfd-siemens-v20-3ac-01-general

( / str-01 str-02 str-03 str-032 str-99 tmp-str-902)

(setq str-01 (nth (atoi (get_tile "txt-01")) list-01)
			str-02 (nth (atoi (get_tile "txt-02")) list-02)			
			str-99 (nth (atoi (get_tile "txt-04")) list-04)
);setq

(if (/= list-901 nil) 
	(setq list-901 (reverse list-901)
				list-902 (reverse list-902)
	);setq
);if

;;;;;;;///////////////////////////////////////////
(if (= str-01 "ПЧ Siemens V20")
	(setq str-03 (nth (atoi (get_tile "txt-03")) list-03)
	
				list-901 (vl-list* (strcat str-01 "  " str-02 "  " str-03) list-901)
				
				str-032 (vl-string-subst "Uвх. ~380В, " "~380В  " str-03)
				str-032 (vl-string-subst "кВт, " "кВт  " str-032)
				str-032 (vl-string-subst "А, " "А  " str-032)
				str-032 (vl-string-subst "А, " "А  " str-032)
				str-032 (vl-string-subst "без" "Без" str-032)
				
				tmp-str-902 (list (cons 1 str-01) (cons 2 str-02) (cons 3 str-032) (cons 99 str-99))
	);setq
);if


;;;;;;;///////////////////////////////////////////
(if (or (= str-01 "Базовая панель оператора")
				(= str-01 "BOP-интерфейс"));or
	(setq list-901 (vl-list* (strcat str-01 "  " str-02 ) list-901)				
				tmp-str-902 (list (cons 1 str-01) (cons 2 str-02) (cons 99 str-99))
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
(defun le-101-04-vfd-siemens-v20-3ac-01-general

( / cntr-1 pnt-ins str-01 str-02 str-03 str-701 str-702 str-tmp)

(setq cntr-1 0);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-01 (cdr (assoc 1 str-tmp))
				str-02 (cdr (assoc 2 str-tmp))
				str-702 nil			
	);setq
	
	(setvar "osmode" 6199)	
	
	(setq pnt-ins (getpoint "\nУкажите точку вставки\n"));setq

	;;;;;;;;;/////////
	(if (= str-01 "ПЧ Siemens V20")
		(setq str-03 (cdr (assoc 3 str-tmp))
					
					str-701 (strcat "Преобразователь частоты Sinamics V20, артикул " str-02 ", " str-03)
		);setq
	);if

	;;;;;;;;;/////////
	(if (= str-01 "Базовая панель оператора")
		(setq str-701 (strcat "Базовая панель оператора Sinamics V20 BOP, артикул " str-02));setq
	);if

	;;;;;;;;;/////////
	(if (= str-01 "BOP-интерфейс")
		(setq str-701 (strcat "BOP-интерфейс Sinamics V20 BOP INTERFACE, артикул " str-02));setq
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

(defun spcf-101-04-vfd-siemens-v20-3ac-01-general

( / cntr-1 dlt-y nmbr-ln pnt-ins str str-01 str-02 str-03 str-04 str-05 str-99 str-not str-patrn str-txt str-unt x-pnt-ins y-pnt-ins y-pnt-ins-1)

(setq cntr-1 0);setq

(setvar "textstyle" "Standard")

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
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
		(setq str-701 "Источник бесперебойного питания"
	
					str-702 (list (cons 1 (strcat "- Uвх. " str-04 "В, мощность " str-05))
												(cons 2 (strcat "дренаж " str-05))
												(cons 3 (strcat "к процессу " str-03))
												(cons 4 (strcat "к прибору " str-04))
									);list
											
					str-manufact "Eaton"
				
					str-order (list (cons 1 str-01) 
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
(defun lecgv-101-04-vfd-siemens-v20-3ac-01-general

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










