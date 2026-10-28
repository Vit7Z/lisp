;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////                                                              ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun 101-08-clmp-klemsan-01-general

( / adoc dcl-id list-01 list-01-read-file list-02 list-02-read-file list-03 list-03-read-file list-04 list-05 list-06 list-07 list-08 list-801 list-802 list-900 list-901 
list-902 str-01 type-list)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(setq list-901 nil
      list-902 nil
      list-900 nil
      
	  str-01 "0"
);setq

(read-file-for-dialog-box-01 "101-08-clmp-klemsan-01-general.txt" 3)

(setq list-01 list-01-read-file
			list-801 list-02-read-file
			list-802 list-03-read-file
);setq

(txt-01-101-08-clmp-klemsan-01-general str-01)

(if (< (setq dcl-id (load_dialog "dia-101-08-clmp-klemsan-01-general.dcl")) 0) ;ищем диалог
  (progn
    (alert "Не найден dcl-файл")
	  (exit)
	);progn
);if

(if (not (new_dialog "dia_101_clmp_klemsan_01_general" dcl-id))
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
					"(txt-01-101-08-clmp-klemsan-01-general str-01)"
	);strcat
);action_tile

(action_tile "txt-02" 
	(strcat "(txt-02-101-08-clmp-klemsan-01-general)")
);action_tile

(action_tile "txt-05" 
	(strcat "(txt-05-101-08-clmp-klemsan-01-general)")
);action_tile

(action_tile "txt-07" 
	(strcat "(txt-07-101-08-clmp-klemsan-01-general)")
);action_tile

(action_tile "but1" 
	(strcat "(but1-101-08-clmp-klemsan-01-general)")
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
  ((= type-list "le") (load "d:\\yandexdisk\\my-sprt\\101-08-clmp\\101-08-clmp-klemsan-01-general-le.lsp") (101-08-clmp-klemsan-01-general-le list-902));=
  ((= type-list "spcf") (load "d:\\yandexdisk\\my-sprt\\101-08-clmp\\101-08-clmp-klemsan-01-general-spcf.lsp") (101-08-clmp-klemsan-01-general-spcf list-902));=
  ((= type-list "lecgv") (load "d:\\yandexdisk\\my-sprt\\101-08-clmp\\101-08-clmp-klemsan-01-general-lecgv.lsp") (101-08-clmp-klemsan-01-general-lecgv list-902));=
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


;;;;///////////////////////////////////////////////////////////////////////////////////////////////
;;;;///////////////////////////////////////////////////////////////////////////////////////////////
(defun txt-01-101-08-clmp-klemsan-01-general

(str-01 / list-01-read-file list-02-read-file list-03-read-file list-04-read-file list-05-read-file 
list-06-read-file list-07-read-file list-900-dscr list-900-menu list-900-read-file name-file-1 num-flds)

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

(setq list-02 list-01-read-file
	  list-03 list-02-read-file
			list-04 list-03-read-file
			list-05 list-04-read-file
			list-06 list-05-read-file
			list-07 list-06-read-file
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
(list-filling "txt-900" list-900)

(set_tile "txt-02" "0")
(set_tile "txt-03" "0")
(set_tile "txt-04" "0")
(set_tile "txt-05" "0")
(set_tile "txt-06" "0")
(set_tile "txt-07" "0")

(princ)
)
;;;;///////////////////////////////////////////////////////////////////////////////////////////////
;;;;///////////////////////////////////////////////////////////////////////////////////////////////


;;;;///////////////////////////////////////////////////////////////////////////////////////////////
;;;;///////////////////////////////////////////////////////////////////////////////////////////////
(defun txt-02-101-08-clmp-klemsan-01-general

( / str-01 str-02 str-02-01)

(setq str-01 (nth (atoi (get_tile "txt-01")) list-01)
	  str-02 (get_tile "txt-02")
	  str-02-01 (nth (atoi (get_tile "txt-02")) list-02)
);setq

(if (or (= str-01 "Клемма проходная винтовая")
        (= str-01 "Клемма проходная пружинная")
        (= str-01 "Клемма проходная push-in")
		(= str-01 "Клемма заземления винтовая")
		(= str-01 "Клемма заземления ппружинная")
		(= str-01 "Клемма с предохранителем пружинная")
		(= str-01 "Стопор концевой")
		(= str-01 "Перемычка")
		(= str-01 "Концевой сегмент")
		(= str-01 "Держатель маркировки для клемм")
		);or
		
	(progn
  	(set_tile "txt-03" str-02)
    (set_tile "txt-04" str-02)
    (set_tile "txt-05" str-02)
    (set_tile "txt-06" str-02)
    (set_tile "txt-07" str-02)
	);progn	
);if

(if (= str-01 "Пластина разделительная")
  (set_tile "txt-03" str-02)
);if

(princ)
)
;;;;//////////////////////////////////////////////////////////////////////////////////////
;;;;//////////////////////////////////////////////////////////////////////////////////////


;;;;//////////////////////////////////////////////////////////////////////////////////////
;;;;//////////////////////////////////////////////////////////////////////////////////////
(defun txt-05-101-08-clmp-klemsan-01-general

( / str-01 str-05)

(setq str-01 (nth (atoi (get_tile "txt-01")) list-01)
	  str-05 (get_tile "txt-05")
);setq

(if (or (= str-01 "Клемма проходная винтовая")
        (= str-01 "Клемма проходная пружинная")
        (= str-01 "Клемма проходная push-in")
		(= str-01 "Клемма заземления винтовая")
		(= str-01 "Клемма заземления ппружинная")
		(= str-01 "Клемма с предохранителем пружинная")
		(= str-01 "Стопор концевой")
		(= str-01 "Перемычка")
		);or
	(progn
  	(set_tile "txt-02" str-05)
    (set_tile "txt-03" str-05)
    (set_tile "txt-04" str-05)
    (set_tile "txt-06" str-05)
    (set_tile "txt-07" str-05)
    (set_tile "txt-09" str-05)
	);progn	
);if

(princ)
)
;;;;//////////////////////////////////////////////////////////////////////////////////////
;;;;//////////////////////////////////////////////////////////////////////////////////////


;;;;//////////////////////////////////////////////////////////////////////////////////////
;;;;//////////////////////////////////////////////////////////////////////////////////////
(defun but1-101-08-clmp-klemsan-01-general

( / str-01 str-02 str-03 str-04 str-05 str-06 str-07 str-08 tmp-list-902)

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
(if (or (= str-01 "Клемма проходная винтовая")
        (= str-01 "Клемма проходная пружинная")
        (= str-01 "Клемма проходная push-in")
				(= str-01 "Клемма заземления винтовая")
				(= str-01 "Клемма заземления пружинная")
				(= str-01 "Клемма силовая винтовая")
		);or
	(progn
		(setq str-05 (nth (atoi (get_tile "txt-05")) list-05)
		      str-06 (nth (atoi (get_tile "txt-06")) list-06)
			  str-07 (nth (atoi (get_tile "txt-07")) list-07)
		);setq
		
		(cond
		  ((or (= str-01 "Клемма проходная винтовая") 
		       (= str-01 "Клемма заземления винтовая")
		       (= str-01 "Клемма силовая винтовая"))
        (setq str-08 "винтовая"));=
        
		 ((or (= str-01 "Клемма проходная пружинная")
				  (= str-01 "Клемма заземления пружинная"))
		   (setq str-08 "пружинная"));=
				  
		 ((= str-01 "Клемма проходная push-in")
		   (setq str-08 "зажим push-in"));=
		);cond
		
		(setq list-901 (vl-list* (strcat str-01 "  " str-02 "  Сечение жилы " str-05 "мм2  " str-06 "  Кол. проводников " str-07) list-901));setq
		
		(cond
		  ((or (= str-01 "Клемма проходная винтовая") 
		       (= str-01 "Клемма проходная пружинная")
		       (= str-01 "Клемма проходная push-in"))
        (setq str-01 "Клемма проходная"));=
        
		 ((or (= str-01 "Клемма заземления винтовая")
				  (= str-01 "Клемма заземления пружинная"))
		   (setq str-01 "Клемма заземления"));=
				  
		 ((= str-01 "Клемма силовая винтовая")
		   (= str-01 "Клемма силовая"));
		);cond
		
		(cond
		  ((= str-06 "Серый") (setq str-06 "серая"));= 
		  ((= str-06 "Синий") (setq str-06 "синяя"));=
		  ((= str-06 "Желт.-зеленый") (setq str-06 "желт.-зеленая"));=
		);cond
		
		(setq str-03 (strcat "артикул " str-03)
		      str-05 (strcat "сечение жилы " str-05 "мм2")
          str-07 (strcat str-07 " проводника")
          
					tmp-list-902 (list (cons 1 str-01) (cons 2 str-02) (cons 3 str-03) (cons 4 str-05) (cons 5 str-06) (cons 6 str-07) (cons 7 str-08) (cons 99 "0,007"))
		);setq
	);progn
);if


;;;;;;;;/////////////////////////////////////////////////////////////////////////////////////////////
(if (= str-01 "Клемма с предохранителем пружинная")
  (progn
    (setq str-05 (nth (atoi (get_tile "txt-05")) list-05)
	      str-06 (nth (atoi (get_tile "txt-06")) list-06)
					str-07 (nth (atoi (get_tile "txt-07")) list-07)
					str-07 (strcat "Uном. " str-07)
					
					list-901 (vl-list* (strcat str-01 "  " str-02 "  Сечение жилы " str-05 "мм2  "  str-06) list-901)
    );setq
  
    (cond
		  ((= str-06 "Серый") (setq str-06 "серая"));= 
		  ((= str-06 "Синий") (setq str-06 "синяя"));=
		  ((= str-06 "Желт.-зеленый") (setq str-06 "желт.-зеленая"));=
		);cond
  
  
	  (setq str-01 "Клемма с предохранителем"
	        str-03 (strcat "артикул " str-03)
		    str-05 (strcat "сечение жилы " str-05 "мм2")
	        str-08 "пружинная"

				tmp-list-902 (list (cons 1 str-01) (cons 2 str-02) (cons 3 str-03) (cons 4 str-05) (cons 5 str-06) (cons 6 str-07) (cons 7 str-08) (cons 99 "0,007"))
	  );setq
  );progn
);if


;;;;;;;/////////////////////////////////////////////////////////////////////////////////////////////
(if (= str-01 "Перемычка")
	(setq str-05 (nth (atoi (get_tile "txt-05")) list-05)
	      str-04 (nth (atoi (get_tile "txt-04")) list-04)

				list-901 (vl-list* (strcat str-01 "  " str-02 "  Контактов " str-04 "  Для клемм шириной " str-05 "мм") list-901)
		    
		    str-03 (strcat "артикул " str-03)
		    str-04 (strcat str-04 " контакта" )
		    str-05 (strcat "для клемм шириной " str-05 "мм")
		    
				tmp-list-902 (list (cons 1 str-01) (cons 2 str-02) (cons 3 str-03) (cons 4 str-04) (cons 5 str-05) (cons 99 "0,002"))
	);setq
);if


;;;;;;;/////////////////////////////////////////////////////////////////////////////////////////////
(if (= str-01 "Стопор концевой")
  (progn
    (setq str-04 (nth (atoi (get_tile "txt-04")) list-04)
	      str-05 (nth (atoi (get_tile "txt-05")) list-05)
		  
		  list-901 (vl-list* (strcat str-01 "  " str-02 "  " str-04 "  Крепление " str-05) list-901)		
		  str-03 (strcat "артикул " str-03)		      
		  str-05 (strcase str-05 1)
		      	
		  tmp-list-902 (list (cons 1 str-01) (cons 2 str-02) (cons 3 str-03) (cons 4 str-05) (cons 99 "0,002"))		
    );setq
  );progn
);if


;;;;;;;/////////////////////////////////////////////////////////////////////////////////////////////
(if (= str-01 "Держатель маркировки для клемм")
  (progn
    (setq str-04 (nth (atoi (get_tile "txt-04")) list-04)
		  str-05 (nth (atoi (get_tile "txt-05")) list-05)
		  list-901 (vl-list* (strcat str-01 "  " str-02 "  Поле " str-04 "мм  Монтаж " str-05) list-901)
		
		  str-03 (strcat "артикул " str-03)	
          str-04 (strcat "размер поля " str-04 " мм")	      
		  tmp-list-902 (list (cons 1 str-01) (cons 2 str-02) (cons 3 str-03) (cons 4 str-04) (cons 99 "0,002"))		
    );setq
  );progn
);if

;;;;;;;/////////////////////////////////////////////////////////////////////////////////////////////
(if (= str-01 "Концевой сегмент")
  (progn
    (setq str-04 (nth (atoi (get_tile "txt-04")) list-04)
		  list-901 (vl-list* (strcat str-01 "  " str-02 "  Для клемм " str-04) list-901)
		
		  str-03 (strcat "артикул " str-03)	
          str-04 (strcat "для клемм " str-04)
		  tmp-list-902 (list (cons 1 str-01) (cons 2 str-02) (cons 3 str-03) (cons 4 str-04) (cons 99 "0,002"))		
    );setq
  );progn
);if

(setq list-902 (vl-list* tmp-list-902 list-902)
      list-901 (reverse list-901)
      list-902 (reverse list-902)
);setq

(list-filling "txt-901" list-901)

(princ)
)
;;;;////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////