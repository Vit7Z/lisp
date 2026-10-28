;/////// ************************************************************ /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////                                                              /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun 101-01-sec-dev-net-moxa-01-general

( / adoc dcl-id list-01 list-01-read-file list-02 list-02-read-file list-03 list-03-read-file list-04 list-05 list-06 list-801 list-802 list-900 list-901 list-902 str-01 str-02 type-list)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(setq	list-901 nil
      list-902 nil
      
			str-01 "0"
			str-02 nil
);setq

(read-file-for-dialog-box-01 "101-01-sec-dev-net-moxa-01-general.txt" 3)

(setq list-01 list-01-read-file
			list-801 list-02-read-file;файлы
			list-802 list-03-read-file;поля в файлах
);setq

(txt-01-101-01-sec-dev-net-moxa-01-general str-01)

(if (< (setq dcl-id (load_dialog "dia-101-01-sec-dev-net-moxa-01-general.dcl")) 0) ;ищем диалог
		(progn
			(alert "Не найден dcl-файл")
			(exit)
		);progn
);if

(if (not (new_dialog "dia_101_01_sec_dev_moxa" dcl-id))
		(exit)
);if

(list-filling "txt-01" list-01)
(list-filling "txt-02" list-02)
(list-filling "txt-03" list-03)
(list-filling "txt-04" list-04)
(list-filling "txt-05" list-05)
(list-filling "txt-06" list-06)
(list-filling "txt-900" list-900)

(set_tile "txt-01" "0")
(set_tile "txt-02" "0")
(set_tile "txt-03" "0")
(set_tile "txt-04" "0")
(set_tile "txt-05" "0")
(set_tile "txt-06" "0")
(set_tile "txt-900" "0")

(action_tile "txt-01"
  (strcat "(setq str-01 (get_tile \"txt-01\"))"
  				"(txt-01-101-01-sec-dev-net-moxa-01-general str-01)");srcat
);action_tile

(action_tile "txt-02"
  (strcat "(set_tile \"txt-03\" $value)"
					"(set_tile \"txt-04\" $value)"
					"(set_tile \"txt-05\" $value)"
					"(set_tile \"txt-06\" $value)"
					"(set_tile \"txt-900\" $value)"
  );srcat
);action_tile

(action_tile "txt-03"
  (strcat "(set_tile \"txt-02\" $value)"
					"(set_tile \"txt-04\" $value)"
					"(set_tile \"txt-05\" $value)"
					"(set_tile \"txt-06\" $value)"
					"(set_tile \"txt-900\" $value)"
  );srcat
);action_tile

(action_tile "txt-900"
  (strcat "(set_tile \"txt-02\" $value)"
  				"(set_tile \"txt-03\" $value)"
					"(set_tile \"txt-04\" $value)"
					"(set_tile \"txt-05\" $value)"
					"(set_tile \"txt-06\" $value)"
  );srcat
);action_tile

(action_tile "but1"
  (strcat "(flng-fields-101-01-sec-dev-net-moxa-01-general)");strcat
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
	((= type-list "le") (le-101-01-sec-dev-net-moxa-01-general));=
	((= type-list "spcf") (spcf-101-01-sec-dev-net-moxa-01-general));=
	((= type-list "lecgv") (lecgv-101-01-sec-dev-net-moxa-01-general));=
);cond

(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(vla-endundomark adoc)
(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// конец программы ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрогамма чтения данных из файлов для авт выкл/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun txt-01-101-01-sec-dev-net-moxa-01-general

(str-01 / list-01-read-file list-02-read-file list-03-read-file list-04-read-file list-05-read-file list-06-read-file list-900-menu name-file-1 num-flds)

(setq name-file-1 (nth (atoi str-01) list-801)
			num-flds (atoi (nth (atoi str-01) list-802))
);setq

(read-file-for-dialog-box-01 name-file-1 num-flds)

(set_tile "ptxt-31" (nth 0 list-900-menu))
(set_tile "ptxt-32" (nth 1 list-900-menu))

(set_tile "ptxt-41" (nth 2 list-900-menu))
(set_tile "ptxt-42" (nth 3 list-900-menu))

(set_tile "ptxt-51" (nth 4 list-900-menu))
(set_tile "ptxt-52" (nth 5 list-900-menu))

(set_tile "ptxt-61" (nth 6 list-900-menu))
(set_tile "ptxt-62" (nth 7 list-900-menu))

;Сервер асинхронный
;Монтажный комплект

(setq list-02 list-01-read-file
			list-03 list-02-read-file
			list-04 list-03-read-file
			list-05 list-04-read-file
			list-06 list-05-read-file
			list-900 list-06-read-file
);setq
		
(list-filling "txt-02" list-02)
(list-filling "txt-03" list-03)
(list-filling "txt-04" list-04)
(list-filling "txt-05" list-05)
(list-filling "txt-06" list-06)
(list-filling "txt-900" list-900)

(set_tile "txt-02" "0")
(set_tile "txt-03" "0")
(set_tile "txt-04" "0")
(set_tile "txt-05" "0")
(set_tile "txt-06" "0")
(set_tile "txt-900" "0")

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма формирования данных/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun flng-fields-101-01-sec-dev-net-moxa-01-general

( / str-01 str-02 str-03 str-04 str-05 str-06 str-902)

(setq	str-01 (nth (atoi (get_tile "txt-01")) list-01)
			str-02 (nth (atoi (get_tile "txt-02")) list-02)
);setq

(if (/= list-901 nil) 
	(setq list-901 (reverse list-901)
				list-902 (reverse list-902)
	);setq
);if

;;;;;;;///////////////////////////////////////////
(if (or (= str-01 "Коммутатор Ethernet")
			  (= str-01 "Конвертер интерфейсов")) 
		
	(setq str-03 (nth (atoi (get_tile "txt-03")) list-03)
				str-04 (nth (atoi (get_tile "txt-04")) list-04)
				str-05 (nth (atoi (get_tile "txt-05")) list-05)
				str-06 (nth (atoi (get_tile "txt-06")) list-06)
					
				list-901 (vl-list* (strcat str-01 "  " str-02 "  " str-03 "  Uпит " str-04 "  " str-05) list-901)
					
				str-902 (list (cons 1 str-01) (cons 2 str-02) (cons 3 str-03) (cons 4 str-04) (cons 5 str-05) (cons 99 str-06))
	);setq
);if


;;;;;;;///////////////////////////////////////////
(if (or (= str-01 "Монтажный комплект") 
				(= str-01 "Переходник"))
				
	(setq str-03 (nth (atoi (get_tile "txt-03")) list-03)
				str-04 (nth (atoi (get_tile "txt-04")) list-04)
					
				list-901 (vl-list* (strcat str-01 "  " str-02) list-901)
					
				str-902 (list (cons 1 str-01) (cons 2 str-02) (cons 3 str-03) (cons 99 str-04))
	);setq
);if




(setq list-902 (vl-list* str-902 list-902)
			list-901 (reverse list-901)
			list-902 (reverse list-902)
);setq

(list-filling "txt-901" list-901)

(princ)
)
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в ПЭ                   ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun le-101-01-sec-dev-net-moxa-01-general

( / cntr-1 pnt-ins str-01 str-02 str-03 str-04 str-05 str-701 str-702 str-tmp)

(setq cntr-1 0
			str-702 nil
);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-01 (cdr (assoc 1 str-tmp))
				str-02 (cdr (assoc 2 str-tmp))
				str-03 (cdr (assoc 3 str-tmp))						
	);setq

	(setvar "osmode" 6199)
	
	(setq pnt-ins (getpoint "\nУкажите точку вставки\n"));setq
	
	;;;;;;;;;///////////////////////////////////////////////////////////
	(if (or (= str-01 "Коммутатор Ethernet")
					(= str-01 "Конвертер интерфейсов"))			 	
		(progn	
			(setq str-04 (cdr (assoc 4 str-tmp))
						str-05 (cdr (assoc 5 str-tmp))
						str-05 (vl-string-subst "рейку" "рейка" str-05)
						str-05 (vl-string-subst "плоскость" "Плоскость" str-05)
			);setq
			
			(cond
				((= str-01 "Коммутатор Ethernet") (setq str-01 "Коммутатор MOXA"));=
				((= str-01 "Конвертер интерфейсов") (setq str-01 "Конвертер интерфейсов MOXA"));=
			);cond
			
			(setq str-701 (strcat str-01 " " str-02 ", " str-03 ", Uпит. " str-04 ", монтаж на " str-05));setq
		);progn
	);if
	
	
	;;;;;;;;;///////////////////////////////////////////////////////////
	(if (= str-01 "Монтажный комплект") 
		(setq str-03 (vl-string-subst "адаптер" "Адаптер" str-03)
		
					str-701 (strcat str-01 " MOXA " str-02 " (" str-03 ")")			
		);setq
	);if

	;;;;;;;;;///////////////////////////////////////////////////////////
	(if (= str-01 "Переходник") 
		(setq str-03 (vl-string-subst "адаптер" "Адаптер" str-03)
		
					str-701 (strcat str-01 " MOXA " str-02 " (" str-03 ")")			
		);setq
	);if
			
	(split-str-parts-le-01-general str-701 str-702 pnt-ins "**1**");
	
	(setq cntr-1 (+ cntr-1 1));setq
);repeat

(princ)
)
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в спцф                   //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun spcf-101-01-sec-dev-net-moxa-01-general

( / cntr-1 pnt-ins str-01 str-02 str-03 str-04 str-05 str-701 str-702 str-99 str-crtf str-manufact str-order str-tmp str-unit)

(setq cntr-1 0);setq

(setvar "textstyle" "Standard")

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-01 (cdr (assoc 1 str-tmp))
				str-02 (cdr (assoc 2 str-tmp))
				str-03 (cdr (assoc 3 str-tmp))
				str-99 (cdr (assoc 99 str-tmp))
	);setq

	(setvar "osmode" 6199)
	
	(setq pnt-ins (getpoint "\nУкажите точку вставки\n"));setq
	
	(setvar "osmode" 0)

	;;;;;;;;;///////////////////////////////////////////////////////////
	(if (or (= str-01 "Коммутатор Ethernet")
			 		(= str-01 "Сервер асинхронный")) 
		(setq str-04 (cdr (assoc 4 str-tmp))
					str-05 (cdr (assoc 5 str-tmp))
					str-05 (vl-string-subst "рейку" "рейка" str-05)
					str-05 (vl-string-subst "Плоскость" "плоскость" str-05)
						
					str-701 str-01
						
					str-702 (list (cons 1 (strcat "интерфейсы " str-03))
												(cons 2 (strcat "Uпит. " str-04))
												(cons 3 (strcat "монтаж на " str-05)));list
						
					str-order (list (cons 1 str-02) 
													(cons 2 "-")
													(cons 3 nil));list
					str-unit "шт."
		);setq
	);if


	;;;;;;;;;/////////
	(if (= str-01 "Монтажный комплект") 
		(setq str-03 (vl-string-subst "монтаж" "Монтаж" str-03)
					
					str-701 str-01
		
					str-702 (list (cons 1 (strcat str-03)));list

					str-order (list (cons 1 str-02) 
													(cons 2 "-")
													(cons 3 nil));list
					str-unit "шт."		
		);setq
	);if

	(setq str-manufact "MOXA"
				str-crtf nil
	);setq
			
	(split-str-parts-spcf-01-general str-701 str-702 str-order str-manufact str-unit str-99 str-crtf pnt-ins)

	(setq cntr-1 (+ cntr-1 1));setq
);repeat

(princ)
)
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в овш                   ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun lecgv-101-01-sec-dev-net-moxa-01-general

( / cntr-1 pnt-ins str-01 str-02 str-03 str-04 str-05 str-99 str-tmp str-txt str-txt-01 str-txt-02)

(setq cntr-1 0);setq

(setvar "textstyle" "Standard")

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-01 (cdr (assoc 1 str-tmp))
				str-02 (cdr (assoc 2 str-tmp))
				str-03 (cdr (assoc 3 str-tmp))
				str-99 (cdr (assoc 99 str-tmp))
	);setq
	
	(setvar "osmode" 6199)
	
	(setq pnt-ins (getpoint "\nУкажите точку вставки\n")); setq

	;;;;;;;;;/////////
	(if (or (= str-01 "Коммутатор Ethernet")
			 		(= str-01 "Сервер асинхронный")) 
		(setq str-04 (cdr (assoc 4 str-tmp))
					str-05 (cdr (assoc 5 str-tmp))
					str-05 (vl-string-subst "рейку" "рейка" str-05)
					str-05 (vl-string-subst "плоскость" "Плоскость" str-05)
						
					str-txt (strcat str-01 ", " str-02 ", Uпит. " str-04 ", монтаж на " str-05)
					str-txt-01 nil
					str-txt-02 nil
		);setq
	);if

	;;;;;;;;;/////////
	(if (= str-01 "Монтажный комплект") 
		(setq str-03 (vl-string-subst "монтаж" "Монтаж" str-03)
					str-txt (strcat str-01 ", " str-02 " (" str-03 ")")
					str-txt-01 nil
					str-txt-02 nil
		);setq
	);if

	(split-str-parts-lecgv-065-01 str-txt str-txt-01 str-txt-02 str-99 pnt-ins);

	(setq cntr-1 (+ cntr-1 1));setq
);repeat

(princ)
)
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
