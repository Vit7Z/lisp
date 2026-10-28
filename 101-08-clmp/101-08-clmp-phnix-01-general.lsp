;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////                                                              ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun 101-08-clmp-phnix-01-general

( / adoc dcl-id list-01 list-01-read-file list-02 list-02-read-file list-03 list-03-read-file list-04 list-05 list-06 list-07 list-08 list-801 list-802 list-900 list-901 
list-902 str-01 type-list)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(setq	list-901 nil
      list-902 nil
      list-900 nil
      
			str-01 "0"
);setq

(read-file-for-dialog-box-01 "101-08-clmp-phnix-01-general.txt" 3)

(setq list-01 list-01-read-file
			list-801 list-02-read-file
			list-802 list-03-read-file
);setq

(txt-01-101-08-clmp-phnix-01-general str-01)

(if (< (setq dcl-id (load_dialog "dia-101-08-clmp-phnix-01-general.dcl")) 0) ;ищем диалог
	(progn
		(alert "Не найден dcl-файл")
		(exit)
	);progn
);if

(if (not (new_dialog "dia_101_clmp_phnix_cnt_01_general" dcl-id))
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
(list-filling "txt-900" list-900)

(set_tile "txt-01" "0")
(set_tile "txt-02" "0")
(set_tile "txt-03" "0")
(set_tile "txt-04" "0")
(set_tile "txt-05" "0")
(set_tile "txt-06" "0")
(set_tile "txt-07" "0")
(set_tile "txt-08" "0")

(action_tile "txt-01" 
	(strcat "(setq str-01 (get_tile \"txt-01\"))"
					"(txt-01-101-08-clmp-phnix-01-general str-01)"
	);strcat
);action_tile

(action_tile "txt-02" 
	(strcat "(txt-02-101-08-clmp-phnix-01-general)")
);action_tile

(action_tile "txt-05" 
	(strcat "(txt-05-101-08-clmp-phnix-01-general)")
);action_tile

(action_tile "txt-07" 
	(strcat "(txt-07-101-08-clmp-phnix-01-general)")
);action_tile

(action_tile "but1" 
	(strcat "(but1-101-08-clmp-phnix-01-general)")
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
	((= type-list "le") (load "d:\\mcloud\\my-sprt\\101-08-clmp\\101-08-clmp-phnix-01-general-le.lsp") (101-08-clmp-phnix-01-general-le list-902));=
	((= type-list "spcf") (load "d:\\mcloud\\my-sprt\\101-08-clmp\\101-08-clmp-phnix-01-general-spcf.lsp") (101-08-clmp-phnix-01-general-spcf list-902));=
	((= type-list "lecgv") (load "d:\\mcloud\\my-sprt\\101-08-clmp\\101-08-clmp-phnix-01-general-lecgv.lsp") (101-08-clmp-phnix-01-general-lecgv list-902));=
);cond

(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(vla-endundomark adoc)
(gc)
(princ)
)
;/////// *************************************************************///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// КОНЕЦ ПРОГРАММЫ                                              ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// *************************************************************///////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun txt-01-101-08-clmp-phnix-01-general

(str-01 / list-01-read-file list-02-read-file list-03-read-file list-04-read-file list-05-read-file list-06-read-file list-07-read-file list-900-dscr list-900-menu 
list-900-read-file name-file-1 num-flds)

(setq name-file-1 (nth (atoi str-01) list-801)
			num-flds (atoi (nth (atoi str-01) list-802))
);setq

(read-file-for-dialog-box-01 name-file-1 num-flds)

;;;;;;;интерфейс////////////////////////////////////////////////////////////////////////////////////
(set_tile "mln-41" (nth 0 list-900-menu))
(set_tile "mln-42" (nth 1 list-900-menu))

(set_tile "mln-51" (nth 2 list-900-menu))
(set_tile "mln-52" (nth 3 list-900-menu))

(set_tile "mln-61" (nth 4 list-900-menu))
(set_tile "mln-62" (nth 5 list-900-menu))

(set_tile "mln-71" (nth 6 list-900-menu))
(set_tile "mln-72" (nth 7 list-900-menu))

(set_tile "mln-81" (nth 8 list-900-menu))
(set_tile "mln-82" (nth 9 list-900-menu))

(setq list-02 list-01-read-file
			list-03 list-02-read-file
			list-04 list-03-read-file
			list-05 list-04-read-file
			list-06 list-05-read-file
			list-07 list-06-read-file
			list-08 list-07-read-file
);setq

(if (/= list-900-dscr nil)
	(progn
		(divide-text-into-parts list-900-dscr 220)
		(setq list-900 list-900-read-file);setq
	);progn
);if

(list-filling "txt-02" list-02)
(list-filling "txt-03" list-03)
(list-filling "txt-04" list-04)
(list-filling "txt-05" list-05)
(list-filling "txt-06" list-06)
(list-filling "txt-07" list-07)
(list-filling "txt-08" list-08)
(list-filling "txt-900" list-900)

(set_tile "txt-02" "0")
(set_tile "txt-03" "0")
(set_tile "txt-04" "0")
(set_tile "txt-05" "0")
(set_tile "txt-06" "0")
(set_tile "txt-07" "0")
(set_tile "txt-08" "0")

(princ)
)
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun txt-02-101-08-clmp-phnix-01-general

( / str-01 str-02 str-02-01)

(setq str-01 (nth (atoi (get_tile "txt-01")) list-01)
			str-02 (get_tile "txt-02")
			str-02-01 (nth (atoi (get_tile "txt-02")) list-02)
);setq


(if (or (= str-01 "Клемма Проходная")
			(= str-01 "Клемма Защитного провода")
			(= str-01 "Клемма С предохранителем")
			(= str-01 "Клемма Электротехническая")
			(= str-01 "Наконечник кабельный")
			(= str-01 "Стопор концевой")
			(= str-01 "Соединитель поперечный")
		);or
		
	(progn
  	(set_tile "txt-03" str-02)
    (set_tile "txt-04" str-02)
    (set_tile "txt-05" str-02)
    (set_tile "txt-06" str-02)
    (set_tile "txt-07" str-02)
    (set_tile "txt-08" str-02)
	);progn	
);if

(if (and (= str-01 "Планка Zack (маркировка клемм)") (wcmatch str-02-01 "ZB #:UNBEDRUCKT"));and
	(progn
		(setq list-07 nil
					list-08 nil
		);setq
		
		(list-filling "txt-07" list-07)
		(list-filling "txt-08" list-08)
		
		(set_tile "txt-03" str-02)
  	(set_tile "txt-04" str-02)
    (set_tile "txt-05" str-02)
    (set_tile "txt-06" str-02)
		(set_tile "txt-07" str-02)
		(set_tile "txt-08" str-02)
		(set_tile "txt-09" str-02)
	);progn	
);if


(if (and (= str-01 "Планка Zack (маркировка клемм)") (wcmatch str-02-01 "ZB # QR:FORTL.ZAHLEN"));and
	(progn
  	(setq list-07 (list "1...10" "11...20" "21...30" "31...40" "41...50" "51...60" "61...70" "71...80" "81...90" "91...100")
					list-08 (list ":0001" ":0011" ":0021" ":0031" ":0041" ":0051" ":0061" ":0071" ":0081" ":0091")							
  	);setq
												
  	(list-filling "txt-07" list-07)
  	(list-filling "txt-08" list-08)
  	
  	(set_tile "txt-03" str-02)
    (set_tile "txt-04" str-02)
    (set_tile "txt-05" str-02)
    (set_tile "txt-06" str-02)
    (set_tile "txt-07" "0")
		(set_tile "txt-08" "0")
		(set_tile "txt-09" str-02)
	);progn	
);if

(if (or (= str-01 "Пластина разделительная")
		);or
		
	(set_tile "txt-03" str-02)
);if



(princ)
)
;;;;//////////////////////////////////////////////////////////////////////////////////////
;;;;//////////////////////////////////////////////////////////////////////////////////////


;;;;//////////////////////////////////////////////////////////////////////////////////////
;;;;//////////////////////////////////////////////////////////////////////////////////////
(defun txt-05-101-08-clmp-phnix-01-general

( / str-01 str-05)

(setq str-01 (nth (atoi (get_tile "txt-01")) list-01)
			str-05 (get_tile "txt-05")
);setq

(if (or (= str-01 "Клемма Проходная")
				(= str-01 "Клемма Защитного провода")
				(= str-01 "Клемма С предохранителем")
				(= str-01 "Клемма Электротехническая"));or
		
	(progn
  	(set_tile "txt-02" str-05)
    (set_tile "txt-03" str-05)
    (set_tile "txt-04" str-05)
    (set_tile "txt-06" str-05)
    (set_tile "txt-07" str-05)
    (set_tile "txt-08" str-05)
    (set_tile "txt-09" str-05)
	);progn	
);if

(princ)
)
;;;;//////////////////////////////////////////////////////////////////////////////////////
;;;;//////////////////////////////////////////////////////////////////////////////////////



;;;;//////////////////////////////////////////////////////////////////////////////////////
;;;;//////////////////////////////////////////////////////////////////////////////////////
(defun txt-07-101-08-clmp-phnix-01-general

( / str-00 str-01 str-05)

(setq str-01 (nth (atoi (get_tile "txt-01")) list-01)
			str-02 (nth (atoi (get_tile "txt-02")) list-02)
			str-07 (get_tile "txt-07")
);setq

(if (and (= str-01 "Планка Zack (маркировка клемм)") (wcmatch str-02 "ZB # QR:FORTL.ZAHLEN"));and
	(set_tile "txt-08" str-07)
);if



(princ)
)
;;;;////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////


;;;;////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////
(defun but1-101-08-clmp-phnix-01-general

( / str-00 str-01 str-02 str-03 str-04 str-04-01 str-04-02 str-05 str-06 str-07 str-08 tmp-list-902)

(setq str-01 (nth (atoi (get_tile "txt-01")) list-01)
			str-02 (nth (atoi (get_tile "txt-02")) list-02)
			str-03 (nth (atoi (get_tile "txt-03")) list-03)
);setq

(if (/= list-901 nil) 
	(setq list-901 (reverse list-901)
			list-902 (reverse list-902)
	);setq
);if


;;;;;;;/////////////////////////////////////////////////////////////////////////////////////////////
(if (or (= str-01 "Клемма Проходная")
				(= str-01 "Клемма Защитного провода")
				(= str-01 "Клемма С предохранителем")
				(= str-01 "Клемма Электротехническая")
		);or
	(setq str-04 (nth (atoi (get_tile "txt-04")) list-04)
				str-04-01 (substr str-04 1 1)
				str-04-02 (substr str-04 4)					
				str-05 (nth (atoi (get_tile "txt-05")) list-05)
				str-06 (nth (atoi (get_tile "txt-06")) list-06)
				str-08 (nth (atoi (get_tile "txt-08")) list-08)

				list-901 (vl-list* (strcat str-01 "  " str-02 "  Ширина " str-04-02 "мм  " str-05 "мм2  " str-06 "  " str-08) list-901)
		
				tmp-list-902 (list (cons 1 str-01) (cons 2 str-02) (cons 3 str-03) (cons 4 str-04-02) (cons 5 str-05) (cons 6 str-06) (cons 7 str-08) (cons 99 "0,007"))
	);setq
);if

;;;;;;;/////////////////////////////////////////////////////////////////////////////////////////////
(if (or (= str-01 "Наконечник кабельный")

		);or
	(setq str-04 (nth (atoi (get_tile "txt-04")) list-04)
				str-05 (nth (atoi (get_tile "txt-05")) list-05)
				str-06 (nth (atoi (get_tile "txt-06")) list-06)

				list-901 (vl-list* (strcat str-01 "  " str-02 "  " str-04 " мм2  " str-05 "  Длина гильзы " str-06 "мм") list-901)
		
				tmp-list-902 (list (cons 1 str-01) (cons 2 str-02) (cons 3 str-03) (cons 4 str-04) (cons 5 str-05) (cons 6 str-06) (cons 99 "0,002"))
	);setq
);if

;;;;;;;/////////////////////////////////////////////////////////////////////////////////////////////
(if (or (= str-01 "Стопор концевой")

		);or
	(setq str-04 (nth (atoi (get_tile "txt-04")) list-04)
				str-05 (nth (atoi (get_tile "txt-05")) list-05)
				
				list-901 (vl-list* (strcat str-01 "  " str-02 "  " str-04 "  " str-05) list-901)
		
				tmp-list-902 (list (cons 1 str-01) (cons 2 str-02) (cons 3 str-03) (cons 4 str-04) (cons 5 str-05) (cons 99 "0,002"))		
	);setq
);if
      							 
;;;;;;;/////////////////////////////////////////////////////////////////////////////////////////////здесь закончил!!!!!!!!!!!!!!!!
(if (or (= str-01 "Планка Zack (маркировка клемм)")

		);or
	(progn
		(setq str-04 (nth (atoi (get_tile "txt-04")) list-04)
				str-05 (nth (atoi (get_tile "txt-05")) list-05)
		);setq

		(if (wcmatch str-02 "ZB #:UNBEDRUCKT")
			(setq list-901 (vl-list* (strcat str-01 "  " str-02 "  Артикул " str-03 "  " str-05) list-901)
		
					tmp-list-902 (list (cons 1 str-01) (cons 2 str-02) (cons 3 str-03) (cons 5 (strcase str-05 1)) (cons 99 "0,001"))						
			);setq
		);if

		(if (wcmatch str-02 "ZB # QR:FORTL.ZAHLEN")
			(setq str-07 (nth (atoi (get_tile "txt-07")) list-07)
					str-08 (nth (atoi (get_tile "txt-08")) list-08)
					str-03 (strcat str-03 str-08)

					list-901 (vl-list* (strcat str-01 "  " str-02 "  Артикул " str-03 "  Располож. " str-05 "  Цифры " str-07) list-901)
		
					tmp-list-902 (list (cons 1 str-01) (cons 2 str-02) (cons 3 str-03) (cons 5 (strcase str-05 1)) (cons 7 str-07) (cons 99 "0,001"))
			);setq
		);if
	);progn	
);if

;;;;;;;/////////////////////////////////////////////////////////////////////////////////////////////
(if (= str-01 "Соединитель поперечный")
	(setq str-04 (nth (atoi (get_tile "txt-04")) list-04)
			str-05 (nth (atoi (get_tile "txt-05")) list-05)

			list-901 (vl-list* (strcat str-01 "  " str-02 "  " str-04 "  Контактов " str-05) list-901)
		
			tmp-list-902 (list (cons 1 str-01) (cons 2 str-02) (cons 3 str-03) (cons 4 str-04) (cons 5 str-05) (cons 99 "0,002"))
	);setq
);if

;;;;;;;/////////////////////////////////////////////////////////////////////////////////////////////
(if (or (= str-01 "Держатель маркировочных полос")

		);or
	(setq str-04 (nth (atoi (get_tile "txt-04")) list-04)
			list-901 (vl-list* (strcat str-01 "  " str-02 "  Размер поля " str-04 "мм") list-901)
		
			tmp-list-902 (list (cons 1 str-01) (cons 2 str-02) (cons 3 str-03) (cons 4 str-04) (cons 99 "0,001"))
	);setq
);if

;;;;;;;/////////////////////////////////////////////////////////////////////////////////////////////
(if (or (= str-01 "Полоса маркировочная"));or
	(setq str-04 (nth (atoi (get_tile "txt-04")) list-04)
			str-05 (nth (atoi (get_tile "txt-05")) list-05)
			str-06 (nth (atoi (get_tile "txt-06")) list-06)
		
			list-901 (vl-list* (strcat str-01 "  " str-02 "  " str-04 "  " str-05 "  Размер маркировочного поля " str-06 "мм") list-901)
		
			tmp-list-902 (list (cons 1 str-01) (cons 2 str-02) (cons 3 str-03) (cons 4 str-04) (cons 5 str-05) (cons 6 str-06) (cons 99 "0,001"))
	);setq
);if

;;;;;;;/////////////////////////////////////////////////////////////////////////////////////////////
(if (or (= str-01 "Пластина разделительная")

		);or
	(setq list-901 (vl-list* (strcat str-01 "  " str-02) list-901)
		
				tmp-list-902 (lis (cons 1 str-01) (cons 2 str-02) (cons 99 "0,002"))				
	);setq
);if


(setq list-902 (vl-list* tmp-list-902 list-902)
			list-901 (reverse list-901)
			list-902 (reverse list-902)
);setq

(list-filling "txt-901" list-901)

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////