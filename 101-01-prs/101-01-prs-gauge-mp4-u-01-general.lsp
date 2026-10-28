;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////                                                              ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun 101-01-prs-gauge-mp4-u-01-general

( / adoc dcl-id list-01 list-01-read-file list-02 list-02-read-file list-03 list-04 list-05 list-06 list-07 list-08 list-09 list-10 list-11 list-12 list-13 list-14 list-15 
list-16 list-17 list-18 list-19 list-801 list-900 list-901 list-902 str-01 type-list)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(read-file-for-dialog-box-01 "101-01-prs-gauge-mp4-u-01-general.txt" 2)

(setq list-01 list-01-read-file
			list-801 list-02-read-file
			
			str-01 "0"
			
			list-901 nil
      list-902 nil
      list-900 nil
);setq

(start-101-01-prs-gauge-mp4-u-01-general str-01)

(if (< (setq dcl-id (load_dialog "dia-101-01-prs-gauge-mp4-u-01-general.dcl")) 0) ;ищем диалог
		(progn
			(alert "Не найден dcl-файл")
			(exit)
		);progn
);if

(if (not (new_dialog "dia_101_01_press_mp4u" dcl-id))
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
(list-filling "txt-15" list-15)
(list-filling "txt-16" list-16)
(list-filling "txt-17" list-17)
(list-filling "txt-18" list-18)
(list-filling "txt-19" list-19)

(set_tile "txt-01" "0")
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
(set_tile "txt-15" "0")
(set_tile "txt-16" "0")
(set_tile "txt-17" "0")
(set_tile "txt-18" "0")
(set_tile "txt-19" "0")

(action_tile "txt-01"
  (strcat "(tmp-strt-101-01-prs-gauge-mp4-u-01-general)");strcat
);action_tile

(action_tile "txt-03"
  (strcat "(txt-03-101-01-prs-gauge-mp4-u-01-general)");strcat
);action_tile

(action_tile "but1"
  (strcat "(filling-fields-101-01-prs-gauge-mp4-u-01-general)");strcat
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

(if (= type-list "le") (le-101-01-prs-gauge-mp4-u-01-general));if

(if (= type-list "spcf") (spcf-101-01-prs-gauge-mp4-u-01-general));if

(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(vla-endundomark adoc)
(princ)
)
;/////// конец программы ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun start-101-01-prs-gauge-mp4-u-01-general

(str-01 / list-900-read-file list-902-read-file name-file-1)

(setq name-file-1 (nth (atoi str-01) list-801));setq

(read-file-for-dialog-box-02 name-file-1)

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
			list-17 (cdr (nth 15 list-902-read-file))
			list-18 (cdr (nth 16 list-902-read-file))
			list-19 (cdr (nth 17 list-902-read-file))
			list-900 list-900-read-file
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
(list-filling "txt-17" list-17)
(list-filling "txt-18" list-18)
(list-filling "txt-19" list-19)

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
(set_tile "txt-15" "0")
(set_tile "txt-16" "0")
(set_tile "txt-17" "0")
(set_tile "txt-18" "0")
(set_tile "txt-19" "0")

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun txt-03-101-01-prs-gauge-mp4-u-01-general

( / str-01 str-03)

(setq str-01 (nth (atoi (get_tile "txt-01")) list-01)
			str-03 (nth (atoi (get_tile "txt-03")) list-03)
);setq

(princ "\n          str-01 = ") (princ str-01);Erase_DV
(getstring "\nPress Enter to continue...");Erase_DV



(if (= "Манометр МП4-У" str-01)
	(cond
		((= "*кгс/см2" str-03)
			(setq list-04 (list "0...0,6" "0...1" "0...1,6" "0...2,5" "0...4" "0...6" "0...10" "0...16" "0...25" "0...40" "0...60" "0...100" "0...160" "0...250" "0...400" "0...600" "0...1000" "0...1600"));setq
		);

		((= "МПа" str-03)
			(setq list-04 (list "0...0,06" "0...0,1" "0...0,16" "0...0,25" "0...0,4" "0...0,6" "0...1" "0...1,6" "0...2,5" "0...4" "0...6" "0...10" "0...16" "0...25" "0...40" "0...60" "0...100" "0...160"));setq
		);
	);cond
);if


(list-filling "txt-04" list-04)

(set_tile "txt-04" "0")

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма формирования данных/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun filling-fields-101-01-prs-gauge-mp4-u-01-general

( / str-01 str-011 str-012 str-02 str-02-01 str-03 str-04 str-05 str-06 str-06-01 str-07 str-07-901 str-08 str-09 str-10 str-11 str-12 str-13 str-14 str-15 str-16 str-17 
str-18 str-19 str-901 str-902 str-99)

;заполняем поле "выбрано"
(setq str-01 (nth (atoi (get_tile "txt-01")) list-01)
			str-02 (nth (atoi (get_tile "txt-02")) list-02)
			str-03 (nth (atoi (get_tile "txt-03")) list-03)
			str-04 (nth (atoi (get_tile "txt-04")) list-04)
			str-05 (nth (atoi (get_tile "txt-05")) list-05)
			str-06 (nth (atoi (get_tile "txt-06")) list-06)			
			str-07 (nth (atoi (get_tile "txt-07")) list-07)
			str-08 (nth (atoi (get_tile "txt-08")) list-08)
			str-09 (nth (atoi (get_tile "txt-09")) list-09)
			str-10 (nth (atoi (get_tile "txt-10")) list-10)
			str-11 (nth (atoi (get_tile "txt-11")) list-11)
			str-12 (nth (atoi (get_tile "txt-12")) list-12)
			str-13 (nth (atoi (get_tile "txt-13")) list-13)
			str-14 (nth (atoi (get_tile "txt-14")) list-14)
			str-15 (nth (atoi (get_tile "txt-15")) list-15)
			str-16 (nth (atoi (get_tile "txt-16")) list-16)
			str-17 (nth (atoi (get_tile "txt-17")) list-17)
			str-18 (nth (atoi (get_tile "txt-18")) list-18)
			str-19 (nth (atoi (get_tile "txt-15")) list-19)
);setq

(if (/= list-901 nil) 
	(setq list-901 (reverse list-901)
				list-902 (reverse list-902)
	);setq
);if

(setq str-011 (substr str-01 1 (vl-string-search " " str-01))			
			str-012 (substr str-01 (+ (vl-string-search " " str-01) 2))	
);setq

(setq str-02 (vl-string-left-trim "*" str-02)
			str-02-01 (substr str-02 1 (vl-string-search " " str-02))			
			str-901 (strcat str-012 "-" str-02-01)
			str-02 (strcat "климатическое исп. " str-02)
);setq

(setq str-03 (vl-string-left-trim "*" str-03)
			str-03 (strcat str-04 " "  str-03)		
			str-901 (strcat str-901 "-" str-03)
			str-03 (strcat "пределы изм. " str-03)
);setq

(setq str-05 (vl-string-left-trim "*" str-05));setq

(if (/= str-05 "1,5") 
	(setq str-901 (strcat str-901 "-" str-06)
				str-05 (strcat str-05 "кл. точности " str-05)
	);setq

	(setq str-05 (strcat "кл. точности 1,5"));setq
);if

(if (/= str-06 "*Стандартная") 
	(setq str-06-01 (substr str-06 1 (vl-string-search " " str-06))
				str-901 (strcat str-901 "-" str-06-01)
				str-06 (strcat "среда изм. " (substr str-06 (+ (vl-string-search " " str-06) 2)))
				str-06 (strcase str-06 1)
	);setq
);if

(if (/= str-07 "*Радиальный штуцер без фланца") 
	(setq str-07-901 (substr str-07 1 (vl-string-search " " str-07))
				str-901 (strcat str-901 "-" str-07-901)
				str-07 (strcase str-07 1)
				str-07 (substr str-07 (+ (vl-string-search " " str-07) 2))
	);setq
);if

(if (/= str-08 "*IP40") 
	(setq str-901 (strcat str-901 "-" str-08)
				str-08 (strcat "степень защиты " str-08)
	);setq
);if

(setq str-09 (vl-string-left-trim "*" str-09));setq

(if (/= str-09 "М20х1,5-8g") 
	(setq str-901 (strcat str-901 "-" str-09)
				str-09 (strcat "присоединение " str-09 " (наружн.)")
	);setq
	
	 (setq str-09 (strcat "присоединение " str-09 " (наружн.)"));setq
);if

(if (/= str-10 "Нет") 
	(setq str-901 (strcat str-901 "-" str-10)
				str-10 "обезжиривание"
	);setq
);if
  	
(if (/= str-11 "Нет") 
	(setq str-901 (strcat str-901 "-" str-11)	
				str-11 "атомное исп."
	);setq
);if
  	
(if (/= str-12 "Нет") 
	(setq str-901 (strcat str-901 "-" str-12)	
				str-12 "демпфер"
	);setq
);if 	
  	
(if (/= str-13 "Нет") 
	(setq str-901 (strcat str-901 "-" str-13)	
				str-13 "черта"
	);setq
);if 	

(if (/= str-14 "Нет") 
	(setq str-901 (strcat str-901 "-" str-14)	
				str-14 "экспортное исп."
	);setq
);if 	
  	
(if (/= str-15 "Нет") 
	(setq str-901 (strcat str-901 "-" str-15)	
				str-15 "пломба"
	);setq
);if 	
  	
(if (/= str-16 "Нет") 
	(setq str-901 (strcat str-901 "-" str-16)	
				str-16 "табличка"
	);setq
);if

(if (/= str-17 "Нет") 
	(setq str-901 (strcat str-901 "-" str-17)	
				str-17 "номер"
	);setq
);if 	
  	
(if (/= str-18 "Нет") 
	(setq str-901 (strcat str-901 "-" str-18)	
				str-18 "отметка о поверке"
	);setq
);if

(if (= str-19 "ЦСМ") 
	(setq str-901 (strcat str-901 "-" str-19)	
				str-19 "поверка ЦСМ"
	);setq
);if


(cond ;масса
	((= str-01 "Манометр МП4-У") (setq str-99 "1,2"));=
);cond

(setq str-902 (list (cons 1 str-011) (cons 2 str-02) (cons 3 str-03) (cons 5 str-05) (cons 6 str-06) (cons 7 str-07) (cons 8 str-08) (cons 9 str-09) 
										(cons 10 str-10) (cons 11 str-11) (cons 12 str-12) (cons 13 str-13) (cons 14 str-14) (cons 15 str-15) (cons 16 str-16)
										(cons 17 str-17) (cons 18 str-18) (cons 19 str-19) (cons 20 str-901) (cons 99 str-99))
);setq

(setq list-901 (vl-list* str-901 list-901)
			list-902 (vl-list* str-902 list-902)
			
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
(defun le-101-01-prs-gauge-mp4-u-01-general

( / cntr-1 pnt-ins str-01 str-03 str-05 str-09 str-20 str-701 str-702 str-tmp)

(setq cntr-1 0
			str-702 nil
);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-01 (cdr (assoc 1 str-tmp))
				str-03 (cdr (assoc 3 str-tmp))
				str-05 (cdr (assoc 5 str-tmp))
				str-09 (cdr (assoc 9 str-tmp))
				str-20 (cdr (assoc 20 str-tmp))
	);setq

	(setvar "osmode" 6199)
	
	(setq pnt-ins (getpoint "\nУкажите точку вставки\n"));setq
	
	;/////////////////////////////////////////////////////////////////////////////////////////////////
	(if (wcmatch str-01 "Манометр")
		(setq str-701 (strcat str-01 " " str-20 ", " str-03 ", " str-05 ", " str-09));setq
	);if

	(split-str-parts-le-01-general str-701 str-702 pnt-ins "**1**");

	(setq cntr-1 (1+ cntr-1));setq
);repeat

(princ)
)
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в спцф                   ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun spcf-101-01-prs-gauge-mp4-u-01-general

( / cntr-1 cntr-2 pnt-ins str-01 str-02 str-03 str-04 str-05 str-06 str-07 str-08 str-09 str-10 str-11 str-12 str-13 str-14 str-15 str-16 str-17 str-18 str-19 str-20 
str-701 str-702 str-99 str-crtf str-manufact str-order str-tmp str-unit)

(setvar "textstyle" "Standard")

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
				str-17 (cdr (assoc 17 str-tmp))
				str-18 (cdr (assoc 18 str-tmp))
				str-19 (cdr (assoc 19 str-tmp))
				str-20 (cdr (assoc 20 str-tmp))
				str-99 (cdr (assoc 99 str-tmp))
	);setq
	
	(setvar "osmode" 6199)


;(princ "\n         str-tmp = ") (princ str-tmp);Erase_DV
;(getstring "\nPress Enter to continue...");Erase_DV



	(setq pnt-ins (getpoint "\nУкажите точку вставки\n")
	
				str-702 (list (cons 1 (strcat str-02 ", " str-03))
											(cons 2 (strcat str-05)))
				cntr-2 3
	);setq
	
	(if (/= str-06 "*Стандартная") 
		(setq str-702 (vl-list* (cons cntr-2 str-06) str-702)
					cntr-2 (+ cntr-2 1)
		);setq
	);if

	(if (/= str-07 "*Радиальный штуцер без фланца") 
		(setq str-702 (vl-list* (cons cntr-2 str-07) str-702)
					cntr-2 (+ cntr-2 1)
		);setq
	);if

	(if (/= str-08 "*IP40") 
		(setq str-702 (vl-list* (cons cntr-2 str-08) str-702)
					cntr-2 (+ cntr-2 1)
		);setq
	);if
	
	(setq str-702 (vl-list* (cons cntr-2 str-09) str-702)
				cntr-2 (+ cntr-2 1)
	);setq
	
	(if (/= str-10 "Нет") 
		(setq str-702 (vl-list* (cons cntr-2 str-10) str-702)
					cntr-2 (+ cntr-2 1)
		);setq
	);if	
	
	(if (/= str-11 "Нет") 
		(setq str-702 (vl-list* (cons cntr-2 str-11) str-702)
					cntr-2 (+ cntr-2 1)
		);setq
	);if
	
	(if (/= str-12 "Нет") 
		(setq str-702 (vl-list* (cons cntr-2 str-12) str-702)
					cntr-2 (+ cntr-2 1)
		);setq
	);if
	
	(if (/= str-13 "Нет") 
		(setq str-702 (vl-list* (cons cntr-2 str-13) str-702)
					cntr-2 (+ cntr-2 1)
		);setq
	);if
	
	(if (/= str-14 "Нет") 
		(setq str-702 (vl-list* (cons cntr-2 str-14) str-702)
					cntr-2 (+ cntr-2 1)
		);setq
	);if	

	(if (/= str-15 "Нет") 
		(setq str-702 (vl-list* (cons cntr-2 str-15) str-702)
					cntr-2 (+ cntr-2 1)
		);setq
	);if

	(if (/= str-16 "Нет") 
		(setq str-702 (vl-list* (cons cntr-2 str-16) str-702)
					cntr-2 (+ cntr-2 1)
		);setq
	);if

	(if (/= str-17 "Нет") 
		(setq str-702 (vl-list* (cons cntr-2 str-17) str-702)
					cntr-2 (+ cntr-2 1)
		);setq
	);if

	(if (/= str-18 "Нет") 
		(setq str-702 (vl-list* (cons cntr-2 str-18) str-702)
					cntr-2 (+ cntr-2 1)
		);setq
	);if

	(if (/= str-19 "Нет") 
		(setq str-702 (vl-list* (cons cntr-2 str-19) str-702));setq
	);if


	(setq str-manufact "ОАО \"Манотомь\", г. Томск"
				
				str-order (list (cons 1 str-20) 
												(cons 2 "-") 
												(cons 3 nil));list
				
				str-unit "шт."
				str-crtf "Свидетельство об утв. типа СИ №58378"
	);setq
	
	(split-str-parts-spcf-01-general str-01 str-702 str-order str-manufact str-unit str-99 str-crtf pnt-ins);

	(setq cntr-1 (+ cntr-1 1));setq
);repeat

(princ)
)
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
