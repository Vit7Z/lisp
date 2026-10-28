;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////                                                              ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun 101-04-contactors-abs-zeim-pbr-01-general

( / adoc dcl-id list-01 list-01-read-file list-02 list-02-read-file list-03 list-03-read-file list-04 list-04-read-file list-05 list-05-read-file list-06 list-06-read-file 
list-07 list-07-read-file list-08 list-08-read-file list-09 list-09-read-file list-10-read-file list-901 list-902 list-99 str-01 type-list)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(setq str-01 nil
      list-901 nil
      list-902 nil
);setq

(read-file-for-dialog-box-01 "101-04-contactors-abs-zeim-pbr-01-general.txt" 10);setq

(setq list-01 list-01-read-file
      list-02 list-02-read-file
      list-03 list-03-read-file
      list-04 list-04-read-file
      list-05 list-05-read-file
      list-06 list-06-read-file
      list-07 list-07-read-file
      list-08 list-08-read-file
      list-09 list-09-read-file
      list-99 list-10-read-file
);setq

(if (< (setq dcl-id (load_dialog "dia-101-04-contactors-abs-zeim-pbr-01-general.dcl")) 0) ;ищем диалог
	(progn
		(alert "Не найден dcl-файл")
		(exit)
	);progn
);if

(if (not (new_dialog "dia_101_04_contactors_pbr_general" dcl-id))
		(exit)
);if

(list-filling "txt-01" list-01)
(list-filling "txt-02" list-02)
(list-filling "txt-03" list-03)
(list-filling "txt-04" list-04)
(list-filling "txt-05" list-05)
(list-filling "txt-06" list-06)
(list-filling "txt-07" list-07)
(list-filling "txt-08" list-08)
(list-filling "txt-09" list-09)
(list-filling "txt-99" list-99)

(set_tile "txt-01" "0")
(set_tile "txt-02" "0")
(set_tile "txt-03" "0")
(set_tile "txt-04" "0")
(set_tile "txt-05" "0")
(set_tile "txt-06" "0")
(set_tile "txt-07" "0")
(set_tile "txt-08" "0")
(set_tile "txt-09" "0")
(set_tile "txt-99" "0")

(action_tile "txt-01"
  (strcat "(set_tile \"txt-02\" $value)"
  				"(set_tile \"txt-03\" $value)"
  				"(set_tile \"txt-04\" $value)"
  				"(set_tile \"txt-05\" $value)"
  				"(set_tile \"txt-06\" $value)"
  				"(set_tile \"txt-07\" $value)"
  				"(set_tile \"txt-08\" $value)"
  				"(set_tile \"txt-09\" $value)"
  				"(set_tile \"txt-99\" $value)"
  );srcat
);action_tile

(action_tile "txt-02"
  (strcat "(set_tile \"txt-01\" $value)"
  				"(set_tile \"txt-03\" $value)"
  				"(set_tile \"txt-04\" $value)"
  				"(set_tile \"txt-05\" $value)"
  				"(set_tile \"txt-06\" $value)"
  				"(set_tile \"txt-07\" $value)"
  				"(set_tile \"txt-08\" $value)"
  				"(set_tile \"txt-09\" $value)"
  				"(set_tile \"txt-99\" $value)"
  );srcat
);action_tile

(action_tile "txt-03"
  (strcat "(set_tile \"txt-01\" $value)"
  				"(set_tile \"txt-02\" $value)"
  				"(set_tile \"txt-04\" $value)"
  				"(set_tile \"txt-05\" $value)"
  				"(set_tile \"txt-06\" $value)"
  				"(set_tile \"txt-07\" $value)"
  				"(set_tile \"txt-08\" $value)"
  				"(set_tile \"txt-09\" $value)"
  				"(set_tile \"txt-99\" $value)"
  );srcat
);action_tile

(action_tile "txt-04"
  (strcat "(set_tile \"txt-01\" $value)"
  				"(set_tile \"txt-02\" $value)"
  				"(set_tile \"txt-03\" $value)"
  				"(set_tile \"txt-05\" $value)"
  				"(set_tile \"txt-06\" $value)"
  				"(set_tile \"txt-07\" $value)"
  				"(set_tile \"txt-08\" $value)"
  				"(set_tile \"txt-09\" $value)"
  				"(set_tile \"txt-99\" $value)"
  );srcat
);action_tile

(action_tile "txt-05"
  (strcat "(set_tile \"txt-01\" $value)"
  				"(set_tile \"txt-02\" $value)"
  				"(set_tile \"txt-03\" $value)"
  				"(set_tile \"txt-04\" $value)"
  				"(set_tile \"txt-06\" $value)"
  				"(set_tile \"txt-07\" $value)"
  				"(set_tile \"txt-08\" $value)"
  				"(set_tile \"txt-09\" $value)"
  				"(set_tile \"txt-99\" $value)"
  );srcat
);action_tile

(action_tile "but1"
  (strcat "(but1-101-04-contactors-abs-zeim-pbr-01-general)");strcat
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

(if (= type-list "le") (le-101-04-contactors-abs-zeim-pbr-01-general));if
(if (= type-list "spcf") (spcf-101-04-contactors-abs-zeim-pbr-01-general));if
(if (= type-list "lecgv") (lecgv-101-04-contactors-abs-zeim-pbr-01-general));if

(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(vla-endundomark adoc)
(gc)
(princ)
)
;/////// конец программы ///////

;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма формирования данных/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun but1-101-04-contactors-abs-zeim-pbr-01-general

( / str-01 str-02 str-03 str-04 str-05 str-06 str-07 str-08 str-09 str-99 swtch tmp-list-902)

(setq swtch list-901);setq

(if (/= swtch nil) (setq list-902 (reverse list-902)));if

(setq str-01 (nth (atoi (get_tile "txt-01")) list-01);считываем выбранные данные
			str-02 (nth (atoi (get_tile "txt-02")) list-02)
			str-03 (nth (atoi (get_tile "txt-03")) list-03)
			str-04 (nth (atoi (get_tile "txt-04")) list-04)
			str-05 (nth (atoi (get_tile "txt-05")) list-05)
			str-06 (nth (atoi (get_tile "txt-06")) list-06)
			str-07 (nth (atoi (get_tile "txt-07")) list-07)
			str-08 (nth (atoi (get_tile "txt-08")) list-08)
			str-09 (nth (atoi (get_tile "txt-09")) list-09)
			str-99 (nth (atoi (get_tile "txt-99")) list-99)
);setq

(if (or (= "ПБР-2М" str-01) (= "ПБР-3А" str-01))
	(setq list-901 (vl-list* (strcat str-01 "  " 
																	 str-02 "В  Коммутируемый ток "
																	 str-03 "А  "
																	 str-04
														) list-901)
				tmp-list-902 (list (cons 1 str-01) (cons 2 str-02) (cons 3 str-03) (cons 4 str-04) (cons 5 str-05) (cons 6 str-06) (cons 7 str-07) (cons 8 str-08) (cons 9 str-09) (cons 99 str-99))
				list-902 (vl-list* tmp-list-902 list-902)
	);setq
);if
		
(if (or (= "ПБР-2ИМ" str-01) (= "ПБР-3ИМ" str-01))
	(setq list-901 (vl-list* (strcat str-01 "  " 
																	 str-02 "В  Коммутируемый ток "
																	 str-03 "А  "
																	 str-04 "  "
																	 str-05
														) list-901)
				tmp-list-902 (list (cons 1 str-01) (cons 2 str-02) (cons 3 str-03) (cons 4 str-04) (cons 5 str-05) (cons 6 str-06) (cons 7 str-07) (cons 8 str-08) (cons 9 str-09) (cons 99 str-99))
				list-902 (vl-list* tmp-list-902 list-902)
	);setq
);if

(setq list-902 (reverse list-902));setq

(list-filling "txt-901" (reverse list-901))

(princ)
)
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в ПЭ                   /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun le-101-04-contactors-abs-zeim-pbr-01-general

( / cntr-1 pnt-ins str-1 str-2 str-3 str-tmp str-txt)

(setq cntr-1 0
			str-702 nil
);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-1 (cdr (assoc 1 str-tmp))
				str-2 (cdr (assoc 2 str-tmp))
				str-3 (cdr (assoc 3 str-tmp))
	);setq
	
	(setvar "osmode" 6199)
	
	(setq pnt-ins (getpoint "\nУкажите точку вставки\n"));setq

	(setq str-701 (strcat "Пускатель бесконтактный реверсивный, " str-1 ", Uпит. " str-2 "В, макс. коммутируемый ток " str-3 "А"));setq
  		
	(split-str-parts-le-01-general str-701 str-702 pnt-ins "**1**");

	(setq cntr-1 (1+ cntr-1));setq
);repeat

(princ)
)
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в спцф                   ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun spcf-101-04-contactors-abs-zeim-pbr-01-general

( / cntr-1 dlt-y nmbr-ln pnt-ins str-1 str-2 str-3 str-4 str-5 str-6 str-7 str-8 str-9 str-99 str-tmp x-pnt-ins y-pnt-ins y-pnt-ins-1)

(setq cntr-1 0);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-1 (cdr (assoc 1 str-tmp))
				str-2 (cdr (assoc 2 str-tmp))
				str-3 (cdr (assoc 3 str-tmp))
				str-4 (cdr (assoc 4 str-tmp))
				str-5 (cdr (assoc 5 str-tmp))
				str-6 (cdr (assoc 6 str-tmp))
				str-7 (cdr (assoc 7 str-tmp))
				str-8 (cdr (assoc 8 str-tmp))
				str-9 (cdr (assoc 9 str-tmp))
				str-99 (cdr (assoc 99 str-tmp))
	);setq
			
	(setvar "osmode" 6199)
	
	(setq pnt-ins		(getpoint "\nУкажите точку вставки\n")
	  		x-pnt-ins (nth 0 pnt-ins)
	 			y-pnt-ins (nth 1 pnt-ins)
	  		y-pnt-ins-1 y-pnt-ins
	  		dlt-y 8
	); setq
	
	(101-empt-lin-spcf)

	;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	(if (or (= str-1 "ПБР-2М" str-1) (= str-1 "ПБР-3А" str-1))
		(progn
			(setq nmbr-ln 4);setq
			
			(1000-delete-items-spcf nmbr-ln pnt-ins)
			
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Пускатель бесконтактный реверсивный")
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "- Uэл. пит. " str-2 "В, макс. коммутируемый ток " str-3 "А"))
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 (strcat "- климатическое исполнение " str-4 ", монтаж щитовой"))

			(command "_TEXT" "_MC" (list (+ x-pnt-ins 160) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 str-1) ;Тип, марка, обозначение документа, опросного листа
			(command "_TEXT" "_MC" (list (+ x-pnt-ins 160) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 "ЯЛБИ.421235.009 ТУ")
		);progn
	);if

	
	;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	(if (or (= str-1 "ПБР-2ИМ" str-1) (= str-1 "ПБР-3ИМ" str-1))
		(progn
			(setq nmbr-ln 7);setq
			
			(1000-delete-items-spcf nmbr-ln pnt-ins)

			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Пускатель бесконтактный реверсивный")
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "- Uэл. пит. " str-2 ", переменный ток"))
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 (strcat "- макс. коммутируемый ток " str-3 "А"))
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 3)) 4)) 2.5 0 (strcat "- климатическое исполнение " str-4))
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 4)) 4)) 2.5 0 "- монтаж на DIN-рейку")
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 5)) 4)) 2.5 0 (strcat "- интерфейс " str-5))

			(command "_TEXT" "_MC" (list (+ x-pnt-ins 160) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 (strcat str-1 "-" str-3)) ;Тип, марка, обозначение документа, опросного листа
			(command "_TEXT" "_MC" (list (+ x-pnt-ins 160) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 "ЯЛБИ.421235.009 ТУ")
		);progn
	);if

		

	(repeat nmbr-ln
  	(command "_insert" "зс-пустая-строка" "_X" 1 "_Y" 1 "_Z" 1 "_R" 0 (list x-pnt-ins y-pnt-ins-1))
  	(setq y-pnt-ins-1 (- y-pnt-ins-1 8));setq
	);repeat
	
	(command "_text" "_MC" (list (+ x-pnt-ins 322.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 str-99)
	
	(command "_text" "_MC" (list (+ x-pnt-ins 280) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "шт.")
	
	(command "_text" "_MC" (list (+ x-pnt-ins 247.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "ОАО \"АБС ЗЭиМ")
	(command "_text" "_MC" (list (+ x-pnt-ins 247.5) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 "Автоматизация\",")	
	(command "_text" "_MC" (list (+ x-pnt-ins 247.5) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 "г. Чебоксары")

	(setq cntr-1 (+ cntr-1 1));setq
);repeat

(princ)
)
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в овш               ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun lecgv-101-04-contactors-abs-zeim-pbr-01-general

( / cntr-1 pnt-ins str-1 str-2 str-3 str-4 str-5 str-6 str-7 str-8 str-9 str-99 str-tmp str-txt str-txt-01 str-txt-02)

(setq cntr-1 0);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-1 (cdr (assoc 1 str-tmp))
				str-2 (cdr (assoc 2 str-tmp))
				str-3 (cdr (assoc 3 str-tmp))
				str-4 (cdr (assoc 4 str-tmp))
				str-5 (cdr (assoc 5 str-tmp))
				str-6 (cdr (assoc 6 str-tmp))
				str-7 (cdr (assoc 7 str-tmp))
				str-8 (cdr (assoc 8 str-tmp))
				str-9 (cdr (assoc 9 str-tmp))
				str-99 (cdr (assoc 99 str-tmp))
	);setq

	(setvar "osmode" 6199)
	
	(setq pnt-ins		(getpoint "\nУкажите точку вставки\n"));setq

	;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	(if (or (= str-1 "ПБР-2М" str-1) (= str-1 "ПБР-3А" str-1))
		(setq str-txt (strcat "Пускатель бесконтактный реверсивный, " str-1 ", Uпит." str-2 "В, Iмакс. комм. до " str-3 "А")
					str-txt-01 nil
					str-txt-02 nil
		);setq
	);if


	(if (or (= str-1 "ПБР-2ИМ" str-1) (= str-1 "ПБР-3ИМ" str-1))
		(setq str-txt (strcat "Пускатель бесконтактный реверсивный АБС ЗЭиМ, " str-1 "-" str-3", Uпит." str-2 "В, Iмакс. комм. до " str-3 "А")
					str-txt-01 nil
					str-txt-02 nil
		);setq
	);if
	
	(split-str-parts-lecgv-065-01 str-txt str-txt-01 str-txt-02 str-99 pnt-ins);

	(setq cntr-1 (+ cntr-1 1));setq
);repeat

(princ)
)
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////