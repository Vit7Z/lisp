;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////                                                              ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun 101-08-sleeve-prtct-metran

( / adoc dcl-id list-01 list-01-read-file list-02 list-02-read-file list-03 list-04 list-05 list-06 list-07 list-08 list-09 list-10 list-1001 list-801 list-901 list-902 list-99 str-01 type-list)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(setq	list-901 nil
      list-902 nil
      
			str-01 nil
);setq

(read-file-for-dialog-box-01 "101-08-sleeve-prtct-metran-01-general.txt" 2)

(setq list-01 list-01-read-file
			list-801 list-02-read-file
);setq


(txt-01-101-sleeve-prtct-metran)

(if (< (setq dcl-id (load_dialog "dia-101-08-sleeve-prtct-metran.dcl")) 0) ;ищем диалог
		(progn
			(alert "Не найден dcl-файл")
			(exit)
		);progn
);if

(if (not (new_dialog "dia_101_08_sleeve_prtct_metran" dcl-id))
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
(list-filling "txt-99" list-99)
(list-filling "txt-1001" list-1001)

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
(set_tile "txt-99" "0")

(action_tile "txt-01"
  (strcat "(txt-01-101-sleeve-prtct-metran)");srcat
);action_tile

(action_tile "txt-03"
  (strcat "(txt-03-101-sleeve-prtct-metran)");srcat
);action_tile

(action_tile "txt-05"
  (strcat "(set_tile \"txt-10\" (get_tile \"txt-06\"))"
					"(set_tile \"txt-11\" (get_tile \"txt-06\"))"
  );srcat
);action_tile

(action_tile "but1"
  (strcat "(but1-101-sleeve-prtct-metran)"
  );strcat
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

(cond 
	((= type-list "le") (le-101-sleeve-prtct-metran));=
	((= type-list "spcf") (spcf-101-sleeve-prtct-metran));=
);cond
(gc)
(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(vla-endundomark adoc)
(princ)
)
;/////// конец программы ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun txt-01-101-sleeve-prtct-metran

( / list-1001-read-file list-902-read-file name-file-1)

(if (= nil str-01) 
	(setq str-01 (nth 0 list-01)
				name-file-1 (nth 0 list-801)
	);setq
	
	(setq str-01 (nth (atoi (get_tile "txt-01")) list-01)
				name-file-1 (nth (atoi (get_tile "txt-01")) list-801)
	);setq
);if

(cond
	((= "2001-01" str-01) (setq name-file-1 "101-08-sleeve-prtct-metran-2001-01.txt"));=
	((= "2001-02" str-01) (setq name-file-1 "101-08-sleeve-prtct-metran-2001-02.txt"));=
	((= "2001-03" str-01) (setq name-file-1 "101-08-sleeve-prtct-metran-2001-03.txt"));=
	((= "2002-01" str-01) (setq name-file-1 "101-08-sleeve-prtct-metran-2002-01.txt"));=	
	((= "2002-02" str-01) (setq name-file-1 "101-08-sleeve-prtct-metran-2002-02.txt"));=
	((= "2002-03" str-01) (setq name-file-1 "101-08-sleeve-prtct-metran-2002-03.txt"));=
);cond

(read-file-for-dialog-box-02 name-file-1)

(setq list-02 (cdr (assoc 1 list-902-read-file))
			list-03 (cdr (assoc 2 list-902-read-file))
			list-04 (cdr (assoc 3 list-902-read-file))
			list-05 (cdr (assoc 4 list-902-read-file))
			list-06 (cdr (assoc 5 list-902-read-file))
			list-07 (cdr (assoc 6 list-902-read-file))
			list-08 (cdr (assoc 7 list-902-read-file))
			list-09 (cdr (assoc 8 list-902-read-file))
			list-10 (cdr (assoc 9 list-902-read-file))
			list-99 (cdr (assoc 10 list-902-read-file))
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
(list-filling "txt-99" list-99)
(list-filling "txt-1001" list-1001-read-file)

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

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun txt-03-101-sleeve-prtct-metran

( / str-01 str-03 str-04)

(setq str-01 (nth (atoi (get_tile "txt-01")) list-01)
			str-03 (nth (atoi (get_tile "txt-03")) list-03)
);setq

(set_tile "txt-04" (get_tile "txt-03"))

(setq str-04 (nth (atoi (get_tile "txt-04")) list-04));setq

;;;;////////////////////////////////////////////////////////////////////////////////////////////////
(if (= "2001-01" str-01)
	(cond
		((and (= "М20х1,5" str-03) (= "М20х1,5" str-04)) 
			(setq list-05 (list "100" "160" "200")
						list-08 (list "4")
						list-09 (list "40" "40" "25")
      			list-10 (list "4" "4" "2,5")
			);setq
		);=

		((and (= "М20х1,5" str-03) (= "G1/2-B" str-04)) 
			(setq list-05 (list "82" "102" "108" "122" "142" "162" "175" "182" "202" "232" "250" "322" "402")
						list-08 (list "4")
						list-09 (list "40" "40" "40" "40" "40" "40" "40" "40" "25" "25" "25" "25" "5")
      			list-10 (list "4" "4" "4" "4" "4" "4" "4" "4" "2,5" "2,5" "2,5" "2,5" "0,5")
			);setq
		);=

		((and (= "G1/2-B" str-03) (= "G1/2-B" str-04)) 
			(setq list-05 (list "80" "110" "140" "160" "200")
						list-08 (list "4")
						list-09 (list "40" "40" "40" "40" "25")
      			list-10 (list "4" "4" "4" "4" "2,5")
			);setq
		);=
	);cond
);if

;;;;////////////////////////////////////////////////////////////////////////////////////////////////
(if (or (= "2001-02" str-01) (= "2001-03" str-01))
	(setq list-08 (list "25"));setq
);if

;;;;////////////////////////////////////////////////////////////////////////////////////////////////
(if (= "2002-01" str-01)
	(cond
		((and (= "G1/2-B" str-03) (= "G1/2-B" str-04)) 
			(setq list-05 (list "250" "320" "330" "400")
						list-08 (list "15")
						list-09 (list "100" "100" "100" "70")
      			list-10 (list "7,5" "7,5" "7,5" "4")
			);setq
		);=
	);cond
);if

;;;;////////////////////////////////////////////////////////////////////////////////////////////////
(if (= "2002-02" str-01)
	(cond
		((and (= "М24х1,5" str-03) (= "М20х1,5" str-04)) 
			(setq list-05 (list "60" "80" "100" "120" "160" "200" "250" "320")
						list-08 (list "25")
						list-09 (list "150" "150" "150" "120" "120" "100" "100" "100")
      			list-10 (list "12" "12" "12" "10" "10" "7,5" "7,5" "7,5")
			);setq
		);=

		((and (= "М33х2" str-03) (= "М20х1,5" str-04)) 
			(setq list-05 (list "60" "80" "100" "120" "160" "200" "250" "320")
						list-08 (list "25")
						list-09 (list "150" "150" "150" "120" "120" "100" "100" "100")
      			list-10 (list "12" "12" "12" "10" "10" "7,5" "7,5" "7,5")
			);setq
		);=
	);cond
);if

;;;;////////////////////////////////////////////////////////////////////////////////////////////////
(if (= "2002-03" str-01)
	(cond
		((and (= "М20х1,5" str-03) (= "М20х1,5" str-04)) 
			(setq list-05 (list "60" "80" "100" "120" "160" "200" "250" "320")
						list-08 (list "25")
						list-09 (list "150" "150" "150" "120" "120" "100" "100" "100")
      			list-10 (list "12" "12" "12" "10" "10" "7,5" "7,5" "7,5")
			);setq
		);=

		( 
			(setq list-05 (list "60" "80" "100" "120" "160" "200" "250" "320")
						list-08 (list "50")
						list-09 (list "150" "150" "150" "120" "120" "100" "100" "100")
      			list-10 (list "12" "12" "12" "10" "10" "7,5" "7,5" "7,5")
			);setq
		);=
	);cond
);if


(list-filling "txt-05" list-05)
(list-filling "txt-08" list-08)
(list-filling "txt-09" list-09)
(list-filling "txt-10" list-10)

(set_tile "txt-05" "0")
(set_tile "txt-08" "0")
(set_tile "txt-09" "0")
(set_tile "txt-10" "0")

(princ)
)
;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun txt-05-101-sleeve-prtct-metran

()

(set_tile "txt-10" (get_tile "txt-05"))
(set_tile "txt-11" (get_tile "txt-05"))

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма формирования данных/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun but1-101-sleeve-prtct-metran

( / cntr-1 str-01 str-02 str-03 str-04 str-05 str-06 str-07 str-08 str-09 str-10 str-902 str-99)

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
			str-99 (nth (atoi (get_tile "txt-99")) list-99)
      cntr-1 0
);setq

(if (/= list-901 nil) (setq list-902 (reverse list-902)));if

(setq str-99 ;масса
	(cond	
		((wcmatch str-01 "2001*") "до 3")
		((wcmatch str-01 "2002*") "до 4")
	);cond
);setq

(setq str-902 (list (cons 1 str-01) (cons 2 str-02) (cons 3 str-03) (cons 4 str-04) (cons 5 str-05) (cons 6 str-06) (cons 7 str-07) (cons 8 str-08) 
										(cons 9 str-09) (cons 10 str-10) (cons 99 str-99))

  		list-901 (vl-list* (strcat str-01 "  Под штуцер " str-02 "  Резьба монтажн.  " str-03 "  Резьба внутрен. " str-04 "  Длина " str-05 "мм  Диаметр. внутр. " str-06
  															 "  Материал " str-07) list-901)
);setq

(setq list-902 (vl-list* str-902 list-902)
			list-902 (reverse list-902)
);setq

(list-filling "txt-901" (reverse list-901))

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в ПЭ                   //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun le-101-sleeve-prtct-metran

( / cntr-1 pnt-ins str-01 str-011 str-02 str-021 str-03 str-04 str-05 str-06 str-07 str-08 str-701 str-702 str-tmp)

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
		
	(cond	
		((= (substr str-01 1 4) "2001") (setq str-011 "сварной"))
		((= (substr str-01 1 4) "2002") (setq str-011 "цельный"))
	);cond

	(cond	
		((= str-02 "Нет") (setq str-021 "для датчика без штуцера"))
		((= str-02 "Подвижный") (setq str-021 "для датчика с подвижным штуцером"))
		((= str-02 "Неподвижный") (setq str-021 "для датчика с неподвижным штуцером"))
	);cond
	
	(setvar "osmode" 6199)
	
	(setq pnt-ins (getpoint "\nУкажите точку вставки\n"));setq
	
	(setq str-701 (strcat "Гильза защитная \"Метран\", модель " str-01 ", резьба монтажная " str-03 ", резьба внутернняя " str-04 ", длина " 
												str-05 "мм, материал " str-07 ", корпус " str-011 ", " str-021)
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
(defun spcf-101-sleeve-prtct-metran

( / cntr-1 pnt-ins str-01 str-011 str-02 str-021 str-03 str-04 str-05 str-06 str-07 str-071 str-08 str-09 str-701 str-702 str-99 str-crtf str-manufact str-order str-tmp str-unit)

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
	
	(setq pnt-ins (getpoint "\nУкажите точку вставки\n"));setq

	;обработка данных
	(cond	
		((= (substr str-01 1 4) "2001") (setq str-011 "сварной"))
		((= (substr str-01 1 4) "2002") (setq str-011 "цельный"))
	);cond

	(cond	
		((= str-02 "Нет") (setq str-021 "для датчика без штуцера"))
		((= str-02 "Подвижный") (setq str-021 "для датчика с подвижным штуцером"))
		((= str-02 "Неподвижный") (setq str-021 "для датчика с неподвижным штуцером"))
	);cond
 
	(cond	
		((= str-07 "12Х18Н10Т") (setq str-071 "Н10"))
		((= str-07 "10Х17Н13М2Т") (setq str-071 "Н13"))
	);cond

		
	(setq str-702 (list (cons 1 (strcat "давление до " str-08 "МПа"))
											(cons 2 (strcat "монтажная резьба " str-03))
											(cons 3 (strcat "внутренняя резьба " str-04))
											(cons 4 (strcat "длина монтажной части " str-05 "мм"))
											(cons 5 (strcat "материал " str-07))
											(cons 6 (strcat "корпус " str-011))
											(cons 7 str-021)
								);list
						
				str-701 "Гильза защитная"
											 
				str-order (list (cons 1 (strcat str-01 "-" str-04 "-" str-05 "-" str-071 "-" str-05 "мм")) 																												
												(cons 2 "-") 
												(cons 3 nil)
									);list
					
				str-manufact "ПГ \"Метран\", г. Челябинск"
				str-unit "шт."
				str-crtf nil
	);setq
		
	(split-str-parts-spcf-01-general str-701 str-702 str-order str-manufact str-unit str-99 str-crtf pnt-ins)
 
	(setq cntr-1 (+ cntr-1 1));setq
);repeat

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
