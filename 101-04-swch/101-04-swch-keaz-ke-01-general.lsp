;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////                                                              ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun 101-04-swch-keaz-ke-01-general

( / adoc dcl-id list-01 list-01-read-file list-02 list-02-read-file list-03 list-03-read-file list-04 list-05 list-801 list-802 list-900 list-901 list-902 list-99 str-01 type-list)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(read-file-for-dialog-box-01 "101-04-swch-keaz-ke-01-general.txt" 3)

(setq list-01 list-01-read-file
			list-801 list-02-read-file
			
      list-901 nil
      list-902 nil
      list-900 nil
      
      str-01 "0"
);setq

(txt-01-101-04-swch-keaz-ke-01-general str-01)

(if (< (setq dcl-id (load_dialog "dia-101-04-swch-keaz-ke-01-general.dcl")) 0) ;ищем диалог
		(progn
			(alert "Не найден dcl-файл")
			(exit)
		);progn
);if

(if (not (new_dialog "dia_101_04_keaz_ke" dcl-id))
		(exit)
);if

(list-filling "txt-01" list-01)
(list-filling "txt-02" list-02)
(list-filling "txt-03" list-03)
(list-filling "txt-04" list-04)
(list-filling "txt-05" list-05)
(list-filling "txt-99" list-99)
(list-filling "txt-900" list-900)

(set_tile "txt-01" "0")
(set_tile "txt-02" "0")
(set_tile "txt-03" "0")
(set_tile "txt-04" "0")
(set_tile "txt-05" "0")
(set_tile "txt-99" "0")

(action_tile "txt-01"
  (strcat "(txt-01-101-04-swch-keaz-ke-01-general)");srcat
);action_tile

(action_tile "txt-02"
  (strcat "(set_tile \"txt-03\" $value)");srcat
);action_tile

(action_tile "txt-03"
  (strcat "(set_tile \"txt-02\" $value)");srcat
);action_tile

(action_tile "but5"
  (strcat "(list-delete-item)");strcat
);action_tile

(action_tile "but1"
  (strcat "(but1-101-04-swch-keaz-ke-01-general)");strcat
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
  (strcat "(list-delete-item)");strcat
);action_tile

(action_tile "accept"
  (strcat "(done_dialog)"
          "(exit)"
  );strcat
);action_tile

(start_dialog)
(unload_dialog dcl-id)

(cond
	((= type-list "le") (le-101-04-swch-keaz-ke-01-general list-902));=
	((= type-list "spcf") (spcf-101-04-swch-keaz-ke-01-general list-902));=
	((= type-list "lecgv") (lecgv-101-04-swch-keaz-ke-01-general list-902));=
);cond

(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(vla-endundomark adoc)
(gc)
(princ)
)
;/////// конец программы ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun txt-01-101-04-swch-keaz-ke-01-general

(str-01 / list-900-dscr list-902-read-file name-file-1)

(setq name-file-1 (nth (atoi str-01) list-801));setq

(read-file-for-dialog-box-02 name-file-1)

(setq list-02 (cdr (nth 0 list-902-read-file))
			list-03 (cdr (nth 1 list-902-read-file))
			list-04 (cdr (nth 2 list-902-read-file))
			list-05 (cdr (nth 3 list-902-read-file))
			list-99 (cdr (nth 4 list-902-read-file))
			list-900 list-900-dscr
);setq

(list-filling "txt-02" list-02)
(list-filling "txt-03" list-03)
(list-filling "txt-04" list-04)
(list-filling "txt-05" list-05)
(list-filling "txt-99" list-99)
(list-filling "txt-900" list-900)

(set_tile "txt-02" "0")
(set_tile "txt-03" "0")
(set_tile "txt-04" "0")
(set_tile "txt-05" "0")
(set_tile "txt-99" "0")

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма формирования данных/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun but1-101-04-swch-keaz-ke-01-general

( / str-01 str-02 str-021 str-03 str-04 str-041 str-042 str-043 str-05 str-051 str-99 str-ord tmp-str-902)

(if (/= list-901 nil) 
	(setq list-901 (reverse list-901)
				list-902 (reverse list-902)
	);setq
);if

(setq str-01 (nth (atoi (get_tile "txt-01")) list-01)
			str-02 (nth (atoi (get_tile "txt-02")) list-02)
			str-03 (nth (atoi (get_tile "txt-03")) list-03)
			str-04 (nth (atoi (get_tile "txt-04")) list-04)
			str-05 (nth (atoi (get_tile "txt-05")) list-05)
			str-99 (nth (atoi (get_tile "txt-99")) list-99)
			
			list-901 (vl-list* (strcat str-01 "  " str-02 "  " str-03 "  " str-04 "  " str-05) list-901)
);setq


(setq str-021 (strcase str-02 1)
			
			str-03 (strcat "контакты " str-03)
			
			str-041 (substr str-04 1 2)

			str-042 (substr str-04 1 (+ (vl-string-search ")" str-04) 1));
			str-042 (strcat "климатическое исп. " str-042 " по ГОСТ 14255");
			
			str-043 (substr str-04 (+ (vl-string-search ")" str-04) 3));
			str-043 (strcat "степень защиты " str-043 " по ГОСТ 15150");
);setq

(cond 
	((= str-05 "Черный") 
		(setq str-05 "черный"
					str-051 "черного цвета"
		);setq
	);=
	
	((= str-05 "Красный") 
		(setq str-05 "красный"
					str-051 "красного цвета"
		);setq
	);=
);cond

(if (= str-01 "КЕ011")
	(setq str-051 (strcat "цилиндрический толкатель " str-051));setq
);cond

(setq str-ord (strcat str-01 "-" str-041 "-" str-021 "(" str-05 ")-КЭАЗ")

			tmp-str-902 (list (cons 1 str-01) (cons 2 str-ord) (cons 3 str-03) (cons 4 str-051) (cons 5 str-042) (cons 6 str-043) (cons 99 str-99))								
);setq

(setq list-902 (vl-list*  tmp-str-902 list-902)
			list-901 (reverse list-901)
			list-902 (reverse list-902)
);setq

(list-filling "txt-901" list-901)

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в ПЭ                   //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun le-101-04-swch-keaz-ke-01-general

(list-902 / cntr-1 pnt-ins str-01 str-02 str-03 str-04 str-701 str-702 str-tmp)

(setq cntr-1 0
			str-702 nil
);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-01 (cdr (assoc 01 str-tmp))
				str-02 (cdr (assoc 2 str-tmp))
				str-03 (cdr (assoc 3 str-tmp))
				str-04 (cdr (assoc 4 str-tmp))
	);setq
	
	(setvar "osmode" 6199)
	
	(setq pnt-ins (getpoint "\nУкажите точку вставки\n"));setq
	
	;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	(setq str-701 (strcat "Выключатель кнопочный " str-02 ", " str-03 ", " str-04));setq
	
	(split-str-parts-le-01-general str-701 str-702 pnt-ins "**1**");

	(setq cntr-1 (1+ cntr-1));setq
);repeat

(princ)
)
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в спцф                   //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun spcf-101-04-swch-keaz-ke-01-general

( / cntr-1 pnt-ins str-01 str-02 str-03 str-04 str-05 str-701 str-702 str-99 str-crtf str-manufact str-order str-tmp str-unit)

(setq cntr-1 0);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-01 (cdr (assoc 1 str-tmp))
				str-99 (cdr (assoc 99 str-tmp))
				str-02 (cdr (assoc 2 str-tmp))
				str-03 (cdr (assoc 3 str-tmp))
				str-04 (cdr (assoc 4 str-tmp))
				str-05 (cdr (assoc 5 str-tmp))
				str-05 (strcase str-05 1)
	);setq

	(setvar "osmode" 6199)
	
	(setq pnt-ins (getpoint "\nУкажите точку вставки\n"));setq
	
	(cond			
		((= str-04 "Красный") (setq str-04 "красный"));=
		((= str-04 "Черный") (setq str-04 "черный"));=
	);cond

	;/////////////////////////////////////////////////////////////////////////////////////////////////
	(if (wcmatch str-01 "КЕ ###")
		(setq str-701 "Выключатель кнопочный"					
					str-702 (list (cons 1 (strcat "контакты " str-02 " (" str-03 "), " str-05))
												(cons 2 (strcat "цвет " str-04 ", степень защиты IP40 по ГОСТ 14255")));list
																 
					str-order (list (cons 1 (strcat "КЕ 011, исп. " str-02 ", " str-04 " цвет")) 
													(cons 2 ",") 
													(cons 3 nil));list
		);setq
	);if

	(setq str-manufact "ООО \"Реле и Автоматика\", г. Москва"
				str-unit "шт."
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
(defun lecgv-101-04-swch-keaz-ke-01-general

( / cntr-1 pnt-ins str-01 str-02 str-03 str-04 str-05 str-701 str-702 str-703 str-99 str-tmp)

(setq cntr-1 0);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-01 (cdr (assoc 1 str-tmp))
				str-02 (cdr (assoc 2 str-tmp))
				str-03 (cdr (assoc 3 str-tmp))
				str-04 (cdr (assoc 4 str-tmp))
				str-05 (cdr (assoc 5 str-tmp))
				str-99 (cdr (assoc 99 str-tmp))
	);setq
	
	(setvar "osmode" 6199)
	
	(setq pnt-ins (getpoint "\nУкажите точку вставки\n"));setq

	(cond			
		((= str-04 "Красный") (setq str-04 "красный"));=
		((= str-04 "Черный") (setq str-04 "черный"));=
	);cond
	
	(setq str-05 (strcase str-05 1));setq
	
	;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	(if (wcmatch str-01 "КЕ ###")
		(setq str-701 (strcat "Выключатель кнопочный " str-01 ", исп. " str-02 " (" str-03 "), " str-05 ", цвет " str-04)
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