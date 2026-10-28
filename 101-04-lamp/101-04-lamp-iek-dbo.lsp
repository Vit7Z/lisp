;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////                                                              ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun 101-04-lamp-iek-dbo

( / adoc dcl-id list-01 list-01-read-file list-02 list-02-read-file list-03 list-03-read-file list-04 list-04-read-file list-05 list-05-read-file list-06-read-file list-1001 
list-1001-read-file list-901 list-902 list-99 str-01 type-list)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(setq	list-901 nil
      list-902 nil
      
			str-01 nil
);setq

(read-file-for-dialog-box "101-04-lamp-iek-dbo-01-general.txt" 6)

(setq list-01 list-01-read-file
			list-02 list-02-read-file
			list-03 list-03-read-file
			list-04 list-04-read-file
			list-05 list-05-read-file
			list-99 list-06-read-file
);setq

(divide-text-into-parts list-1001-read-file 60)

(setq list-1001 list-1001-read-file);setq


(if (< (setq dcl-id (load_dialog "dia-101-04-lamp-iek-dbo.dcl")) 0) ;ищем диалог
		(progn
			(alert "Не найден dcl-файл")
			(exit)
		);progn
);if

(if (not (new_dialog "dia_101_04_lamp_iek_dbo" dcl-id))
		(exit)
);if

(list-filling "txt-01" list-01)
(list-filling "txt-02" list-02)
(list-filling "txt-03" list-03)
(list-filling "txt-04" list-04)
(list-filling "txt-05" list-05)
(list-filling "txt-99" list-99)
(list-filling "txt-1001" list-1001)

(set_tile "txt-01" "0")
(set_tile "txt-02" "0")
(set_tile "txt-03" "0")
(set_tile "txt-04" "0")
(set_tile "txt-05" "0")
(set_tile "txt-99" "0")

(action_tile "txt-01"
  (strcat "(set_tile \"txt-02\" $value)"
  				"(set_tile \"txt-03\" $value)"
					"(set_tile \"txt-04\" $value)"
					"(set_tile \"txt-05\" $value)"
					"(set_tile \"txt-99\" $value)"
  );srcat
);action_tile

(action_tile "txt-02"
  (strcat "(set_tile \"txt-01\" $value)"
  				"(set_tile \"txt-03\" $value)"
					"(set_tile \"txt-04\" $value)"
					"(set_tile \"txt-05\" $value)"
					"(set_tile \"txt-99\" $value)"
  );srcat
);action_tile

(action_tile "txt-03"
  (strcat "(set_tile \"txt-01\" $value)"
  				"(set_tile \"txt-02\" $value)"
					"(set_tile \"txt-04\" $value)"
					"(set_tile \"txt-05\" $value)"
					"(set_tile \"txt-99\" $value)"
  );srcat
);action_tile

(action_tile "txt-04"
  (strcat "(set_tile \"txt-01\" $value)"
  				"(set_tile \"txt-02\" $value)"
					"(set_tile \"txt-03\" $value)"
					"(set_tile \"txt-05\" $value)"
					"(set_tile \"txt-99\" $value)"
  );srcat
);action_tile

(action_tile "txt-05"
  (strcat "(set_tile \"txt-01\" $value)"
  				"(set_tile \"txt-02\" $value)"
					"(set_tile \"txt-03\" $value)"
					"(set_tile \"txt-04\" $value)"
					"(set_tile \"txt-99\" $value)"
  );srcat
);action_tile

(action_tile "but1"
  (strcat	"(tmp-filling-fields-101-04-lamp-iek-dbo)");strcat
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

(if (= type-list "le") (tmp-le-101-04-lamp-iek-dbo));if

(if (= type-list "spcf") (tmp-spcf-101-04-lamp-iek-dbo));if

(if (= type-list "lecgv") (tmp-lecgv-101-04-lamp-iek-dbo));if

(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(vla-endundomark adoc)
(gc)
(princ)
)
;;;;////////////////////////// конец программы       //////////////////////////////////////////////////////////////
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма формирования данных///////////////////////////////////////////////////////////////////////////////
(defun tmp-filling-fields-101-04-lamp-iek-dbo

( / str-01 str-02 str-03 str-04 str-05 str-99 tmp-list-902)

;заполняем поле "выбрано"
(setq str-01 (nth (atoi (get_tile "txt-01")) list-01)
			str-02 (nth (atoi (get_tile "txt-02")) list-02)
      str-03 (nth (atoi (get_tile "txt-03")) list-03)
			str-04 (nth (atoi (get_tile "txt-04")) list-04)
			str-05 (nth (atoi (get_tile "txt-05")) list-05)
			str-99 (nth (atoi (get_tile "txt-99")) list-99)
);setq

(if (/= list-901 nil) 
	(setq list-901 (reverse list-901)
				list-902 (reverse list-902)
	);setq
);if

(setq list-901 (vl-list* (strcat str-02 "  Длина " str-03 "мм.  Uпит. " str-04 "В  Мощность " str-05 "В") list-901)
			tmp-list-902 (list (cons 1 str-01) (cons 2 str-02) (cons 3 str-03) (cons 4 str-04) (cons 5 str-05) (cons 99 str-99))
);setq

(setq list-902 (vl-list* tmp-list-902 list-902)
			list-901 (reverse list-901)
			list-902 (reverse list-902)
);setq

(list-filling "txt-901" list-901)

(princ)
)
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в ПЭ                   /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun tmp-le-101-04-lamp-iek-dbo

( / cntr-1 pnt-ins str-01 str-02 str-03 str-04 str-05 str-701 str-702 str-tmp)

(setq cntr-1 0);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-01 (cdr (assoc 1 str-tmp))
				str-02 (cdr (assoc 2 str-tmp))
				str-03 (cdr (assoc 3 str-tmp))
				str-04 (cdr (assoc 4 str-tmp))
				str-05 (cdr (assoc 5 str-tmp))
	);setq
	
	(setvar "osmode" 6199)
	
	(setq pnt-ins (getpoint "\nУкажите точку вставки\n")
				str-701 (strcat "Светильник IEK " str-01 ", артикул " str-02 ", длина " str-03 "мм, Uпит. " str-04 "В")
				str-702 nil	
	);setq
 
	(split-str-parts-le-01-general str-701 str-702 pnt-ins);

	(setq cntr-1 (1+ cntr-1));setq
);repeat

(princ)
)
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в спцф                   ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun tmp-spcf-101-04-lamp-iek-dbo

( / cntr-1 pnt-ins str-01 str-02 str-03 str-04 str-05 str-701 str-702 str-99 str-crtf str-manufact str-order str-tmp str-unit)

(setq cntr-1 0);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-01 (cdr (assoc 1 str-tmp))
				str-02 (cdr (assoc 2 str-tmp))
				str-03 (cdr (assoc 3 str-tmp))
				str-04 (cdr (assoc 4 str-tmp))
				str-05 (cdr (assoc 5 str-tmp))
				str-99 (cdr (assoc 99 str-tmp))
	);setq
	
	(setvar "osmode" 6199)
	
	(setq pnt-ins (getpoint "\nУкажите точку вставки\n")
	
				str-701 "Светильник светодиодный"
						
				str-702 (list (cons 1 (strcat "длина " str-03 " мм"))
											(cons 2 (strcat "мощность " str-05 " Вт"))
											(cons 3 (strcat "Uпит.  " str-04 " В")));list
																 
				str-order (list (cons 1 (strcat str-01 ", артикул " str-02)) 
												(cons 2 ",") 
												(cons 3 nil));list
														
				str-unit "шт."
				
				str-manufact "IEK, г. Москва"
				
				str-crtf nil
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
(defun tmp-lecgv-101-04-lamp-iek-dbo

( / cntr-1 pnt-ins str-01 str-02 str-03 str-04 str-05 str-06 str-701 str-702 str-703 str-99 str-tmp)

(setq cntr-1 0);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-01 (cdr (assoc 1 str-tmp))
				str-02 (cdr (assoc 2 str-tmp))
				str-03 (cdr (assoc 3 str-tmp))
				str-04 (cdr (assoc 4 str-tmp))
				str-05 (cdr (assoc 5 str-tmp))
				str-99 (cdr (assoc 99 str-tmp))
	);setq

	(setvar "osmode" 6199)
	
	(setq pnt-ins (getpoint "\nУкажите точку вставки\n")

				str-701 (strcat "Светильник светодиодный IEK " str-01 ", артикул " str-02 ", длина " str-03 " мм, Uпит. " str-04 "В")
				str-702 nil
				str-703 nil
	);setq

	(split-str-parts-lecgv-01-general str-701 str-702 str-703 str-99 pnt-ins);

	(setq cntr-1 (+ cntr-1 1));setq
);repeat

(princ)
)
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////