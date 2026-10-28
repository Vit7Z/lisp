;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////                                                              ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun 101-01-prs-relay-dm-01-general

( / adoc dcl-id list-01 list-01-read-file list-02 list-02-read-file list-03 list-04 list-05 list-06 list-07 list-08 list-09 list-10 list-11 list-12 list-13 list-14 list-15 
list-801 list-900 list-900-dscr list-901 list-902 str-01 type-list)

(vl-load-com)

(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(read-file-for-dialog-box-01 "101-01-prs-relay-dm-01-general.txt" 2)

(setq list-01 list-01-read-file
			list-801 list-02-read-file
			
      list-901 nil
      list-902 nil
      
      list-900-dscr nil
      
      str-01 "0"
);setq

(txt-01-101-01-prs-relay-dm-01-general str-01)

(if (< (setq dcl-id (load_dialog "dia-101-01-prs-relay-dm-01-general.dcl")) 0) ;ищем диалог
		(progn
			(alert "Не найден dcl-файл")
			(exit)
		);progn
);if

(if (not (new_dialog "dia_101_01_press_relay_dm_manotom" dcl-id))
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
(list-filling "txt-900" list-900)

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

(action_tile "txt-01"
  (strcat "(txt-01-101-01-prs-relay-dm-01-general)");strcat
);action_tile

(action_tile "txt-03"
  (strcat "(txt-03-101-01-prs-relay-dm-01-general)");strcat
);action_tile

(action_tile "but1"
  (strcat "(tmp-filling-fields-101-01-prs-relay-dm-01-general)");strcat
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

(action_tile "but5"
  (strcat "(list-delete-item)");strcat
);action_tile



(action_tile "accept"
  (strcat "(done_dialog)"
          "(exit)"
  );strcat
);action_tile

(start_dialog)
(unload_dialog dcl-id)

(if (= type-list "le") (tmp-le-101-01-prs-relay-dm-01-general));if

(if (= type-list "spcf") (tmp-spcf-101-01-prs-relay-dm-01-general));if

(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(vla-endundomark adoc)

(gc)

(princ)
)
;/////// конец программы ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun txt-01-101-01-prs-relay-dm-01-general

(str-01 / list-900-dscr list-900-read-file list-902-read-file name-file)

(setq name-file (nth (atoi str-01) list-801));setq

(read-file-for-dialog-box-02 name-file)

(if (/= list-900-dscr nil)
	(divide-text-into-parts list-900-dscr 120)
);if


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
(list-filling "txt-900" list-900)

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

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun txt-03-101-01-prs-relay-dm-01-general

( / str-01 str-03)

(setq str-01 (nth (atoi (get_tile "txt-01")) list-01)
			str-03 (nth (atoi (get_tile "txt-03")) list-03)
);setq

(if (= "ДМ2005Сг1Ех" str-01)
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
(defun tmp-filling-fields-101-01-prs-relay-dm-01-general

( / str-01 str-02 str-02-901 str-03 str-04 str-05 str-06 str-06-901 str-07 str-08 str-09 str-10 str-11 str-12 str-13 str-14 str-15 str-901 str-902 str-99)

;заполняем поле "выбрано"
(setq str-01 (nth (atoi (get_tile "txt-01")) list-01)
			str-02 (nth (atoi (get_tile "txt-02")) list-02)
			str-02 (vl-string-left-trim "*" str-02)
			str-02-901 (substr str-02 1 (vl-string-search " " str-02))
			
			str-03 (nth (atoi (get_tile "txt-03")) list-03)
			str-03 (vl-string-left-trim "*" str-03)
			
			str-04 (nth (atoi (get_tile "txt-04")) list-04)
			
			str-03 (strcat str-04 " "  str-03)
			
			str-05 (nth (atoi (get_tile "txt-05")) list-05)
			str-06 (nth (atoi (get_tile "txt-06")) list-06)
			str-06 (vl-string-left-trim "*" str-06)
			str-06-901 (substr str-06 1 (vl-string-search " " str-06))
			
			str-07 (nth (atoi (get_tile "txt-07")) list-07)
			str-07 (vl-string-left-trim "*" str-07)
			
			str-08 (nth (atoi (get_tile "txt-08")) list-08)
			str-09 (nth (atoi (get_tile "txt-09")) list-09)
			str-10 (nth (atoi (get_tile "txt-10")) list-10)
			str-11 (nth (atoi (get_tile "txt-11")) list-11)
			str-12 (nth (atoi (get_tile "txt-12")) list-12)
			str-13 (nth (atoi (get_tile "txt-13")) list-13)
			str-14 (nth (atoi (get_tile "txt-14")) list-14)
			str-15 (nth (atoi (get_tile "txt-15")) list-15)
			str-99 "5,5"
);setq

(if (/= list-901 nil) 
	(setq list-901 (reverse list-901)
				list-902 (reverse list-902)
	);setq
);if

(setq str-901 (strcat str-01 "-"  str-02-901 "-" str-03));setq

(if (/= str-05 "* стандартная") (setq str-901 (strcat str-901 "-Кис")));if
  	
(setq str-901 (strcat str-901 "-" str-06-901 "-" str-07));setq
  	
(if (/= str-08 "Нет") (setq str-901 (strcat str-901 "-" str-08)));if
  	
(if (/= str-09 "Нет") (setq str-901 (strcat str-901 "-" str-09)));if
  	
(if (/= str-10 "Нет") (setq str-901 (strcat str-901 "-" str-10)));if
  	
(if (/= str-11 "Нет") (setq str-901 (strcat str-901 "-" str-11)));if
  	
(if (/= str-12 "Нет") (setq str-901 (strcat str-901 "-" str-12)));if
  	
(if (/= str-13 "Нет") (setq str-901 (strcat str-901 "-" str-13)));if
  	
(if (/= str-14 "Нет") (setq str-901 (strcat str-901 "-" str-14)));if
  	
(if (/= str-15 "Нет") (setq str-901 (strcat str-901 "-" str-15)));if

(setq str-03 (strcat "пределы изм. " str-03)
			str-06 (strcat "исп. контактов " str-06)
			str-07 (strcat "резьба штуцера " str-07)
);setq



(if (= str-01 "ДМ2005Сг1Ех")
	(setq str-902 (list (cons 0 str-01) (cons 1 str-901) (cons 2 str-02) (cons 3 str-03) (cons 5 str-05) (cons 6 str-06) (cons 7 str-07)	(cons 8 str-08)  
											(cons 9 str-09) (cons 10 str-10) (cons 11 str-11) (cons 12 str-12) (cons 13 str-13) (cons 14 str-14) (cons 15 str-15) (cons 99 str-99))
  );setq
);if

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
(defun tmp-le-101-01-prs-relay-dm-01-general

( / cntr-1 pnt-ins str-00 str-01 str-03 str-06 str-07 str-701 str-702 str-tmp)

(setq cntr-1 0);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-00 (cdr (assoc 0 str-tmp))
				str-01 (cdr (assoc 1 str-tmp))
				str-03 (cdr (assoc 3 str-tmp))
				str-06 (cdr (assoc 6 str-tmp))
				str-07 (cdr (assoc 7 str-tmp))
				str-702 nil
	);setq
	
	(princ "\n         str-01 = ") (princ str-01);Erase_DV
	(princ "\n         str-03 = ") (princ str-03);Erase_DV
	(princ "\n         str-06 = ") (princ str-06);Erase_DV
	(princ "\n         str-07 = ") (princ str-07);Erase_DV
(getstring "\nPress Enter to continue...");Erase_DV

	(setvar "osmode" 6199)
	
	(setq pnt-ins (getpoint "\nУкажите точку вставки\n"));setq
	
	;/////////////////////////////////////////////////////////////////////////////////////////////////
	(if (= str-00 "ДМ2005Сг1Ех")
		(setq str-701 (strcat "Манометр сигнализирующий " str-01 ", " str-03 ", " str-06 ", " str-07 ", маркировка взрывозащиты 1ЕхdIIBT4"));setq
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
(defun tmp-spcf-101-01-prs-relay-dm-01-general

( / cntr-1 cntr-2 pnt-ins str-01 str-02 str-03 str-05 str-06 str-07 str-08 str-09 str-10 str-11 str-12 str-13 str-14 str-15 str-701 str-702 str-702-03 str-99 
str-crtf str-manufact str-order str-tmp str-unit)

(setvar "textstyle" "Standard")

(setq cntr-1 0);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-01 (cdr (assoc 1 str-tmp))
				str-02 (cdr (assoc 2 str-tmp))
				str-03 (cdr (assoc 3 str-tmp))
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
				str-99 (cdr (assoc 99 str-tmp))
				
				str-702-03 nil
	);setq

	(setvar "osmode" 6199)
	
	(setq pnt-ins (getpoint "\nУкажите точку вставки\n"));setq

	;/////////////////////////////////////////////////////////////////////////////////////////////////
	(if (wcmatch str-01 "ДМ2005*") (setq str-701 "Манометр сигнализирующий"));if
	
	(setq str-702 (list (cons 1 (strcat "климатическое исп. " str-02 ", пределы изм. " str-03)))							
				cntr-2 2
	);setq
	
	(if (/= str-05 "* стандартная") 
		(setq str-702 (vl-list* (cons cntr-2 "для изм. кислорода") str-702)
					cntr-2 (+ cntr-2 1)
		);setq
	);if
	
	(setq str-702 (vl-list* (cons cntr-2 (strcat "исп. контактов " str-06)) str-702)
				cntr-2 (+ cntr-2 1)
	);setq
	
	(setq str-702 (vl-list* (cons cntr-2 (strcat "резьба штуцера " str-07)) str-702)
				cntr-2 (+ cntr-2 1)
	);setq
	
	(if (/= str-08 "Нет")
		(setq str-702 (vl-list* (cons cntr-2 "магнитное поджатие") str-702)
					cntr-2 (+ cntr-2 1)
		);setq
	);if

	(if (/= str-09 "Нет")
		(setq str-702 (vl-list* (cons cntr-2 "обезжиривание") str-702)
					cntr-2 (+ cntr-2 1)
		);setq
	);if

	(if (/= str-10 "Нет")
		(setq str-702 (vl-list* (cons cntr-2 "исп. для АЭС") str-702)
					cntr-2 (+ cntr-2 1)
		);setq
	);if

	(if (/= str-11 "Нет")
		(setq str-702 (vl-list* (cons cntr-2 "черта на шкале") str-702)
					cntr-2 (+ cntr-2 1)
		);setq
	);if

	(if (/= str-12 "Нет")
		(setq str-702 (vl-list* (cons cntr-2 "экспортное исп.") str-702)
					cntr-2 (+ cntr-2 1)
		);setq
	);if
	
	(if (/= str-13 "Нет")
		(setq str-702 (vl-list* (cons cntr-2 "табличка") str-702)
					cntr-2 (+ cntr-2 1)
		);setq
	);if

	(if (/= str-14 "Нет")
		(setq str-702 (vl-list* (cons cntr-2 "отметка о поверке на стекле") str-702)
					cntr-2 (+ cntr-2 1)
		);setq
	);if

	(if (/= str-15 "Нет")
		(setq str-702 (vl-list* (cons cntr-2 "поверка ЦСМ") str-702));setq
	);if

	(setq str-order (list (cons 1 str-01) 
												(cons 2 "-") 
												(cons 3 nil));list
				
				str-manufact "ОАО Манотомь, г. Томск"
				str-unit "шт."
				str-crtf "№58378"
	);setq
	
	(split-str-parts-spcf-01-general str-701 str-702 str-order str-manufact str-unit str-99 str-crtf pnt-ins);

	(setq cntr-1 (+ cntr-1 1));setq
);repeat

(princ)
)
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

