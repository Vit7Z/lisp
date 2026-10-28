;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////                                                              ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun 101-04-bell-general

( / adoc dcl-id list-01 list-01-read-file list-02 list-02-read-file list-03 list-03-read-file list-04 list-05 list-1001-read-file list-801 list-802 list-901 list-902 list-99 str-01 type-list)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(read-file-for-dialog-box-01 "101-04-bell-01-general.txt" 3)

(setq list-01 list-01-read-file
			list-801 list-02-read-file
			list-802 list-03-read-file
			
			list-901 nil
			list-902 nil
			list-1001-read-file nil
			str-01 nil
);setq

(txt-01-101-04-bell-general)

(if (< (setq dcl-id (load_dialog "dia-101-04-bell-general.dcl")) 0) ;ищем диалог
		(progn
			(alert "Не найден dcl-файл")
			(exit)
		);progn
);if

(if (not (new_dialog "dia_101_04_bell_general" dcl-id))
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

(action_tile "txt-01"
  (strcat "(txt-01-101-04-bell-general)");srcat
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

(action_tile "but1"
  (strcat "(tmp-filling-fields-101-04-bell-general)");strcat
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

(if (= type-list "le") (tmp-le-101-04-bell-general));if
(if (= type-list "spcf") (tmp-spcf-101-04-bell-general));if
(if (= type-list "lecgv") (tmp-lecgv-101-04-bell-general));if

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
(defun txt-01-101-04-bell-general

( / flds-1 list-01-read-file list-02-read-file list-03-read-file list-04-read-file list-05-read-file name-file-1)

(if (= nil str-01) 
	(setq str-01 (nth 0 list-01)
				name-file-1 (nth 0 list-801)
				flds-1 (atoi (nth 0 list-802))
	);setq
	
	(setq str-01 (nth (atoi (get_tile "txt-01")) list-01)
				name-file-1 (nth (atoi (get_tile "txt-01")) list-801)
				flds-1 (atoi (nth (atoi (get_tile "txt-01")) list-802))
	);setq
);if

(read-file-for-dialog-box-01 name-file-1 flds-1)

(setq list-02 list-01-read-file
			list-03 list-02-read-file
			list-04 list-03-read-file
			list-05 list-04-read-file
			list-99 list-05-read-file
);setq

(list-filling "txt-02" list-02)
(list-filling "txt-03" list-03)
(list-filling "txt-04" list-04)
(list-filling "txt-05" list-05)
(list-filling "txt-99" list-99)

(set_tile "txt-02" "0")
(set_tile "txt-03" "0")
(set_tile "txt-04" "0")
(set_tile "txt-05" "0")
(set_tile "txt-99" "0")

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма формирования данных/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun tmp-filling-fields-101-04-bell-general

( / str-01 str-02 str-03 str-04 str-05 str-99 swtch tmp-list-902)

(setq swtch list-901);setq

(if (/= swtch nil) (setq list-902 (reverse list-902)));if

(setq str-01 (nth (atoi (get_tile "txt-01")) list-01)
			str-02 (nth (atoi (get_tile "txt-02")) list-02)
			str-03 (nth (atoi (get_tile "txt-03")) list-03)
			str-04 (nth (atoi (get_tile "txt-04")) list-04)
			str-05 (nth (atoi (get_tile "txt-05")) list-05)
			str-99 (nth (atoi (get_tile "txt-99")) list-99)
);setq
  	
(setq list-901 (vl-list* (strcat str-01 " " str-02) list-901)
			tmp-list-902 (list (cons 1 str-01) (cons 2 str-02) (cons 3 str-03) (cons 4 str-04) (cons 5 str-05) (cons 99 str-99))
			list-902 (vl-list* tmp-list-902 list-902)
			list-902 (reverse list-902)
);setq

(list-filling "txt-901" (reverse list-901))

(princ)
)
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в ПЭ                   /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun tmp-le-101-04-bell-general

( / cntr-1 pnt-ins str-01 str-02 str-02-01 str-02-02 str-03 str-05 str-701 str-702 str-tmp)

(setq cntr-1 0);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-01 (cdr (assoc 1 str-tmp))
				str-02 (cdr (assoc 2 str-tmp))
				str-03 (cdr (assoc 3 str-tmp))
				str-05 (cdr (assoc 5 str-tmp))
	);setq
	
	(setvar "osmode" 6199)
	
	(setq pnt-ins (getpoint "\nУкажите точку вставки\n"));setq
	
	;/////////////////////////////////////////////////////////////////////////////////////////////////
	(if (= str-01 "Звонок Schneider Electric")
		(setq str-701 (strcat str-01 ", " str-02 ", Uпит. " str-03 "В, звуковое давление " str-05 "дБ")
					str-702 nil
		);setq
	);if =
	
 	
	;/////////////////////////////////////////////////////////////////////////////////////////////////
	(if (= str-01 "Сирена")
		(setq str-701 (strcat str-01 " " str-02 ", Uпит. " str-03 "В, звуковое давление " str-05 "дБ")
					str-702 nil
		);setq
	);if =
	
 	
	;/////////////////////////////////////////////////////////////////////////////////////////////////
	(if (= str-01 "Оповещатель")
		(setq str-701 (strcat "Оповещатель охранно-пожарный свето-звуковой Корбу, Uпит. " str-03 "В, звуковое давление " str-05 "дБ")
					str-702 nil
		);setq
	);if =
	

	;/////////////////////////////////////////////////////////////////////////////////////////////////
	(if (= str-01 "Оповещатель EKF PROxima")
		(setq str-02-01 (substr str-02 1 (vl-string-search "," str-02))
					str-02-02 (substr str-02 (+ (vl-string-search "," str-02) 3))
		
					str-701 (strcat "Оповещатель свето-звуковой EKF PROxima, артикул " str-02-01 ", Uпит. " str-03 "В, звуковое давление " str-05 "дБ, цвет " str-02-02)
					str-702 nil
		);setq
	);if =


	(split-str-parts-le-01-general str-701 str-702 pnt-ins "**1**");

	(setq cntr-1 (1+ cntr-1));setq
);repeat

(princ)
)
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в спцф                   ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun tmp-spcf-101-04-bell-general

( / cntr-1 pnt-ins str-01 str-02 str-02-01 str-02-02 str-03 str-05 str-701 str-702 str-99 str-crtf str-manufact str-order str-tmp str-unit)

(setq cntr-1 0);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-01 (cdr (assoc 1 str-tmp))
				str-02 (cdr (assoc 2 str-tmp))
				str-03 (cdr (assoc 3 str-tmp))
				str-05 (cdr (assoc 5 str-tmp))
				str-99 (cdr (assoc 99 str-tmp))
	);setq
	
	(setvar "osmode" 6199)
	
	(setq pnt-ins (getpoint "\nУкажите точку вставки\n"));setq

	;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
	(if (= str-01 "Звонок Schneider Electric")
		(setq str-701 "Звонок (зуммер)"
					str-702 (list (cons 1 (strcat "Uпит. " str-03 "В, звуковое давление " str-05 "дБ"))
												(cons 2 (strcat "монтаж на DIN-рейку"))
									);list
									
					str-order (list (cons 1 str-02) (cons 2 ",") (cons 3 nil)
										);list
					
					str-manufact "Schneider Electric"
					str-unit "шт."
					str-crtf nil			
		);setq
	);if


	;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
	(if (= str-01 "Сирена")
		(setq str-701 str-01
					str-702 (list (cons 1 (strcat "Uпит. " str-03 "В, звуковое давление " str-05 "дБ"))
									);list
									
					str-order (list (cons 1 str-02) (cons 2 ",") (cons 3 nil)
										);list
					
					str-manufact nil
					str-unit "шт."
					str-crtf nil			
		);setq
	);if


	;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
	(if (= str-01 "Оповещатель")
		(setq str-701 "Оповещатель свето-звуковой"
					str-702 (list (cons 1 (strcat "Uпит. " str-03 "В, звуковое давление " str-05 "дБ"))
									);list
									
					str-order (list (cons 1 str-02) (cons 2 ",") (cons 3 nil)
										);list
					
					str-manufact "ЗАО \"ПО \"Спецавтоматика\", г. Бийск"
					str-unit "шт."
					str-crtf nil			
		);setq
	);if


	;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
	(if (= str-01 "Оповещатель EKF PROxima")
		(setq str-02-01 (substr str-02 1 (vl-string-search "," str-02))
					str-02-02 (substr str-02 (+ (vl-string-search "," str-02) 3))
			
					str-701 "Оповещатель свето-звуковой"
					str-702 (list (cons 1 (strcat "Uпит. " str-03 "В, звуковое давление " str-05 "дБ, цвет " str-02-02))
									);list
									
					str-order (list (cons 1 str-02-01) (cons 2 ".") (cons 3 nil));list
					
					str-manufact "EKF PROxima"
					str-unit "шт."
					str-crtf nil			
		);setq
	);if
			
	(split-str-parts-spcf-01-general str-701 str-702 str-order str-manufact str-unit str-99 str-crtf pnt-ins);
 
	(setq cntr-1 (+ cntr-1 1));setq
);repeat

(princ)
)
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в овш               ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun tmp-lecgv-101-04-bell-general

( / cntr-1 pnt-ins str-01 str-02 str-03 str-05 str-99 str-tmp str-txt str-txt-01 str-txt-02)

(setq cntr-1 0);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-01 (cdr (assoc 1 str-tmp))
				str-02 (cdr (assoc 2 str-tmp))
				str-03 (cdr (assoc 3 str-tmp))
				str-05 (cdr (assoc 5 str-tmp))
				str-99 (cdr (assoc 99 str-tmp))
	);setq
	
	(setvar "osmode" 6199)
	
	(setq pnt-ins (getpoint "\nУкажите точку вставки\n"));setq
	
	;/////////////////////////////////////////////////////////////////////////////////////////////////
	(if (= str-01 "Звонок Schneider Electric")
		(setq str-txt (strcat str-01 ", " str-02 ", Uпит. " str-03 "В, звуковое давление " str-05 "дБ")
					str-txt-01 nil
					str-txt-02 nil
		);setq
	);if =
	
	;/////////////////////////////////////////////////////////////////////////////////////////////////
	(if (= str-01 "Сирена")
		(setq str-txt (strcat str-01 " " str-02 ", Uпит. " str-03 "В, звуковое давление " str-05 "дБ")
					str-txt-01 nil
					str-txt-02 nil
		);setq
	);if =
 	
	;/////////////////////////////////////////////////////////////////////////////////////////////////
	(if (= str-01 "Оповещатель")
		(setq str-txt (strcat "Оповещатель охранно-пожарный свето-звуковой Корбу, Uпит. " str-03 "В, звуковое давление " str-05 "дБ")
					str-txt-01 nil
					str-txt-02 nil
		);setq
	);if =	

	(split-str-parts-lecgv-065-01 str-txt str-txt-01 str-txt-02 str-99 pnt-ins);
 
	(setq cntr-1 (+ cntr-1 1));setq
);repeat

(princ)
)
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////