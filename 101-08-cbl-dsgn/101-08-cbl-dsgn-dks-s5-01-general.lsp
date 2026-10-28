;/////// ************************************************************ //////////////////////////////////////////////////////////////////////
;/////// ДКС, кабельные конструкции                                   //////////////////////////////////////////////////////////////////////
;/////// ************************************************************ //////////////////////////////////////////////////////////////////////
(defun 101-08-cbl-dsgn-dks-s5-01-general

( / adoc dcl-id list-01 list-01-read-file list-02 list-02-read-file list-03 list-03-read-file 
list-04 list-05 list-801 list-802 list-900 list-901 list-902 str-01 type-list)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object)))); start undo

(read-file-for-dialog-box-01 "101-08-cbl-dsgn-dks-s5-01-general.txt" 3)

(setq list-01 list-01-read-file
			list-801 list-02-read-file
			list-802 list-03-read-file
			
			str-01 "0"
			
			list-901 nil
			list-902 nil
);setq

(101-08-cbl-dsgn-dks-s5-01-general-str-01 str-01)

(if (< (setq dcl-id (load_dialog "dia-101-08-cbl-dsgn-dks-s5-01-general.dcl")) 0) ;ищем диалог
  (progn
    (alert "Не найден dcl-файл")
    (exit)
	);progn
);if

(if (not (new_dialog "dia_101_08_cbl_dsgn_dks_s5" dcl-id))
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
  				"(101-08-cbl-dsgn-dks-s5-01-general-str-01 str-01)"
  );srcat
);action_tile

(action_tile "txt-02"
  (strcat "(setq str-01 (get_tile \"txt-01\"))"
          "(setq str-02 (get_tile \"txt-02\"))"
  				"(101-08-cbl-dsgn-dks-s5-01-general-str-02 str-01 str-02)"
  );srcat
);action_tile

(action_tile "txt-03"
  (strcat "(setq str-03 (get_tile \"txt-03\"))"
  				"(101-08-cbl-dsgn-dks-s5-01-general-str-03 str-03)"
  );srcat
);action_tile

(action_tile "but1"
  (strcat "(tmp-filling-fields-101-08-cbl-dsgn-dks-s5-01-general)");strcat
);action_tile

(action_tile "but2"
  (strcat "(setq type-list \"lecgv\")"
          "(done_dialog)"
  );strcat
);action_tile

(action_tile "but3"
  (strcat "(setq type-list \"spcf\")"
          "(done_dialog)"
  );strcat
);action_tile

(action_tile "but5"
  (strcat"(setq str-901 (get_tile \"txt-901\"))"
  				"(item-delete-from-lists-901-902 str-901 list-901 list-902)"
  				"(setq list-901 list-901-new)"
  				"(setq list-902 list-902-new)"
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
	((= type-list "lecgv") (load "101-08-cbl-dsgn-dks-s5-lecgv.lsp") (101-08-cbl-dsgn-dks-s5-lecgv list-902));=
	((= type-list "spcf") (load "101-08-cbl-dsgn-dks-s5-spcf.lsp") (101-08-cbl-dsgn-dks-s5-spcf list-902));if
);if

(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(vla-endundomark adoc)
(princ)
)
;/////// ************************************************************ //////////////////////////////
;/////// конец                                                        //////////////////////////////
;/////// ************************************************************ //////////////////////////////


;;;;////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////
(defun 101-08-cbl-dsgn-dks-s5-01-general-str-01

(str-01 / list-01-read-file list-02-read-file list-03-read-file list-04-read-file list-900-dscr 
list-900-menu list-900-read-file name-file-1 name-item num-flds)

(setq name-item (nth (atoi str-01) list-01)
			name-file-1 (nth (atoi str-01) list-801)
			num-flds (atoi (nth (atoi str-01) list-802))
			list-05 nil
);setq

(read-file-for-dialog-box-01 name-file-1 num-flds)

(if (and (/= name-item "Крепление к потолку")
         (/= name-item "Консоль")
         (/= name-item "Профиль"))
  
  (setq list-02 list-01-read-file
	      list-03 list-02-read-file
        list-04 list-03-read-file
        list-05 list-04-read-file         
	);setq
);if

(if (or (= name-item "Крепление к потолку")
        (= name-item "Консоль")
        (= name-item "Профиль"))

  (progn
	  (setq list-02 list-01-read-file
	        name-file-1 (nth 0 list-02-read-file)
	        num-flds (atoi (nth 0 list-03-read-file))
	  );setq
	  
	  (read-file-for-dialog-box-01 name-file-1 num-flds)
	  
	  (setq list-03 list-01-read-file
	        list-04 list-02-read-file
          list-05 list-03-read-file     
	  );setq
	);progn
);if

(set_tile "ptxt-21" (nth 0 list-900-menu))
(set_tile "ptxt-22" (nth 1 list-900-menu))
(set_tile "ptxt-31" (nth 2 list-900-menu))
(set_tile "ptxt-32" (nth 3 list-900-menu))
(set_tile "ptxt-41" (nth 4 list-900-menu))
(set_tile "ptxt-42" (nth 5 list-900-menu))
(set_tile "ptxt-51" (nth 6 list-900-menu))
(set_tile "ptxt-52" (nth 7 list-900-menu))

(divide-text-into-parts list-900-dscr 195)

(setq list-900 list-900-read-file)

(list-filling "txt-02" list-02)
(list-filling "txt-03" list-03)
(list-filling "txt-04" list-04)
(list-filling "txt-05" list-05)
(list-filling "txt-900" list-900)

(set_tile "txt-02" "0")
(set_tile "txt-03" "0")
(set_tile "txt-04" "0")
(set_tile "txt-05" "0")

(princ)
)
;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun 101-08-cbl-dsgn-dks-s5-01-general-str-02

(str-01 str-02 / list-01-read-file list-02-read-file list-03-read-file list-900-dscr 
list-900-read-file name-file-1 name-item num-flds)

(setq name-item (nth (atoi str-01) list-01));setq

(if (and (/= name-item "Крепление к потолку")
         (/= name-item "Консоль")
         (/= name-item "Профиль"))
  (progn 
	  (set_tile "txt-03" str-02)
	  (set_tile "txt-04" str-02)
	);progn
	
  (progn
	  (setq name-file-1 (nth (atoi str-01) list-801)
	        num-flds (atoi (nth (atoi str-01) list-802))
	  );setq
	  
	  (read-file-for-dialog-box-01 name-file-1 num-flds)
	  
	  (setq name-file-1 (nth (atoi str-02) list-02-read-file)
	        num-flds (atoi (nth (atoi str-02) list-03-read-file))     
	  );setq
	  
	  (read-file-for-dialog-box-01 name-file-1 num-flds)
	  
	  (setq list-03 list-01-read-file
	        list-04 list-02-read-file
          list-05 list-03-read-file     
	  );setq
	  
	  (divide-text-into-parts list-900-dscr 195)

    (setq list-900 list-900-read-file)
	  
	  (list-filling "txt-03" list-03)
    (list-filling "txt-04" list-04)
    (list-filling "txt-05" list-05)
    (list-filling "txt-900" list-900)
    
    (set_tile "txt-03" "0")
    (set_tile "txt-04" "0")
    (set_tile "txt-05" "0")
	);progn
);if

(princ)
)
;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun 101-08-cbl-dsgn-dks-s5-01-general-str-03

(str-03)

(set_tile "txt-04" str-03)
(set_tile "txt-05" str-03)

(princ)
)
;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun tmp-filling-fields-101-08-cbl-dsgn-dks-s5-01-general

( / str-01 str-01-1 str-01-2 str-01-3 str-02 str-02-1 str-03 str-04 str-04-1 str-04-2 str-05 str-902)

(setq str-01 (nth (atoi (get_tile "txt-01")) list-01)
			str-02 (nth (atoi (get_tile "txt-02")) list-02)
			str-03 (nth (atoi (get_tile "txt-03")) list-03)
			str-04 (nth (atoi (get_tile "txt-04")) list-04)
			
			str-01-1 (substr str-01 1 (vl-string-search "," str-01))
);setq

(if (/= list-901 nil) 
	(setq list-901 (reverse list-901)
				list-902 (reverse list-902)
	);setq
);if

;;;;;;;///////////////////////////////////////////////////////////////
(if (wcmatch str-01 "Лоток перфорированный*")
  (progn
    (cond
      ((= str-01 "Лоток перфорированный, толщ. 1мм, исп. 1") (setq str-01-2 "толщина 1мм"));=
    );cond

	  (setq str-02 (strcat str-02 " (ВхШхД, мм)")
	        list-901 (vl-list* (strcat str-01 "  " str-02 "  Код " str-03) list-901)			
				
				  str-902 (list (cons 1 str-01-1) (cons 2 str-02) (cons 3 str-03) (cons 4 str-01-2) (cons 99 str-04))
	  );setq
  );progn
);if

;;;;;;;///////////////////////////////////////////////////////////////
(if (or (wcmatch str-01 "Угол*")
				(wcmatch str-01 "Ответвитель*")
		);or
	(setq str-02 (strcat str-02 " (ВхШ, мм)"));setq
);if


;;;;;;;///////////////////////////////////////////////////////////////
(if (wcmatch str-01 "Крышка лотка*")
	  (setq str-02 (strcat str-02 " (ШхД, мм)")
	
	      list-901 (vl-list* (strcat str-01 "  " str-02 "  Код " str-03) list-901)				
				str-01-2 (substr str-01 (+ (vl-string-search "," str-01) 3))				
				str-01-3 (substr str-01-2 (+ (vl-string-search "," str-01-2) 3))				
				str-01-2 (substr str-01-2 1 (vl-string-search "," str-01-2))			
				str-01-2 (vl-string-subst "толщина" "толщ." str-01-2)				
				
				str-902 (list (cons 1 str-01-1) (cons 2 str-02) (cons 3 str-03) (cons 4 str-01-2) (cons 5 str-01-3) (cons 99 str-04))
	  );setq
);if

;;;;;;;///////////////////////////////////////////////////////////////
(if (wcmatch str-01 "Угол*")
	(progn
		(if (vl-string-search "90" str-01)
			(setq str-01-2 "угол 90%%d")
		);if
		
		(if (vl-string-search "45" str-01)
			(setq str-01-2 "угол 45%%d")
		);if
		
		(if (vl-string-search "измен" str-01)
			(setq str-01-2 "угол изменяемый")
		);if

		(setq list-901 (vl-list* (strcat str-01 "  " str-02 "  Код " str-03) list-901)					
					str-902 (list (cons 1 str-01-1) (cons 2 str-02) (cons 3 str-03) (cons 4 str-01-2) (cons 99 str-04))
		);setq
	);progn
);if

;;;;;;;///////////////////////////////////////////////////////////////
(if (wcmatch str-01 "Ответвитель*")
	(setq list-901 (vl-list* (strcat str-01 "  " str-02 "  Код " str-03) list-901)					
				str-902 (list (cons 1 str-01-1) (cons 2 str-02) (cons 3 str-03) (cons 99 str-04))
	);setq
);if

;;;;;;;///////////////////////////////////////////////////////////////
(if (wcmatch str-01 "Крышка для*")
	(setq list-901 (vl-list* (strcat str-01 "  Ширина " str-02 "мм  Код " str-03) list-901)												
				str-02 (strcat "ширина " str-02 "мм")				
				str-902 (list (cons 1 str-01-1) (cons 2 str-02) (cons 3 str-03) (cons 99 str-04))
	);setq
);if

;;;;;;;///////////////////////////////////////////////////////////////
(if (wcmatch str-01 "Соединитель*")
	(setq list-901 (vl-list* (strcat str-01 "  Высота " str-02 "мм  Код " str-03) list-901)
									
				str-02 (strcat "высота " str-02 "мм")
					
				str-902 (list (cons 1 str-01-1) (cons 2 str-02) (cons 3 str-03) (cons 99 str-04))
	);setq
);if

;;;;;;;///////////////////////////////////////////////////////////////
(if (wcmatch str-01 "Консоль*")
	(setq str-05 (nth (atoi (get_tile "txt-05")) list-05)			
				str-04-1 (substr str-04 1 (- (vl-string-search "(" str-04) 1))
	      str-04-2 (substr str-04 (+ (vl-string-search "/" str-04) 2))
	
	      list-901 (vl-list* (strcat str-01 "  " str-02 "  Ширина " str-04-1 "мм  Нагрузка " str-04-2 "кг  Код " str-03) list-901)
        
        str-02-1 (substr str-02 1 (vl-string-search "," str-02))
	      str-04-1 (strcat "ширина " str-04-1 "мм")
	      str-04-2 (strcat "макс. нагрузка " str-04-2 "кг")

				str-902 (list (cons 1 str-01-1) (cons 2 str-02-1) (cons 3 str-03) (cons 41 str-04-1) (cons 42 str-04-2) (cons 99 str-05))
	);setq
);if

;;;;;;;///////////////////////////////////////////////////////////////
(if (wcmatch str-01 "Профиль*")
	(setq str-05 (nth (atoi (get_tile "txt-05")) list-05)
	      list-901 (vl-list* (strcat str-01 "  " str-02 "  L = " str-03 "мм  Код " str-04) list-901)
				
				str-02-1 (substr str-02 1 (vl-string-search "," str-02))				
				str-03 (strcat "длина " str-03 "мм")
				
				str-902 (list (cons 1 str-01-1) (cons 2 str-02-1) (cons 3 str-03) (cons 04 str-04) (cons 99 str-05))
	);setq
);if

;;;;;;;///////////////////////////////////////////////////////////////
(if (wcmatch str-01 "Переходник*")
	(setq list-901 (vl-list* (strcat str-01 "  " str-02 " (ВхШ1хШ2, мм)  Код " str-03) list-901)
									
				str-02 (strcat str-02 " (ВхШ1хШ2, мм)")
					
				str-902 (list (cons 1 str-01-1) (cons 2 str-02) (cons 3 str-03) (cons 99 str-04))
	);setq
);if

;;;;;;;///////////////////////////////////////////////////////////////
(if (wcmatch str-01 "Крепление к*")
	(setq list-901 (vl-list* (strcat str-01 "  " str-02 "  Код " str-03) list-901)
									
				str-02-1 (substr str-02 1 (vl-string-search "," str-02))
					
				str-902 (list (cons 1 str-01) (cons 2 str-02-1) (cons 3 str-03) (cons 99 str-04))
	);setq
);if

;;;;;;;///////////////////////////////////////////////////////////////
(if (= str-01 "Перегородка SEP, исп. 1")
	(setq str-02 (strcat str-02 " (ВхД, мм)")
	      list-901 (vl-list* (strcat str-01 "  " str-02 "  Код " str-03) list-901)					
				str-902 (list (cons 1 str-01-1) (cons 2 str-02) (cons 3 str-03) (cons 99 str-04))
	);setq
);if

(setq list-902 (vl-list* str-902 list-902)
			list-902 (reverse list-902)
			list-901 (reverse list-901)
);setq

(list-filling "txt-901" list-901)

(princ)
)
;;;;////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////