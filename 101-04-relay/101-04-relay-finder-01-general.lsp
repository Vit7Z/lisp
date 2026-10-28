;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////                                                              ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun 101-04-relay-finder-01-general

( / adoc dcl-id list-01 list-01-read-file list-02 list-02-read-file list-03 list-03-read-file list-04 list-05 list-06 list-07 list-08 list-09 list-10 list-11 list-12 list-801 list-802 list-900 list-901 list-902 str-01 type-list)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(setq	list-901 nil
      list-902 nil
      list-900 nil
      
			str-01 "0"
);setq

(read-file-for-dialog-box-01 "101-04-relay-finder-01-general.txt" 3)

(setq list-01 list-01-read-file
			list-801 list-02-read-file
			list-802 list-03-read-file
);setq

(start-101-04-relay-finder-01-general str-01)

(if (< (setq dcl-id (load_dialog "dia-101-04-relay-finder-01-general.dcl")) 0) ;ищем диалог
		(progn
			(alert "Не найден dcl-файл")
			(exit)
		);progn
);if

(if (not (new_dialog "dia_101_04_relay_finder" dcl-id))
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

(action_tile "txt-01" ;выбор
  (strcat "(setq str-01 (get_tile \"txt-01\"))"
  				"(start-101-04-relay-finder-01-general str-01)" 
  );strcat
);action_tile

(action_tile "txt-02" ;выбор
  (strcat "(txt-02-101-04-relay-finder-01-general)");strcat
);action_tile

(action_tile "txt-03" ;выбор
  (strcat "(txt-03-101-04-relay-finder-01-general)");strcat
);action_tile

(action_tile "but1"
  (strcat "(filling-fields-101-04-relay-finder-01-general)");strcat
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
  (strcat "(delete-item)"
  );strcat
);action_tile

(action_tile "accept"
  (strcat "(done_dialog)"
          "(exit)"
  );strcat
);action_tile

(start_dialog)
(unload_dialog dcl-id)

(if (= type-list "le") (le-101-04-relay-finder-01-general));if

(if (= type-list "spcf") (spcf-101-04-relay-finder-01-general));if

(if (= type-list "lecgv") (lecgv-101-04-relay-finder-01-general));if

(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(vla-endundomark adoc)
(gc)
(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// конец программы ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun start-101-04-relay-finder-01-general

(str-01 / list-01-read-file list-02-read-file list-03-read-file list-04-read-file list-05-read-file list-06-read-file list-07-read-file list-08-read-file list-09-read-file 
list-10-read-file list-11-read-file list-900-dscr list-900-menu list-900-read-file name-file-1 num-flds)

(setq name-file-1 (nth (atoi str-01) list-801)
			num-flds (atoi (nth (atoi str-01) list-802))
);setq

(read-file-for-dialog-box-01 name-file-1 num-flds)

;;;;;;;интерфейс
(set_tile "mln-31" (nth 0 list-900-menu))
(set_tile "mln-32" (nth 1 list-900-menu))

(set_tile "mln-41" (nth 2 list-900-menu))
(set_tile "mln-42" (nth 3 list-900-menu))

(set_tile "mln-51" (nth 4 list-900-menu))
(set_tile "mln-52" (nth 5 list-900-menu))

(set_tile "mln-61" (nth 6 list-900-menu))
(set_tile "mln-62" (nth 7 list-900-menu))

(set_tile "mln-71" (nth 8 list-900-menu))
(set_tile "mln-72" (nth 9 list-900-menu))

(set_tile "mln-81" (nth 10 list-900-menu))
(set_tile "mln-82" (nth 11 list-900-menu))

(set_tile "mln-91" (nth 12 list-900-menu))
(set_tile "mln-92" (nth 13 list-900-menu))

(set_tile "mln-101" (nth 14 list-900-menu))
(set_tile "mln-102" (nth 15 list-900-menu))

(set_tile "mln-111" (nth 16 list-900-menu))
(set_tile "mln-112" (nth 17 list-900-menu))

(set_tile "mln-121" (nth 18 list-900-menu))
(set_tile "mln-122" (nth 19 list-900-menu))

(setq list-02 list-01-read-file
			list-03 list-02-read-file
			list-04 list-03-read-file
			list-05 list-04-read-file
			list-06 list-05-read-file
			list-07 list-06-read-file
			list-08 list-07-read-file
			list-09 list-08-read-file
			list-10 list-09-read-file
			list-11 list-10-read-file
			list-12 list-11-read-file
);setq

(divide-text-into-parts list-900-dscr 230)

(setq list-900 list-900-read-file);setq

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

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun txt-02-101-04-relay-finder-01-general

( / str-tmp)

(setq str-tmp (get_tile "txt-02"));setq

(set_tile "txt-03" str-tmp)
(set_tile "txt-04" str-tmp)
(set_tile "txt-05" str-tmp)
(set_tile "txt-06" str-tmp)
(set_tile "txt-07" str-tmp)
(set_tile "txt-08" str-tmp)
(set_tile "txt-09" str-tmp)
(set_tile "txt-10" str-tmp)
(set_tile "txt-11" str-tmp)
(set_tile "txt-12" str-tmp)

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun txt-03-101-04-relay-finder-01-general

( / str-tmp)

(setq str-tmp (get_tile "txt-03"));setq

(set_tile "txt-02" str-tmp)
(set_tile "txt-04" str-tmp)
(set_tile "txt-05" str-tmp)
(set_tile "txt-06" str-tmp)
(set_tile "txt-07" str-tmp)
(set_tile "txt-08" str-tmp)
(set_tile "txt-09" str-tmp)
(set_tile "txt-10" str-tmp)
(set_tile "txt-11" str-tmp)
(set_tile "txt-12" str-tmp)

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма формирования данных/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun filling-fields-101-04-relay-finder-01-general

( / str-01 str-02 str-03 str-04 str-05 str-06 str-08 str-902 str-99)

(setq str-01 (nth (atoi (get_tile "txt-01")) list-01));setq

(if (/= list-901 nil) 
	(setq list-901 (reverse list-901)
				list-902 (reverse list-902)
	);setq
);if

;;;;;;;/////////////////////////////////////////////////////////////////////////////////////////////
(if (or (= str-01 "Серия 38, реле") (= str-01 "Серия 55, реле"))
	(setq str-02 (nth (atoi (get_tile "txt-02")) list-02)
				str-03 (nth (atoi (get_tile "txt-03")) list-03)
				str-04 (nth (atoi (get_tile "txt-04")) list-04)
				str-05 (nth (atoi (get_tile "txt-05")) list-05)
				str-06 (nth (atoi (get_tile "txt-06")) list-06)
				str-08 (nth (atoi (get_tile "txt-08")) list-08)
				str-99 (nth (atoi (get_tile "txt-12")) list-12)
				;
				str-902 (list (cons 1 str-01) (cons 2 str-02) (cons 3 str-03) (cons 4 str-04) (cons 5 str-05) (cons 6 str-06) (cons 8 str-08) (cons 99 str-99))
				list-902 (vl-list*  str-902 list-902)
				;
				list-901 (vl-list* (strcat "Реле  " str-02 "  " (substr str-03 3) "  Контакт " str-04 "  Uкат. " str-06 "В  " (substr str-05 3) "  Схема контактов " (substr str-08 3)) list-901)
	);setq
);if


;;;;;;;/////////////////////////////////////////////////////////////////////////////////////////////
(if (= str-01 "Серия 38, перемычка")
	(setq str-02 (nth (atoi (get_tile "txt-02")) list-02)
				str-03 (nth (atoi (get_tile "txt-03")) list-03)
				str-04 (nth (atoi (get_tile "txt-04")) list-04)
				str-05 (nth (atoi (get_tile "txt-05")) list-05)
				str-99 (nth (atoi (get_tile "txt-06")) list-06)
				;
				str-902 (list (cons 1 str-01) (cons 2 str-02) (cons 4 str-04) (cons 5 str-05) (cons 99 str-99))
				list-902 (vl-list*  str-902 list-902)
				;
				list-901 (vl-list* (strcat str-01 "  " str-02  "  Для " str-03 "  Кол. контактов " str-04 "  Цвет " str-05) list-901)
	);setq
);if


;;;;;;;/////////////////////////////////////////////////////////////////////////////////////////////
(if (= str-01 "Серия 55, розетка")
	(setq str-02 (nth (atoi (get_tile "txt-02")) list-02)
				str-04 (nth (atoi (get_tile "txt-04")) list-04)
				str-99 (nth (atoi (get_tile "txt-07")) list-07)
				;
				str-902 (list (cons 1 str-01) (cons 2 str-02) (cons 4 str-04) (cons 99 str-99))
				list-902 (vl-list*  str-902 list-902)
				;
				list-901 (vl-list* (strcat str-01 "  " str-02 "  Зажим контактов " str-04) list-901)
	);setq
);if

(setq list-901 (reverse list-901)
			list-902 (reverse list-902)
);setq

(list-filling "txt-901" list-901)

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в ПЭ                   //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun le-101-04-relay-finder-01-general

( / cntr-1 pnt-ins str-01 str-02 str-03 str-05 str-06 str-08 str-701 str-702 str-tmp str-txt)

(setq cntr-1 0
			str-702 nil
);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-01 (cdr (assoc 1 str-tmp))
	);setq
	
	(setvar "osmode" 6199)
	
	(setq pnt-ins (getpoint "\nУкажите точку вставки\n"));setq
	
	;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
	(if (= str-01 "Серия 38, реле")
		(progn
			(setq str-02 (cdr (assoc 2 str-tmp))
						str-03 (cdr (assoc 3 str-tmp))
						str-05 (cdr (assoc 5 str-tmp))
						str-06 (cdr (assoc 6 str-tmp))
						;
						str-08 (cdr (assoc 8 str-tmp))
						str-08 (substr str-08 3)	
			);setq
			
			(cond
				((wcmatch str-03 "*Пружинная клемма") (setq str-03 "пружинные контакты"));=
			);cond
			
			(cond
				((wcmatch str-05 "# =DC") (setq str-05 "="));=
				((wcmatch str-05 "# ~AC/=DC") (setq str-05 "~/="));=
			);cond
			
			(setq str-701 (strcat "Реле электромагнитное Finder " str-02 ", Uупр. " str-05 str-06 "В, схема контактов " str-08 ", " str-03));setq
		);progn
	);if
	

	;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
	(if (= str-01 "Серия 55, реле")
		(progn
			(setq str-02 (cdr (assoc 2 str-tmp))
						str-05 (cdr (assoc 5 str-tmp))
						str-06 (cdr (assoc 6 str-tmp))
						;
						str-08 (cdr (assoc 8 str-tmp))
						str-08 (substr str-08 3)
			);setq

			(cond
				((wcmatch str-05 "# =DC") (setq str-05 "="));=
				((wcmatch str-05 "# ~AC/=DC") (setq str-05 "~/="));=
			);cond
			
			(setq str-701 (strcat "Реле промежуточное Finder " str-02 ", Uупр. " str-05 str-06 "В, схема контактов " str-08));setq
		);progn
	);if


	;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
	(if (= str-01 "Серия 55, розетка")
		(progn
			(setq str-02 (cdr (assoc 2 str-tmp))
						str-04 (cdr (assoc 4 str-tmp))
			);setq
			
			(cond
				((= str-04 "Пружина") (setq str-04 "пружинные контакты"));=
			);cond
			
			(setq str-701 (strcat "Розетка Finder " str-02 " (для реле серии 55), " str-04));setq
		);progn
	);if

	(split-str-parts-le-01-general str-701 str-702 pnt-ins "**1**");

	(setq cntr-1 (1+ cntr-1));setq
);repeat

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в спцф                   ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

(defun spcf-101-04-relay-finder-01-general

( / cntr-1 pnt-ins str-01 str-02 str-03 str-04 str-05 str-06 str-08 str-701 str-702 str-99 str-manufact str-note str-order str-tmp str-unit)

(setq cntr-1 0);setq

(setvar "textstyle" "Standard")

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-01 (cdr (assoc 1 str-tmp))
				str-99 (cdr (assoc 99 str-tmp))
	);setq
	
	
	(setvar "osmode" 6199)
	
	(setq pnt-ins (getpoint "\nУкажите точку вставки\n"));setq
	
	;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
	(if (= str-01 "Серия 38, реле")
		(progn
			(setq str-02 (cdr (assoc 2 str-tmp))
						str-03 (cdr (assoc 3 str-tmp))					
						str-05 (cdr (assoc 5 str-tmp))						
						str-06 (cdr (assoc 6 str-tmp))
						;
						str-08 (cdr (assoc 8 str-tmp))
						str-08 (substr str-08 3)
			);setq

			(cond
				((wcmatch str-03 "*Пружинная*") (setq str-03 "пружинные клеммы"));=
				((wcmatch str-03 "*Винтовая*") (setq str-03 "винтовые клеммы"));=
			);cond
			
			(cond
				((wcmatch str-05 "# =DC") (setq str-05 "="));=
				((wcmatch str-05 "# ~AC/=DC") (setq str-05 "~/="));=
			);cond
			
			(setq str-701 "Реле электромагнитное"
						str-702 (list (cons 1 (strcat "серия 38, Uупр. " str-05 str-06 "В"))
													(cons 2 (strcat "схема контактов " str-08))
													(cons 3 str-03)
													(cons 4 "в комплекте с розеткой "));list
						
						str-order (list (cons 1 str-02) 
														(cons 2 ",") 
														(cons 3 nil));list
						str-unit "шт."
			);setq
		);progn
	);if
	

	;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
	(if (= str-01 "Серия 38, перемычка")
		(setq str-02 (cdr (assoc 2 str-tmp))
					str-04 (cdr (assoc 4 str-tmp))					
					;
					str-701 "Шинный соединитель"
					str-702 (list (cons 1 "для реле Finder серии 38")
												(cons 2 (strcat "кол. полюсов " str-04)));list
						
					str-order (list (cons 1 str-02) 
													(cons 2 ",") 
													(cons 3 nil));list
					str-unit "шт."
			);setq
	);if	
		

	;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
	(if (= str-01 "Серия 55, реле")
		(progn
			(setq str-02 (cdr (assoc 2 str-tmp))				
						str-05 (cdr (assoc 5 str-tmp))						
						str-06 (cdr (assoc 6 str-tmp))
						;
						str-08 (cdr (assoc 8 str-tmp))
						str-08 (substr str-08 3)
			);setq
			
			(cond
				((wcmatch str-05 "# =DC") (setq str-05 "="));=
				((wcmatch str-05 "# ~AC/=DC") (setq str-05 "~/="));=
			);cond
			
			(setq str-701 "Реле электромагнитное"
						str-702 (list (cons 1 (strcat "серия 55, Uупр. " str-05 str-06 "В"))
													(cons 2 (strcat "схема контактов " str-08)));list
						
						str-order (list (cons 1 str-02) 
														(cons 2 ".") 
														(cons 3 nil));list
						str-unit "шт."
			);setq
		);progn
	);if
				
				
	;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
	(if (= str-01 "Серия 55, розетка")
		(progn
			(setq str-02 (cdr (assoc 2 str-tmp))
						str-04 (cdr (assoc 4 str-tmp))
			);setq
			
			(cond
				((= str-04 "Пружина") (setq str-04 "пружинные контакты"));=
			);cond
			
			(setq str-701 "Розетка"
						str-702 (list (cons 1 "для реле Finder серии 55")
													(cons 2 str-04));list
						
						str-order (list (cons 1 str-02) 
														(cons 2 ".") 
														(cons 3 nil));list
						str-unit "шт."
			);setq
		);progn
	);if


	
	(setq str-manufact "Finder"			
				str-note nil 
	);setq
	
	(split-str-parts-spcf-01-general str-701 str-702 str-order str-manufact str-unit str-99 str-note pnt-ins);
 
	(setq cntr-1 (+ cntr-1 1));setq
);repeat

(princ)
)
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в овш               ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun lecgv-101-04-relay-finder-01-general

( / cntr-1 pnt-ins str-01 str-02 str-03 str-04 str-05 str-06 str-08 str-11 str-13 str-701 str-702 str-703 str-99 str-tmp str-txt str-txt-01 str-txt-02)

(setq cntr-1 0);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-01 (cdr (assoc 1 str-tmp))
				str-02 (cdr (assoc 2 str-tmp))
				str-99 (cdr (assoc 99 str-tmp))
	);setq

	(setvar "osmode" 6199)
	
	(setq pnt-ins (getpoint "\nУкажите точку вставки\n"));setq
	
	(09-empt-lin-le-cgv)

	;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	(if (= str-01 "Серия 38, ЭМ реле")
		(progn
			(setq str-03 (cdr (assoc 3 str-tmp))
						str-05 (cdr (assoc 5 str-tmp))
						str-06 (cdr (assoc 6 str-tmp))
						str-08 (cdr (assoc 8 str-tmp))
						str-11 (cdr (assoc 11 str-tmp))
			);setq
			
			(cond
				((wcmatch str-03 "*Пружинная*") (setq str-03 "пружинная клемма"));=
				((wcmatch str-03 "*Винтовая*") (setq str-03 "винтовая клемма"));=
			);cond
			
			(cond
				((wcmatch str-05 "# =DC") (setq str-05 "="));=
				((wcmatch str-05 "# ~AC/=DC") (setq str-05 "~/="));=
			);cond
			
			(cond
				((wcmatch str-08 "*SPDT") (setq str-08 "1 перекл. контакт (SPDT)"));=

			);cond
			
			(setq str-11 (vl-string-subst "розеткой" "Розетка"  str-11)

						str-701 (strcat "Модуль интерфейсный (электромагнитное реле), серия 38, " str-02 ", Uупр. " str-05 str-06 
														"В, " str-08 ", " str-03 ", комплектно с " str-11)
						str-702 nil
						str-703 nil
			);setq
		);progn
	);if

	;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
	(if (= str-01 "Серия 38, перемычка")
		(setq str-03 (cdr (assoc 3 str-tmp))						
					str-04 (strcase (cdr (assoc 4 str-tmp))	1)
					str-13 (cdr (assoc 13 str-tmp))
					str-13 (substr str-13 (vl-string-search "38." str-13 1))
					str-13 (vl-string-right-trim "." str-13)
					
					str-701 (strcat "Шинный соеднитель, " str-02 ", для модулей серии 38 " str-13 ", кол. полюсов " str-03 ", цвет " str-04)
					str-702 nil
					str-703 nil
		);setq
	);if


	;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
	(if (= str-01 "Серия 38, маркировка")
		(setq str-03 (cdr (assoc 3 str-tmp))						
					str-13 (cdr (assoc 13 str-tmp))
					str-13 (substr str-13 (vl-string-search "38." str-13 1))
					str-13 (vl-string-right-trim "." str-13)
						
					str-701 (strcat "Блок маркировок, " str-02 ", для модулей серии 38 " str-13 ", кол. пластин " str-03)
					str-702 nil
					str-703 nil			
		);setq
	);if

	;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
	(if (= str-01 "Серия 38, разделитель")
		(setq str-701 (strcat "Разделитель, " str-02 ", для модулей серии 38 (визуальное разделение на группы)")
					str-702 nil
					str-703 nil		
		);setq
	);if



	(split-str-parts-lecgv-01-general str-701 str-702 str-703 str-99 pnt-ins);

	(setq cntr-1 (+ cntr-1 1));setq
);repeat

(princ)
)
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



















