;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// Проводник заземляющий                                        ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun 101-06-ground-01-general

( / adoc dcl-id list-01 list-01-read-file list-02 list-02-read-file list-03 list-03-read-file list-900 list-901 list-902 type-list)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object)))); start undo

(setq	list-901 nil
      list-902 nil
);setq

(read-file-for-dialog-box-01 "101-06-ground-p750.txt" 3)

(setq list-01 list-01-read-file
			list-02 list-02-read-file
			list-03 list-03-read-file
);setq

(if (< (setq dcl-id (load_dialog "dia-101-06-ground-01-general.dcl")) 0) ;ищем диалог
		(progn
			(alert "Не найден dcl-файл")
			(exit)
		);progn
);if

(if (not (new_dialog "dia_101_06_ground" dcl-id))
		(exit)
);if

(list-filling "txt-01" list-01)
(list-filling "txt-02" list-02)
(list-filling "txt-03" list-03)
(list-filling "txt-900" list-900)

(set_tile "txt-01" "0")
(set_tile "txt-02" "0")
(set_tile "txt-03" "0")

(action_tile "txt-01"
  (strcat "(set_tile \"txt-02\" $value)"
  				"(set_tile \"txt-03\" $value)"
  );srcat
);action_tile

(action_tile "but1"
  (strcat "(fill-fields-101-06-ground-01-general)");strcat
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

(if (= type-list "le") (le-101-06-ground-01-general list-902));if

(if (= type-list "spcf") (spcf-101-06-ground-01-general list-902));if

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
;;;;подпрограмма формирования данных/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun fill-fields-101-06-ground-01-general

( / str-01 str-02 str-03 tmp-str-902)

(setq str-01 (nth (atoi (get_tile "txt-01")) list-01)
			str-02 (nth (atoi (get_tile "txt-02")) list-02)
			str-03 (nth (atoi (get_tile "txt-03")) list-03)
);setq

(if (/= list-901 nil)
	(setq list-902 (reverse list-902)
				list-901 (reverse list-901)
	);setq
);if

;;;;;;;///////////////////////////////////////////////////////////////////////////////////////////
(setq list-901 (vl-list* (strcat str-01) list-901)
			tmp-str-902 (list (cons 1 str-01) (cons 2 str-02) (cons 99 str-03))			
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
(defun le-101-06-ground-01-general

(list-902 / cntr-1 pnt-ins str-01 str-701 str-702 str-tmp)

(setq cntr-1 0);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-01 (cdr (assoc 1 str-tmp))
	);setq

	(setvar "osmode" 6199)

	(setq pnt-ins (getpoint "\nУкажите точку вставки\n"));setq

	;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	(setq str-701 (strcat "Проводник заземляющий " str-01)
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
(defun spcf-101-06-ground-01-general

(list-902 / cntr-1 pnt-ins str-01 str-02 str-701 str-702 str-99 str-manufact str-note str-order str-tmp str-unit)

(setq cntr-1 0);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-01 (cdr (assoc 1 str-tmp))
				str-02 (cdr (assoc 2 str-tmp))
				str-99 (cdr (assoc 99 str-tmp))
	);setq

	(setvar "osmode" 6199)
	
	(setq pnt-ins (getpoint "\nУкажите точку вставки\n"));setq

	;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	(setq str-701 "Проводник заземляющий"		
						
				str-702 (list (cons 1 (strcat "длина " str-02 "мм, сечение 6мм2")));list
									
				str-order (list (cons 1 str-01) 
												(cons 2 ",") 
												(cons 3 nil))	
																	
				str-manufact "ОАО РОЗ \"Монтажавтоматика\", г. Ростов-на-Дону"
				str-unit "шт"
				str-note nil
	);setq

	(split-str-parts-spcf-01-general str-701 str-702 str-order str-manufact str-unit str-99 str-note pnt-ins)
	
	(setq cntr-1 (+ cntr-1 1));setq
);repeat

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
