;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////                                                              ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun 101-04-cir-brk-abb-s200-01-general

( / adoc dcl-id list-01 list-01-read-file list-02 list-02-read-file list-03 list-03-read-file list-04 list-04-read-file list-05 list-801 list-802 list-900 list-900-dscr 
list-900-menu list-901 list-902 str-01 type-list)

(vl-load-com)

(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(read-file-for-dialog-box-01 "101-04-cir-brk-abb-s200-01-general.txt" 4)

(setq list-01 list-01-read-file
			list-801 list-02-read-file
			list-802 list-03-read-file
			list-05 list-04-read-file
			
      list-901 nil
      list-902 nil
      
      list-900-menu nil
      list-900-dscr nil
      
      str-01 "0"
);setq

(txt-01-101-04-cir-brk-abb-s200-01-general str-01)

(if (< (setq dcl-id (load_dialog "dia-101-04-cir-brk-abb-s200-01-general.dcl")) 0) ;ищем диалог
	(progn
		(alert "Не найден dcl-файл")
		(exit)
	);progn
);if

(if (not (new_dialog "dia_101_04_auto_abb_prom_compact" dcl-id))
		(exit)
);if

(list-filling "txt-01" list-01)
(list-filling "txt-02" list-02)
(list-filling "txt-03" list-03)
(list-filling "txt-04" list-04)
(list-filling "txt-05" list-05)
(list-filling "txt-900" list-900)

(set_tile "txt-01" "0")
(set_tile "txt-02" "0")
(set_tile "txt-03" "0")
(set_tile "txt-04" "0")
(set_tile "txt-05" "0")

(action_tile "txt-01"
  (strcat "(setq str-01 (get_tile \"txt-01\"))"
  				"(set_tile \"txt-05\" str-01)"
  				"(txt-01-101-04-cir-brk-abb-s200-01-general str-01)" 				
  );srcat
);action_tile

(action_tile "txt-02"
  (strcat "(setq str-02 (get_tile \"txt-02\"))"
  				"(set_tile \"txt-03\" str-02)"
  				"(set_tile \"txt-04\" str-02)"
  );srcat
);action_tile

(action_tile "txt-03"
  (strcat "(setq str-03 (get_tile \"txt-03\"))"
  				"(set_tile \"txt-02\" str-03)"
  				"(set_tile \"txt-04\" str-03)"
  );srcat
);action_tile

(action_tile "but1"
  (strcat "(but1-101-04-cir-brk-abb-s200-01-general)");strcat
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
	((= type-list "le") (le-101-04-cir-brk-abb-s200-01-general list-902));=
	((= type-list "spcf") (spcf-101-04-cir-brk-abb-s200-01-general list-902));=
	((= type-list "lecgv") (lecgv-101-04-cir-brk-abb-s200-01-general list-902));=
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
(defun txt-01-101-04-cir-brk-abb-s200-01-general

(str-01 / list-01-read-file list-02-read-file list-03-read-file list-900-dscr list-900-menu list-900-read-file name-file num-flds)

(setq name-file (nth (atoi str-01) list-801)
			num-flds (atoi (nth (atoi str-01) list-802))
);setq

(read-file-for-dialog-box-01 name-file num-flds)

(if (/= list-900-dscr nil)
	(divide-text-into-parts list-900-dscr 150)
);

(setq list-02 list-01-read-file
			list-03 list-02-read-file
			list-04 list-03-read-file
			list-900 list-900-read-file
);setq

(set_tile "hm-21" (nth 0 list-900-menu))
(set_tile "hm-22" (nth 1 list-900-menu))
(set_tile "hm-31" (nth 2 list-900-menu))
(set_tile "hm-32" (nth 3 list-900-menu))
(set_tile "hm-41" (nth 4 list-900-menu))
(set_tile "hm-42" (nth 5 list-900-menu))

(list-filling "txt-02" list-02)
(list-filling "txt-03" list-03)
(list-filling "txt-04" list-04)
(list-filling "txt-05" list-05)
(list-filling "txt-900" list-900)

(set_tile "txt-02" "0")
(set_tile "txt-03" "0")
(set_tile "txt-04" "0")
(set_tile "txt-05" str-01)

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма формирования данных/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun but1-101-04-cir-brk-abb-s200-01-general

( / str-01 str-01-01 str-01-02 str-02 str-03 str-03-01 str-03-02 str-04 str-99 str-key tmp-list-902)

(setq str-01 (nth (atoi (get_tile "txt-01")) list-01)
			str-02 (nth (atoi (get_tile "txt-02")) list-02)
			str-03 (nth (atoi (get_tile "txt-03")) list-03)
			str-04 (nth (atoi (get_tile "txt-04")) list-04)
			str-99 (nth (atoi (get_tile "txt-05")) list-05)
			
			str-key (substr str-01 1 3)
);setq

(if (/= list-901 nil)
	(setq list-902 (reverse list-902)
				list-901 (reverse list-901)
	);setq
);if

;;;;;;;;собираем данные авт выключателей
(if (wcmatch str-key "S #")
	(progn
		(cond 
			((vl-string-search "хар-ка С" str-01) (setq str-01-01 "хар-ка С"));=
			((vl-string-search "хар-ка D" str-01) (setq str-01-01 "хар-ка D"));=
		);cond
		
		(cond 
			((vl-string-search "1 пол." str-01) (setq str-01-02 "1 полюс"));=
			((vl-string-search "2 пол." str-01) (setq str-01-02 "2 полюса"));=
			((vl-string-search "3 пол." str-01) (setq str-01-02 "3 полюса"));=
		);cond
	
		(setq str-02 (strcat str-02 "А")
					list-901 (vl-list* (strcat "Автомат  " str-03 "  Iном " str-02  "  " str-01-01 "  " str-01-02) list-901)
					tmp-list-902 (list (cons 1 "Автомат") (cons 2 str-03) (cons 3 str-02) (cons 4 str-01-01) (cons 5 str-01-02) (cons 6 str-04) (cons 99 str-99))
		);setq
	);progn
);if

;;;;;;;;собираем данные доп. контактов
(if (= str-key "Всп")
	(setq str-03-01 (substr str-03 1 (vl-string-search "," str-03))
				str-03-02 (substr str-03 (+ (vl-string-search "," str-03) 3))
					
				list-901 (vl-list* (strcat "Вспом. контакт  " str-03-01 "  " str-03-02) list-901)
				tmp-list-902 (list (cons 1 "Вспом. контакт") (cons 2 str-03-01) (cons 3 str-03-02) (cons 4 str-04) (cons 99 str-99))
	);setq
);if

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
(defun le-101-04-cir-brk-abb-s200-01-general

(list-902 / cntr-1 pnt-ins str-1 str-2 str-3 str-4 str-5 str-701 str-702 str-tmp)

(setq cntr-1 0
			str-702 nil
);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-1 (cdr (assoc 1 str-tmp))				
	);setq

	(setvar "osmode" 6199)
	
	(setq pnt-ins (getpoint "\nУкажите точку вставки\n"));setq
	
	;;;;;;;/////////////////////////////////////////////////////////////
	(if (= str-1 "Автомат")
		(setq str-2 (cdr (assoc 2 str-tmp))
					str-3 (cdr (assoc 3 str-tmp))
					str-4 (cdr (assoc 4 str-tmp))
					str-5 (cdr (assoc 5 str-tmp))
					str-6 (cdr (assoc 6 str-tmp))
					
					str-701 (strcat "Выключатель автоматический ABB " str-2 ", артикул " str-6 ", Iном. " str-3 ", " str-4 ", " str-5)	
		);setq
	);if

	;;;;;;;/////////////////////////////////////////////////////////////
	(if (= str-1 "Вспом. контакт")
		(setq str-2 (cdr (assoc 2 str-tmp))
					str-3 (cdr (assoc 3 str-tmp))
		
					str-701 (strcat "Контакт вспомогательный ABB " str-2 ", артикул " str-6 ", тип контактов " str-3)
		);setq
	);if

	(split-str-parts-le-01-general str-701 str-702 pnt-ins "**1**");

	(setq cntr-1 (1+ cntr-1));setq
);repeat

(princ)
)
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в спцф                   //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun spcf-101-04-cir-brk-abb-s200-01-general

(list-902 / cntr-1 pnt-ins str-01 str-01-mdf str-02 str-03 str-04 str-701 str-702 str-99 str-crtf str-manufact str-order str-tmp str-unit)

(setq cntr-1 0);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-01 (cdr (assoc 1 str-tmp))
				str-02 (cdr (assoc 2 str-tmp))
				str-03 (cdr (assoc 3 str-tmp))
				str-04 (cdr (assoc 4 str-tmp))
				str-99 (cdr (assoc 99 str-tmp))
	);setq
	
	
	(setvar "osmode" 6199)
	
	(setq pnt-ins (getpoint "\nУкажите точку вставки\n"));setq
	

	
	
	
	;;;;;;;/////////////////////////////////////////////////////////////
	(if (wcmatch str-01 "S 200,*")
		(setq str-701 "Выключатель автоматический"
				
					str-01-mdf (vl-string-left-trim "S 200, " str-01)
				
					str-702 (list (cons 1 str-01-mdf)
												(cons 2 (strcat "Iном. " str-02 "А")));list
											 
					str-order (list (cons 1 (strcat str-03 ", код заказа " str-04)) 
													(cons 2 ",") 
													(cons 3 nil));list
		);setq
	);if
	
	
	

	(setq str-manufact "ABB"
				str-unit "шт."
				str-crtf nil
	);setq
	
	(split-str-parts-spcf-01-general str-701 str-702 str-order str-manufact str-unit str-99 str-crtf pnt-ins) 
 
	(setq cntr-1 (+ cntr-1 1));setq
);repeat

(princ)
)
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в овш               ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun lecgv-101-04-cir-brk-abb-s200-01-general

(list-902 / cntr-1 pnt-ins str-00 str-01 str-02 str-03 str-04 str-05 str-06 str-701 str-702 str-703 str-99 str-tmp)

(setq cntr-1 0);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-01 (cdr (assoc 1 str-tmp))
				str-99 (cdr (assoc 99 str-tmp))
	);setq
	
	(setvar "osmode" 6199)
	
	(setq pnt-ins (getpoint "\nУкажите точку вставки\n"));setq

;	(if (vl-string-search "M UC" str-00)
;		(setq str-03 (strcat str-03 " (пост./перемен. ток)"));setq
;	);if
	
	;;;;;;;/////////////////////////////////////////////////////////////
	(if (= str-01 "Автомат")
		(setq str-02 (cdr (assoc 2 str-tmp))
					str-03 (cdr (assoc 3 str-tmp))
					str-04 (cdr (assoc 4 str-tmp))
					str-05 (cdr (assoc 5 str-tmp))
					str-06 (cdr (assoc 6 str-tmp))
					
					str-701 (strcat "Выключатель автоматический ABB " str-02 ", артикул " str-06 ", Iном. " str-03 ", " str-04 ", " str-05)	
		);setq
	);if
	
	
	
	
	

	;;;;;;;;;/////////
	(setq str-702 nil
				str-703 nil
	);setq

	(split-str-parts-lecgv-01-general str-701 str-702 str-703 str-99 pnt-ins);
	
	(setq cntr-1 (+ cntr-1 1));setq
);repeat

(princ)
)
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

