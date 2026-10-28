;/////// ************************************************************ //////////////////////////////////////////////////////////////////
;/////// спт                                                          //////////////////////////////////////////////////////////////////
;/////// ************************************************************ //////////////////////////////////////////////////////////////////
(defun 101-01-heat-meter-logika

( / adoc dcl-id file-name file-open list-00 list-01 list-02 list-03 list-04 list-05 list-901 list-902 path-file-open str-0 str-1 str-2 str-3 str-f type-list)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(setvar "cmdecho" 0)
(setvar "textstyle" "Standard")

(setq str-f 1;переменные
			str-0 nil
			str-1 nil
			str-2 nil
			str-3 nil
      list-00 (list 
      "Логика 7961" 
      "Логика 8961"
      )
      list-01 nil
			list-02 nil
			list-03 nil
			list-04 nil
			list-05 nil
      list-901 nil
      list-902 nil
			file-name nil
			file-open nil
			path-file-open nil
);setq

(tmp-start-101-01-heat-meter-logika)

(if (< (setq dcl-id (load_dialog "dia-101-01-heat-meter-logika.dcl")) 0) ;ищем диалог
		(progn
			(alert "Не найден dcl-файл")
			(exit)
		);progn
);if

(if (not (new_dialog "dia_101_logika" dcl-id))
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
  (strcat "(tmp-start-101-01-heat-meter-logika)"
  );srcat
);action_tile

(action_tile "txt-01"
  (strcat "(txt-01-101-01-heat-meter-logika)"
          "(set_tile \"txt-03\" \"0\")"
          "(set_tile \"txt-04\" \"0\")"
          "(set_tile \"txt-05\" \"0\")"
  );srcat
);action_tile

(action_tile "but1"
  (strcat "(tmp-filling-fields-101-heat-meter)"
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
	((= type-list "le") (le-101-01-heat-meter-logika));=
	((= type-list "spcf") (spcf-101-01-heat-meter-logika));=
	((= type-list "lecgv") (lecgv-101-01-heat-meter-logika));=
);cond

(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(vla-endundomark adoc)
(gc)
(princ)
)
;/////// конец программы ///////

;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun tmp-start-101-01-heat-meter-logika

( / )

(if (= nil str-0) 
	(setq str-0 "Логика 7961"
	);setq
	(setq str-0 (nth (atoi (get_tile "txt-00")) list-00)
	);setq
);if

(cond
	((= str-0 "Логика 7961")
		(progn
			(tmp-read-file-1-101-heat-meter "101-heat-meter-lgk-7961.txt" 2)
			(setq list-03 (list "ТЭМ-100" "ТПТ-1" "ТПТ-15" "Серия 90" "ТСП-Н")
						list-04 (list "ТЭМ-110" "КТПТР-01" "КТПТР-05")
      			list-05 (list "МИДА-13П" "Метран-55" "Метран-150" "DMP" "DMD 331" "КРТ9" "АИР-10" "АИР-20/М2" "MBS" "СДВ" "EJA" "EJX")
			);setq
		);progn
	); str-0

	((= str-0 "Логика 8961")
		(progn
			(tmp-read-file-1-101-heat-meter "101-heat-meter-lgk-8961.txt" 2)
			(setq list-03 (list "ТПТ-1" "ТПТ-15" "ТСП 001" "Серия 90" "Взлет ТПС")
						list-04 (list "КТПТР-01" "КТПТР-05" "КТСПР 001" "Взлет ТПС")
      			list-05 (list "Метран-55" "Метран-100" "МИДА-13П" "Сапфир-22МТ" "ALPHA-N" "EJA")
			);setq
		);progn
	); str-0
); cond

(list-filling "txt-03" list-03)
(list-filling "txt-04" list-04)
(list-filling "txt-05" list-05)

(princ)
)
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрогамма чтения данных из файлов////////////////////////////////////////////////////////////////////////////
(defun tmp-read-file-1-101-heat-meter

(file-name swtch / str-f str-lft-01 str-lft-02 str-lft-03 str-lft-04 str-lft-05)

(setq list-01 nil
			list-02 nil
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

(if (= swtch 2)
	(progn
		(while (/= str-f nil)
			(setq str-f (read-line file-open);читаем строку
			);setq
			(if (/= str-f nil)
				(setq str-lft-01 (substr str-f 1 (vl-string-search "\\" str-f))
							str-lft-02 (substr str-f (+ (vl-string-search "\\" str-f) 2));1 \\
							list-01 (vl-list* str-lft-01 list-01)
							list-02 (vl-list* str-lft-02 list-02)					
				);setq
			);if
		);while
		(setq list-01 (reverse (vl-remove "" list-01))
					list-02 (reverse (vl-remove "" list-02))
		);setq
	);progn
);if

(close file-open)

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
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun txt-01-101-01-heat-meter-logika

( / str-01)

(setq str-01 (get_tile "txt-01")
);setq

(list-filling "txt-02" list-02)

(set_tile "txt-02" str-01)

(princ)
)
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма формирования данных///////////////////////////////////////////////////////////////////////////////
(defun tmp-filling-fields-101-heat-meter

( / cntr-1 str-00 str-01 swtch tmp-str-01 tmp-str-02 tmp-str-03 tmp-str-04 tmp-str-05 tmp-str-06 tmp-str-902)

;заполняем поле "выбрано"
(setq str-00 (nth (atoi (get_tile "txt-00")) list-00)
			str-01 (get_tile "txt-01");список с номерами выбранных строк
      swtch list-901 ;запоминаем первоначальное состояние списка в поле "выбрано"
      cntr-1 0 ;счетчик, номер элемента в списке
);setq
  
(setq str-01 (strcat "(" str-01 ")");преобразуем строку в список
      str-01 (read str-01)
);setq

(if (/= swtch nil);если есть уже выбраннное то переворачиваем
	(setq list-902 (reverse list-902);список характеристик для спецификации
	);setq
);if

(repeat (length str-01)
  (setq tmp-str-01 (nth (nth cntr-1 str-01) list-01);извлекаем элемент из списка элементов лист-1 по номеру элемента из списка тмп? формируем список обозначений
  			tmp-str-02 (nth (nth cntr-1 str-01) list-02)
  );setq

	(if (/= tmp-str-01 nil)
		(cond
			((= "Логика 7961" str-00)
				(setq list-901 (vl-list* (strcat "Логика " tmp-str-02 ", " tmp-str-01) list-901)
				);setq
			); =
			((= "Логика 8961" str-00)
				(setq list-901 (vl-list* (strcat "Логика " tmp-str-02 ", " tmp-str-01) list-901)
				);setq
			); =
		);cond
	); if
	
	(setq tmp-str-902 (list (cons 0 str-00) (cons 1 tmp-str-02))
  			list-902 (vl-list*  tmp-str-902 list-902);список характеристик для спецификации
	);setq
  (setq cntr-1 (1+ cntr-1);счетчик
  );setq
);repeat

(if (= swtch nil)
	(setq list-902 (reverse list-902);список характеристик для спецификации
	);setq
);if

(if (/= swtch nil)
	(setq list-902 (reverse list-902);список характеристик для спецификации
	);setq
);if

(list-filling "txt-901" (reverse list-901))

(princ)
)
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в ПЭ                   /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun le-101-01-heat-meter-logika

( / cntr-1 dlt-y nmbr-ln pnt-ins str-tmp str-tmp-0 str-tmp-1 x-pnt-ins y-pnt-ins y-pnt-ins-1)

(setq cntr-1 0 ;счетчик
);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-tmp-0 (cdr (assoc 0 str-tmp))
				str-tmp-1 (cdr (assoc 1 str-tmp))
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
		
	(setq nmbr-ln 2 ;количество строк
	);setq
	
	(1000-delete-items-le nmbr-ln x-pnt-ins y-pnt-ins);удаление предыдущей записи
	(1000-delete-items-le-2 (- nmbr-ln 1) x-pnt-ins (- y-pnt-ins 8)); удаление в графе "количество"
	
	(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 (strcat "Теплосчетчик Логика, модель " str-tmp-1 ", в составе:"))
	(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 "- Тепловычислитель СПТ 961.2")
	
	(command "_text" "_MC" (list (+ x-pnt-ins 115) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 "1")
 
	(setq cntr-1 (1+ cntr-1);счетчик
	);setq
	
	
	(repeat nmbr-ln
  	(command "_insert" "пэ-пустая-строка" "_X" 1 "_Y" 1 "_Z" 1 "_R" 0 (list x-pnt-ins y-pnt-ins-1))
  	(setq y-pnt-ins-1 (- y-pnt-ins-1 8)
  	);setq
	);repeat
);repeat

(princ)
)
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в спцф                   ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun spcf-101-01-heat-meter-logika

( / cntr-1 dlt-y nmbr-ln pnt-ins str-tmp str-tmp-0 str-tmp-1 x-pnt-ins y-pnt-ins y-pnt-ins-1)

(setq cntr-1 0 ;счетчик
);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-tmp-0 (cdr (assoc 0 str-tmp))
				str-tmp-1 (cdr (assoc 1 str-tmp))
	);setq
	
	(setvar "osmode" 6199)
	
	(setq pnt-ins		(getpoint "\nУкажите точку вставки\n")
	  		x-pnt-ins (nth 0 pnt-ins)
	 			y-pnt-ins (nth 1 pnt-ins)
	  		y-pnt-ins-1 y-pnt-ins
	  		dlt-y 8
	); setq
	
	(101-empt-lin-spcf)
	(setvar "osmode" 0)
	(setvar "cmdecho" 0)

	;обработка данных
	(if (= str-tmp-0 "Логика 7961")
		(progn		
			(setq nmbr-ln 6
			);setq
			
			(1000-delete-items-spcf nmbr-ln x-pnt-ins y-pnt-ins);удаление предыдущей записи
			(1000-delete-items-spcf-crtf (+ nmbr-ln 1) x-pnt-ins y-pnt-ins);удаление предыдущего сертификата
			(1000-delete-items-spcf-parts nmbr-ln x-pnt-ins y-pnt-ins) ;удаление кол. составляющих из спецификации
			
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Теплосчетчик, в составе:")
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 "- Тепловычислитель")
			
			(command "_TEXT" "_MC" (list (+ x-pnt-ins 160) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 str-tmp-1) ;Тип, марка, обозначение документа, опросного листа
			(command "_text" "_MC" (list (+ x-pnt-ins 160) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 "ТУ 4218-070-23041473-2009")
			(command "_text" "_MC" (list (+ x-pnt-ins 160) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 "СПТ 961.2")

			(command "_text" "_MC" (list (+ x-pnt-ins 280) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "шт.")
			(command "_text" "_MC" (list (+ x-pnt-ins 280) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 "шт.")
			(command "_text" "_MC" (list (+ x-pnt-ins 300) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 "1")

			(command "_text" "_MC" (list (+ x-pnt-ins 322.5) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 "2,5")
			
			(command "_text" "_ML" (list (+ x-pnt-ins 336) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Внесен в Госреестр");сертификат
			(command "_text" "_ML" (list (+ x-pnt-ins 336) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 "средств измерений,")
			(command "_text" "_ML" (list (+ x-pnt-ins 336) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 "№44079-10, сертификат")
			(command "_text" "_ML" (list (+ x-pnt-ins 336) (- (- y-pnt-ins (* dlt-y 3)) 4)) 2.5 0 "об утверждении типа")
			(command "_text" "_ML" (list (+ x-pnt-ins 336) (- (- y-pnt-ins (* dlt-y 4)) 4)) 2.5 0 "средств измерений")
			(command "_text" "_ML" (list (+ x-pnt-ins 336) (- (- y-pnt-ins (* dlt-y 5)) 4)) 2.5 0 "RU.C.32.004.A №39392")
		);progn
	);if

	(repeat nmbr-ln
  	(command "_insert" "зс-пустая-строка" "_X" 1 "_Y" 1 "_Z" 1 "_R" 0 (list x-pnt-ins y-pnt-ins-1))
  	(setq y-pnt-ins-1 (- y-pnt-ins-1 8)
  	);setq
	);repeat
								
	(command "_text" "_MC" (list (+ x-pnt-ins 247.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "ЗАО НПФ \"ЛОГИКА\",")
	(command "_text" "_MC" (list (+ x-pnt-ins 247.5) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 "г. Санкт-Петербург")	

	(setq cntr-1 (+ cntr-1 1)
	);setq
);repeat

(princ)
)
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в овш               ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun lecgv-101-01-heat-meter-logika

( / cntr-1 dlt-y nmbr-ln pnt-ins str-tmp str-tmp-0 str-tmp-1 str-tmp-11 str-tmp-12 str-tmp-13 str-tmp-2 str-tmp-3 str-tmp-31 str-tmp-32 str-tmp-4 str-tmp-5 
x-pnt-ins y-pnt-ins y-pnt-ins-1)

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

	;обработка данных	
	(if (= "Выключатель автоматический" str-tmp-0)
		(progn
			(cond
				((= str-tmp-3 "1 полюс") (setq str-tmp-3 "1P")); =
				((= str-tmp-3 "2 полюса") (setq str-tmp-3 "2P")); =
				((= str-tmp-3 "3 полюса")	(setq str-tmp-3 "3P")); =
				((= str-tmp-3 "4 полюса")	(setq str-tmp-3 "4P")); =
			); cond
			(setq nmbr-ln 3
						str-tmp-11 (strcat str-tmp-0 " IEK," )
						str-tmp-12 (strcat str-tmp-1 " " str-tmp-3 " " str-tmp-4 "А х-ка " str-tmp-2)
			);setq
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 str-tmp-11)
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 str-tmp-12)
			(command "_TEXT" "_MC" (list (+ x-pnt-ins 142.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "0,2")
		);progn
	);if
		
	(if (= "Выключатель" str-tmp-0)
		(progn
			(cond
				((= str-tmp-2 "Открытая") (setq str-tmp-2 "установка открытая")); =
				((= str-tmp-2 "Скрытая") (setq str-tmp-2 "установка скрытая")); =
			); cond
			(setq str-tmp-31 (substr str-tmp-3 1 (vl-string-search "," str-tmp-3))
						str-tmp-32 (substr str-tmp-3 (+ (vl-string-search " " str-tmp-3) 2))
			);setq
			(cond
				((= str-tmp-31 "Нет") (setq str-tmp-31 "без индикатора")); =
				((= str-tmp-31 "Да") (setq str-tmp-31 "с индикатором")); =
			); cond
			(setq str-tmp-32 (strcat "степень защиты " str-tmp-32)
			);setq
			(setq nmbr-ln 4 ;количество строк
						str-tmp-11 (strcat str-tmp-0 " IEK, " str-tmp-1 ",")
						str-tmp-12 (strcat str-tmp-2 ", " str-tmp-31 ",")
						str-tmp-13 (strcat str-tmp-32)
			);setq
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 str-tmp-11)
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 str-tmp-12)
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 str-tmp-13)
			(command "_TEXT" "_MC" (list (+ x-pnt-ins 142.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "0,2")
		);progn
	);if
	
	(if (= "Розетка с заземляющим контактом" str-tmp-0)
		(progn
			(setq nmbr-ln 3 ;количество строк
						str-tmp-11 (strcat str-tmp-0 " IEK,")
						str-tmp-12 (strcat str-tmp-1 ", монтаж на DIN-рейку" )
			);setq
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 str-tmp-11)
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 str-tmp-12)
			(command "_TEXT" "_MC" (list (+ x-pnt-ins 142.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "0,2")
		);progn
	);if
	
	(if (= "Светильник" str-tmp-0)
		(progn
			(setq nmbr-ln 3 ;количество строк
						str-tmp-11 (strcat str-tmp-0 " IEK, " str-tmp-1 ",")
						str-tmp-12 (strcat "длина " str-tmp-2 "мм.")
			);setq
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 str-tmp-11)
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 str-tmp-12)
			(command "_TEXT" "_MC" (list (+ x-pnt-ins 142.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "0,7")
		);progn
	);if

	(repeat nmbr-ln
  	(command "_insert" "овш-пэ-пустая-строка" "_X" 1 "_Y" 1 "_Z" 1 "_R" 0 (list x-pnt-ins y-pnt-ins-1))
  	(setq y-pnt-ins-1 (- y-pnt-ins-1 8)
  	);setq
	);repeat
		
	(command "_text" "_MC" (list (- x-pnt-ins 7.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "***");номер по овш
	(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "*******");поз по пэ
	(command "_TEXT" "_MC" (list (+ x-pnt-ins 130) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "**");количество
 
	(setq cntr-1 (+ cntr-1 1)
	);setq
);repeat

(princ)
)
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////