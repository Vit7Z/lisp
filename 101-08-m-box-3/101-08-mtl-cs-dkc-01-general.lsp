;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////                                                              ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun 101-08-mtl-cs-dkc-01-general

( / adoc dcl-id list-01 list-01-read-file list-02 list-02-read-file list-03 list-03-read-file list-04 list-05 list-06 list-07 list-801 list-802 list-900 list-901 list-902 
str-01 type-list)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(setq	list-901 nil
      list-902 nil
      list-900 nil
      
			str-01 "0"
);setq

(read-file-for-dialog-box-01 "101-08-mtl-cs-dkc-01-general.txt" 3)

(setq list-01 list-01-read-file
			list-801 list-02-read-file
			list-802 list-03-read-file
);setq

(start-101-08-mtl-cs-dkc-01-general str-01)

(if (< (setq dcl-id (load_dialog "dia-101-08-mtl-cs-dkc-01-general.dcl")) 0) ;ищем диалог
	(progn
		(alert "Не найден dcl-файл")
		(exit)
	);progn
);if

(if (not (new_dialog "dia_101_08_dkc_01" dcl-id))
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

(action_tile "txt-01"
  (strcat "(setq str-01 (get_tile \"txt-01\"))"
  				"(start-101-08-mtl-cs-dkc-01-general str-01)");srcat
);action_tile

(action_tile "txt-02"
  (strcat "(set_tile \"txt-03\" $value)"
          "(set_tile \"txt-04\" $value)"
          "(set_tile \"txt-05\" $value)"    
          "(set_tile \"txt-06\" $value)"     
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
  (strcat "(filling-fields-101-08-mtl-cs-dkc-01-general)");strcat
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
	((= type-list "spcf") (load "d:\\yandexdisk\\my-sprt\\101-08-m-box-3\\101-08-dkc-01-spcf.lsp") (101-08-dkc-01-spcf list-902));=
	((= type-list "lecgv") (load "d:\\yandexdisk\\my-sprt\\101-08-m-box-3\\101-08-mtl-cs-dkc-01-lecgv.lsp") (101-08-mtl-cs-dkc-01-lecgv list-902));=
);cond

(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(vla-endundomark adoc)
(princ)
)
;/////// конец программы ///////

;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun start-101-08-mtl-cs-dkc-01-general

(str-01 / list-01-read-file list-02-read-file list-03-read-file list-04-read-file list-05-read-file list-900-dscr list-900-menu list-900-read-file name-file-1 num-flds)

(setq name-file-1 (nth (atoi str-01) list-801)
			num-flds (atoi (nth (atoi str-01) list-802))
);setq

;;;;;;;интерфейс
(read-file-for-dialog-box-01 name-file-1 num-flds)

(set_tile "ml-31" (nth 0 list-900-menu))
(set_tile "ml-32" (nth 1 list-900-menu))
(set_tile "ml-33" (nth 2 list-900-menu))

(set_tile "ml-41" (nth 3 list-900-menu))
(set_tile "ml-42" (nth 4 list-900-menu))
(set_tile "ml-43" (nth 5 list-900-menu))

(set_tile "ml-51" (nth 6 list-900-menu))
(set_tile "ml-52" (nth 7 list-900-menu))
(set_tile "ml-53" (nth 8 list-900-menu))

(set_tile "ml-61" (nth 9 list-900-menu))
(set_tile "ml-62" (nth 10 list-900-menu))
(set_tile "ml-63" (nth 11 list-900-menu))

(setq list-02 list-01-read-file
			list-03 list-02-read-file
			list-04 list-03-read-file
			list-05 list-04-read-file
			list-06 list-05-read-file
);setq

(divide-text-into-parts list-900-dscr 178)

(setq list-900 list-900-read-file);setq

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

(princ)
)
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма формирования данных///////////////////////////////////////////////////////////////////////////////
(defun filling-fields-101-08-mtl-cs-dkc-01-general

( / list-tmp str-01 str-02 str-03 str-04 str-06 str-98 str-99 tmp-list-902)

;;;;;;; str-97 - артикул
;;;;;;; str-98 - ед. измерения

(setq str-01 (nth (atoi (get_tile "txt-01")) list-01)				
			str-02 (nth (atoi (get_tile "txt-02")) list-02)
			str-03 (nth (atoi (get_tile "txt-03")) list-03)
);setq

(if (/= list-901 nil) 
	(setq list-901 (reverse list-901)
				list-902 (reverse list-902)
	);setq
);if

;;;;;;;//////////////////////////////////////////////////
(if (or (= "Шкаф сборный CQE" str-01)
		    (= "Шкаф навесной ST" str-01))
				
	(setq str-99 (nth (atoi (get_tile "txt-04")) list-04)				
				str-98 "компл."
				
				list-901 (vl-list* (strcat str-01 "  " str-03 " (ВхШхГ, мм)  Арт. " str-02) list-901)
				
				list-tmp (list
					(cons 2 (strcat "размеры " str-03 " (ВхШхГ, мм)"))) 
	);setq
);if

;;;;;;;;//////////////////////////////////////////////////
;(if (= "Дверь сплошная" str-01)
;				
;	(setq str-04 (nth (atoi (get_tile "txt-04")) list-04)
;				str-99 (nth (atoi (get_tile "txt-05")) list-05)								
;				str-98 "шт."
;				
;				list-901 (vl-list* (strcat str-01 "  " str-03 " (ВхШ, мм)  Арт. " str-02 "  Для шкафов " str-04) list-901)
;				
;				list-tmp (list
;					(cons 2 (strcat "размеры " str-03 " (ВхШ, мм)"))
;					(cons 3 (strcat "для шкафов типа " str-04)))
;	);setq
;);if


;;;;;;;//////////////////////////////////////////////////
(if (= "Панели боковые" str-01)
				
	(setq str-04 (nth (atoi (get_tile "txt-04")) list-04)
				str-99 (nth (atoi (get_tile "txt-05")) list-05)							
				str-98 "компл."
				
				list-901 (vl-list* (strcat str-01 "  " str-03 " (ВхГ, мм)  Арт. " str-02 "  Для шкафов " str-04) list-901)
				
				list-tmp (list
					(cons 2 (strcat "размеры " str-03 " (ВхГ, мм)"))
					(cons 3 (strcat "для шкафов типа " str-04)))
	);setq
);if


;;;;;;;//////////////////////////////////////////////////
(if (= "Панель монтажная" str-01)
				
	(setq str-04 (nth (atoi (get_tile "txt-04")) list-04)
				str-99 (nth (atoi (get_tile "txt-05")) list-05)								
				str-98 "шт." 
				
				list-901 (vl-list* (strcat str-01 "  " str-03 " (ВхШ, мм)  Арт. " str-02 "  Для шкафов " str-04) list-901)
				
				list-tmp (list
					(cons 2 (strcat "размеры " str-03 " (ВхШ, мм)"))
					(cons 3 (strcat "для шкафов типа " str-04)))
	);setq
);if


;;;;;;;//////////////////////////////////////////////////
(if (= "Цоколь (элементы угловые)" str-01)
				
	(setq str-99 (nth (atoi (get_tile "txt-04")) list-04)								
				str-98 "компл."
				
				list-901 (vl-list* (strcat str-01 "  Высота " str-03 "мм  Арт. " str-02) list-901)
				
				list-tmp (list (cons 2 (strcat "высота " str-03 "мм")))
	);setq
);if


;;;;;;;//////////////////////////////////////////////////
(if (= "Цоколь (панели)" str-01)
				
	(setq str-99 (nth (atoi (get_tile "txt-04")) list-04)								
				str-98 "компл."
				
				list-901 (vl-list* (strcat str-01 "  " str-03 " (ВхШ/Г), мм)  Арт. " str-02) list-901)
				
				list-tmp (list (cons 2 (strcat "размеры " str-03 " (ВхШ/Г), мм)")))
	);setq
);if


;;;;;;;//////////////////////////////////////////////////
(if (= "Карман для документации" str-01)
				
	(setq str-99 (nth (atoi (get_tile "txt-04")) list-04)												
				str-98 "шт."
				
				list-901 (vl-list* (strcat str-01 "  Ширина " str-03 " (Ш, мм)  Арт. " str-02) list-901)
				
				list-tmp (list (cons 2 (strcat "ширина " str-03 "мм")))
	);setq
);if


;;;;;;;//////////////////////////////////////////////////
(if (= "Ручка стандартная" str-01)
				
	(setq str-99 (nth (atoi (get_tile "txt-04")) list-04)
				str-98 "компл."
				
				list-901 (vl-list* (strcat str-01 "  Арт. " str-02) list-901)
				
				list-tmp (list (cons 2 (strcat "в компл. с замком (под ключ с двойной бородкой)")))
	);setq
);if


;;;;;;;//////////////////////////////////////////////////
(if (= "Полка фиксированная" str-01)
				
	(setq str-04 (nth (atoi (get_tile "txt-04")) list-04)
				str-99 (nth (atoi (get_tile "txt-05")) list-05)
				str-98 "шт." 
								
				list-901 (vl-list* (strcat str-01 "  " str-03 " (ШхГ, мм)  Арт. " str-02 "  Для шкафов " str-04) list-901)
				
				list-tmp (list
					(cons 2 (strcat "размеры " str-03 " (ШхГ, мм)"))
					(cons 3 (strcat "для шкафов типа " str-04)))
	);setq
);if


;;;;;;;//////////////////////////////////////////////////
(if (= "DIN-рейка (С-профиль)" str-01)
				
	(setq str-04 (nth (atoi (get_tile "txt-04")) list-04)
				str-99 (nth (atoi (get_tile "txt-05")) list-05)
				str-06 (nth (atoi (get_tile "txt-06")) list-06)
				str-98 "шт."
								
				list-901 (vl-list* (strcat str-01 "  Профиль " str-04 "  " str-03 " (Д, мм)  Арт. " str-02 "  " str-06) list-901)
				
				list-tmp (list
					(cons 2 (strcat "длина " str-03 "мм"))
					(cons 3 (strcat "профиль " str-04 "мм"))
					(cons 4 str-06)
				);list
	);setq
);if

;;;;;;;//////////////////////////////////////////////////
(if (= "DIN-рейка" str-01)
				
	(setq str-04 (nth (atoi (get_tile "txt-04")) list-04)
				str-99 (nth (atoi (get_tile "txt-05")) list-05)
				str-98 "шт."
								
				list-901 (vl-list* (strcat str-01 "  Профиль " str-04 "  Длина " str-03 "мм  Арт. " str-02) list-901)
				
				list-tmp (list (cons 2 (strcat "длина " str-03 "мм"))
											 (cons 3 (strcat "профиль " str-04 "мм"))
								 );list
	);setq
);if


;;;;;;;//////////////////////////////////////////////////
(if (= "Кронштейн (для DIN-рейки)" str-01)			
	(setq str-04 (nth (atoi (get_tile "txt-04")) list-04)
				str-99 str-03
				str-98 "компл."			
				
				list-901 (vl-list* (strcat str-01 "  " str-04 "  Арт. " str-02) list-901)
				
				list-tmp (list (cons 2 str-04))
	);setq
);if


;;;;;;;//////////////////////////////////////////////////
(if (= "Кронштейн (для 19\" профилей)" str-01)				
	(setq str-99 str-03
				str-98 "компл."			
				
				list-901 (vl-list* (strcat str-01 "  Арт. " str-02) list-901)
	);setq
);if


;;;;;;;//////////////////////////////////////////////////
(if (= "Зажим для кабеля" str-01)				
	(setq str-99 (nth (atoi (get_tile "txt-04")) list-04)
				str-98 "шт." 
				
				list-901 (vl-list* (strcat str-01 " диаметром " str-03 "мм  Арт. " str-02) list-901)
				
				list-tmp (list (cons 2 (strcat "диаметр кабеля " str-03 "мм")))
	);setq
);if


;;;;;;;//////////////////////////////////////////////////
(if (= "Шина заземления" str-01)			
	(setq str-99 (nth (atoi (get_tile "txt-04")) list-04)
				str-98 "компл."
				
				list-901 (vl-list* (strcat str-01  "  Длина " str-03 "мм  Арт. " str-02) list-901)
	
				list-tmp (list (cons 2 (strcat "длина " str-03 "мм")))
	);setq
);if


;;;;;;;//////////////////////////////////////////////////
(if (= "Панель для кабельных вводов" str-01)				
	(setq str-04 (nth (atoi (get_tile "txt-04")) list-04)
				str-99 (nth (atoi (get_tile "txt-05")) list-05)
				str-98 "шт."
				
				list-901 (vl-list* (strcat str-01 "  Длина " str-03 "мм  Арт. " str-02 "  Кол. мест " str-04) list-901)
				
				list-tmp (list (cons 2 (strcat "длина " str-03 "мм"))
											 (cons 3 (strcat "кол. мест " str-04))
								 );
	);setq
);if


;;;;;;;//////////////////////////////////////////////////
(if (= "Кабельный ввод" str-01)				
	(setq str-99 (nth (atoi (get_tile "txt-04")) list-04)
				str-98 "шт."
				
				list-901 (vl-list* (strcat str-01 "  " str-03 " (кол. х диаметр отв.)  Арт. " str-02) list-901)
				
				list-tmp (list (cons 2 (strcat str-03 " (кол. х диам. отверстий)")))
	);setq
);if


;;;;;;;//////////////////////////////////////////////////
(if (= "Заглушка (дно шкафа)" str-01)			
	(setq str-99 (nth (atoi (get_tile "txt-04")) list-04)
				str-98 "шт."
				
				list-901 (vl-list* (strcat str-01 "  " str-03 " (ШхГ, мм)  Арт. " str-02) list-901)
				
				list-tmp (list (cons 2 (strcat "размеры " str-03 " (ШхГ, мм)")))
	);setq
);if


;;;;;;;//////////////////////////////////////////////////
(if (= "Короб перфорированный" str-01)
				
	(setq str-04 (nth (atoi (get_tile "txt-04")) list-04)
				str-99 (nth (atoi (get_tile "txt-05")) list-05)
				str-98 "шт."
				
				list-901 (vl-list* (strcat str-01 "  " str-03 " (ШхВхД, мм)  Арт. " str-02) list-901)
				
				list-tmp (list (cons 2 (strcat "размеры " str-03 " (ШхВхД, мм)")))
	);setq
);if


(setq tmp-list-902 (list 
				(cons 1 str-01) 
				(cons 97 (strcat "артикул " str-02))
				(cons 98 str-98) 
				(cons 99 str-99))

		 tmp-list-902 (append tmp-list-902 list-tmp)
		 list-901 (reverse list-901)
		 list-902 (vl-list* tmp-list-902 list-902)
		 list-902 (reverse list-902)
);setq

;(princ "\n    tmp-list-902 = ") (princ tmp-list-902);Erase_DV
;(getstring "\nPress Enter to continue...");Erase_DV

(list-filling "txt-901" list-901)

(princ)
)
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////