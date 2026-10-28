;/////// ************************************************************ //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////                                                              //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun c:701-pipes-general

( / adoc dcl-id file-name file-open list-00 list-01 list-02 list-03 list-04 list-05 list-901 list-902 path-file-open str-1 str-f type-list)

(vl-load-com)

(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(setq str-f 1;переменные
      list-00 (list "ГОСТ 3262-75" 
						  "ГОСТ 8734-75" 
      				  "ГОСТ 9941-81" 
      				  "ГОСТ 10704-91"
      				  "ГОСТ 617-2006")
      list-901 nil
      list-902 nil
      list-01 nil
		list-02 nil
		list-03 nil
		list-04 nil
		list-05 nil
		str-1 nil
		file-name nil
		file-open nil
		path-file-open nil
);setq

(start-701-pipes-general)

(if (< (setq dcl-id (load_dialog "dia-701-pipes-general.dcl")) 0) ;ищем диалог
	(progn
		(alert "Не найден dcl-файл")
		(exit)
	);progn
);if

(if (not (new_dialog "dia_701_pipes_general" dcl-id))
	(exit)
);if

(list-filling "txt-00" list-00)
(list-filling "txt-01" list-01)
(list-filling "txt-02" list-02)
(list-filling "txt-03" list-03)
(list-filling "txt-04" list-04)
(list-filling "txt-05" list-05)

(set_tile "txt-00" "0")
(set_tile "txt-01" "0")
(set_tile "txt-02" "0")
(set_tile "txt-03" "0")
(set_tile "txt-04" "0")
(set_tile "txt-05" "0")

(action_tile "txt-00"
  (strcat "(start-701-pipes-general)");srcat
);action_tile

(action_tile "txt-01"
  (strcat "(txt-01-701-pipes-general)");srcat
);action_tile

(action_tile "txt-04"
  (strcat "(txt-04-701-pipes-general)");srcat
);action_tile

(action_tile "but1"
  (strcat "(tmp-filling-fields-701-pipes-general)"
  				"(list-filling \"txt-01\" list-01)"
  				"(list-filling \"txt-02\" list-02)"
					"(list-filling \"txt-03\" list-03)"
					"(list-filling \"txt-04\" list-04)"
					"(list-filling \"txt-05\" list-05)"
					"(set_tile \"txt-01\" \"0\")"
					"(set_tile \"txt-02\" \"0\")"
          "(set_tile \"txt-03\" \"0\")"
          "(set_tile \"txt-04\" \"0\")"
          "(set_tile \"txt-05\" \"0\")"
  );strcat
);action_tile

(action_tile "but2"
  (strcat "(setq type-list \"le\")"
          "(done_dialog)"
  );strcat
);action_tile

(action_tile "but3"
  (strcat "(setq type-list \"ledae\")"
          "(done_dialog)"
  );strcat
);action_tile

(action_tile "but4"
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

(if (= type-list "le") (tmp-le-701-pipes-general));if

(if (= type-list "ledae") (tmp-ledae-701-pipes-general));if

(if (= type-list "spcf") (tmp-spcf-701-pipes-general));if

(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(vla-endundomark adoc)
(princ)
(gc)
)
;/////// конец программы ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun start-701-pipes-general

( / )

(if (= nil str-1) 
	(setq str-1 "ГОСТ 3262-75");setq
	(setq str-1 (nth (atoi (get_tile "txt-00")) list-00));setq
);if

(cond
	((= str-1 "ГОСТ 3262-75")
		(progn
			(tmp-read-file-701-pipes-general "701-pipes-gost-3262.txt" 4)
			(set_tile "ptxt-011" "Усл. проход х")
			(set_tile "ptxt-012" "Толщ. стенки,")
			(set_tile "ptxt-013" "мм.")
			(set_tile "ptxt-021" "Наружный")
			(set_tile "ptxt-022" "диаметр, мм.")
			(set_tile "ptxt-023" "")			
			(set_tile "ptxt-031" "Масса")
			(set_tile "ptxt-032" "1 м., кг")
			(set_tile "ptxt-033" "")
			(set_tile "ptxt-041" "Тип")
			(set_tile "ptxt-042" "")
			(set_tile "ptxt-043" "")
			(set_tile "ptxt-051" "")
			(set_tile "ptxt-052" "")
			(set_tile "ptxt-053" "")
			(set_tile "ptxt-061" "Труба стальная водогазопроводная. Только для взрывоопасных установок")	

		);progn
	); str-1
	
	((= str-1 "ГОСТ 8734-75")
		(progn
			(tmp-read-file-701-pipes-general "701-pipes-gost-8734.txt" 3)
			(set_tile "ptxt-011" "Нар. диаметр х")
			(set_tile "ptxt-012" "Толщ. стенки,")
			(set_tile "ptxt-013" "мм.")
			(set_tile "ptxt-021" "Масса.,")
			(set_tile "ptxt-022" "1 м., кг")
			(set_tile "ptxt-023" "")			
			(set_tile "ptxt-031" "Тип трубы")
			(set_tile "ptxt-032" "")
			(set_tile "ptxt-033" "")
			(set_tile "ptxt-041" "Материал")
			(set_tile "ptxt-042" "")
			(set_tile "ptxt-043" "")
			(set_tile "ptxt-051" "")
			(set_tile "ptxt-052" "")
			(set_tile "ptxt-053" "")
			(set_tile "ptxt-061" "Труба стальная бесшовная холоднодеформированная. Материал, углеродистая сталь 10, 20 по ГОСТ 1050.")	
	
		);progn
	); str-1

	((= str-1 "ГОСТ 9941-81")
		(progn
			(set_tile "ptxt-011" "Нар. диаметр х")
			(set_tile "ptxt-012" "Толщ. стенки,")
			(set_tile "ptxt-013" "мм.")
			(set_tile "ptxt-021" "Длина трубы")
			(set_tile "ptxt-022" "не более, м")
			(set_tile "ptxt-023" "")			
			(set_tile "ptxt-031" "Масса.,")
			(set_tile "ptxt-032" "1 м., кг")
			(set_tile "ptxt-033" "")
			(set_tile "ptxt-041" "Материал")
			(set_tile "ptxt-042" "трубы")
			(set_tile "ptxt-043" "")
			(set_tile "ptxt-051" "")
			(set_tile "ptxt-052" "")
			(set_tile "ptxt-053" "")
				
			(set_tile "ptxt-061" "Трубы бесшовные холодно- и теплодеформированные из коррозионно-стойкой стали.")
			(tmp-read-file-701-pipes-general "701-pipes-gost-9941-12h18n10t.txt" 3)
		);progn
	); str-1

	((= str-1 "ГОСТ 10704-91")
		(progn
			(set_tile "ptxt-011" "Нар. диаметр х")
			(set_tile "ptxt-012" "Толщ. стенки,")
			(set_tile "ptxt-013" "мм.")
			(set_tile "ptxt-021" "Масса.,")
			(set_tile "ptxt-022" "1 м., кг")
			(set_tile "ptxt-023" "")			
			(set_tile "ptxt-031" "Материал")
			(set_tile "ptxt-032" "трубы")
			(set_tile "ptxt-033" "")
			(set_tile "ptxt-041" "")
			(set_tile "ptxt-042" "")
			(set_tile "ptxt-043" "")
			(set_tile "ptxt-051" "")
			(set_tile "ptxt-052" "")
			(set_tile "ptxt-053" "")
				
			(set_tile "ptxt-061" "Трубы стальные электросварные прямошовные.")
			(tmp-read-file-701-pipes-general "701-pipes-gost-10704.txt" 2)
		);progn
	); str-1

	((= str-1 "ГОСТ 617-2006")
		(progn
			(tmp-read-file-701-pipes-general "701-pipes-gost-617.txt" 2)
			(set_tile "ptxt-011" "Нар. диаметр х")
			(set_tile "ptxt-012" "Толщ. стенки,")
			(set_tile "ptxt-013" "мм.")
			(set_tile "ptxt-021" "Масса.,")
			(set_tile "ptxt-022" "1 м., кг")
			(set_tile "ptxt-023" "")			
			(set_tile "ptxt-031" "Способ")
			(set_tile "ptxt-032" "изготовлен.")
			(set_tile "ptxt-033" "")
			(set_tile "ptxt-041" "Точность")
			(set_tile "ptxt-042" "изготовления")
			(set_tile "ptxt-043" "")
			(set_tile "ptxt-051" "Состояние")
			(set_tile "ptxt-052" "")
			(set_tile "ptxt-053" "")
			(set_tile "ptxt-061" "Трубы медные.")			

		);progn
	); str-1


); cond

   
(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрогамма чтения данных из файлов//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun tmp-read-file-701-pipes-general

(file-name swtch / file-open path-file-open str-f str-lft-01 str-lft-02 str-lft-03 str-lft-04 str-lft-05)

(setq list-01 nil
		list-02 nil
		list-03 nil
		list-04 nil
		list-05 nil
		str-lft-01 ""
      str-lft-02 ""
      str-lft-03 ""
      str-lft-04 ""
      str-lft-05 ""
      str-f 1   
);setq

(setq path-file-open (findfile file-name);открываем файл, создаем список для занесения в диалог
      file-open (open path-file-open "r")
);setq

(if (= str-1 "ГОСТ 8734-75")
	(setq list-04 
		(reverse
			(list "В10 ГОСТ 8733-75" 
					"В20 ГОСТ 8733-75" 
					"10 ГОСТ 1050-88" 
					"20 ГОСТ 1050-88"
			);list
		);reverse
	);setq
);if

(if (= str-1 "ГОСТ 9941-81")
	(setq list-04
		(reverse
			(list "12Х18Н10Т" 
					"12Х18Н12Т"
			);list
		);reverse
	);setq
);if

(if (= str-1 "ГОСТ 617-2006")
	(setq list-03 (reverse (list "Тянутая (Д)" "Прессов. (Г)"))
			list-04 (reverse (list "Норм. (Н)" "Повыш. (П)"))
			list-05 (reverse (list "Мягкое (М)" "Полутв. (П)" "Твердое (Т)"))
	);setq
);if

(if (= str-1 "ГОСТ 10704-91")
	(setq list-03 
		(reverse
			(list "Б-20 ГОСТ 1050-88"
					"Ст2сп ГОСТ 10705-80"
			);list
		);revrse
	);setq
);if

(if (= swtch 1)
	(progn
		(while (/= str-f nil)
			(setq str-f (read-line file-open));setq
			(if (/= str-f nil)
				(setq str-lft-01 (substr str-f 1 (vl-string-search "\\" str-f));первые \\
							str-lft-02 (substr str-f (+ (vl-string-search "\\" str-f) 2));вторые \\	
							list-01 (vl-list* str-lft-01 list-01);создаем список из считанных строк из файла
							list-02 (vl-list* str-lft-02 list-02)
				);setq
			);if
		);while
	);progn
);if

(if (= swtch 2)
	(progn
		(while (/= str-f nil)
			(setq str-f (read-line file-open));setq
			(if (/= str-f nil)
				(setq str-lft-01 (substr str-f 1 (vl-string-search "\\" str-f));первые \\
							str-lft-02 (substr str-f (+ (vl-string-search "\\" str-f) 2))
							list-01 (vl-list* str-lft-01 list-01);создаем список из считанных строк из файла
							list-02 (vl-list* str-lft-02 list-02)
				);setq
			);if
		);while
	);progn
);if

(if (= swtch 3)
	(progn
		(while (/= str-f nil)
			(setq str-f (read-line file-open));setq
			(if (/= str-f nil)
				(setq str-lft-01 (substr str-f 1 (vl-string-search "\\" str-f));первые \\
							str-f (substr str-f (+ (vl-string-search "\\" str-f) 2));вторые \\
							str-lft-02 (substr str-f 1 (vl-string-search "\\" str-f))
							str-lft-03 (substr str-f (+ (vl-string-search "\\" str-f) 2));третьи \\		
							list-01 (vl-list* str-lft-01 list-01);создаем список из считанных строк из файла
							list-02 (vl-list* str-lft-02 list-02)
							list-03 (vl-list* str-lft-03 list-03)
				);setq
			);if
		);while
	);progn
);if

(if (= swtch 4)
	(progn
		(while (/= str-f nil)
			(setq str-f (read-line file-open));setq
			(if (/= str-f nil)
				(setq str-lft-01 (substr str-f 1 (vl-string-search "\\" str-f));1 \\
							str-f (substr str-f (+ (vl-string-search "\\" str-f) 2))
							str-lft-02 (substr str-f 1 (vl-string-search "\\" str-f));2 \\
							str-f (substr str-f (+ (vl-string-search "\\" str-f) 2))
							str-lft-03 (substr str-f 1 (vl-string-search "\\" str-f));3 \\
							str-lft-04 (substr str-f (+ (vl-string-search "\\" str-f) 2));4 \\
							list-01 (vl-list* str-lft-01 list-01);создаем список из считанных строк из файла
							list-02 (vl-list* str-lft-02 list-02)
							list-03 (vl-list* str-lft-03 list-03)
							list-04 (vl-list* str-lft-04 list-04)
				);setq
			);if
		);while
	);progn
);if

(if (= swtch 5)
	(progn
		(while (/= str-f nil)
			(setq str-f (read-line file-open));setq
			(if (/= str-f nil)
				(setq str-lft-01 (substr str-f 1 (vl-string-search "\\" str-f));первые \\
							str-f (substr str-f (+ (vl-string-search "\\" str-f) 2));вторые \\
							str-lft-02 (substr str-f 1 (vl-string-search "\\" str-f))
							str-f (substr str-f (+ (vl-string-search "\\" str-f) 2));третьи \\
							str-lft-03 (substr str-f 1 (vl-string-search "\\" str-f))
							str-f (substr str-f (+ (vl-string-search "\\" str-f) 2));4 \\
							str-lft-04 (substr str-f 1 (vl-string-search "\\" str-f))
							str-lft-05 (substr str-f (+ (vl-string-search "\\" str-f) 2))				
							list-01 (vl-list* str-lft-01 list-01);создаем список из считанных строк из файла
							list-02 (vl-list* str-lft-02 list-02)
							list-03 (vl-list* str-lft-03 list-03)
							list-04 (vl-list* str-lft-04 list-04)
							list-05 (vl-list* str-lft-05 list-05)
				);setq
			);if
		);while
	);progn
);if

(close file-open)

(setq list-01 (reverse (vl-remove "" list-01))
      list-02 (reverse (vl-remove "" list-02))
      list-03 (reverse (vl-remove "" list-03))
      list-04 (reverse (vl-remove "" list-04))
      list-05 (reverse (vl-remove "" list-05))
);setq

(list-filling "txt-01" list-01)
(list-filling "txt-02" list-02)
(list-filling "txt-03" list-03)
(list-filling "txt-04" list-04)
(list-filling "txt-05" list-05)

(set_tile "txt-01" "0")
(set_tile "txt-02" "0")
(set_tile "txt-03" "0")
(set_tile "txt-04" "0")
(set_tile "txt-05" "0")

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрогамма выбора данных////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun txt-01-701-pipes-general

( / str-00 str-01)

(setq str-00 (nth (atoi (get_tile "txt-00")) list-00)
			str-01 (get_tile "txt-01")
);setq

(if (= str-00 "ГОСТ 3262-75")
	(progn
		(list-filling "txt-02" list-02)
		(list-filling "txt-03" list-03)
		(list-filling "txt-04" list-04)
		(list-filling "txt-05" list-05)
		(set_tile "txt-02" str-01)
    (set_tile "txt-03" str-01)
    (set_tile "txt-04" str-01)
    (set_tile "txt-05" str-01)
	);progn
);if

(if (= str-00 "ГОСТ 8734-75")
	(progn
		(list-filling "txt-02" list-02)
		(list-filling "txt-03" list-03)
		(list-filling "txt-04" list-04)
		(set_tile "txt-02" str-01)
    (set_tile "txt-03" str-01)
    (set_tile "txt-04" "0")
	);progn
);if

(if (= str-00 "ГОСТ 9941-81")
	(progn
		(list-filling "txt-02" list-02)
		(list-filling "txt-03" list-03)
		(set_tile "txt-02" str-01)
    (set_tile "txt-03" str-01)
	);progn
);if

(if (or (= str-00 "ГОСТ 617-2006") 
				(= str-00 "ГОСТ 10704-91")
		);or
	(progn
		(list-filling "txt-02" list-02)
		(set_tile "txt-02" str-01)
	);progn
);if

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрогамма выбора данных////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun txt-04-701-pipes-general

( / file-name file-open list-01 list-02 list-03 path-file-open str-00 str-04 str-f str-lft-01 str-lft-02 str-lft-03)

(setq str-f 1 ;начальное значение для открытия файла
			list-01 nil
			list-02 nil
			list-03 nil
			str-lft-01 ""
      str-lft-02 ""
      str-lft-03 ""
			str-00 (nth (atoi (get_tile "txt-00")) list-00)
			str-04 (nth (atoi (get_tile "txt-04")) list-04)
);setq

(if (= str-00 "ГОСТ 9941-81")
	(progn
		(cond
			((= str-04 "12Х18Н10Т") (setq file-name "701-pipes-gost-9941-12h18n10t.txt"));=
			((= str-04 "12Х18Н12Т") (setq file-name "701-pipes-gost-9941-12h18n12t.txt"));=
		);cond
		
		(setq path-file-open (findfile file-name);открываем файл, создаем список для занесения в диалог
    		  file-open (open path-file-open "r")
		);setq
		
		(while (/= str-f nil)
			(setq str-f (read-line file-open));setq
			(if (/= str-f nil)
				(setq str-lft-01 (substr str-f 1 (vl-string-search "\\" str-f));первые \\
							str-f (substr str-f (+ (vl-string-search "\\" str-f) 2));вторые \\
							str-lft-02 (substr str-f 1 (vl-string-search "\\" str-f))
							str-lft-03 (substr str-f (+ (vl-string-search "\\" str-f) 2));третьи \\		
							list-01 (vl-list* str-lft-01 list-01);создаем список из считанных строк из файла
							list-02 (vl-list* str-lft-02 list-02)
							list-03 (vl-list* str-lft-03 list-03)
				);setq
			);if
		);while
		
		(setq list-01 (reverse (vl-remove "" list-01))
      		list-02 (reverse (vl-remove "" list-02))
      		list-03 (reverse (vl-remove "" list-03))
		);setq
		
		(list-filling "txt-01" list-01)
		(list-filling "txt-02" list-02)
		(list-filling "txt-03" list-03)
		
		(set_tile "txt-01" "0")
		(set_tile "txt-02" "0")
		(set_tile "txt-03" "0")
	);progn
);if

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма формирования данных/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun tmp-filling-fields-701-pipes-general

( / cntr-1 str-00 str-01 swtch tmp-str-01 tmp-str-02 tmp-str-03 tmp-str-04 tmp-str-05 tmp-str-902)

;заполняем поле "выбрано"
(setq str-00 (nth (atoi (get_tile "txt-00")) list-00)
			str-01 (get_tile "txt-01");список с номерами выбранных строк
      swtch list-901 ;запоминаем первоначальное состояние списка в поле "выбрано"
      cntr-1 0 ;счетчик, номер элемента в списке
);setq
  
(setq str-01 (strcat "(" str-01 ")");преобразуем строку в список
      str-01 (read str-01)
);setq

(if (/= swtch nil) (setq list-902 (reverse list-902)));if, ;если есть уже выбраннное то переворачиваем

(repeat (length str-01)
  (setq tmp-str-01 (nth (nth cntr-1 str-01) list-01);извлекаем элемент из списка элементов лист-1 по номеру элемента из списка тмп? формируем список обозначений
        tmp-str-02 (nth (nth cntr-1 str-01) list-02) 
        
  );setq

	(cond
		((= str-00 "ГОСТ 617-2006") (setq tmp-str-03 (nth (atoi (get_tile "txt-03")) list-03)));=
		((= str-00 "ГОСТ 10704-91") (setq tmp-str-03 (nth (atoi (get_tile "txt-03")) list-03)));=
		((and
			(/= str-00 "ГОСТ 617-2006")
			(/= str-00 "ГОСТ 10704-91") 
		 );
			(setq tmp-str-03 (nth (nth cntr-1 str-01) list-03))
		);=
	);cond
	
	(if (= list-04 nil) ;если поле пустое
		(setq tmp-str-04 "***");setq
		(setq tmp-str-04 (nth (atoi (get_tile "txt-04")) list-04));setq
	);if
	
	(if (= list-05 nil) ;если поле пустое
		(setq tmp-str-05 "***");setq
		(setq tmp-str-05 (nth (atoi (get_tile "txt-05")) list-05));setq
	);if

	(if (= str-00 "ГОСТ 3262-75")
		(setq list-901 (vl-list* (strcat str-00 "  " tmp-str-01) list-901));setq
	);if
	
	(if (= str-00 "ГОСТ 8734-75")
		(setq list-901 (vl-list* (strcat str-00 "  " tmp-str-01 "  Сталь " tmp-str-04) list-901));setq
	);if
	
	(if (= str-00 "ГОСТ 9941-81")
		(setq list-901 (vl-list* (strcat str-00 "  " tmp-str-01 "  Сталь " tmp-str-04) list-901));setq
	);if

	(if (= str-00 "ГОСТ 10704-91")
		(setq list-901 (vl-list* (strcat str-00 "  " tmp-str-01 "  Сталь " tmp-str-03) list-901));setq
	);if

	(if (= str-00  "ГОСТ 617-2006")
		(setq list-901 (vl-list* (strcat str-00 "  " tmp-str-01 " " tmp-str-03 " " tmp-str-04 " " tmp-str-05) list-901));setq
	);if



  (setq tmp-str-902 (list (cons 0 str-00) (cons 1 tmp-str-01) (cons 2 tmp-str-02) (cons 3 tmp-str-03) (cons 4 tmp-str-04) (cons 5 tmp-str-05))
  			list-902 (vl-list*  tmp-str-902 list-902);список характеристик для спецификации
	);setq
	
  (setq cntr-1 (1+ cntr-1));setq
);repeat

(if (= swtch nil) (setq list-902 (reverse list-902)));if

(if (/= swtch nil) (setq list-902 (reverse list-902)));if

(list-filling "txt-901" (reverse list-901))

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в ПЭ                   //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun tmp-le-701-pipes-general

( / cntr-1 dlt-y nmbr-ln pnt-ins str-03 str-04 str-05 str-tmp str-tmp-0 str-tmp-1 str-tmp-2 str-tmp-3 str-tmp-4 str-tmp-5 tmp-str-03 tmp-str-04 tmp-str-05 x-pnt-ins y-pnt-ins y-pnt-ins-1)

(setq cntr-1 0);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-tmp-0 (cdr (assoc 0 str-tmp))
				str-tmp-1 (cdr (assoc 1 str-tmp))
				str-tmp-2 (cdr (assoc 2 str-tmp))
				str-tmp-3 (cdr (assoc 3 str-tmp))
				str-tmp-4 (cdr (assoc 4 str-tmp))
				str-tmp-5 (cdr (assoc 5 str-tmp))
	);setq
	
;(princ "\n         str-tmp = ") (princ str-tmp);Erase_DV
;(getstring "\nPress Enter to continue...");Erase_DV

	(setvar "osmode" 6199)
	
	(setq pnt-ins		(getpoint "\nУкажите точку вставки\n")
	  		x-pnt-ins (nth 0 pnt-ins)
	 			y-pnt-ins (nth 1 pnt-ins)
	  		y-pnt-ins-1 y-pnt-ins
	  		dlt-y 8
	); setq
	(100-empt-lin-le)
	
	(setvar "osmode" 0)
	(setvar "cmdecho" 0)

	;///////////////////////////////////////////////////////////////////
	(if (= "ГОСТ 3262-75" str-tmp-0)
		(progn
			(setq nmbr-ln 2);setq
			
			(1000-delete-items-le-1 nmbr-ln x-pnt-ins y-pnt-ins);удаление предыдущей записи
			(setvar "osmode" 0)
			(setvar "cmdecho" 0)
			
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 (strcat "Труба " str-tmp-1 " ГОСТ 3262-75, наружний диаметр " str-tmp-2 "мм"))
		);progn
	);if	
	
	;///////////////////////////////////////////////////////////////////
	(if (= "ГОСТ 8734-75" str-tmp-0)
		(progn
			(setq nmbr-ln 2);setq
			
			(1000-delete-items-le-1 nmbr-ln x-pnt-ins y-pnt-ins);удаление предыдущей записи
			(setvar "osmode" 0)
			(setvar "cmdecho" 0)
			
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 (strcat "Труба " str-tmp-1 " ГОСТ 8734-75, материал " str-tmp-4))		
		);progn
	);if

	;///////////////////////////////////////////////////////////////////
	(if (= "ГОСТ 9941-81" str-tmp-0)
		(progn
			(setq nmbr-ln 2);setq
			
			(1000-delete-items-le-1 nmbr-ln x-pnt-ins y-pnt-ins);удаление предыдущей записи
			(setvar "osmode" 0)
			(setvar "cmdecho" 0)
			
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 (strcat "Труба " str-tmp-1 "-" str-tmp-4 " ГОСТ 9941-81 (коррозионно-стойкая)"))	
		);progn
	);if

	;///////////////////////////////////////////////////////////////////
	(if (= "ГОСТ 617-2006" str-tmp-0)
		(progn
			(setq nmbr-ln 2);setq
			
			(1000-delete-items-le-1 nmbr-ln x-pnt-ins y-pnt-ins);удаление предыдущей записи
			(setvar "osmode" 0)
			(setvar "cmdecho" 0)
			
			(cond
				((= str-tmp-3 "Тянутая (Д)") (setq str-3 "Д"));=
				((= str-tmp-3 "Прессов. (Г)") (setq str-3 "Г"));=
			);cond
			
			(cond
				((= str-tmp-4 "Норм. (Н)") (setq str-4 "Н"));=
				((= str-tmp-4 "Повыш. (П)") (setq str-4 "П"));=
			);cond
			
			(cond
				((= str-tmp-5 "Мягкое (М)") (setq str-5 "М"));=
				((= str-tmp-5 "Полутв. (П)") (setq str-5 "П"));=
				((= str-tmp-5 "Твердое (Т)") (setq str-5 "Т"));=
			);cond
			
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 (strcat "Труба " str-3 "КР" str-4 str-5 "ХХ М2 " str-tmp-1 " ГОСТ 617-2006 (медная)"))	
		);progn
	);if

	;///////////////////////////////////////////////////////////////////
	(if (= "ГОСТ 10704-91" str-tmp-0)
		(progn
			(setq nmbr-ln 2);setq
			
			(1000-delete-items-le-1 nmbr-ln x-pnt-ins y-pnt-ins);удаление предыдущей записи
			
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 (strcat "Труба " str-tmp-1 " ГОСТ 10704-91, материал " str-tmp-3))	
		);progn
	);if



	(command "_text" "_ML" (list (+ x-pnt-ins 121) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Кол. в метрах")

	(repeat nmbr-ln
  	(command "_insert" "пэ-пустая-строка" "_X" 1 "_Y" 1 "_Z" 1 "_R" 0 (list x-pnt-ins y-pnt-ins-1))
  	(setq y-pnt-ins-1 (- y-pnt-ins-1 8));setq
	);repeat
 
	(setq cntr-1 (+ cntr-1 1));setq
);repeat

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в ПЭ ЧРО               //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun tmp-ledae-701-pipes-general

( / cntr-1 dlt-y nmbr-ln pnt-ins str-3 str-4 str-5 str-tmp str-tmp-0 str-tmp-1 str-tmp-2 str-tmp-3 str-tmp-4 str-tmp-5 x-pnt-ins y-pnt-ins y-pnt-ins-1)

(setq cntr-1 0 ;счетчик
);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-tmp-0 (cdr (assoc 0 str-tmp))
				str-tmp-1 (cdr (assoc 1 str-tmp))
				str-tmp-2 (cdr (assoc 2 str-tmp))
				str-tmp-3 (cdr (assoc 3 str-tmp))
				str-tmp-4 (cdr (assoc 4 str-tmp))
				str-tmp-5 (cdr (assoc 5 str-tmp))
	);setq

	(setvar "osmode" 6199)
	(setq pnt-ins		(getpoint "\nУкажите точку вставки\n")
	  		x-pnt-ins (nth 0 pnt-ins)
	 			y-pnt-ins (nth 1 pnt-ins)
	  		y-pnt-ins-1 y-pnt-ins
	  		dlt-y 8
	); setq
	
	(09-empt-lin-le-cgv)
	(setvar "osmode" 0)
	(setvar "cmdecho" 0)


	;///////////////////////////////////////////////////////////////////
	(if (= "ГОСТ 3262-75" str-tmp-0)
		(progn
			(setq nmbr-ln 3);setq
			
			(1000-delete-items-le-cgv nmbr-ln x-pnt-ins y-pnt-ins);удаление предыдущей записи
			(setvar "osmode" 0)
			(setvar "cmdecho" 0)
			
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "ГОСТ 3262-75")
			
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 (strcat "Труба " str-tmp-1 ", наружний"))
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "диаметр " str-tmp-2 "мм"))
			
			(command "_TEXT" "_MC" (list (+ x-pnt-ins 142.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 str-tmp-3)
		);progn
	);if

	;///////////////////////////////////////////////////////////////////
	(if (= "ГОСТ 8734-75" str-tmp-0)
		(progn
			(setq nmbr-ln 3);setq
			
			(1000-delete-items-le-cgv nmbr-ln x-pnt-ins y-pnt-ins);удаление предыдущей записи
			(setvar "osmode" 0)
			(setvar "cmdecho" 0)
			
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "ГОСТ 8734-75")
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 (strcat "Труба " str-tmp-1))
			(command "_TEXT" "_MC" (list (+ x-pnt-ins 142.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 str-tmp-2)
		);progn
	);if
	
	;///////////////////////////////////////////////////////////////////
	(if (= "ГОСТ 9941-81" str-tmp-0)
		(progn
			(setq nmbr-ln 3);setq
			
			(1000-delete-items-le-cgv nmbr-ln x-pnt-ins y-pnt-ins);удаление предыдущей записи
			(setvar "osmode" 0)
			(setvar "cmdecho" 0)
			
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "ГОСТ 9941-81")
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 (strcat "Труба " str-tmp-1 "-" str-tmp-4))
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 "(коррозионно-стойкая)")
			(command "_TEXT" "_MC" (list (+ x-pnt-ins 142.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 str-tmp-3)
		);progn
	);if

	;///////////////////////////////////////////////////////////////////
	(if (= "ГОСТ 10704-91" str-tmp-0)
		(progn
			(setq nmbr-ln 3);setq
			
			(1000-delete-items-le-cgv nmbr-ln x-pnt-ins y-pnt-ins);удаление предыдущей записи
			(setvar "osmode" 0)
			(setvar "cmdecho" 0)
			
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "ГОСТ 10704-91")
			
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 (strcat "Труба " str-tmp-1 ", материал "))
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "" str-tmp-3))
			
			(command "_TEXT" "_MC" (list (+ x-pnt-ins 142.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 str-tmp-2)
		);progn
	);if

	;///////////////////////////////////////////////////////////////////
	(if (= "ГОСТ 617-2006" str-tmp-0)
		(progn
			(setq nmbr-ln 3);setq
			
			(1000-delete-items-le-cgv nmbr-ln x-pnt-ins y-pnt-ins);удаление предыдущей записи
			(setvar "osmode" 0)
			(setvar "cmdecho" 0)
			
			(cond
				((= str-tmp-3 "Тянутая (Д)") (setq str-3 "Д"));=
				((= str-tmp-3 "Прессов. (Г)") (setq str-3 "Г"));=
			);cond
			
			(cond
				((= str-tmp-4 "Норм. (Н)") (setq str-4 "Н"));=
				((= str-tmp-4 "Повыш. (П)") (setq str-4 "П"));=
			);cond
			
			(cond
				((= str-tmp-5 "Мягкое (М)") (setq str-5 "М"));=
				((= str-tmp-5 "Полутв. (П)") (setq str-5 "П"));=
				((= str-tmp-5 "Твердое (Т)") (setq str-5 "Т"));=
			);cond
			
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "ГОСТ 617-2006")
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 (strcat "Труба " str-3 "КР" str-4 str-5 "ХХ М2 " str-tmp-1))
			(command "_TEXT" "_MC" (list (+ x-pnt-ins 142.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 str-tmp-2)
			
		);progn
	);if 


	(command "_text" "_ML" (list (+ x-pnt-ins 151) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Кол. в")
	(command "_text" "_ML" (list (+ x-pnt-ins 151) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 "метрах")

	(repeat nmbr-ln
  	(command "_insert" "овш-пэ-пустая-строка" "_X" 1 "_Y" 1 "_Z" 1 "_R" 0 (list x-pnt-ins y-pnt-ins-1))
  	(setq y-pnt-ins-1 (- y-pnt-ins-1 8));setq
	);repeat
 
	(setq cntr-1 (+ cntr-1 1));setq
);repeat

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в спцф                   ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun tmp-spcf-701-pipes-general

( / cntr-1 dlt-y nmbr-ln pnt-ins str-3 str-4 str-5 str-tmp str-tmp-0 str-tmp-1 str-tmp-2 str-tmp-3 str-tmp-4 str-tmp-5 x-pnt-ins y-pnt-ins y-pnt-ins-1)

(setq cntr-1 0);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
			str-0 (cdr (assoc 0 str-tmp))
			str-1 (cdr (assoc 1 str-tmp))
			str-2 (cdr (assoc 2 str-tmp))
			str-3 (cdr (assoc 3 str-tmp))
			str-4 (cdr (assoc 4 str-tmp))
			str-5 (cdr (assoc 5 str-tmp))
	);setq

	(setvar "osmode" 6199)
	
	(setq pnt-ins (getpoint "\nУкажите точку вставки\n"));setq
	
	(setvar "osmode" 0)
	(setvar "cmdecho" 0)

	;///////////////////////////////////////////////////////////////////
	(if (= "ГОСТ 3262-75" str-tmp-0)
		(progn
			(setq nmbr-ln 3);setq
			
			(1000-delete-items-spcf nmbr-ln x-pnt-ins y-pnt-ins);удаление предыдущей записи
			(setvar "osmode" 0)
			(setvar "cmdecho" 0)
			
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Труба стальная водогазопроводная") ;наименование и техническая характеристика
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "- наружний диаметр " str-tmp-2 "мм"))
			
			(command "_TEXT" "_MC" (list (+ x-pnt-ins 160) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 (strcat "Труба " str-tmp-1)) ;Тип, марка, обозначение документа, опросного листа
			(command "_text" "_MC" (list (+ x-pnt-ins 160) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 str-tmp-0)
			(command "_text" "_MC" (list (+ x-pnt-ins 280) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "м")
			(command "_text" "_MC" (list (+ x-pnt-ins 322.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 str-tmp-3)			
		);progn
	);if
	
	;///////////////////////////////////////////////////////////////////
	(if (= "ГОСТ 8734-75" str-0)
	  (setq str-701 "Труба стальная бесшовная холоднодеформированная"
	  
			  str-702 nil
											  
			  str-manufact nil
				  
			  str-order (list (cons 1 (strcat "Труба " str-1 " ГОСТ 8734-75, сталь " str-4)) 
									(cons 2 ".") 
									(cons 3 nil));list
				  
			  str-unit "м"
			  str-crtf nil
	  );setq
	);if

(princ "\n         str-701 = ") (princ str-701);Erase_DV
(princ "\n       str-order = ") (princ str-order);Erase_DV
(princ "\n           str-2 = ") (princ str-2);Erase_DV
(getstring "\nPress Enter to continue...");Erase_DV


	;///////////////////////////////////////////////////////////////////
	(if (= "ГОСТ 9941-81" str-tmp-0)
		(progn
			(setq nmbr-ln 3);setq
			
			(1000-delete-items-spcf nmbr-ln x-pnt-ins y-pnt-ins);удаление предыдущей записи
			(setvar "osmode" 0)
			(setvar "cmdecho" 0)
			
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Труба бесшовная холодно- и теплодеформированная из коррозионно-") ;наименование и техническая характеристика
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 "стойкой стали")
			
			(command "_TEXT" "_MC" (list (+ x-pnt-ins 160) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 (strcat "Труба " str-tmp-1 "-" str-tmp-4)) ;Тип, марка, обозначение документа, опросного листа
			(command "_text" "_MC" (list (+ x-pnt-ins 160) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 "ГОСТ 9941-81")
			(command "_text" "_MC" (list (+ x-pnt-ins 280) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "м")
			(command "_text" "_MC" (list (+ x-pnt-ins 322.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 str-tmp-3)			
		);progn
	);if

	;///////////////////////////////////////////////////////////////////
	(if (= "ГОСТ 10704-91" str-tmp-0)
		(progn
			(setq nmbr-ln 3);setq
			
			(1000-delete-items-spcf nmbr-ln x-pnt-ins y-pnt-ins);удаление предыдущей записи
			(setvar "osmode" 0)
			(setvar "cmdecho" 0)
			
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Труба стальная электросварная прямошовная") ;наименование и техническая характеристика
						
			(command "_TEXT" "_MC" (list (+ x-pnt-ins 160) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 (strcat "Труба " str-tmp-1 " ГОСТ 10704-91,")) ;Тип, марка, обозначение документа, опросного листа
			(command "_text" "_MC" (list (+ x-pnt-ins 160) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "материал " str-tmp-3))
			(command "_text" "_MC" (list (+ x-pnt-ins 280) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "м")
			(command "_text" "_MC" (list (+ x-pnt-ins 322.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 str-tmp-2)			
		);progn
	);if

	;///////////////////////////////////////////////////////////////////
	(if (= "ГОСТ 617-2006" str-tmp-0)
		(progn
			(cond
				((= str-tmp-3 "Тянутая (Д)") (setq str-tmp-3 "тянутая" str-3 "Д"));=
				((= str-tmp-3 "Прессов. (Г)") (setq str-tmp-3 "прессованная" str-3 "Г"));=
			);cond
			
			(cond
				((= str-tmp-4 "Норм. (Н)") (setq str-tmp-4 "нормальная" str-4 "Н"));=
				((= str-tmp-4 "Повыш. (П)") (setq str-tmp-4 "повышенная" str-4 "П"));=
			);cond
			
			(cond
				((= str-tmp-5 "Мягкое (М)") (setq str-tmp-5 "мягкое" str-5 "М"));=
				((= str-tmp-5 "Полутв. (П)") (setq str-tmp-5 "полутвердое" str-5 "П"));=
				((= str-tmp-5 "Твердое (Т)") (setq str-tmp-5 "твердое" str-5 "Т"));=
			);cond
			
			(setq nmbr-ln 7);setq
			
			(1000-delete-items-spcf nmbr-ln x-pnt-ins y-pnt-ins);удаление предыдущей записи
			(setvar "osmode" 0)
			(setvar "cmdecho" 0)
			
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Труба медная") ;наименование и техническая характеристика
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "- " str-tmp-3))
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 "- круглая")
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 3)) 4)) 2.5 0 (strcat "- точность " str-tmp-4))
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 4)) 4)) 2.5 0 (strcat "- состояние " str-tmp-5))
			
			(command "_TEXT" "_MC" (list (+ x-pnt-ins 160) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 (strcat "Труба " str-3 " КР " str-4 " " str-5 "ХХ М2 " str-tmp-1)) ;Тип, марка, обозначение документа, опросного листа
			(command "_text" "_MC" (list (+ x-pnt-ins 160) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat str-tmp-1  " ГОСТ 617-2006"))
			
			(command "_text" "_MC" (list (+ x-pnt-ins 280) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "м")
			(command "_text" "_MC" (list (+ x-pnt-ins 322.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 str-tmp-2)			
		);progn
	);if




	
	(split-str-parts-spcf-01-general str-701 str-702 str-order str-manufact str-unit str-99 str-crtf pnt-ins);




	
	(setq cntr-1 (+ cntr-1 1));setq
);repeat

(princ)
)
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////


