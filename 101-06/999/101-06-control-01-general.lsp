;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// кабель контрольный                                           ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun 101-06-control-01-general

( / adoc dcl-id list-01 list-01-read-file list-02 list-02-read-file list-03 list-03-read-file list-04 list-04-read-file list-05 list-05-read-file list-06 list-1001 list-801 
list-802 list-803 list-901 list-902 str-01 tmp-list type-list)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object)))); start undo

(setq	list-01 nil;файлы общие
      list-802 nil;файлы кабелей
      list-803 nil;поля в файлах кабелей
			
			list-901 nil
      list-902 nil
      
      tmp-list nil
      
			str-01 nil
);setq

(read-file-for-dialog-box-01 "101-06-control-01-general.txt" 5)

(setq list-01 list-01-read-file
			list-801 list-02-read-file;список имен файлов
			list-802 list-03-read-file;список кол. полей для чтеня
			list-05 list-04-read-file;производитель
			list-06 list-05-read-file;сертификат
);setq

(txt-01-101-06-control-01-general)

(if (< (setq dcl-id (load_dialog "dia-101-06-control-01-general.dcl")) 0) ;ищем диалог
		(progn
			(alert "Не найден dcl-файл")
			(exit)
		);progn
);if

(if (not (new_dialog "dia_101_06_control_01" dcl-id))
		(exit)
);if

(list-filling "txt-01" list-01)
(list-filling "txt-02" list-02)
(list-filling "txt-03" list-03)
(list-filling "txt-04" list-04)
(list-filling "txt-05" list-05)
(list-filling "txt-06" list-06)
(list-filling "txt-1001" list-1001)

(set_tile "txt-01" "0")
(set_tile "txt-02" "0")
(set_tile "txt-03" "0")
(set_tile "txt-04" "0")
(set_tile "txt-05" "0")
(set_tile "txt-06" "0")

(action_tile "txt-01"
  (strcat "(txt-01-101-06-control-01-general)");srcat
);action_tile

(action_tile "txt-02"
  (strcat "(set_tile \"txt-03\" (get_tile \"txt-02\"))"
  				"(set_tile \"txt-04\" (get_tile \"txt-02\"))"
  );srcat
);action_tile

(action_tile "but1"
  (strcat "(fill-fields-101-06-control-01-general)");strcat
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
  (strcat "(list-delete-item-from-list-901-902)"
  );strcat
);action_tile

(action_tile "accept"
  (strcat "(done_dialog)"
          "(exit)"
  );strcat
);action_tile

(start_dialog)
(unload_dialog dcl-id)

(if (= type-list "le") (le-101-06-control-01-general list-902));if

(if (= type-list "spcf") (spcf-101-06-control-01-general list-902));if

(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(vla-endundomark adoc)
(gc)
(princ)
)
;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// конец                                                        ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun txt-01-101-06-control-01-general

( / list-01-read-file list-02-read-file list-03-read-file list-1001-read-file list-900-dscr name-file num-flds txt-01)

(if (= nil str-01) 
	(setq str-01 (nth 0 list-01)
				name-file (nth 0 list-801)
				num-flds (atoi (nth 0 list-802))
				txt-01 "0"
	);setq
	
	(setq str-01 (nth (atoi (get_tile "txt-01")) list-01)
				name-file (nth (atoi (get_tile "txt-01")) list-801)
				num-flds (atoi (nth (atoi (get_tile "txt-01")) list-802))
				txt-01 (get_tile "txt-01")
	);setq
);if

(read-file-for-dialog-box-01 name-file num-flds)

(setq list-02 list-01-read-file
			list-03 list-02-read-file
			list-04 list-03-read-file
);setq

(divide-text-into-parts list-900-dscr 120)

(setq list-1001 list-1001-read-file);setq

(list-filling "txt-02" list-02)
(list-filling "txt-03" list-03)
(list-filling "txt-04" list-04)
(list-filling "txt-1001" list-1001)

(set_tile "txt-02" "0")
(set_tile "txt-03" "0")
(set_tile "txt-04" "0")
(set_tile "txt-05" txt-01)
(set_tile "txt-06" txt-01)

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма формирования данных/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun fill-fields-101-06-control-01-general

( / str-01 str-02 str-03 str-04 str-05 str-06 str-opt tmp-str-902)

(setq str-01 (nth (atoi (get_tile "txt-01")) list-01)
			str-02 (nth (atoi (get_tile "txt-02")) list-02)
			str-03 (nth (atoi (get_tile "txt-03")) list-03)
			str-04 (nth (atoi (get_tile "txt-04")) list-04)
			str-05 (nth (atoi (get_tile "txt-05")) list-05)
			str-06 (nth (atoi (get_tile "txt-06")) list-06)
);setq

(if (/= list-901 nil)
	(setq list-902 (reverse list-902)
				list-901 (reverse list-901)
	);setq
);if

;;;;;;;///////////////////////////////////////////////////////////////////////////////////////////
(setq list-901 (vl-list* (strcat str-01 "  " str-02) list-901)
			tmp-str-902 (list (cons 1 str-01) (cons 2 str-02) (cons 3 str-03) (cons 99 str-04) (cons 5 str-05) (cons 6 str-06))			
);setq

(setq list-902 (vl-list* tmp-str-902 list-902)
			list-901 (reverse list-901)
			list-902 (reverse list-902)
);setq

(list-filling "txt-901" list-901)

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в ПЭ                   //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun le-101-06-control-01-general

(list-902 / cntr-1 pnt-ins str-01 str-02 str-701 str-702 str-tmp)

(setq cntr-1 0);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-01 (cdr (assoc 1 str-tmp))
				str-02 (cdr (assoc 2 str-tmp))
	);setq

	(setvar "osmode" 6199)

	(setq pnt-ins (getpoint "\nУкажите точку вставки\n"));setq

	;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	(setq str-701 (strcat "Кабель контрольный " str-01 " " str-02)
				str-702 "Кол. в метрах"
	);setq

	(split-str-parts-le-01-general str-701 str-702 pnt-ins "**1**")
	
	(setq cntr-1 (+ cntr-1 1));setq
);repeat

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в спцф                   ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun spcf-101-06-control-01-general

(list-902 / cntr-1 pnt-ins str-01 str-02 str-03 str-05 str-06 str-701 str-702 str-99 str-manufact str-note str-order str-tmp str-unit)

(setq cntr-1 0);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-01 (cdr (assoc 1 str-tmp))
				str-02 (cdr (assoc 2 str-tmp))
				str-03 (cdr (assoc 3 str-tmp))
				str-99 (cdr (assoc 99 str-tmp))
				str-05 (cdr (assoc 5 str-tmp))
				str-06 (cdr (assoc 6 str-tmp))
	);setq

	(setvar "osmode" 6199)
	
	(setq pnt-ins (getpoint "\nУкажите точку вставки\n"));setq

	;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	(setq str-701 "Кабель контрольный"		
						
				str-702 (list (cons 1 (strcat "диаметр наружний " str-03 " мм"))
											(cons 2 (strcat "сертификат " str-06))
								);list
									
				str-order (list (cons 1 (strcat str-01 " " str-02)) 
												(cons 2 ",") 
												(cons 3 nil))	
																	
				str-manufact str-05
				str-unit "м"
				str-note nil
	);setq

	(split-str-parts-spcf-01-general str-701 str-702 str-order str-manufact str-unit str-99 str-note pnt-ins)
	
	(setq cntr-1 (+ cntr-1 1));setq
);repeat

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
