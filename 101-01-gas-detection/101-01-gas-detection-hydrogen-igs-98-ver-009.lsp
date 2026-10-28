;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////                                                              ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun 101-01-gas-detection-hydrogen-igs-98-ver-009

( / adoc dcl-id list-01 list-02 list-03 list-04 list-05 list-06 list-900 list-901 list-902 list-902-read-file str-01 type-list)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(setq	list-901 nil
      list-902 nil
      list-900 nil
      
			str-01 "0"
);setq

(read-file-for-dialog-box-02 "101-01-gas-detection-hydrogen-igs-98-ver-009.txt")

(setq list-01 (cdr (nth 0 list-902-read-file))
			list-02 (cdr (nth 1 list-902-read-file))
			list-03 (cdr (nth 2 list-902-read-file))
			list-04 (cdr (nth 3 list-902-read-file))
			list-05 (cdr (nth 4 list-902-read-file))
			list-99 (cdr (nth 5 list-902-read-file))
);setq

(if (< (setq dcl-id (load_dialog "dia-101-01-gas-detection-hydrogen-igs-98-ver-009.dcl")) 0) ;ищем диалог
		(progn
			(alert "Не найден dcl-файл") 
			(exit)
		);progn
);if

(if (not (new_dialog "dia_101_01_gas_detection_hydrogen" dcl-id))
		(exit)
);if

(list-filling "txt-01" list-01)
(list-filling "txt-02" list-02)
(list-filling "txt-03" list-03)
(list-filling "txt-04" list-04)
(list-filling "txt-05" list-05)
(list-filling "txt-99" list-99)

(set_tile "txt-01" "0")
(set_tile "txt-02" "0")
(set_tile "txt-03" "0")
(set_tile "txt-04" "0")
(set_tile "txt-05" "0")
(set_tile "txt-99" "0")

(action_tile "but1"
  (strcat "(but1-101-01-gas-detection-hydrogen-igs-98-ver-009)"
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

(cond
	((= type-list "le") (le-101-01-gas-detection-hydrogen-igs-98-ver-009));=
	((= type-list "spcf") (spcf-101-01-gas-detection-hydrogen-igs-98-ver-009));=
	((= type-list "lecgv") (lecgv-101-01-gas-detection-hydrogen-igs-98-ver-009));=
);cond

(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(vla-endundomark adoc)
(gc)
(princ)
)
;/////// конец программы ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма формирования данных/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun but1-101-01-gas-detection-hydrogen-igs-98-ver-009

( / str-01 str-02 str-03 str-04 str-05 str-99 tmp-902)

;заполняем поле "выбрано"
(setq str-01 (nth (atoi (get_tile "txt-01")) list-01)

      str-02 (nth (atoi (get_tile "txt-02")) list-02)
      str-02 (strcat "Uпит. " str-02)
      
      str-03 (nth (atoi (get_tile "txt-03")) list-03)
      
      str-04 (nth (atoi (get_tile "txt-04")) list-04)
      str-04 (strcat "маркировка взрывозащиты " str-04)
      
      str-05 (nth (atoi (get_tile "txt-05")) list-05)
      str-05 (strcat "степень защиты " str-05)
      
      str-99 (nth (atoi (get_tile "txt-99")) list-99)
);setq

(if (/= list-901 nil) 
	(setq list-901 (reverse list-901)
				list-902 (reverse list-902)
	);setq
);if

(setq list-901 (vl-list* (strcat "ИГС-98  " str-01 "  " str-02) list-901)
			tmp-902 (list (cons 1 str-01) (cons 2 str-02) (cons 3 str-03) (cons 4 str-04) (cons 5 str-05) (cons 99 str-99))		
);setq

(setq list-902 (vl-list* tmp-902 list-902)
			list-902 (reverse list-902)
			list-901 (reverse list-901)
);setq

(list-filling "txt-901" list-901)

(princ)
)
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в ПЭ                   /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun le-101-01-gas-detection-hydrogen-igs-98-ver-009

( / cntr-1 pnt-ins str-01 str-02 str-701 str-702 str-tmp)

(setq cntr-1 0);setq

(repeat (length list-902)
	(setvar "osmode" 6199)
	
	(setq pnt-ins (getpoint "\nУкажите точку вставки\n")
				
				str-tmp (nth cntr-1 list-902)
				str-01 (cdr (assoc 1 str-tmp))
				str-02 (cdr (assoc 2 str-tmp))
				str-702 nil
	);setq
	
	(setq str-701 (strcat "Газоанализатор ИГС-98 Верба-Д (исп. 009), изм. концентрации водорода (Н2), сенсор " str-01 ", " str-02));setq

	(split-str-parts-le-01-general str-701 str-702 pnt-ins "**1**");
	
	(setq cntr-1 (1+ cntr-1));setq
);repeat

(princ)
)
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в спцф                   ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun spcf-101-01-gas-detection-hydrogen-igs-98-ver-009

( / cntr-1 pnt-ins str-01 str-02 str-03 str-04 str-05 str-701 str-702 str-99 str-manufact str-note str-order str-tmp str-unit)

(setq cntr-1 0);setq

(repeat (length list-902)
	(setvar "osmode" 6199)
	
	(setq pnt-ins (getpoint "\nУкажите точку вставки\n")
				
				str-tmp (nth cntr-1 list-902)
				str-01 (cdr (assoc 1 str-tmp))
				str-02 (cdr (assoc 2 str-tmp))
				str-03 (cdr (assoc 3 str-tmp))
				str-04 (cdr (assoc 4 str-tmp))
				str-05 (cdr (assoc 5 str-tmp))
				str-99 (cdr (assoc 99 str-tmp))
				str-702 nil
	);setq

	(setq str-701 "Газоанализатор"
	
				str-702 (list (cons 1 "измерение концентрации водорода")
											(cons 2 (strcat "сенсор " str-01))
											(cons 3 str-02)
											(cons 4 (strcat "вых. сигнал " str-03))
											(cons 5 str-04)
											(cons 6 str-05)
								);list
											
				str-manufact "АО \"НПП \"Дельта\", г. Москва"
				
				str-order (list (cons 1 (strcat "ИГС-98 Клевер-СВ (исп. 009), сенсор " str-01)) 
												(cons 2 ",") 
												(cons 3 nil) ;;;  здесь обозначение ТУ или НТД
									);list
				
				str-unit "шт."
				
				str-note "Свидетельство об утв. типа СИ № 49891" ;;;;;;; примечание, текстовая строка
	);setq
	
	(split-str-parts-spcf-01-general str-701 str-702 str-order str-manufact str-unit str-99 str-note pnt-ins);
	
	(setq cntr-1 (1+ cntr-1));setq
);repeat

(princ)
)
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
