;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////                                                              ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun 101-04-swch-apator-01-general

( / adoc dcl-id list-001 list-002 list-003 list-004 list-005 list-006 list-007 list-008 list-009 list-901 list-902 type-list)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(setvar "cmdecho" 0)

(setq str-01 nil
			list-01 (list "Серия 4G")
      list-901 nil
      list-902 nil
);setq

(txt-001-101-04-swch-apator-01-general)

(if (< (setq dcl-id (load_dialog "dia-101-04-swch-apator-01-general.dcl")) 0) ;ищем диалог
		(progn
			(alert "Не найден dcl-файл")
			(exit)
		);progn
);if

(if (not (new_dialog "dia_101_04_swtch_apator" dcl-id))
		(exit)
);if

(list-filling "txt-001" list-01)
(list-filling "txt-002" list-02)
(list-filling "txt-003" list-03)
(list-filling "txt-004" list-04)
(list-filling "txt-005" list-05)
(list-filling "txt-006" list-06)
(list-filling "txt-007" list-07)
(list-filling "txt-008" list-08)
(list-filling "txt-009" list-09)

(set_tile "txt-001" "0")
(set_tile "txt-002" "0")
(set_tile "txt-003" "0")
(set_tile "txt-004" "0")
(set_tile "txt-005" "0")
(set_tile "txt-006" "0")
(set_tile "txt-007" "0")
(set_tile "txt-008" "0")
(set_tile "txt-009" "0")

(action_tile "txt-001"
  (strcat "(txt-001-101-04-swch-apator-01-general)");srcat
);action_tile

(action_tile "txt-002"
  (strcat "(txt-002-101-04-swch-apator-01-general)");srcat
);action_tile

(action_tile "txt-003"
  (strcat "(txt-003-101-04-swch-apator-01-general)");srcat
);action_tile

(action_tile "txt-004"
  (strcat "(setq str-004 (get_tile \"txt-004\"))"
  				"(set_tile \"txt-005\" str-004)"
  );strcat
);action_tile

(action_tile "txt-005"
  (strcat "(setq str-005 (get_tile \"txt-005\"))"
  				"(set_tile \"txt-004\" str-005)"
  );strcat
);action_tile

(action_tile "txt-008"
  (strcat "(txt-008-101-04-swch-apator-01-general)");srcat
);action_tile





(action_tile "but1"
  (strcat "(tmp-filling-fields-101-04-swch-apator-01-general)");strcat
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

(if (= type-list "le") (tmp-le-101-04-swch-apator-01-general));if

(if (= type-list "spcf") (tmp-spcf-101-04-swch-apator-01-general));if

(if (= type-list "lecgv") (tmp-lecgv-101-04-swch-apator-01-general));if

(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(vla-endundomark adoc)
(gc)
(princ)
)
;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////  конец программы                                             ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun txt-001-101-04-swch-apator-01-general

( / str-01)

(cond 
	((= nil str-01) (setq str-01 "Серия 4G"));=
	((/= nil str-01) (setq str-01 (nth (atoi (get_tile "txt-001")) list-01)));=
);cond

(if (= str-01 "Серия 4G")
	(setq list-02 (list "Переключатель с нулевым положением 1-0-2"
											"Переключатель без нулевого положения 1-2"
											"Тумблер (с автоматическим возвратом) 1-0-2")
				list-03 (list "10" "16" "25" "40" "63" "80" "100")
				list-04 (list "1" "2" "3" "4" "5")
				list-05 (list "51" "52" "53" "75" "76")
				list-06 (list "U Открытое" "OU Открытое, крепление на заднюю стенку" "PK Закрытое")
				list-07 (list "Малая")
				list-08 (list "R014 Черный" "R012 Красный")
				list-09 (list "Нет" 
											 "S1 Уплотненная муфта, IP55" 
											 "S6 Блокировка висячим замком" 
											 "S9 Центральное крепление, диам 30,5 мм"
											 "S10 Центральное крепление, диам 30,5 мм, ключ-рукоятка, закрытие в положениях 3, 6, 9, 12"
											 "S11 Центральное крепление, диам 22,5 мм"
											 "S15 Лампа сигнализации (красный цвет)"
											 "S18 Монтаж на шине DIN")
	);setq
);if

(list-filling "txt-002" list-02)
(list-filling "txt-003" list-03)
(list-filling "txt-004" list-04)
(list-filling "txt-005" list-05)
(list-filling "txt-006" list-06)
(list-filling "txt-007" list-07)
(list-filling "txt-008" list-08)
(list-filling "txt-009" list-09)

(set_tile "txt-002" "0")
(set_tile "txt-003" "0")
(set_tile "txt-004" "0")
(set_tile "txt-005" "0")
(set_tile "txt-006" "0")
(set_tile "txt-007" "0")
(set_tile "txt-008" "0")
(set_tile "txt-009" "0")

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun txt-002-101-04-swch-apator-01-general

( / str-02)

(setq str-02 (nth (atoi (get_tile "txt-002")) list-02));setq

(if (= str-02 "Переключатель с нулевым положением 1-0-2")
	(setq list-04 (list "1" "2" "3" "4" "5")
				list-05 (list "51" "52" "53" "75" "76")
	);setq
);if

(if (= str-02 "Переключатель без нулевого положения 1-2")
	(setq list-04 (list "1" "2" "3" "4")
				list-05 (list "54" "55" "56" "69")
	);setq
);if

(if (= str-02 "Тумблер (с автоматическим возвратом) 1-0-2")
	(setq list-04 (list "1" "2" "3")
				list-05 (list "201" "202" "203")
	);setq
);if

(list-filling "txt-004" list-04)
(list-filling "txt-005" list-05)

(set_tile "txt-004" "0")
(set_tile "txt-005" "0")

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun txt-003-101-04-swch-apator-01-general

( / list-03 list-06)

(setq str-03 (nth (atoi (get_tile "txt-003")) list-03)
			str-06 (nth (atoi (get_tile "txt-006")) list-06)
);=

(cond
	((= str-03 "10") (setq list-08 (list "Малая") list-09 (list "R014 Черный" "R012 Красный")));=
	
	((or (= str-03 "16") (= str-03 "25")) (setq list-08 (list "Малая" "Большая") list-09 (list "R114 Черный" "R112 Красный")));=
	
	((or (= str-03 "40") (= str-03 "63") (= str-03 "80")) (setq list-08 (list "Малая" "Большая") list-09 (list "R214 Черный" "R212 Красный")));=
	
	((= str-03 "100") (setq list-08 (list "Малая") list-09 (list "R314 Черный" "R312 Красный")));=
);cond

(list-filling "txt-007" list-07)
(list-filling "txt-008" list-08)
(list-filling "txt-009" list-09)

(set_tile "txt-007" "0")
(set_tile "txt-008" "0")
(set_tile "txt-009" "0")

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun txt-008-101-04-swch-apator-01-general

( / str-003 str-008)

(setq str-03 (nth (atoi (get_tile "txt-003")) list-03)
			str-08 (nth (atoi (get_tile "txt-008")) list-08)
);=

(if (= str-03 "10")
	(cond
		((= str-08 "Малая") (setq list-09 (list "R014 Черный" "R012 Красный")));=
	);cond
);if

(if (or (= str-03 "16") (= str-03 "25"))
	(cond
		((= str-08 "Малая") (setq list-09 (list "R114 Черный" "R112 Красный")));=
		((= str-08 "Большая") (setq list-09 (list "R124 Черный" "R122 Красный")));=
	);cond
);if

(if (or (= str-03 "40") (= str-03 "63") (= str-03 "80"))
	(cond
		((= str-08 "Малая") (setq list-09 (list "R214 Черный" "R212 Красный")));=
		((= str-08 "Большая") (setq list-09 (list "R224 Черный" "R222 Красный")));=
	);cond
);if

(if (= str-03 "100")
	(cond
		((= str-08 "Малая") (setq list-09 (list "R314 Черный" "R312 Красный")));=
		((= str-08 "Большая") (setq list-09 (list "R324 Черный" "R322 Красный")));=
	);cond
);if

(list-filling "txt-009" list-09)

(set_tile "txt-009" "0")

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма формирования данных/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun tmp-filling-fields-101-04-swch-apator-01-general

( / str-01 str-01-ord str-01-spc str-02 str-02-spc str-03 str-03-spc str-04 str-04-spc str-05 str-05-spc str-06 str-06-ord str-06-spc str-07 str-08 str-08-ord 
str-08-spc str-09 str-09-ord str-09-spc str-order tmp-list-902)

(if (/= list-902 nil) (setq list-902 (reverse list-902)));if

(setq str-01 (nth (atoi (get_tile "txt-001")) list-01));setq

(if (= str-01 "Серия 4G")
	(progn
		(setq str-02 (nth (atoi (get_tile "txt-002")) list-02);считываем выбранные данные
					str-03 (nth (atoi (get_tile "txt-003")) list-03)
					str-04 (nth (atoi (get_tile "txt-004")) list-04)
					str-05 (nth (atoi (get_tile "txt-005")) list-05)
					str-06 (nth (atoi (get_tile "txt-006")) list-06)
					str-07 (nth (atoi (get_tile "txt-007")) list-07)
					str-08 (nth (atoi (get_tile "txt-008")) list-08)
					str-09 (nth (atoi (get_tile "txt-009")) list-09)
		);setq
		
		;;;;;;;обозначение при заказе
		(setq str-01-ord (substr str-01 (+ (vl-string-search " " str-01) 2))
					str-06-ord (substr str-06 1 (vl-string-search " " str-06))				
					str-08-ord (substr str-08 1 (vl-string-search " " str-08))
					str-09-ord (substr str-09 1 (vl-string-search " " str-09))
		);setq
	
		(if (/= str-09 "Нет")
			(setq str-09-ord (substr str-09 1 (vl-string-search " " str-09)));=
		);if
		
		(cond
			((/= str-09 "Нет") (setq str-order (strcat str-01-ord str-03 "-" str-05 "-" str-06-ord "-" str-09-ord "-" str-08-ord)));=
			((setq str-order (strcat str-01-ord str-03 "-" str-05 "-" str-06-ord "-" str-08-ord)));=
		);cond
		
		;;;;;;;для спецификации
		(setq str-01-spc (substr str-02 1 (vl-string-search " " str-02)));setq
	
		(cond
			((vl-string-search "1-0-2" str-02) (setq str-02-spc "направление 1-0-2"));=
			((vl-string-search "1-2" str-02) (setq str-02-spc "направление 1-2"));=
		);cond
		
		(setq str-03-spc (strcat "Iном. " str-03 "А")
					
					str-04-spc (strcat "кол. полюсов " str-04)
					
					str-05-spc (strcat "№ схемы " str-05)
					
					str-06-spc (strcat "исполнение " str-06-ord)
					
					str-08-spc (substr str-08 (+ (vl-string-search " " str-08) 2))
					str-08-spc (strcase (strcat "цвет рукоятки " str-08-spc) 1)
					str-08-spc (vl-string-subst "черный" "Черный" str-08-spc)
		);setq

		(if (/= str-09 "Нет") 
			(setq str-09-spc (strcat "опция " str-09-ord)
						list-901 (vl-list* (strcat str-01-spc "  " str-order "  " str-02-spc "  " str-03-spc "  " str-04-spc "  " str-05-spc "  " str-06-spc "  " str-09-spc "  " str-08-spc) list-901)
			);setq
		
			(setq list-901 (vl-list* (strcat str-01-spc "  " str-order "  " str-02-spc "  " str-03-spc "  " str-04-spc "  " str-05-spc "  " str-06-spc "  " str-08-spc) list-901)
			);setq
		);if
	
		(setq tmp-list-902 (list (cons 1 str-01-spc) (cons 2 str-order) (cons 3 str-02-spc) (cons 4 str-03-spc) 
														 (cons 5 str-04-spc) (cons 6 str-05-spc) (cons 7 str-06-spc) (cons 8 str-08-spc) 
														 (cons 9 str-09-spc) (cons 99 "0,4"));list
	
		);setq
	);progn
);if =

(setq list-902 (vl-list* tmp-list-902 list-902)
			list-902 (reverse list-902)
			list-901 (reverse list-901)
);setq

(list-filling "txt-901" list-901)

(princ)
)
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в ПЭ                   /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun tmp-le-101-04-swch-apator-01-general

( / cntr-1 pnt-ins str-01 str-02 str-03 str-04 str-05 str-06 str-07 str-08 str-701 str-702 str-tmp)

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
	);setq
	
	(setvar "osmode" 6199)
	
	(setq pnt-ins (getpoint "\nУкажите точку вставки\n"));setq

	;/////////////////////////////////////////////////////////////////////////////
	(setq str-701 (strcat str-01 " APATOR, " str-02 ", " str-03 ", " str-04 ", " str-05 ", " str-06 ", " str-07 ", " str-08)
				str-702 nil
	);setq

	(split-str-parts-le-01-general str-701 str-702 pnt-ins "**1**");
	
	(setq cntr-1 (1+ cntr-1));setq
);repeat

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в спцф                   ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun tmp-spcf-101-04-swch-apator-01-general

( / cntr-1 pnt-ins str-01 str-02 str-03 str-04 str-05 str-06 str-07 str-08 str-09 str-701 str-702 str-99 str-crtf str-manufact str-order str-tmp str-unit)

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
				str-99 (cdr (assoc 99 str-tmp))
	);setq
	
	(setvar "osmode" 6199)
	
	(setq pnt-ins (getpoint "\nУкажите точку вставки\n")
				str-701 str-01);setq
	
	(if (/= str-09 nil) 
		(setq str-702 (list (cons 1 str-03) (cons 2 str-04) (cons 3 str-05) (cons 4 str-06) (cons 5 str-09) (cons 5 str-08)));setq
		
		(setq str-702 (list (cons 1 str-03) (cons 2 str-04) (cons 3 str-05) (cons 4 str-06) (cons 6 str-08)));setq
	);if

	(setq str-order (list (cons 1 str-02) (cons 2 "-") (cons 3 nil));list
				str-manufact "АПАТОР-ЭЛЕКТРО, г. Москва"
				str-unit "шт"
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
(defun tmp-lecgv-101-04-swch-apator-01-general

( / cntr-1 pnt-ins str-01 str-02 str-03 str-04 str-05 str-06 str-07 str-08 str-701 str-702 str-703 str-99 str-tmp)

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
				str-99 (cdr (assoc 99 str-tmp))
	);setq

	(setvar "osmode" 6199)

	(setq pnt-ins (getpoint "\nУкажите точку вставки\n")
				str-701 (strcat str-01 " APATOR, " str-02 ", " str-03 ", " str-04 ", " str-05 ", " str-06 ", " str-07 ", " str-08)
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