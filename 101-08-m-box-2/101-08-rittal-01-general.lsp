;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////                                                              ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun 101-08-rittal-01-general

( / adoc dcl-id list-01 list-01-read-file list-02 list-02-read-file list-03 list-03-read-file list-04 list-05 list-06 list-07 list-801 list-802 list-900 list-901 list-902 
str-01 type-list)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(setq	list-901 nil
      list-902 nil
      list-900 nil
      
			str-01 "0"
);setq

(read-file-for-dialog-box-01 "101-08-rittal-01-general.txt" 3)

(setq list-01 list-01-read-file
			list-801 list-02-read-file
			list-802 list-03-read-file
);setq

(start-101-08-rittal-01-general str-01)

(if (< (setq dcl-id (load_dialog "dia-101-08-rittal-01-general.dcl")) 0) ;ищем диалог
		(progn
			(alert "Не найден dcl-файл")
			(exit)
		);progn
);if

(if (not (new_dialog "dia_101_08_rittal_01" dcl-id))
		(exit)
);if

(list-filling "txt-01" list-01)
(list-filling "txt-02" list-02)
(list-filling "txt-03" list-03)
(list-filling "txt-04" list-04)
(list-filling "txt-05" list-05)
(list-filling "txt-06" list-06)
(list-filling "txt-07" list-07)
(list-filling "txt-900" list-900)

(set_tile "txt-01" "0")
(set_tile "txt-02" "0")
(set_tile "txt-03" "0")
(set_tile "txt-04" "0")
(set_tile "txt-05" "0")
(set_tile "txt-06" "0")
(set_tile "txt-07" "0")

(action_tile "txt-01"
  (strcat "(setq str-01 (get_tile \"txt-01\"))"
  				"(start-101-08-rittal-01-general str-01)");srcat
);action_tile

(action_tile "txt-02"
  (strcat "(set_tile \"txt-03\" $value)"
          "(set_tile \"txt-04\" $value)"
          "(set_tile \"txt-05\" $value)"    
          "(set_tile \"txt-06\" $value)"     
          "(set_tile \"txt-07\" $value)"
  );srcat
);action_tile

(action_tile "txt-03"
  (strcat "(set_tile \"txt-01\" $value)"
          "(set_tile \"txt-02\" $value)"
          "(set_tile \"txt-04\" $value)"
          "(set_tile \"txt-05\" $value)"   
          "(set_tile \"txt-06\" $value)"      
  );srcat
);action_tile

(action_tile "txt-04"
  (strcat "(set_tile \"txt-01\" $value)"
          "(set_tile \"txt-02\" $value)"
          "(set_tile \"txt-03\" $value)"
          "(set_tile \"txt-05\" $value)"   
          "(set_tile \"txt-06\" $value)"      
  );srcat
);action_tile

(action_tile "txt-05"
  (strcat "(set_tile \"txt-01\" $value)"
          "(set_tile \"txt-02\" $value)"
          "(set_tile \"txt-03\" $value)"
          "(set_tile \"txt-04\" $value)" 
          "(set_tile \"txt-06\" $value)"        
  );srcat
);action_tile

(action_tile "txt-06"
  (strcat "(set_tile \"txt-01\" $value)"
          "(set_tile \"txt-02\" $value)"
          "(set_tile \"txt-03\" $value)"
          "(set_tile \"txt-04\" $value)" 
          "(set_tile \"txt-05\" $value)"        
  );srcat
);action_tile

(action_tile "but1"
  (strcat "(filling-fields-101-08-rittal-01-general)");strcat
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
	((= type-list "spcf") (load "d:\\mcloud\\my-sprt\\101-08-m-box-2\\101-08-rittal-01-general-spcf.lsp") (101-08-rittal-01-general-spcf list-902));=
	((= type-list "lecgv") (load "d:\\mcloud\\my-sprt\\101-08-m-box-2\\101-08-rittal-03-lecgv.lsp") (101-08-rittal-03-lecgv list-902));=
);cond

(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(vla-endundomark adoc)
(princ)
)
;/////// конец программы ///////

;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun start-101-08-rittal-01-general

(str-01 / list-01-read-file list-02-read-file list-03-read-file list-04-read-file list-05-read-file list-06-read-file list-900-dscr list-900-menu list-900-read-file name-file-1 num-flds)

(setq name-file-1 (nth (atoi str-01) list-801)
			num-flds (atoi (nth (atoi str-01) list-802))
);setq

;;;;;;;интерфейс
(read-file-for-dialog-box-01 name-file-1 num-flds)

(set_tile "ml-21" (nth 0 list-900-menu))
(set_tile "ml-22" (nth 1 list-900-menu))
(set_tile "ml-23" (nth 2 list-900-menu))

(set_tile "ml-31" (nth 3 list-900-menu))
(set_tile "ml-32" (nth 4 list-900-menu))
(set_tile "ml-33" (nth 5 list-900-menu))

(set_tile "ml-41" (nth 6 list-900-menu))
(set_tile "ml-42" (nth 7 list-900-menu))
(set_tile "ml-43" (nth 8 list-900-menu))

(set_tile "ml-51" (nth 9 list-900-menu))
(set_tile "ml-52" (nth 10 list-900-menu))
(set_tile "ml-53" (nth 11 list-900-menu))

(set_tile "ml-61" (nth 12 list-900-menu))
(set_tile "ml-62" (nth 13 list-900-menu))
(set_tile "ml-63" (nth 14 list-900-menu))

(set_tile "ml-71" (nth 15 list-900-menu))
(set_tile "ml-72" (nth 16 list-900-menu))
(set_tile "ml-73" (nth 17 list-900-menu))

(setq list-02 list-01-read-file
			list-03 list-02-read-file
			list-04 list-03-read-file
			list-05 list-04-read-file
			list-06 list-05-read-file
			list-07 list-06-read-file
);setq

(divide-text-into-parts list-900-dscr 178)

(setq list-900 list-900-read-file);setq

(list-filling "txt-02" list-02)
(list-filling "txt-03" list-03)
(list-filling "txt-04" list-04)
(list-filling "txt-05" list-05)
(list-filling "txt-06" list-06)
(list-filling "txt-07" list-07)
(list-filling "txt-900" list-900)

(set_tile "txt-02" "0")
(set_tile "txt-03" "0")
(set_tile "txt-04" "0")
(set_tile "txt-05" "0")
(set_tile "txt-06" "0")
(set_tile "txt-07" "0")

(princ)
)
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма формирования данных///////////////////////////////////////////////////////////////////////////////
(defun filling-fields-101-08-rittal-01-general

( / str-01 str-02 str-03 str-04 str-05 str-06 str-07 str-99 tmp-list-902)

(setq str-01 (nth (atoi (get_tile "txt-01")) list-01));setq

(if (/= list-901 nil) 
	(setq list-901 (reverse list-901)
				list-902 (reverse list-902)
	);setq
);if

(setq str-02 (nth (atoi (get_tile "txt-02")) list-02));setq

(if (= "Корпус шкафа" str-01)
	(setq str-03 (nth (atoi (get_tile "txt-03")) list-03)
				str-99 (nth (atoi (get_tile "txt-05")) list-05)
				str-06 (nth (atoi (get_tile "txt-06")) list-06)
				
				list-901 (vl-list* (strcat str-01 "  (ШхВхГ, мм) " str-02 "  Арт. " str-03 "  Цвет " str-06) list-901)
				tmp-list-902 (list (cons 1 str-01) (cons 2 str-03) (cons 3 str-02) (cons 99 str-99) (cons 4 str-06))
	);setq
);if

(if (= "Стенки боковые" str-01) 
	(setq str-03 (nth (atoi (get_tile "txt-03")) list-03)
				str-99 (nth (atoi (get_tile "txt-04")) list-04)
				str-05 (nth (atoi (get_tile "txt-05")) list-05)
				
				list-901 (vl-list* (strcat str-01 "  (ВхГ, мм) " str-02 "  Арт. " str-03 "  Цвет " str-05) list-901)
				tmp-list-902 (list (cons 1 str-01) (cons 2 str-03) (cons 3 str-02) (cons 4 str-05) (cons 99 str-99))
	);setq
);if

(if (= "Ручка для двери" str-01) 
	(setq str-03 (nth (atoi (get_tile "txt-03")) list-03)
				str-04 (nth (atoi (get_tile "txt-04")) list-04)
				str-06 (nth (atoi (get_tile "txt-06")) list-06)
				str-99 (nth (atoi (get_tile "txt-07")) list-07)
				
				list-901 (vl-list* (strcat str-01 "  Арт. " str-02 "  Цвет " str-06 "  Совместимость с " str-03 "  " str-04) list-901)
				tmp-list-902 (list (cons 1 str-01) (cons 2 str-02) (cons 6 str-06) (cons 99 str-99))
	);setq
);if

(if (= "Замок для двери" str-01)
	(setq str-99 (nth (atoi (get_tile "txt-07")) list-07)
				
				list-901 (vl-list* (strcat str-01 "  артикул " str-02) list-901)
				tmp-list-902 (list (cons 1 str-01) (cons 2 str-02) (cons 99 str-99))
	);setq
);if

(if (= "Карман для документации" str-01)
	(setq str-03 (nth (atoi (get_tile "txt-03")) list-03)
				str-04 (nth (atoi (get_tile "txt-04")) list-04)
				str-99 (nth (atoi (get_tile "txt-05")) list-05)
				
				list-901 (vl-list* (strcat str-01 "  Ширина двери " str-02 "  Глубина " str-04 "мм  Артикул " str-03) list-901)
				tmp-list-902 (list (cons 1 str-01) (cons 2 str-02) (cons 3 str-03) (cons 4 str-04) (cons 99 str-99))
	);setq
);if

(if (= "Цоколь, эл. передние и задние" str-01)
	(setq str-03 (nth (atoi (get_tile "txt-03")) list-03)
				str-04 (nth (atoi (get_tile "txt-04")) list-04)
				str-99 (nth (atoi (get_tile "txt-06")) list-06)
				str-07 (nth (atoi (get_tile "txt-07")) list-07)
				
				list-901 (vl-list* (strcat str-01 " Высота " str-03 "мм  Ширина шкафа " str-02 "мм  Арт. " str-04 "  Цвет " str-07) list-901)
				tmp-list-902 (list (cons 1 str-01) (cons 2 str-02) (cons 3 str-03) (cons 4 str-04) (cons 7 str-07) (cons 99 str-99))
	);setq
);if

(if (= "Цоколь, эл. боковые" str-01)
	(setq str-03 (nth (atoi (get_tile "txt-03")) list-03)
				str-04 (nth (atoi (get_tile "txt-04")) list-04)
				str-99 (nth (atoi (get_tile "txt-06")) list-06)
				str-07 (nth (atoi (get_tile "txt-07")) list-07)
				
				list-901 (vl-list* (strcat str-01 " Высота " str-03 "мм  Глубина шкафа " str-02 "мм  Арт. " str-04 "  Цвет " str-07) list-901)
				tmp-list-902 (list (cons 1 str-01) (cons 2 str-02) (cons 3 str-03) (cons 4 str-04) (cons 7 str-07) (cons 99 str-99))
	);setq
);if

(if (= "Шина заземления" str-01)
	(setq str-03 (nth (atoi (get_tile "txt-03")) list-03)
				str-99 (nth (atoi (get_tile "txt-04")) list-04)
				
				list-901 (vl-list* (strcat str-01 "  Для шкафа (Ш или Г) " str-02 "мм  Арт. " str-03) list-901)
				tmp-list-902 (list (cons 1 str-01) (cons 2 str-02) (cons 3 str-03) (cons 99 str-99))	
	);setq
);if

(if (= "Полка приборная" str-01)
	(setq str-03 (nth (atoi (get_tile "txt-03")) list-03)
				str-04 (nth (atoi (get_tile "txt-04")) list-04)
				str-99 (nth (atoi (get_tile "txt-06")) list-06)
				
				list-901 (vl-list* (strcat str-01 "  Для ширины шкафа " str-02 "мм  Арт. " str-03 "  Глубина " str-04 "мм") list-901)
				tmp-list-902 (list (cons 1 str-01) (cons 2 str-02) (cons 3 str-03) (cons 4 str-04) (cons 99 str-99))
	);setq
);if

(if (= "Направляющие (для полки приборн.)" str-01)
	(setq str-03 (nth (atoi (get_tile "txt-03")) list-03)
				str-99 (nth (atoi (get_tile "txt-05")) list-05)
				
				list-901 (vl-list* (strcat str-01 "  Для полки глубиной " str-02 "мм  Арт. " str-03) list-901)
				tmp-list-902 (list (cons 1 str-01) (cons 2 str-02) (cons 3 str-03) (cons 99 str-99))
	);setq
);if

(if (= "Шасси системные" str-01)
	(setq str-03 (nth (atoi (get_tile "txt-03")) list-03)
				str-99 (nth (atoi (get_tile "txt-05")) list-05)
				
				list-901 (vl-list* (strcat str-01 "  Для шкафа (Ш или Г) " str-02 "мм  Арт. " str-03) list-901)
				tmp-list-902 (list (cons 1 str-01) (cons 2 str-02) (cons 3 str-03) (cons 99 str-99))
	);setq
);if

(if (= "Шина кабельная 30/15" str-01)
	(setq str-03 (nth (atoi (get_tile "txt-03")) list-03)
				str-99 (nth (atoi (get_tile "txt-04")) list-04)
				str-05 (nth (atoi (get_tile "txt-06")) list-05)
				
				list-901 (vl-list* (strcat str-01 "  Для шкафа (Ш или Г) " str-02 "мм  Арт. " str-03 "  " str-05) list-901)
				tmp-list-902 (list (cons 1 str-01) (cons 2 str-02) (cons 3 str-03) (cons 5 str-05) (cons 99 str-99))	
	);setq
);if

(if (= "Зажим для кабеля (крепл. к шине 30/15)" str-01)
	(setq str-03 (nth (atoi (get_tile "txt-03")) list-03)
				str-04 (nth (atoi (get_tile "txt-04")) list-04)
				str-99 (nth (atoi (get_tile "txt-05")) list-05)
	
				list-901 (vl-list* (strcat str-01 ", диаметр кабеля " str-02 "мм  Арт. " str-03) list-901)
				tmp-list-902 (list (cons 1 str-01) (cons 2 str-02) (cons 3 str-03) (cons 99 str-99))
	);setq
);if

(if (or (= "Держатель (для шины 30/15)" str-01)
				(= "Держатель (для кабеля)" str-01));or
	(setq str-99 (nth (atoi (get_tile "txt-03")) list-03)
	
				list-901 (vl-list* (strcat str-01 "  " str-02) list-901)
				tmp-list-902 (list (cons 1 str-01) (cons 2 str-02) (cons 99 str-99))
	);setq
);if

(if (= "Панель для ввода кабеля" str-01)
	(setq str-03 (nth (atoi (get_tile "txt-03")) list-03)
				str-04 (nth (atoi (get_tile "txt-04")) list-04)
				str-99 (nth (atoi (get_tile "txt-05")) list-05)
	
				list-901 (vl-list* (strcat str-01 "  " str-02 "  Ширина шкафа " str-03 "  Кол. вырезов " str-04) list-901)
				tmp-list-902 (list (cons 1 str-01) (cons 2 str-02) (cons 3 str-03) (cons 99 str-99))
	);setq
);if

(if (= "Кабельный ввод" str-01)
	(setq str-03 (nth (atoi (get_tile "txt-03")) list-03)
				str-04 (nth (atoi (get_tile "txt-04")) list-04)
				str-99 (nth (atoi (get_tile "txt-05")) list-05)
	
				list-901 (vl-list* (strcat str-01 "  " str-02 "  Макс. диаметр кабеля " str-03 "  Кол. кабелей на 1 ввод " str-04) list-901)
				tmp-list-902 (list (cons 1 str-01) (cons 2 str-02) (cons 3 str-03) (cons 4 str-04) (cons 99 str-99))
	);setq
);if

(setq list-901 (reverse list-901)
			list-902 (vl-list* tmp-list-902 list-902)
			list-902 (reverse list-902)
);setq

(list-filling "txt-901" list-901)

(princ)
)
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////