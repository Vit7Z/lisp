;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////                                                              ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun 101-01-prs-sens-elemer-air-10-pt-01-general

( / adoc cntr-1 dcl-id list-01 list-01-read-file list-02 list-02-read-file list-03 list-04 list-05 list-06 list-07 list-08 
list-09 list-10 list-1001 list-11 list-12 list-13 list-14 list-15 list-16 list-801 list-901 list-902 str-01 type-list)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object)))) ; start undo

(setvar "cmdecho" 0)

(read-file-for-dialog-box-01 "101-01-prs-sens-elemer-air-10-pt-01-general.txt" 2)

(setq str-01 "0"
      list-01 list-01-read-file
      list-801 list-02-read-file

      list-901 nil
      list-902 nil
);setq

(txt-01-101-01-prs-sens-elemer-air-10-pt-01-general str-01)

(if (< (setq dcl-id (load_dialog "dia-101-01-prs-sens-elemer-air-10-pt-01-general.dcl")) 0) ;ищем диалог
		(progn
			(alert "Не найден dcl-файл")
			(exit)
		);progn
);if

(if (not (new_dialog "dia_101_elemer_air_10_pt" dcl-id))
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
(list-filling "txt-10" list-10)
(list-filling "txt-11" list-11)
(list-filling "txt-12" list-12)
(list-filling "txt-13" list-13)
(list-filling "txt-14" list-14)
(list-filling "txt-13" list-13)
(list-filling "txt-14" list-14)
(list-filling "txt-15" list-15)
(list-filling "txt-16" list-16)
(list-filling "txt-1001" list-1001)

(set_tile "txt-01" "0")
(set_tile "txt-02" "0")
(set_tile "txt-03" "0")
(set_tile "txt-04" "0")
(set_tile "txt-05" "0")
(set_tile "txt-06" "0")
(set_tile "txt-07" "0")
(set_tile "txt-08" "0")
(set_tile "txt-09" "Нет")
(set_tile "txt-10" "0")
(set_tile "txt-11" "0")
(set_tile "txt-12" "0")
(set_tile "txt-13" "0")
(set_tile "txt-14" "0")

(action_tile "txt-01" 
	(strcat "(txt-01-101-01-prs-sens-elemer-air-10-pt-01-general)")
);action_tile

(action_tile "txt-02" 
	(strcat "(txt-02-101-01-prs-sens-elemer-air-10-pt-01-general)")
);action_tile




(action_tile "but1"
  (strcat "(but1-101-01-prs-sens-elemer-air-10-pt-01-general)");srcat
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

(action_tile "accept"
  (strcat "(done_dialog)"
          "(exit)"
  );strcat
);action_tile

(start_dialog)
(unload_dialog dcl-id)

(if (= type-list "le") (le-101-01-prs-sens-elemer-air-10-pt-01-general));if

(if (= type-list "spcf") (spcf-101-01-prs-sens-elemer-air-10-pt-01-general));if

(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(vla-endundomark adoc)
(princ)
)
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun txt-01-101-01-prs-sens-elemer-air-10-pt-01-general
(str-01 / list-1001-read-file list-902-read-file name-file)

(setq name-file (nth (atoi str-01) list-801));setq

(read-file-for-dialog-box-02 name-file)

;(divide-text-into-parts list-900-read-file 150)

(setq list-02 (cdr (nth 0 list-902-read-file))
			list-03 (cdr (nth 1 list-902-read-file))
			list-04 (cdr (nth 2 list-902-read-file))
			list-05 (cdr (nth 3 list-902-read-file))
			list-06 (cdr (nth 4 list-902-read-file))
			list-07 (cdr (nth 5 list-902-read-file))
			list-08 (cdr (nth 6 list-902-read-file))
			list-09 (cdr (nth 7 list-902-read-file))
			list-10 (cdr (nth 8 list-902-read-file))
			list-11 (cdr (nth 9 list-902-read-file))
			list-12 (cdr (nth 10 list-902-read-file))
			list-13 (cdr (nth 11 list-902-read-file))
			list-14 (cdr (nth 12 list-902-read-file))
			list-15 (cdr (nth 13 list-902-read-file))
			list-16 (cdr (nth 14 list-902-read-file))
			;list-900 list-900-read-file
);setq

 
(list-filling "txt-02" list-02)
(list-filling "txt-03" list-03)
(list-filling "txt-04" list-04)
(list-filling "txt-05" list-05)
(list-filling "txt-06" list-06)
(list-filling "txt-07" list-07)
(list-filling "txt-08" list-08)
(list-filling "txt-09" list-09)
(list-filling "txt-10" list-10)
(list-filling "txt-11" list-11)
(list-filling "txt-12" list-12)
(list-filling "txt-13" list-13)
(list-filling "txt-14" list-14)
(list-filling "txt-15" list-15)
(list-filling "txt-16" list-16)
(list-filling "txt-1001" list-1001)


(set_tile "txt-02" "0")
(set_tile "txt-03" "0")
(set_tile "txt-04" "0")
(set_tile "txt-05" "0")
(set_tile "txt-06" "0")
(set_tile "txt-07" "0")
(set_tile "txt-08" "0")
(set_tile "txt-09" "0")
(set_tile "txt-10" "0")
(set_tile "txt-11" "0")
(set_tile "txt-12" "0")
(set_tile "txt-13" "0")
(set_tile "txt-14" "0")


(princ)
)
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun txt-02-101-01-prs-sens-elemer-air-10-pt-01-general
( / str-01 str-02)

(setq str-01 (nth (atoi (get_tile "txt-01")) list-01)
			str-02 (nth (atoi (get_tile "txt-02")) list-02)
);setq

(if (or (= "АИР-10-М1-ДИ-1162" str-01) 
				(= "АИР-10-М1-ДИ-1165" str-01))
	(cond
		((= str-02 "0...0,10 МПа") (setq list-03 (list "С05* 2,0%" "B02* 1,0%")));
		((= str-02 "0...0,16 МПа") (setq list-03 (list "С05* 1,5%" "B02* 0,8%")));
		((= str-02 "0...0,25 МПа") (setq list-03 (list "С05* 1,2%" "B02* 0,6%")));
		((= str-02 "0...0,4 МПа") (setq list-03 (list "С05* 1,0%" "B02* 0,5%")));
		((= str-02 "0...0,6 МПа") (setq list-03 (list "С05* 0,8%" "B02* 0,4%")));
		((= str-02 "0...1,0 МПа") (setq list-03 (list "С05* 0,5%" "B02* 0,3%")));
		((= str-02 "0...1,6 МПа") (setq list-03 (list "С05* 0,5%" "B02* 0,2%")));
		((= str-02 "0...2,5 МПа") (setq list-03 (list "С05* 0,5%" "B02* 0,2%")));

	);cond
);if

(list-filling "txt-03" list-03)

(set_tile "txt-03" "0")

(princ)
)
;;;;//////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;//////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;//////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;//////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun txt-03-101-01-prs-sens-elemer-air-10-pt-01-general

( / str-02 str-03 str-03-1)

(setq str-01 (nth (atoi (get_tile "txt-02")) list-02)
			str-02 (nth (atoi (get_tile "txt-02")) list-02)
);setq

(princ)
)
;;;;//////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;//////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;//////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;//////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun txt-14-101-01-prs-sens-elemer-air-10-pt-01-general

( / str-02 str-03 str-03-1)

(princ)
)
;;;;//////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;//////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;//////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма формирования данных//////////////////////////////////////////////////////////////////////////
(defun but1-101-01-prs-sens-elemer-air-10-pt-01-general

( / cntr-1 str-01 str-02 str-03 str-03-1 str-04 str-04-1 str-05 str-05-1 str-06 str-06-1 str-07 str-07-1 str-08 
str-08-1 str-09 str-10 str-10-1 str-11 str-11-1 str-12 str-12-1 str-13 str-13-1 str-14 str-15 str-16 str-99 
tmp-list-902)

(setq cntr-1 0);setq

(if (/= list-901 nil) 
	(setq list-901 (reverse list-901)
				list-902 (reverse list-902)
	);setq
);if

;заполняем поле "выбрано"
(setq str-01 (nth (atoi (get_tile "txt-01")) list-01)
			str-02 (nth (atoi (get_tile "txt-02")) list-02)
			str-03 (nth (atoi (get_tile "txt-03")) list-03)
			str-04 (nth (atoi (get_tile "txt-04")) list-04)
			str-05 (nth (atoi (get_tile "txt-05")) list-05)
			str-06 (nth (atoi (get_tile "txt-06")) list-06)
			str-07 (nth (atoi (get_tile "txt-07")) list-07)
			str-08 (nth (atoi (get_tile "txt-08")) list-08)
			str-09 (get_tile "txt-09")
			str-10 (nth (atoi (get_tile "txt-10")) list-10)
			str-11 (nth (atoi (get_tile "txt-11")) list-11)
			str-12 (nth (atoi (get_tile "txt-12")) list-12)
			str-13 (nth (atoi (get_tile "txt-13")) list-13)
			str-14 (nth (atoi (get_tile "txt-14")) list-14)
			str-15 (nth (atoi (get_tile "txt-15")) list-15)
			str-16 (nth (atoi (get_tile "txt-16")) list-16)
);setq


(setq str-03-1 (substr str-03 1 (vl-string-search " " str-03))
			str-04-1 (substr str-04 1 (vl-string-search " " str-04))
			str-05-1 (substr str-05 1 (vl-string-search " " str-05))
			str-06-1 (substr str-06 1 (vl-string-search " " str-06))
			str-07-1 (substr str-07 1 (vl-string-search " " str-07))
			str-08-1 (substr str-08 1 (vl-string-search " " str-08))

			str-10-1 (substr str-10 1 (vl-string-search " " str-10))
			str-11-1 (substr str-11 1 (vl-string-search " " str-11))
			str-12-1 (substr str-12 1 (vl-string-search " " str-12))
			str-13-1 (substr str-13 1 (vl-string-search " " str-13))
);setq
     

(setq list-901 (vl-list* (strcat str-01 "  "
																 str-02 "  " 
																 str-03-1 "  "
																 str-04-1 "  "
																 str-05-1 "  "
																 str-06-1 "  "
																 str-07-1 "  "
																 str-08-1 "  "
																 "(13) " str-09 "  "
																 "(14) " str-10-1 "  "
																 "(15) " str-11-1 "  "
																 "(16) " str-12-1 "  "
																 "(17) " str-13-1 "  "
																 "(18) " str-14 "  "
																 "(19) " str-15 "  "
																 "(20) " str-16 "  "
																 	) list-901)
);setq

;масса
(cond	
	((wcmatch str-01 "АИР-10-М#-Д@-1##2") (setq str-99 "0,25"));=
	((wcmatch str-01 "АИР-10-М#-Д@-1##5") (setq str-99 "0,25"));=
	((wcmatch str-01 "АИР-10-М#-ДИВ-1##2") (setq str-99 "0,25"));=
	
);cond

(setq tmp-list-902 (list (cons 1 str-01) 
												 (cons 2 str-02) 
												 (cons 3 str-03) 
												 (cons 4 str-04)
												 (cons 5 str-05)
												 (cons 6 str-06)
												 (cons 7 str-07)
												 (cons 8 str-08)
												 (cons 9 str-09)
												 (cons 10 str-10)
												 (cons 11 str-11)
												 (cons 12 str-12)
												 (cons 13 str-13)
												 (cons 14 str-14)
												 (cons 15 str-15)
												 (cons 16 str-16)
									 			 (cons 99 str-99));list
);setq

(setq list-902 (vl-list* tmp-list-902 list-902)
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
(defun le-101-01-prs-sens-elemer-air-10-pt-01-general

( / cntr-1 pnt-ins str-01 str-02 str-701 str-702 str-tmp)

(setq cntr-1 0);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-01 (cdr (assoc 1 str-tmp))
				str-02 (cdr (assoc 2 str-tmp))
	);setq

	(setvar "osmode" 6199)
	
	(setq pnt-ins		(getpoint "\nУкажите точку вставки\n"));setq
	
	;;;;;;;///////////////////////////////////////////////////////////////////////////////////////////
	(if (wcmatch str-01 "АИР-10-М#-ДИ-1###")
		(setq str-701 (strcat "Датчик давления (избыточное давл.) Элемер " str-01 ", исп. общепромышлен., пределы изм. " str-02)
					str-702 nil
		);setq
	);if

	(split-str-parts-le-01-general str-701 str-702 pnt-ins "*12*");

	(setq cntr-1 (1+ cntr-1));setq

);repeat

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в СПЦФ                 //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun spcf-101-01-prs-sens-elemer-air-10-pt-01-general

( / cntr-1 pnt-ins str-01 str-01-1 str-02 str-03 str-03-1 str-03-2 str-04 str-04-2 str-05 str-05-2 str-06 str-06-1 str-06-2 str-07 str-07-1 
str-07-2 str-08 str-08-1 str-08-2 str-09 str-09-1 str-09-2 str-10 str-10-1 str-10-2 str-11 str-11-1 str-11-2 str-12 str-12-1 str-12-2 
str-13 str-13-1 str-13-2 str-14 str-14-2 str-15 str-15-1 str-15-2 str-16 str-16-1 str-16-2 str-701 str-702 str-99 str-crtf str-manufact 
str-order str-tmp str-unit)

(setq cntr-1 0);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-01 (cdr (assoc 1 str-tmp))
				str-02 (cdr (assoc 2 str-tmp))
				str-03 (cdr (assoc 3 str-tmp))
				str-04 (cdr (assoc 4 str-tmp))
				str-05 (cdr (assoc 5 str-tmp))
				str-06 (cdr (assoc 6 str-tmp))
				str-07 (cdr (assoc 7 str-tmp))
				str-08 (cdr (assoc 8 str-tmp))
				str-09 (cdr (assoc 9 str-tmp))
				str-10 (cdr (assoc 10 str-tmp))
				str-11 (cdr (assoc 11 str-tmp))
				str-12 (cdr (assoc 12 str-tmp))
				str-13 (cdr (assoc 13 str-tmp))
				str-14 (cdr (assoc 14 str-tmp))
				str-15 (cdr (assoc 15 str-tmp))
				str-16 (cdr (assoc 16 str-tmp))
				str-99 (cdr (assoc 99 str-tmp))
	);setq
     
	(cond
		((not (wcmatch str-01 "Ex")) (setq str-01-1 "общепромышленное"));=
		((wcmatch str-01 "Ex") (setq str-01-1 "взрывозащищенное (маркировка ExiaIICT6 X)"));=
	);cond
	
	(cond
		((wcmatch str-01 "АИР-10-М#-ДИ-####") (setq str-701 "Преобразователь давления (избыточное давление)"));=
	);cond

	(setq str-03-2 (vl-string-right-trim "*" (substr str-03 1 (vl-string-search " " str-03)))
				str-03-1 (substr str-03 (+ (vl-string-search " " str-03) 2))
				
				str-04-2 (vl-string-right-trim "*" (substr str-04 1 (vl-string-search " " str-04)))
				
				str-05-2 (vl-string-right-trim "*" str-05)
				
				str-06-2 (vl-string-right-trim "*" (substr str-06 1 (vl-string-search " " str-06)))
				str-06-1 (substr str-06 (+ (vl-string-search " " str-06) 2))
				
				str-07-2 (vl-string-right-trim "*" (substr str-07 1 (vl-string-search " " str-07)))
				str-07-1 (substr str-07 (+ (vl-string-search " " str-07) 2))
				
				str-08-2 (vl-string-right-trim "*" (substr str-08 1 (vl-string-search " " str-08)))
				str-08-1 (substr str-08 (+ (vl-string-search " " str-08) 2))
				str-08-1 (vl-string-subst "вилка" "Вилка" str-08-2)
				
				str-14-2 (vl-string-right-trim "*" str-14)
	);setq
	
	(if (/= str-09 "Нет") 
		(setq str-09-1 (list (cons 9 "длина кабеля " str-09 " м"))
					str-09-2 str-09);setq

		(setq str-09-2 "-")
	);if

	(if (/= str-10 "Нет") 
		(setq str-10-2 "БР" 
					str-10-1 (list (cons 10 "опция БР (герконовое реле)"))
		);setq
	
		(setq str-10-2 "-")
	);if
	
	(if (/= str-11 "Нет") 
		(setq str-11-2 str-11
					str-11-1 (list (cons 11 (strcat "индикатор " str-11)))
		);setq 
		
		(setq str-11-2 "-")
	);if
	
	(if (/= str-12 "Нет") 
		(setq str-12-2 "ПО" 
					str-12-1 (list (cons 12 "опция ПО (кабель для подключения к ПК)"))
		);setq 
					
		(setq str-12-2 "-")	
	);if
	
	(if (/= str-13 "Нет") 
		(setq str-13-2 "КМЧ" 
					str-13-1 (list (cons 13 "опция КМЧ (ниппель, гайка)"))
		);setq
		 
		(setq str-13-2 "-")
	);if

	(if (/= str-15 "Нет") 
		(setq str-15-2 "360П" 
					str-15-1 (list (cons 15 "опция 360П (испытания в течение 360 ч)"))
		);setq
		
		(setq str-15-2 "-")
	);if

	(if (/= str-16 "Нет") 
		(setq str-16-2 "ГП" 
					str-16-1 (list (cons 16 "опция ГП (госповерка)"))
		);setq 
		
		(setq str-16-2 "-")
	);if

	(setq str-order (strcat str-01 "-" str-03-2 "-" str-04-2 "-" str-05-2 "-" str-06-2 "-" str-07-2 "-" 
													str-02 "-" str-08-2 "-" str-09-2 "-" str-10-2 "-" str-11-2 "-" str-12-2 "-" str-13-2 "-" 
													str-14-2 "-" str-15-2 "-" str-16-2);strcat
	);setq

	(repeat 15
		(setq str-order (vl-string-subst "-" "--" str-order));setq
	);repeat

	(setvar "osmode" 6199)
	
	(setq pnt-ins (getpoint "\nУкажите точку вставки\n"));setq

	(setq str-702 (list (cons 1 (strcat "диапазон измерений " str-02))
											(cons 2 (strcat "исполнение " str-01-1))
											(cons 3 (strcat "присоединение к процессу " str-03-1))
											(cons 4 (strcat "исполнение по материалам " str-04-2))
											(cons 5 (strcat "исполнение корпуса " str-05-2))
											(cons 6 (strcat "климатическое исполнение " str-06-2 " (" str-06-1 ")"))
											(cons 7 (strcat "осн. погрешность " str-07-1))
											(cons 8 (strcat "электрическое присоединение " str-08-1))
											(cons 14 (strcat "гр. исполнения по ЭМС " str-14-2)));list
	);setq
	
	(if (/= str-09 "Нет") (setq str-702 (append str-702 str-09-1)));if
	
	(if (/= str-10 "Нет") (setq str-702 (append str-702 str-10-1)));if
	
	(if (/= str-11 "Нет") (setq str-702 (append str-702 str-11-1)));if
	
	(if (/= str-12 "Нет") (setq str-702 (append str-702 str-12-1)));if
	
	(if (/= str-13 "Нет") (setq str-702 (append str-702 str-13-1)));if
	
	(if (/= str-15 "Нет") (setq str-702 (append str-702 str-15-1)));if
	
	(if (/= str-16 "Нет") (setq str-702 (append str-702 str-16-1)));if
	
	(setq str-order (list (cons 1 str-order)
									(cons 2 "-")
									(cons 3 "ТУ 4212-029-13282997-06"));list
									
				str-manufact "ООО НПП \"ЭЛЕМЕР\", г. Зеленоград"
				str-unit "шт."
				str-crtf "№31654-14"
	);setq
	
	(split-str-parts-spcf-01-general str-701 str-702 str-order str-manufact str-unit str-99 str-crtf pnt-ins);
	
	(setq cntr-1 (+ cntr-1 1));setq
);repeat

(princ)
)
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
