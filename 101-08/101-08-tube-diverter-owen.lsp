;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// блок вентильный "овен"                                       ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun 101-08-tube-diverter-owen

( / adoc dcl-id file-name-1 list-01 list-01-read-file list-02 list-02-read-file list-03 list-03-read-file list-04 list-04-read-file list-05 list-05-read-file list-06 list-1001 
list-901 list-902 type-list)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(setvar "cmdecho" 0)
(setvar "textstyle" "Standard")

(setq file-name-1 "101-08-tube-diverter-owen.txt"
			
			list-901 nil
			list-902 nil
);setq

;считываем данные
(read-file-for-dialog-box-01 file-name-1 5)

(setq list-01 list-01-read-file
			list-02 list-02-read-file
			list-03 list-03-read-file
			list-04 (list "М20х1,5 (внутренняя)")
			list-05 list-04-read-file
			list-06 list-05-read-file
			list-1001 list-900-dscr
);setq

(if (< (setq dcl-id (load_dialog "dia-101-08-tube-diverter-owen.dcl")) 0) ;ищем диалог
		(progn
			(alert "Не найден dcl-файл")
			(exit)
		);progn
);if

(if (not (new_dialog "dia_101_08_tube_diverter_owen" dcl-id))
		(exit)
);if

(list-filling "txt-01" list-01)
(list-filling "txt-02" list-02)
(list-filling "txt-03" list-03)
(list-filling "txt-04" list-04)
(list-filling "txt-05" list-05)
(list-filling "txt-06" list-06)
(list-filling "txt-1001" list-1001)

(set_tile "txt-01" "0")
(set_tile "txt-02" "0")
(set_tile "txt-03" "0")
(set_tile "txt-04" "0")
(set_tile "txt-05" "0")
(set_tile "txt-06" "0")

(action_tile "txt-01"
  (strcat "(setq str-01 (get_tile \"txt-01\"))"
  				"(set_tile \"txt-02\" str-01)"
  				"(set_tile \"txt-03\" str-01)"
  				"(set_tile \"txt-05\" str-01)"
  				"(set_tile \"txt-06\" str-01)"
  );srcat
);action_tile

(action_tile "txt-02"
  (strcat "(setq str-01 (get_tile \"txt-02\"))"
  				"(set_tile \"txt-01\" str-01)"
  				"(set_tile \"txt-03\" str-01)"
  				"(set_tile \"txt-05\" str-01)"
  				"(set_tile \"txt-06\" str-01)"
  );srcat
);action_tile

(action_tile "txt-03"
  (strcat "(setq str-01 (get_tile \"txt-03\"))"
  				"(set_tile \"txt-01\" str-01)"
  				"(set_tile \"txt-02\" str-01)"
  				"(set_tile \"txt-05\" str-01)"
  				"(set_tile \"txt-06\" str-01)"
  );srcat
);action_tile

(action_tile "txt-05"
  (strcat "(setq str-01 (get_tile \"txt-05\"))"
  				"(set_tile \"txt-01\" str-01)"
  				"(set_tile \"txt-02\" str-01)"
  				"(set_tile \"txt-03\" str-01)"
  				"(set_tile \"txt-06\" str-01)"
  );srcat
);action_tile

(action_tile "but1"
  (strcat "(but1-101-08-tube-diverter-owen)");strcat
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
	((= type-list "le") (le-101-08-tube-diverter-owen));=
	((= type-list "spcf") (spcf-101-08-tube-diverter-owen));=
);if

(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(vla-endundomark adoc)
(princ)
)
;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// конец программы                                             ////////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////


;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// формирование данных, заполнение поля "выбрано"               ///////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun but1-101-08-tube-diverter-owen

( / cntr-1 str-01 str-02 str-03 str-04 str-05 str-06 str-902 str-99 swtch)

(setq str-01 (nth (atoi (get_tile "txt-01")) list-01)
			str-02 (nth (atoi (get_tile "txt-02")) list-02)
			str-03 (nth (atoi (get_tile "txt-03")) list-03)
			str-04 (nth (atoi (get_tile "txt-04")) list-04)
			str-05 (nth (atoi (get_tile "txt-05")) list-05)
			str-06 (nth (atoi (get_tile "txt-06")) list-06)
			
      swtch list-901
      cntr-1 0
);setq

(if (/= swtch nil) (setq list-902 (reverse list-902)));if

;масса
(cond	
	((wcmatch str-01 "ТО-У*") (setq str-99 "0,1"));=
	((wcmatch str-01 "ТО-СУ*") (setq str-99 "0,3"));=
	
);cond

(setq list-901 (vl-list* (strcat str-01 "  " 
																 str-02 "  " 
																 "К процессу " str-03 "  " 
																 "К прибору " str-04 "  "
																 str-05 "  "
																 "Длина " str-06 "см") list-901)  
);setq

		
;для пэ, зс
(setq str-902 (list (cons 1 str-01) (cons 2 str-02) (cons 3 str-03) (cons 4 str-04) (cons 5 str-05) (cons 6 str-06) (cons 99 str-99))
			list-902 (vl-list* str-902 list-902)
);setq

(setq list-902 (reverse list-902));=

(list-filling "txt-901" (reverse list-901))

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// вывод в ПЭ                                                   ///////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun le-101-08-tube-diverter-owen

( / cntr-1 dlt-y nmbr-ln pnt-ins str-01 str-02 str-03 str-04 str-05 str-tmp x-pnt-ins y-pnt-ins y-pnt-ins-1)

(setq cntr-1 0
			str-702 nil
);setq

(setvar "textstyle" "Standard")

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-01 (cdr (assoc 1 str-tmp))
				str-02 (cdr (assoc 2 str-tmp))
				str-03 (cdr (assoc 3 str-tmp))
				str-04 (cdr (assoc 4 str-tmp))
				str-05 (cdr (assoc 5 str-tmp))
	);setq

	(setvar "osmode" 6199)
	
	(setq pnt-ins (getpoint "\nУкажите точку вставки\n"));setq
	
	;;;;;;;///////////////////////////////////////////////////////////////////////////////////////////
	(setq str-02 (strcase str-02 1)
				str-03 (vl-string-subst "сварка" "Сварка" str-03) 
				str-05 (vl-string-subst "сталь" "Сталь" str-05)
	);setq

	;;;;;;;///////////////////////////////////////////////////////////////////////////////////////////
	(setq str-701 (strcat "Трубка отводная ОВЕН " str-01 ", " str-02 ", к процессу " str-03 ", к прибору " str-04 ", материал " str-05));setq
	
	(split-str-parts-le-01-general str-701 str-702 pnt-ins "**1**");
	
	(setq cntr-1 (1+ cntr-1));setq
	
	(setvar "osmode" 6199)
);repeat

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в спцф                   ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun spcf-101-08-tube-diverter-owen

( / cntr-1 pnt-ins str-01 str-02 str-03 str-04 str-05 str-06 str-701 str-702 str-99 str-crtf str-manufact str-note str-order str-tmp str-unit)

(setq cntr-1 0);setq

(setvar "textstyle" "Standard")

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-01 (cdr (assoc 1 str-tmp))
				str-02 (cdr (assoc 2 str-tmp))
				str-03 (cdr (assoc 3 str-tmp))
				str-04 (cdr (assoc 4 str-tmp))
				str-05 (cdr (assoc 5 str-tmp))
				str-06 (cdr (assoc 6 str-tmp))
				str-99 (cdr (assoc 99 str-tmp))
	);setq

	(setvar "osmode" 6199)
	
	(setq pnt-ins (getpoint "\nУкажите точку вставки\n"));setq
		
	;;;;;;;///////////////////////////////////////////////////////////////////////////////////////////
	(setq str-02 (strcase str-02 1)
				str-03 (vl-string-subst "сварка" "Сварка" str-03) 
				str-05 (vl-string-subst "сталь" "Сталь" str-05)
	);setq

	(setq str-701 "Трубка отводная"
	
				str-702 (list (cons 1 (strcat str-02))
											(cons 2 (strcat "материал " str-05))
											(cons 3 (strcat "длина " str-06 "см"))
											(cons 4 (strcat "к процессу " str-03 ", к прибору " str-04))
								);list
											
				str-order (list (cons 1 str-01) 
												(cons 2 "-") 
												(cons 3 nil) ;;;  здесь обозначение ТУ или НТД
									);list
				
				str-unit "шт."
				str-note nil ;;;;;;; примечание, текстовая строка
	);setq
			
	(setq str-manufact "ОВЕН, г. Москва"
				str-unit "шт"
				str-crtf nil
	);setq

	(split-str-parts-spcf-01-general str-701 str-702 str-order str-manufact str-unit str-99 str-crtf pnt-ins)
 
	(setq cntr-1 (+ cntr-1 1));setq
);repeat

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

