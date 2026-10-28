;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////                                                              ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun 101-08-mtl-cs-iek-01-general

( / adoc dcl-id list-01 list-01-read-file list-02 list-02-read-file list-03 list-03-read-file list-04 list-05 list-06 list-07 list-801 list-802 list-900 list-901 list-902 
str-01 type-list)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(setq	list-901 nil
      list-902 nil
      list-900 nil
      
			str-01 "0"
);setq

(read-file-for-dialog-box-01 "101-08-mtl-cs-iek-01-general.txt" 3)

(setq list-01 list-01-read-file
			list-801 list-02-read-file
			list-802 list-03-read-file
);setq

(start-101-08-mtl-cs-iek-01-general str-01)

(if (< (setq dcl-id (load_dialog "dia-101-08-mtl-cs-iek-01-general.dcl")) 0) ;ищем диалог
	(progn
		(alert "Не найден dcl-файл")
		(exit)
	);progn
);if

(if (not (new_dialog "dia_101_08_mtl_cs_iek_01_general" dcl-id))
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
  				"(start-101-08-mtl-cs-iek-01-general str-01)");srcat
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
  (strcat "(filling-fields-101-08-mtl-cs-iek-01-general)");strcat
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
	((= type-list "spcf") (load "d:\\yandexdisk\\my-sprt\\101-08-m-box-3\\101-08-mtl-cs-iek-01-spcf.lsp") (101-08-mtl-cs-iek-01-spcf list-902));=
	((= type-list "lecgv") (load "d:\\yandexdisk\\my-sprt\\101-08-m-box-3\\101-08-mtl-cs-iek-01-lecgv.lsp") (101-08-mtl-cs-iek-01-lecgv list-902));=
);cond

(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(vla-endundomark adoc)
(princ)
)
;/////// конец программы ///////

;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun start-101-08-mtl-cs-iek-01-general

(str-01 / list-01-read-file list-02-read-file list-03-read-file list-04-read-file list-05-read-file list-900-dscr list-900-menu list-900-read-file name-file-1 num-flds)

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
(defun filling-fields-101-08-mtl-cs-iek-01-general

( / list-tmp str-01 str-02 str-03 str-04 str-05 str-98 str-99 tmp-list-902)

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
(if (or (= "Корпус металлический ЩМП" str-01)
				(= "Корпус металлический TITAN 5" str-01))
				
	(setq str-05 (nth (atoi (get_tile "txt-05")) list-05)
				str-99 (nth (atoi (get_tile "txt-06")) list-06)				
				str-98 "компл."
				
				list-901 (vl-list* (strcat str-01 "  " str-03 " (ВхШхГ, мм)  " str-02) list-901)
				
				tmp-list-902 (list
					(cons 1 str-01) 
					(cons 2 str-02)
					(cons 3 (strcat "артикул " str-05))
					(cons 4 (strcat "размеры " str-03 " (ВхШхГ, мм)"))
					(cons 98 str-98)
					(cons 99 str-99))
	);setq
);if


;;;;;;;//////////////////////////////////////////////////
(if (= "Кабель-канал перфорированный" str-01)
				
	(setq str-99 (nth (atoi (get_tile "txt-04")) list-04)						
				str-98 "шт."
				
				list-901 (vl-list* (strcat str-01 "  " str-03 " (ВхГ, мм)  Арт. " str-02) list-901)
				
				tmp-list-902 (list
					(cons 1 str-01) 
					(cons 2 (strcat "артикул " str-02))
					(cons 3 (strcat "размеры " str-03 " (ВхГ, мм)"))
					(cons 98 str-98)
					(cons 99 str-99))
	);setq
);if


;;;;;;;//////////////////////////////////////////////////
(if (= "DIN-рейка" str-01)
				
	(setq str-99 (nth (atoi (get_tile "txt-04")) list-04)						
				str-98 "шт."
								
				list-901 (vl-list* (strcat str-01 "  Длина " str-03 "  Арт. " str-02) list-901)
				
				tmp-list-902 (list
					(cons 1 str-01) 
					(cons 2 (strcat "артикул " str-02))
					(cons 3 (strcat "длина " str-03))
					(cons 98 str-98)
					(cons 99 str-99))
	);setq
);if



(setq list-901 (reverse list-901)
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