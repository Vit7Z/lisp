;\\\\\\\ ************************************************************ \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
;\\\\\\\                                                              \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
;\\\\\\\ ************************************************************ \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
(defun 101-04-pwr-unt-meanwell

( / adoc dcl-id list-01 list-01-read-file list-02 list-02-read-file list-03 list-03-read-file list-04 list-05 list-06 list-07 list-801 
list-802 list-900 list-901 list-902 list-99 str-01 type-list)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(setvar "cmdecho" 0)

(setq	list-901 nil
      list-902 nil
      list-900 nil
      
			str-01 "0"
);setq

(read-file-for-dialog-box-01 "101-04-pwr-unt-meanwell-01-general.txt" 3)

(setq list-01 list-01-read-file
			list-801 list-02-read-file
			list-802 list-03-read-file
);setq

(start-101-04-pwr-unt-meanwell str-01)

(if (< (setq dcl-id (load_dialog "dia-101-04-pwr-unt-meanwell.dcl")) 0) ;ищем диалог
		(progn
			(alert "Не найден dcl-файл")
			(exit)
		);progn
);if

(if (not (new_dialog "dia_101_04_pwr_unt_meanwell" dcl-id))
		(exit)
);if

(list-filling "txt-01" list-01)
(list-filling "txt-02" list-02)
(list-filling "txt-03" list-03)
(list-filling "txt-04" list-04)
(list-filling "txt-05" list-05)
(list-filling "txt-06" list-06)
(list-filling "txt-07" list-07)
(list-filling "txt-99" list-99)
(list-filling "txt-900" list-900)

(set_tile "txt-01" "0")
(set_tile "txt-02" "0")
(set_tile "txt-03" "0")
(set_tile "txt-04" "0")
(set_tile "txt-05" "0")
(set_tile "txt-06" "0")
(set_tile "txt-07" "0")
(set_tile "txt-99" "0")

(action_tile "txt-01"
	(strcat "(setq str-01 (get_tile \"txt-01\"))"
					"(start-101-04-pwr-unt-meanwell str-01)"
	);strcat
);action_tile

(action_tile "txt-02" 
	(strcat "(set_tile \"txt-03\" $value)"
					"(set_tile \"txt-04\" $value)"
					"(set_tile \"txt-05\" $value)"
					"(set_tile \"txt-06\" $value)"
					"(set_tile \"txt-07\" $value)"
					"(set_tile \"txt-99\" $value)"
  );srcat
);action_tile

(action_tile "txt-03" 
	(strcat "(set_tile \"txt-02\" $value)"
					"(set_tile \"txt-04\" $value)"
					"(set_tile \"txt-05\" $value)"
					"(set_tile \"txt-06\" $value)"
					"(set_tile \"txt-07\" $value)"
					"(set_tile \"txt-99\" $value)"
  );srcat
);action_tile

(action_tile "txt-04" 
	(strcat "(set_tile \"txt-02\" $value)"
					"(set_tile \"txt-03\" $value)"
					"(set_tile \"txt-05\" $value)"
					"(set_tile \"txt-06\" $value)"
					"(set_tile \"txt-07\" $value)"
					"(set_tile \"txt-99\" $value)"
  );srcat
);action_tile

(action_tile "txt-05" 
	(strcat "(set_tile \"txt-02\" $value)"
					"(set_tile \"txt-03\" $value)"
					"(set_tile \"txt-04\" $value)"
					"(set_tile \"txt-06\" $value)"
					"(set_tile \"txt-07\" $value)"
					"(set_tile \"txt-99\" $value)"
  );srcat
);action_tile

(action_tile "txt-06" 
	(strcat "(set_tile \"txt-02\" $value)"
					"(set_tile \"txt-03\" $value)"
					"(set_tile \"txt-04\" $value)"
					"(set_tile \"txt-05\" $value)"
					"(set_tile \"txt-07\" $value)"
					"(set_tile \"txt-99\" $value)"
  );srcat
);action_tile

(action_tile "txt-07" 
	(strcat "(set_tile \"txt-02\" $value)"
					"(set_tile \"txt-03\" $value)"
					"(set_tile \"txt-04\" $value)"
					"(set_tile \"txt-05\" $value)"
					"(set_tile \"txt-06\" $value)"
					"(set_tile \"txt-99\" $value)"
  );srcat
);action_tile

(action_tile "but1"
  (strcat	"(filling-fields-101-04-pwr-unt-meanwell)");strcat
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
  (strcat "(setq str-901 (get_tile \"txt-901\"))"
  				"(list-delete-item-from-list-01 list-901 str-901)"
  				"(list-filling \"txt-901\" list-1001)"
  				"(setq list-901 list-1001)"  				
  				"(list-delete-item-from-list-01 list-902 str-901)"
  				"(setq list-902 list-1001)"  				
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
	((= type-list "le") (le-101-04-pwr-unt-meanwell));=
	((= type-list "spcf") (spcf-101-04-pwr-unt-meanwell));=
	((= type-list "lecgv") (lecgv-101-04-pwr-unt-meanwell));=
);cond

(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(vla-endundomark adoc)

(princ)
(gc)
)
;\\\\\\\ конец программы \\\\\\\

;;;;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
;;;;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
(defun start-101-04-pwr-unt-meanwell

(str-01 / list-01-read-file list-02-read-file list-03-read-file list-04-read-file list-05-read-file list-06-read-file 
list-07-read-file list-900-dscr list-900-read-file name-file-1 num-flds)

(setq name-file-1 (nth (atoi str-01) list-801)
			num-flds (atoi (nth (atoi str-01) list-802))
);setq

(read-file-for-dialog-box-01 name-file-1 num-flds)

(setq list-02 list-01-read-file
			list-03 list-02-read-file
			list-04 list-03-read-file
			list-05 list-04-read-file
			list-06 list-05-read-file
			list-07 list-06-read-file
			list-99 list-07-read-file
);setq

(divide-text-into-parts list-900-dscr 130)

(setq list-900 list-900-read-file);setq

(list-filling "txt-02" list-02)
(list-filling "txt-03" list-03)
(list-filling "txt-04" list-04)
(list-filling "txt-05" list-05)
(list-filling "txt-06" list-06)
(list-filling "txt-07" list-07)
(list-filling "txt-99" list-99)
(list-filling "txt-900" list-900)

(set_tile "txt-02" "0")
(set_tile "txt-03" "0")
(set_tile "txt-04" "0")
(set_tile "txt-05" "0")
(set_tile "txt-06" "0")
(set_tile "txt-07" "0")
(set_tile "txt-99" "0")

(princ)
)
;;;;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
;;;;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\


;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма формирования данных/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun filling-fields-101-04-pwr-unt-meanwell

( / str-01 str-02 str-03 str-04 str-05 str-07 str-99 tmp-list-902)

(setq str-01 (nth (atoi (get_tile "txt-01")) list-01)
			str-02 (nth (atoi (get_tile "txt-02")) list-02)
			str-03 (nth (atoi (get_tile "txt-03")) list-03)
			str-04 (nth (atoi (get_tile "txt-04")) list-04)
			str-05 (nth (atoi (get_tile "txt-05")) list-05)
			str-07 (nth (atoi (get_tile "txt-07")) list-07)
			str-99 (nth (atoi (get_tile "txt-99")) list-99)
);setq

(if (/= list-901 nil) 
	(setq list-901 (reverse list-901)
				list-902 (reverse list-902)
	);setq
);if

;;;;;;;/////////////////////////////////////////////////////////////////////////////////////////////
(if (or (= str-01 "Серия SDR") 	
        (= str-01 "Серия DRA")
		    (= str-01 "Серия HDR")
			  (= str-01 "Серия EDR")
				(= str-01 "Серия MDR"));or
				
	(setq list-901 (vl-list* (strcat str-02 "  Uвх. " str-03 "  Uвых. " str-04  "  " str-05) list-901)
				tmp-list-902 (list (cons 1 str-01) (cons 2 str-02) (cons 3 str-03) (cons 4 str-04) (cons 5 str-05) (cons 7 str-07) (cons 99 str-99))					
	);setq
);if

;;;;;;;/////////////////////////////////////////////////////////////////////////////////////////////
(if (= str-01 "Модуль. резервир.")
  (setq list-901 (vl-list* (strcat str-02 "  Вход " str-03 "  Выход " str-04  "  " str-05 "  DC OK " str-07) list-901)
				tmp-list-902 (list (cons 1 str-01) (cons 2 str-02) (cons 3 str-03) (cons 4 str-04) (cons 5 str-05) (cons 7 str-07) (cons 99 str-99))					
	);setq
);if

(setq list-902 (vl-list* tmp-list-902 list-902)
			list-902 (reverse list-902)
			list-901 (reverse list-901)
);setq

(list-filling "txt-901" list-901)

(princ)
)
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в ПЭ                   /////////////////////////////////////////////////////////////////////////
(defun le-101-04-pwr-unt-meanwell

( / cntr-1 pnt-ins str-01 str-02 str-03 str-04 str-701 str-702 str-tmp)

(setq cntr-1 0
		 str-702 nil
);setq

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
	(if (or (= str-01 "Серия SDR") 	
			    (= str-01 "Серия DRA")
			    (= str-01 "Серия EDR")
		      (= str-01 "Серия HDR")
		      (= str-01 "Серия MDR"));or
					
		(setq str-701 (strcat "Блок питания Mean Well " str-02 ", Uвх. " str-03 ", Uвых. " str-04));setq
	);if

	;;;;;;;///////////////////////////////////////////////////////////////////////////////////////////
	(if (= str-01 "Модуль. резервир.")	
		(setq str-701 (strcat "Модуль резервирования питания Mean Well " str-02 ", Uвх. " str-03 ", Uвых. " str-04));setq
	);if

	(split-str-parts-le-01-general str-701 str-702 pnt-ins "**1**");
 
	(setq cntr-1 (1+ cntr-1)
			  str-701 nil
	);setq
);repeat

(princ)
)
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в спцф                   ///////////////////////////////////////////////////////////////////////
(defun spcf-101-04-pwr-unt-meanwell

( / cntr-1 pnt-ins str-01 str-02 str-03 str-04 str-07 str-701 str-702 str-99 str-crtf str-manufact str-order str-tmp 
str-unit)

(setq cntr-1 0);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
			str-01 (cdr (assoc 1 str-tmp))
			str-02 (cdr (assoc 2 str-tmp))
			str-03 (cdr (assoc 3 str-tmp))
			str-04 (cdr (assoc 4 str-tmp))
			str-07 (cdr (assoc 7 str-tmp))
			str-99 (cdr (assoc 99 str-tmp))
	);setq

  (cond
    ((= str-07 "Да, СК") (setq str-07 "сигн. состояния (СК)"));=
    ((= str-07 "Да, Акт") (setq str-07 "сигн. состояния (сигнал напряжения)"));=
		((= str-07 "Нет") (setq str-07 "без сигн. состояния"));=
	);cond

	(setvar "osmode" 6199)
	(setq pnt-ins (getpoint "\nУкажите точку вставки\n"));setq

	;/////////////////////////////////////////////////////////////////////////////////////////////////
	(if (or (= str-01 "Серия SDR") 	
			    (= str-01 "Серия DRA")
		      (= str-01 "Серия HDR")
		      (= str-01 "Серия EDR")
		      (= str-01 "Серия MDR"));or
		(setq str-701 "Блок питания"						
				  str-702 (list (cons 1 (strcat "Uвх. " str-03 ", Uвых. " str-04))
								        (cons 2 "крепление на DIN-рейку")
								        (cons 3 str-07))
								   
		);setq
	);if
	
	;;;;;;;///////////////////////////////////////////////////////////////////////////////////////////
	(if (= str-01 "Модуль. резервир.")	
	  (setq str-701 "Модуль резервирования питания"
		      str-702 (list 
		        (cons 1 (strcat "Uвх. " str-03 ", Uвых. " str-04))
		        (cons 2 "крепление на DIN-рейку")
		        (cons 3 str-07))
		);setq
	);if

	(setq str-manufact "MeanWell"				
				str-order (list 
				  (cons 1 str-02) 
					(cons 2 "-") 
					(cons 3 nil));list
				
				str-unit "шт."				
				str-crtf nil
	);setq
	
	(split-str-parts-spcf-01-general str-701 str-702 str-order str-manufact str-unit str-99 str-crtf pnt-ins);

	(setq cntr-1 (+ cntr-1 1));setq
);repeat

(princ)
)
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в овш               ////////////////////////////////////////////////////////////////////////////
(defun lecgv-101-04-pwr-unt-meanwell

( / cntr-1 pnt-ins str-01 str-02 str-03 str-04 str-07 str-701 str-702 str-703 str-99 str-tmp)

(setq cntr-1 0
      str-702 nil
			str-703 nil
);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
			 str-01 (cdr (assoc 1 str-tmp))
			 str-02 (cdr (assoc 2 str-tmp))
			 str-03 (cdr (assoc 3 str-tmp))
			 str-04 (cdr (assoc 4 str-tmp))
			 str-07 (cdr (assoc 7 str-tmp))
			 str-99 (cdr (assoc 99 str-tmp))
	);setq
	
	(cond
    ((= str-07 "Да, СК") (setq str-07 "сигн. состояния (СК)"));=
    ((= str-07 "Да, Акт") (setq str-07 "сигн. состояния (сигнал напряжения)"));=
		((= str-07 "Нет") (setq str-07 "без сигн. состояния"));=
	);cond

	(setvar "osmode" 6199)
	(setq pnt-ins (getpoint "\nУкажите точку вставки\n"));setq

	;;;;;;;///////////////////////////////////////////////////////////////////////////////////////////
	(if (or (= str-01 "Серия SDR") 	
					(= str-01 "Серия DRA")
					(= str-01 "Серия HDR")
					(= str-01 "Серия EDR")
					(= str-01 "Серия MDR"));or
		
		(setq str-701 (strcat "Блок питания, " str-02 ", Uвх. " str-03 "В, Uвых. " str-04 "В, крепление на DIN-рейку, " str-07));setq
	);if
	
	;;;;;;;///////////////////////////////////////////////////////////////////////////////////////////
	(if (= str-01 "Модуль. резервир.")	
	  (setq str-701 (strcat "Модуль резервирования питания Mean Well " str-02 ", Uвх. " str-03 ", Uвых. " str-04 
	                        ", крепление на DIN-рейку, " str-07)
		);setq
	);if
	
	(split-str-parts-lecgv-01-general str-701 str-702 str-703 str-99 pnt-ins);
 
	(setq cntr-1 (+ cntr-1 1));setq
);repeat

(princ)
)
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


	
		