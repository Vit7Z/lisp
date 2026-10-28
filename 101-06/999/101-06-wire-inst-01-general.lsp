;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// Проводник установочный (монтажный)                           ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun 101-06-wire-inst-01-general

( / adoc dcl-id list-01 list-01-read-file list-02 list-02-read-file list-03 list-03-read-file list-04 list-04-read-file list-05 list-05-read-file list-06 list-07 list-801 list-802 list-803 list-900 list-901 list-902 str-01 type-list)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object)))); start undo

(setq	list-01 nil;файлы общие
      list-802 nil;файлы кабелей
      list-803 nil;поля в файлах кабелей
			
			list-901 nil
      list-902 nil
      
			str-01 "0"
);setq

(read-file-for-dialog-box-01 "101-06-wire-inst-01-general.txt" 5)

(setq list-01 list-01-read-file
			list-801 list-02-read-file;список имен файлов
			list-802 list-03-read-file;список кол. полей для чтеня
			list-05 list-04-read-file;производитель
			list-06 list-05-read-file;сертификат
);setq





(txt-01-101-06-wire-inst-01-general str-01)

(if (< (setq dcl-id (load_dialog "dia-101-06-wire-inst-01-general.dcl")) 0) ;ищем диалог
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
  				"(txt-01-101-06-wire-inst-01-general str-01)"
  );srcat
);action_tile

(action_tile "txt-02"
  (strcat "(set_tile \"txt-03\" (get_tile \"txt-02\"))"
  				"(set_tile \"txt-04\" (get_tile \"txt-02\"))"
  );srcat
);action_tile

(action_tile "but1"
  (strcat "(fill-fields-101-06-wire-inst-01-general)");strcat
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

(if (= type-list "le") (le-101-06-wire-inst-01-general list-902));if

(if (= type-list "spcf") (spcf-101-06-wire-inst-01-general list-902));if

(if (= type-list "lecgv") (lecgv-101-06-wire-inst-01-general list-902));if

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
(defun txt-01-101-06-wire-inst-01-general

(str-01 / list-01-read-file list-02-read-file list-03-read-file list-900-dscr list-900-read-file name-file num-flds txt-01)

(setq name-file (nth (atoi str-01) list-801)
			num-flds (atoi (nth (atoi str-01) list-802))
			txt-01 (nth (atoi str-01) list-01)
);setq

(if (= txt-01 "ПуГВ") 
	(setq list-07 (list "Белый" "Желто-зел." "Синий"));setq
);if

(if (= txt-01 "МГШВ") 
	(setq list-07 (list "Белый"));setq
);if

(if (= txt-01 "ПВ1") 
	(setq list-07 (list "Белый" "Желто-зел."));setq
);if


(read-file-for-dialog-box-01 name-file num-flds)

(setq list-02 list-01-read-file
			list-03 list-02-read-file
			list-04 list-03-read-file
);setq

(divide-text-into-parts list-900-dscr 128)

(setq list-900 list-900-read-file);setq

(list-filling "txt-02" list-02)
(list-filling "txt-03" list-03)
(list-filling "txt-04" list-04)
(list-filling "txt-07" list-07)
(list-filling "txt-900" list-900)

(set_tile "txt-02" "0")
(set_tile "txt-03" "0")
(set_tile "txt-04" "0")
(set_tile "txt-05" str-01)
(set_tile "txt-06" str-01)
(set_tile "txt-07" "0")

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма формирования данных/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun fill-fields-101-06-wire-inst-01-general

( / str-01 str-02 str-03 str-04 str-05 str-06 str-opt tmp-str-902)

(setq str-01 (nth (atoi (get_tile "txt-01")) list-01)
			str-02 (nth (atoi (get_tile "txt-02")) list-02)
			str-03 (nth (atoi (get_tile "txt-03")) list-03)
			str-04 (nth (atoi (get_tile "txt-04")) list-04)
			str-05 (nth (atoi (get_tile "txt-05")) list-05)
			str-06 (nth (atoi (get_tile "txt-06")) list-06)
			str-07 (nth (atoi (get_tile "txt-07")) list-07)
);setq

(if (/= list-901 nil)
	(setq list-902 (reverse list-902)
				list-901 (reverse list-901)
	);setq
);if

;;;;;;;///////////////////////////////////////////////////////////////////////////////////////////
(setq list-901 (vl-list* (strcat str-01 "  " str-02 "  " str-07) list-901)
			tmp-str-902 (list (cons 1 str-01) (cons 2 str-02) (cons 3 str-07) (cons 4 str-05) (cons 5 str-06) (cons 99 str-04))			
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
(defun le-101-06-wire-inst-01-general

(list-902 / cntr-1 pnt-ins str-01 str-02 str-701 str-702 str-tmp)

(setq cntr-1 0);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-01 (cdr (assoc 1 str-tmp))
				str-02 (cdr (assoc 2 str-tmp))
				str-03 (cdr (assoc 3 str-tmp))
	);setq



	(setvar "osmode" 6199)

	(setq pnt-ins (getpoint "\nУкажите точку вставки\n"));setq

	;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	(setq str-701 (strcat "Проводник установочный " str-01 " " str-02)
				str-702 "Кол. в метрах"
	);setq

	(split-str-parts-le-01-general str-701 str-702 pnt-ins)
	
	(setq cntr-1 (+ cntr-1 1));setq
);repeat

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в спцф                   ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun spcf-101-06-wire-inst-01-general

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


;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в ПЭ ОВШ               //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun lecgv-101-06-wire-inst-01-general

(list-902 / cntr-1 pnt-ins str-01 str-02 str-03 str-701 str-702 str-703 str-99 str-tmp)

(setq cntr-1 0);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-01 (cdr (assoc 1 str-tmp))
				str-02 (cdr (assoc 2 str-tmp))
				str-03 (cdr (assoc 3 str-tmp))
				str-99 (cdr (assoc 99 str-tmp))
				
				str-702 nil
				str-703 "Кол. в метрах"
	);setq

	(cond
		((= str-03 "Белый") (setq str-03 "белый"));
		((= str-03 "Желто-зел.") (setq str-03 "желто-зел."));
		((= str-03 "Синий") (setq str-03 "синий"));
	);if

	(setvar "osmode" 6199)
	
	(setq pnt-ins (getpoint "\nУкажите точку вставки\n"));setq
		
	;///////////////////////////
	(if (= str-01 "ПуГВ")
		(setq str-701 (strcat "Проводник установочный " str-01 " " str-02 ", " str-03));setq
	);


	(split-str-parts-lecgv-01-general str-701 str-702 str-703 str-99 pnt-ins);

	(setq cntr-1 (+ cntr-1 1));setq
);repeat

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

