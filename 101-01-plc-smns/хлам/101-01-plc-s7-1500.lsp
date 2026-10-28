;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////                                                              ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun 101-01-plc-s7-1500

( / adoc dcl-id list-01 list-02 list-03 list-04 list-901 list-902 list-99 str-01 type-list)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(setq list-01 (list "Процессор" 
      				  "Аналоговый ввод" 
      				  "Аналоговый вывод" 
      				  "Дискретный ввод"  
      				  "Дискретный вывод"  
      				  "Блок питания"
      				  "Соединитель фронтальный"
      				  "Шина профильная")
      list-02 nil
      list-03 nil
      list-04 nil				
      list-99 nil
      					
      list-901 nil
      list-902 nil
			
		str-01 nil
);setq

(start-101-01-plc-s7-1500)

(if (< (setq dcl-id (load_dialog "dia-101-01-plc-s7-1500.dcl")) 0) ;ищем диалог
	(progn
		(alert "Не найден dcl-файл")
		(exit)
	);progn
);if

(if (not (new_dialog "dia_101_01_plc_s7_1500" dcl-id))
	(exit)
);if

(list-filling "txt-01" list-01)
(list-filling "txt-02" list-02)
(list-filling "txt-03" list-03)
(list-filling "txt-04" list-04)
(list-filling "txt-99" list-99)

(set_tile "txt-01" "0")
(set_tile "txt-02" "0")
(set_tile "txt-03" "0")
(set_tile "txt-04" "0")
(set_tile "txt-99" "0")

(action_tile "txt-01"
  (strcat "(start-101-01-plc-s7-1500)");srcat
);action_tile

(action_tile "txt-02"
  (strcat "(set_tile \"txt-03\" $value)"
  			 "(set_tile \"txt-04\" $value)"
  			 "(set_tile \"txt-99\" $value)"
  );srcat
);action_tile

(action_tile "txt-03"
  (strcat "(set_tile \"txt-02\" $value)"
  			 "(set_tile \"txt-04\" $value)"
  			 "(set_tile \"txt-99\" $value)"
  );srcat
);action_tile

(action_tile "txt-04"
  (strcat "(set_tile \"txt-02\" $value)"
  			 "(set_tile \"txt-03\" $value)"
  			 "(set_tile \"txt-99\" $value)"
  );srcat
);action_tile

(action_tile "but1"
  (strcat "(but1-101-01-plc-s7-1500)");srcat
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
	((= type-list "le") (le-101-01-plc-s7-1500));=
	((= type-list "spcf") (spcf-101-01-plc-s7-1500));=
	((= type-list "lecgv") (lecgv-101-01-plc-s7-1500));=
);cond

(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(vla-endundomark adoc)
(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// конец программы ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun start-101-01-plc-s7-1500

( / file-data list-01-read-file list-02-read-file list-03-read-file list-04-read-file str-f str-lft-02 str-lft-03 str-lft-04 str-lft-99)

(setq str-f 1
		str-lft-02 nil
		str-lft-03 nil
		str-lft-04 nil
		str-lft-99 nil
			
		list-02 nil
      list-03 nil
      list-04 nil					
      list-99 nil
);setq

(if (= nil str-01)
	(setq str-01 "Процессор")
	(setq str-01 (nth (atoi (get_tile "txt-01")) list-01));setq
);if

(cond 
	((= str-01 "Процессор") (setq file-data "101-01-plc-s7-1500-cpu.txt"));setq
	((= str-01 "Аналоговый ввод") (setq file-data "101-01-plc-s7-1500-ai.txt"));setq
;	((= str-01 "Аналоговый вывод") (setq file-data "101-01-plc-s7-1500-ao.txt"));setq
	((= str-01 "Дискретный ввод") (setq file-data "101-01-plc-s7-1500-di.txt"));setq
	((= str-01 "Дискретный вывод") (setq file-data "101-01-plc-s7-1500-do.txt"));setq
;	((= str-01 "Модуль связи") (setq file-data "101-01-plc-s7-1500-nets.txt"));setq
;	((= str-01 "Штекер (для модуля связи)") (setq file-data "101-01-plc-s7-1500-connectors-rj45.txt"));setq
;	((= str-01 "Соединитель фронтальный") (setq file-data "101-01-plc-s7-1500-front-connector.txt"));setq
;	((= str-01 "Шина профильная") (setq file-data "101-01-plc-s7-1500-tire-profile.txt"));setq
;	((= str-01 "Карта Flash-EEPROM") (setq file-data "101-01-plc-s7-1500-flash-eeprom.txt"));setq
;	((= str-01 "Блок питания") (setq file-data "101-01-plc-s7-1500-400-pwr.txt"));setq

);cond

(setq path-file-open (findfile file-data))

(read-file-for-dialog-box file-data 4)


;описание
(cond 
	((= str-01 "Процессор") 
		(progn
			(divide-text-into-parts list-03-read-file 130)
			(setq list-04 list-1001-read-file);
		);progn
	); 
	
	((setq list-04 list-03-read-file))
);cond

(setq list-02 list-01-read-file
		list-03 list-02-read-file
		list-99 list-04-read-file	
);setq

(list-filling "txt-02" list-02)
(list-filling "txt-03" list-03)
(list-filling "txt-04" list-04)
(list-filling "txt-99" list-99)

(set_tile "txt-02" "0")
(set_tile "txt-03" "0")
(set_tile "txt-04" "0")
(set_tile "txt-99" "0")

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма формирования данных/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun but1-101-01-plc-s7-1500

( / cntr-1 str-01 str-02 str-03 str-04 str-99 swtch tmp-list-902)

;заполняем поле "выбрано"
(setq str-01 (nth (atoi (get_tile "txt-01")) list-01)
      swtch list-901 ;запоминаем первоначальное состояние списка в поле "выбрано"
      cntr-1 0 ;счетчик, номер элемента в списке
);setq

 (if (/= swtch nil) (setq list-902 (reverse list-902)));if

;заполняем поле "выбрано"
(setq str-01 (nth (atoi (get_tile "txt-01")) list-01)
		str-02 (nth (atoi (get_tile "txt-02")) list-02)
		str-03 (nth (atoi (get_tile "txt-03")) list-03)
		str-04 (nth (atoi (get_tile "txt-04")) list-04)
		str-99 (nth (atoi (get_tile "txt-99")) list-99)
);setq

(if (or (= str-01 "Процессор")
		  (= str-01 "Аналоговый ввод")
		  (= str-01 "Аналоговый вывод")
		  (= str-01 "Дискретный ввод")
		  (= str-01 "Дискретный вывод")
		  (= str-01 "Модуль связи")
		  (= str-01 "Штекер (для модуля связи)")
		  (= str-01 "Блок питания")
	);or
	(progn
		(setq list-901 (vl-list* (strcat str-01 "  " str-02 "  " str-04) list-901));setq

		(setq tmp-list-902 (list (cons 1 str-01) (cons 2 str-02) (cons 3 str-03) (cons 4 str-04) (cons 99 str-99))
				list-902 (vl-list*  tmp-list-902 list-902)
		);setq
	);progn
);if

(if (or (= str-01 "Соединитель фронтальный")
		  (= str-01 "Шина профильная")
		  (= str-01 "Карта Flash-EEPROM")
		);
	(progn
		(setq list-901 (vl-list* (strcat str-01 "  " str-03 "  " str-04) list-901));setq

		(setq tmp-list-902 (list (cons 1 str-01) (cons 2 str-02) (cons 3 str-03) (cons 4 str-04) (cons 99 str-99))
				list-902 (vl-list*  tmp-list-902 list-902)
		);setq
	);progn
);if

(setq list-902 (reverse list-902))

(list-filling "txt-901" (reverse list-901))

(princ)
)
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в ПЭ                   /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun le-101-01-plc-s7-1500

( / cntr-1 dlt-y nmbr-ln pnt-ins str-01 str-02 str-03 str-04 str-99 str-lft-02 str-lft-03 str-tmp str-tmp-12 x-pnt-ins y-pnt-ins y-pnt-ins-1)

(setq cntr-1 0);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
			str-01 (cdr (assoc 1 str-tmp))
			str-02 (cdr (assoc 2 str-tmp))
			str-03 (cdr (assoc 3 str-tmp))
			str-04 (cdr (assoc 4 str-tmp))
			str-99 (cdr (assoc 99 str-tmp))
			str-tmp-12 nil
	);setq
	
	(setvar "osmode" 6199)
	
	(setq pnt-ins		(getpoint "\nУкажите точку вставки\n")
  			x-pnt-ins (nth 0 pnt-ins)
 			y-pnt-ins (nth 1 pnt-ins)
  			y-pnt-ins-1 y-pnt-ins
  			dlt-y 8
	);setq
	
	(100-empt-lin-le)
	
	;/////////////////////////////////////////////////////////////////////////////////////////////////
	(if (= str-01 "Процессор")
		(progn
			(setq nmbr-ln 3);setq
			(1000-delete-items-le nmbr-ln x-pnt-ins y-pnt-ins);удаление предыдущей записи
					
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 (strcat "Контроллер Siemens, серия S7-300, " str-02 ","))
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "артикул " str-03))
		);progn
	);if

	;/////////////////////////////////////////////////////////////////////////////////////////////////
	(if (= str-01 "Аналоговый ввод")
		(progn
			(setq nmbr-ln 3);setq
			
			(1000-delete-items-le nmbr-ln x-pnt-ins y-pnt-ins);удаление предыдущей записи
					
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Модуль ввода аналоговых сигналов Siemens, серия S7-300,")
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat str-02 ", артикул " str-03 ", " (substr str-04 1 (vl-string-search "," str-04))))
		);progn
	);if

	;/////////////////////////////////////////////////////////////////////////////////////////////////
	(if (= str-01 "Аналоговый вывод")
		(progn
			(setq nmbr-ln 3
					str-lft-02 (substr str-04 1 (vl-string-search "," str-04))
					str-04 (substr str-04 (+ (vl-string-search "," str-04) 2));3 \\
					str-lft-03 (substr str-04 1 (vl-string-search ", раз" str-04))
			);setq
			(1000-delete-items-le nmbr-ln x-pnt-ins y-pnt-ins);удаление предыдущей записи
					
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Модуль вывода аналоговых сигналов Siemens, серия S7-400,")
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat str-02 ", артикул " str-03 ", " str-lft-02 "," str-lft-03))
		);progn
	);if
	
	;/////////////////////////////////////////////////////////////////////////////////////////////////
	(if (= str-01 "Дискретный ввод")
		(progn
			(setq nmbr-ln 3
					str-lft-02 (substr str-04 1 (vl-string-search ", сое" str-04))
			);setq
			(1000-delete-items-le nmbr-ln x-pnt-ins y-pnt-ins);удаление предыдущей записи
					
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Модуль ввода дискретных сигналов Siemens, серия S7-300,")
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat str-02 ", артикул " str-03 ", " str-lft-02))
		);progn
	);if
	
	;/////////////////////////////////////////////////////////////////////////////////////////////////
	(if (= str-01 "Дискретный вывод")
		(progn
			(setq nmbr-ln 4
					str-lft-02 (substr str-04 1 (vl-string-search "," str-04))
					str-04 (substr str-04 (+ (vl-string-search "," str-04) 2));3 \\
					str-lft-03 (substr str-04 1 (vl-string-search ", сое" str-04))
			);setq
			(1000-delete-items-le nmbr-ln x-pnt-ins y-pnt-ins);удаление предыдущей записи
					
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Модуль вывода дискретных сигналов Siemens, серия S7-300,")
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat str-02 ", артикул " str-03 ", " str-lft-02 ","))
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 (strcat str-lft-03))
		);progn
	);if	
	
	;/////////////////////////////////////////////////////////////////////////////////////////////////
	(if (and (= str-01 "Модуль связи") (= str-02 "CP 341"))
		(progn
			(setq nmbr-ln 4
					str-lft-02 (substr str-04 1 (vl-string-search "," str-04))
					str-04 (substr str-04 (+ (vl-string-search "," str-04) 2));3 \\
					str-lft-03 (vl-string-left-trim " " (substr str-04 1 (vl-string-search ", 0,3" str-04)))
			);setq
			(1000-delete-items-le nmbr-ln x-pnt-ins y-pnt-ins);удаление предыдущей записи
					
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Модуль коммуникационный Siemens, серия S7-300,")
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat str-02 ", артикул " str-03 ", " str-lft-02 ", "))
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 (strcat str-lft-03))
		);progn
	);if

	(if (and (= str-01 "Модуль связи") (= str-02 "CSM 377"))
		(progn
			(setq nmbr-ln 4
					str-lft-02 (substr str-04 1 (vl-string-search "," str-04))
					str-04 (substr str-04 (+ (vl-string-search "," str-04) 2));3 \\
					str-lft-03 (vl-string-left-trim " " (substr str-04 1 (vl-string-search ", эл" str-04)))
			);setq
			(1000-delete-items-le nmbr-ln x-pnt-ins y-pnt-ins);удаление предыдущей записи
					
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Коммутатор компактный Siemens, серия S7-300,")
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat str-02 ", артикул " str-03 ", " str-lft-02 ", "))
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 (strcat str-lft-03))
		);progn
	);if

	(if (and (= str-01 "Модуль связи") (= str-02 "CP 343-1"))
		(progn
			(setq nmbr-ln 4
					str-lft-02 (substr str-04 1 (vl-string-search "," str-04))
					str-04 (substr str-04 (+ (vl-string-search "," str-04) 2));3 \\
					str-lft-03 (vl-string-left-trim " " (substr str-04 1 (vl-string-search ", эл" str-04)))
			);setq
			(1000-delete-items-le nmbr-ln x-pnt-ins y-pnt-ins);удаление предыдущей записи
					
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Процессор коммуникационный Siemens, серия S7-300,")
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat str-02 ", артикул " str-03 ", " str-lft-02 ", "))
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 (strcat str-lft-03))
		);progn
	);if

	;/////////////////////////////////////////////////////////////////////////////////////////////////
	(if (and (= str-01 "Блок питания") (= str-02 "PS 307"))
		(progn
			(setq nmbr-ln 4
					str-lft-02 (vl-string-left-trim " " (substr str-04 (vl-string-search "мак" str-04)))
			);setq
			(1000-delete-items-le nmbr-ln x-pnt-ins y-pnt-ins);удаление предыдущей записи
					
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 (strcat "Блок питания Siemens, серия S7-300, " str-02 ","))
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "артикул " str-03 ", выходное напряжение =24В,"))
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 (strcat str-lft-02))
		);progn
	);if

	;/////////////////////////////////////////////////////////////////////////////////////////////////
	(if (= str-01 "Штекер (для модуля связи)")
		(progn
			(setq nmbr-ln 4
					str-lft-02 (substr str-04 (vl-string-search "угол" str-04))
					str-lft-02 (vl-string-left-trim " " (substr str-lft-02 1 (vl-string-search "град" str-lft-02)))
			);setq
					
			(1000-delete-items-le nmbr-ln x-pnt-ins y-pnt-ins);удаление предыдущей записи
					
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Соединитель штекерный Siemens (для модулей коммуникационных,")
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "коммутаторов), серия S7-300, " str-02 ", артикул"))
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 (strcat str-03 ", " str-lft-02 "градусов"))
		);progn
	);if
	
	;/////////////////////////////////////////////////////////////////////////////////////////////////
	(if (= str-01 "Соединитель фронтальный")
		(progn
			(cond
				((= "20 полюсов, с поддержкой технологии FastConnect" str-04)
					(setq nmbr-ln 4);setq
					
					(1000-delete-items-le nmbr-ln x-pnt-ins y-pnt-ins);удаление предыдущей записи
					
					(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Соединитель фронтальный Siemens, серия S7-300, артикул")
					(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat str-03 ", 20 полюсов, с поддержкой технологии"))
					(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 "FastConnect")
				);
				
				((= "40 полюсов, с поддержкой технологии FastConnect" str-04)
					(setq nmbr-ln 4);setq
					
					(1000-delete-items-le nmbr-ln x-pnt-ins y-pnt-ins);удаление предыдущей записи
					
					(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Соединитель фронтальный Siemens, серия S7-300, артикул")
					(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat str-03 ", 40 полюсов, с поддержкой технологии"))
					(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 "FastConnect")
				);
				
				(
					(setq nmbr-ln 3);setq
					
					(1000-delete-items-le nmbr-ln x-pnt-ins y-pnt-ins);удаление предыдущей записи
					
					(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Соединитель фронтальный Siemens, серия S7-300, артикул")
					(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat str-03 ", " str-04))				
				);
			);cond
		
		);progn
	);if	

	;/////////////////////////////////////////////////////////////////////////////////////////////////
	(if (= str-01 "Шина профильная")
		(progn
			(setq nmbr-ln 4);setq
			(1000-delete-items-le nmbr-ln x-pnt-ins y-pnt-ins);удаление предыдущей записи
					
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Шина профильная Siemens (для монтажа контроллеров, модулей")
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "сигнальных), серия S7-300, артикул " str-03 ","))
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 (strcase str-04 1))
		);progn
	);if	


	;/////////////////////////////////////////////////////////////////////////////////////////////////
	(if (= str-01 "Карта Flash-EEPROM")
		(progn
			(setq nmbr-ln 3
						str-lft-02 (substr str-04 1 (vl-string-search "," str-04))
			);setq
			(1000-delete-items-le nmbr-ln x-pnt-ins y-pnt-ins);удаление предыдущей записи
					
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 (strcat "Микрокарта памяти Siemens, артикул " str-03 ","))
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 str-lft-02)
		);progn
	);if
	
	(setq cntr-1 (1+ cntr-1));setq
	
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
(defun spcf-101-01-controllers-siemens-s7-1500

( / cntr-1 dlt-y nmbr-ln pnt-ins str-01 str-02 str-03 str-04 str-99 str-lft-02 str-lft-03 str-tmp x-pnt-ins y-pnt-ins y-pnt-ins-1)

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
	(setq pnt-ins		(getpoint "\nУкажите точку вставки\n")
	  		x-pnt-ins (nth 0 pnt-ins)
	 			y-pnt-ins (nth 1 pnt-ins)
	  		y-pnt-ins-1 y-pnt-ins
	  		dlt-y 8
	);setq
	
	(101-empt-lin-spcf)
	(setvar "osmode" 0)
	(setvar "cmdecho" 0)

	;обработка данных
	;;;;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////
	(if (= "Процессор" str-01)
		(progn
			
			(setq nmbr-ln 3);setq
			
			(1000-delete-items-spcf nmbr-ln x-pnt-ins y-pnt-ins);удаление предыдущей записи
			(1000-delete-items-spcf-crtf nmbr-ln x-pnt-ins y-pnt-ins);удаление предыдущего сертификата
			(setvar "osmode" 0)
			(setvar "cmdecho" 0)

			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 (strcat str-01 ", серия S7-300"))
			(command "_TEXT" "_MC" (list (+ x-pnt-ins 160) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 (strcat str-02 ",")) ;Тип, марка, обозначение документа, опросного листа
			(command "_text" "_MC" (list (+ x-pnt-ins 160) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "артикул " str-03))
			(command "_text" "_MC" (list (+ x-pnt-ins 280) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "шт.")
			(command "_text" "_MC" (list (+ x-pnt-ins 322.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 str-99)
		);progn
	);if

	;;;;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////
	(if (= str-01 "Аналоговый ввод")
		(progn
			(setq nmbr-ln 3
						str-lft-02 (substr str-04 1 (vl-string-search "," str-04))
						str-04 (substr str-04 (+ (vl-string-search "," str-04) 2));3 \\
						str-lft-03 (substr str-04 1 (vl-string-search ", раз" str-04))
			);setq	
			(1000-delete-items-spcf nmbr-ln x-pnt-ins y-pnt-ins);удаление предыдущей записи
			(1000-delete-items-spcf-crtf nmbr-ln x-pnt-ins y-pnt-ins);удаление предыдущего сертификата
			(setvar "osmode" 0)
			(setvar "cmdecho" 0)
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Модуль ввода аналоговых сигналов Siemens, серия S7-300")
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "- " str-lft-02 ", " str-lft-03))		
			(command "_TEXT" "_MC" (list (+ x-pnt-ins 160) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 (strcat str-02 ",")) ;Тип, марка, обозначение документа, опросного листа
			(command "_text" "_MC" (list (+ x-pnt-ins 160) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "артикул " str-03))
			(command "_text" "_MC" (list (+ x-pnt-ins 280) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "шт.")
			(command "_text" "_MC" (list (+ x-pnt-ins 322.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 str-99)
		);progn
	);if

	;;;;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////
	(if (= str-01 "Аналоговый вывод")
		(progn
			(setq nmbr-ln 3
						str-lft-02 (substr str-04 1 (vl-string-search "," str-04))
						str-04 (substr str-04 (+ (vl-string-search "," str-04) 2));3 \\
						str-lft-03 (substr str-04 1 (vl-string-search ", раз" str-04))
			);setq		
			(1000-delete-items-spcf nmbr-ln x-pnt-ins y-pnt-ins);удаление предыдущей записи
			(1000-delete-items-spcf-crtf nmbr-ln x-pnt-ins y-pnt-ins);удаление предыдущего сертификата
			(setvar "osmode" 0)
			(setvar "cmdecho" 0)
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Модуль вывода аналоговых сигналов Siemens, серия S7-300")
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "- " str-lft-02 ", " str-lft-03))		
			(command "_TEXT" "_MC" (list (+ x-pnt-ins 160) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 (strcat str-02 ",")) ;Тип, марка, обозначение документа, опросного листа
			(command "_text" "_MC" (list (+ x-pnt-ins 160) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "артикул " str-03))
			(command "_text" "_MC" (list (+ x-pnt-ins 280) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "шт.")
			(command "_text" "_MC" (list (+ x-pnt-ins 322.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 str-99)
		);progn
	);if

	;;;;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////
	(if (= str-01 "Дискретный ввод")
		(progn
			(setq nmbr-ln 4
						str-lft-02 (substr str-04 1 (vl-string-search "," str-04))
						str-04 (substr str-04 (+ (vl-string-search "," str-04) 2));3 \\
						str-lft-03 (substr str-04 1 (vl-string-search ", раз" str-04))
			);setq		
			(1000-delete-items-spcf nmbr-ln x-pnt-ins y-pnt-ins);удаление предыдущей записи
			(1000-delete-items-spcf-crtf nmbr-ln x-pnt-ins y-pnt-ins);удаление предыдущего сертификата
			(setvar "osmode" 0)
			(setvar "cmdecho" 0)
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Модуль ввода дискретных сигналов Siemens, серия S7-300")
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "- " str-lft-02 ", " str-lft-03))		
			(command "_TEXT" "_MC" (list (+ x-pnt-ins 160) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 (strcat str-02 ",")) ;Тип, марка, обозначение документа, опросного листа
			(command "_text" "_MC" (list (+ x-pnt-ins 160) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "артикул " str-03))
			(command "_text" "_MC" (list (+ x-pnt-ins 280) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "шт.")
			(command "_text" "_MC" (list (+ x-pnt-ins 322.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 str-99)
		);progn
	);if


	;;;;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////
	(if (= str-01 "Дискретный вывод")
		(progn
			(setq nmbr-ln 3
						str-lft-02 (substr str-04 1 (vl-string-search ", сое" str-04))
			);setq			
			(1000-delete-items-spcf nmbr-ln x-pnt-ins y-pnt-ins);удаление предыдущей записи
			(1000-delete-items-spcf-crtf nmbr-ln x-pnt-ins y-pnt-ins);удаление предыдущего сертификата
			(setvar "osmode" 0)
			(setvar "cmdecho" 0)
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Модуль вывода дискретных сигналов Siemens, серия S7-300")
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "- " str-lft-02))			
			(command "_TEXT" "_MC" (list (+ x-pnt-ins 160) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 (strcat str-02 ",")) ;Тип, марка, обозначение документа, опросного листа
			(command "_text" "_MC" (list (+ x-pnt-ins 160) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "артикул " str-03))
			(command "_text" "_MC" (list (+ x-pnt-ins 280) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "шт.")
			(command "_text" "_MC" (list (+ x-pnt-ins 322.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 str-99)
		);progn
	);if


	;;;;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////
	(if (and (= str-01 "Модуль связи") (= str-02 "CP 341"))
		(progn			
			(setq nmbr-ln 4
						str-lft-02 (substr str-04 1 (vl-string-search "," str-04))
						str-04 (substr str-04 (+ (vl-string-search "," str-04) 2));3 \\
						str-lft-03 (vl-string-left-trim " " (substr str-04 1 (vl-string-search ", 0,3" str-04)))
			);setq
			(1000-delete-items-spcf nmbr-ln x-pnt-ins y-pnt-ins);удаление предыдущей записи
			(1000-delete-items-spcf-crtf nmbr-ln x-pnt-ins y-pnt-ins);удаление предыдущего сертификата
			(setvar "osmode" 0)
			(setvar "cmdecho" 0)			
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Модуль коммуникационный Siemens, серия серия S7-300")
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "- " str-lft-02))
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 (strcat "- " str-lft-03))
			(command "_TEXT" "_MC" (list (+ x-pnt-ins 160) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 (strcat str-02 ", артикул")) ;Тип, марка, обозначение документа, опросного листа
			(command "_text" "_MC" (list (+ x-pnt-ins 160) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 str-03)
			(command "_text" "_MC" (list (+ x-pnt-ins 280) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "шт.")
			(command "_text" "_MC" (list (+ x-pnt-ins 322.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 str-99)
		);progn
	);if


	(if (and (= str-01 "Модуль связи") (= str-02 "CSM 377"))
		(progn
			(setq nmbr-ln 4
						str-lft-02 (substr str-04 1 (vl-string-search "," str-04))
						str-04 (substr str-04 (+ (vl-string-search "," str-04) 2));3 \\
						str-lft-03 (vl-string-left-trim " " (substr str-04 1 (vl-string-search ", эл" str-04)))
			);setq
			(1000-delete-items-spcf nmbr-ln x-pnt-ins y-pnt-ins);удаление предыдущей записи
			(1000-delete-items-spcf-crtf nmbr-ln x-pnt-ins y-pnt-ins);удаление предыдущего сертификата
			(setvar "osmode" 0)
			(setvar "cmdecho" 0)
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Коммутатор компактный Siemens, серия S7-300")
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "- " str-lft-02))
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 (strcat "- " str-lft-03))
			(command "_TEXT" "_MC" (list (+ x-pnt-ins 160) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 (strcat str-02 ", артикул")) ;Тип, марка, обозначение документа, опросного листа
			(command "_text" "_MC" (list (+ x-pnt-ins 160) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 str-03)
			(command "_text" "_MC" (list (+ x-pnt-ins 280) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "шт.")
			(command "_text" "_MC" (list (+ x-pnt-ins 322.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 str-99)
		);progn
	);if


	(if (and (= str-01 "Модуль связи") (= str-02 "CP 343-1"))
		(progn
			(setq nmbr-ln 4
						str-lft-02 (substr str-04 1 (vl-string-search "," str-04))
						str-04 (substr str-04 (+ (vl-string-search "," str-04) 2));3 \\
						str-lft-03 (vl-string-left-trim " " (substr str-04 1 (vl-string-search ", эл" str-04)))
			);setq
			(1000-delete-items-spcf nmbr-ln x-pnt-ins y-pnt-ins);удаление предыдущей записи
			(1000-delete-items-spcf-crtf nmbr-ln x-pnt-ins y-pnt-ins);удаление предыдущего сертификата
			(setvar "osmode" 0)
			(setvar "cmdecho" 0)
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Процессор коммуникационный Siemens, серия S7-300")
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "- " str-lft-02))
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 (strcat "- " str-lft-03))
			(command "_TEXT" "_MC" (list (+ x-pnt-ins 160) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 (strcat str-02 ", артикул")) ;Тип, марка, обозначение документа, опросного листа
			(command "_text" "_MC" (list (+ x-pnt-ins 160) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 str-03)
			(command "_text" "_MC" (list (+ x-pnt-ins 280) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "шт.")
			(command "_text" "_MC" (list (+ x-pnt-ins 322.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 str-99)
		);progn
	);if


	;/////////////////////////////////////////////////////////////////////////////////////////////////
	(if (and (= str-01 "Блок питания") (= str-02 "PS 307"))
		(progn
			(setq nmbr-ln 3
						str-lft-02 (vl-string-left-trim " " (substr str-04 (vl-string-search "мак" str-04)))
			);setq
			(1000-delete-items-spcf nmbr-ln x-pnt-ins y-pnt-ins);удаление предыдущей записи
			(1000-delete-items-spcf-crtf nmbr-ln x-pnt-ins y-pnt-ins);удаление предыдущего сертификата
			(setvar "osmode" 0)
			(setvar "cmdecho" 0)
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Блок питания Siemens, серия S7-300")
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "- выходное напряжение =24В, " str-lft-02))
			(command "_TEXT" "_MC" (list (+ x-pnt-ins 160) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 (strcat str-02 ", артикул")) ;Тип, марка, обозначение документа, опросного листа
			(command "_text" "_MC" (list (+ x-pnt-ins 160) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 str-03)		
			(command "_text" "_MC" (list (+ x-pnt-ins 280) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "шт.")
			(command "_text" "_MC" (list (+ x-pnt-ins 322.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 str-99)

		);progn
	);if

	;;;;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////
	(if (= str-01 "Соединитель фронтальный")
		(progn
			(setq nmbr-ln 3);setq
			(1000-delete-items-spcf nmbr-ln x-pnt-ins y-pnt-ins);удаление предыдущей записи
			(1000-delete-items-spcf-crtf nmbr-ln x-pnt-ins y-pnt-ins);удаление предыдущего сертификата
			(setvar "osmode" 0)
			(setvar "cmdecho" 0)
					
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Соединитель фронтальный Siemens, серия S7-300")
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "- " str-04))
			(command "_TEXT" "_MC" (list (+ x-pnt-ins 160) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 (strcat "Артикул " str-03)) ;Тип, марка, обозначение документа, опросного листа
			(command "_text" "_MC" (list (+ x-pnt-ins 280) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "шт.")
			(command "_text" "_MC" (list (+ x-pnt-ins 322.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 str-99)
		);progn
	);if

	;;;;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////
	(if (= "Штекер (для модуля связи)" str-01)
		(progn
			(setq nmbr-ln 3
						str-lft-02 (substr str-04 (vl-string-search "угол" str-04))
						str-lft-02 (vl-string-left-trim " " (substr str-lft-02 1 (vl-string-search "град" str-lft-02)))
			);setq

			(1000-delete-items-spcf nmbr-ln x-pnt-ins y-pnt-ins);удаление предыдущей записи
			(1000-delete-items-spcf-crtf nmbr-ln x-pnt-ins y-pnt-ins);удаление предыдущего сертификата
			(setvar "osmode" 0)
			(setvar "cmdecho" 0)
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Штекер Siemens (для модуля связи)")
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "- " str-lft-02 "градусов"))			
			(command "_TEXT" "_MC" (list (+ x-pnt-ins 160) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 (strcat str-02 ",")) ;Тип, марка, обозначение документа, опросного листа
			(command "_text" "_MC" (list (+ x-pnt-ins 160) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "артикул " str-03))
			
			(command "_text" "_MC" (list (+ x-pnt-ins 280) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "шт.")

			(command "_text" "_MC" (list (+ x-pnt-ins 322.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 str-99)
		);progn
	);if

	;;;;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////
	(if (= "Шина профильная" str-01)
		(progn			
			(setq nmbr-ln 3
						str-04 (cdr (assoc 4 str-tmp))
			);setq
			(1000-delete-items-spcf nmbr-ln x-pnt-ins y-pnt-ins);удаление предыдущей записи
			(1000-delete-items-spcf-crtf nmbr-ln x-pnt-ins y-pnt-ins);удаление предыдущего сертификата
			(setvar "osmode" 0)
			(setvar "cmdecho" 0)			
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Шина профильная Siemens, для монтажа контроллеров")
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "- " (strcase str-04 1)))			
			(command "_TEXT" "_MC" (list (+ x-pnt-ins 160) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 (strcat "Артикул " str-03)) ;Тип, марка, обозначение документа, опросного листа			
			(command "_text" "_MC" (list (+ x-pnt-ins 280) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "шт.")
			(command "_text" "_MC" (list (+ x-pnt-ins 322.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 str-99)
		);progn
	);if

	;/////////////////////////////////////////////////////////////////////////////////////////////////
	(if (= str-01 "Карта Flash-EEPROM")
		(progn
			(setq nmbr-ln 3
						str-lft-02 (substr str-04 1 (vl-string-search "," str-04))
			);setq
			(1000-delete-items-spcf nmbr-ln x-pnt-ins y-pnt-ins);удаление предыдущей записи
			(1000-delete-items-spcf-crtf nmbr-ln x-pnt-ins y-pnt-ins);удаление предыдущего сертификата
			(setvar "osmode" 0)
			(setvar "cmdecho" 0)		
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Микрокарта памяти Siemens")
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "- объем " str-lft-02))			
			(command "_TEXT" "_MC" (list (+ x-pnt-ins 160) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 (strcat "Артикул " str-03)) ;Тип, марка, обозначение документа, опросного листа			
			(command "_text" "_MC" (list (+ x-pnt-ins 280) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "шт.")
			(command "_text" "_MC" (list (+ x-pnt-ins 322.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 str-99)		
		);progn
	);if





	(repeat nmbr-ln
  	(command "_insert" "зс-пустая-строка" "_X" 1 "_Y" 1 "_Z" 1 "_R" 0 (list x-pnt-ins y-pnt-ins-1))
  	(setq y-pnt-ins-1 (- y-pnt-ins-1 8));setq
	);repeat
								
	(command "_text" "_MC" (list (+ x-pnt-ins 247.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "\"Siemens\", г. Москва")
 
	(setq cntr-1 (+ cntr-1 1));setq
);repeat

(princ)
)
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в овш               ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun lecgv-101-01-controllers-siemens-s7-1500

( / cntr-1 dlt-y nmbr-ln pnt-ins str-01 str-02 str-03 str-04 str-99 str-lft-02 str-lft-03 str-tmp x-pnt-ins y-pnt-ins y-pnt-ins-1)

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
	
	;;;;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////
	(if (= "Процессор" str-01)
		(progn
			(setq nmbr-ln 4);setq
			
			(1000-delete-items-le-cgv nmbr-ln x-pnt-ins y-pnt-ins);удаление предыдущей записи
			(setvar "osmode" 0)
			(setvar "cmdecho" 0)
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Контроллер Siemens, серия S7-300,")
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat str-02 ", артикул"))
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 str-03)
			(command "_TEXT" "_MC" (list (+ x-pnt-ins 142.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 str-99)
		);progn
	);if  

	;;;;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////
	(if (= "Аналоговый ввод" str-01)
		(progn
			(setq nmbr-ln 5
						str-lft-02 (substr str-04 1 (vl-string-search "," str-04))
			);setq
			
			(1000-delete-items-le-cgv nmbr-ln x-pnt-ins y-pnt-ins);удаление предыдущей записи
			(setvar "osmode" 0)
			(setvar "cmdecho" 0)
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Модуль ввода аналоговых сигналов")
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "Siemens, серия S7-300, " str-02 ","))
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 (strcat "артикул " str-03 ","))
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 3)) 4)) 2.5 0 str-lft-02)
			(command "_TEXT" "_MC" (list (+ x-pnt-ins 142.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 str-99)
		);progn
	);if
	
	;;;;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////
	(if (= "Аналоговый вывод" str-01)
		(progn
			(setq nmbr-ln 5
						str-lft-02 (substr str-04 1 (vl-string-search "," str-04))
			);setq
			
			(1000-delete-items-le-cgv nmbr-ln x-pnt-ins y-pnt-ins);удаление предыдущей записи
			(setvar "osmode" 0)
			(setvar "cmdecho" 0)
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Модуль вывода аналоговых сигналов")
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "Siemens, серия S7-300, " str-02 ","))
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 (strcat "артикул " str-03 ","))
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 3)) 4)) 2.5 0 str-lft-02)
			(command "_TEXT" "_MC" (list (+ x-pnt-ins 142.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 str-99)
		);progn
	);if
	
	;;;;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////
	(if (= "Дискретный ввод" str-01)
		(progn
			(setq nmbr-ln 5
						str-lft-02 (substr str-04 1 (vl-string-search "," str-04))
			);setq
			
			(1000-delete-items-le-cgv nmbr-ln x-pnt-ins y-pnt-ins);удаление предыдущей записи
			(setvar "osmode" 0)
			(setvar "cmdecho" 0)
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Модуль ввода дискретных сигналов")
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "Siemens, серия S7-300, " str-02 ","))
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 (strcat "артикул " str-03 ","))
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 3)) 4)) 2.5 0 str-lft-02)
			(command "_TEXT" "_MC" (list (+ x-pnt-ins 142.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 str-99)
		);progn
	);if
	
	;;;;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////
	(if (= "Дискретный вывод" str-01)
		(progn
			(setq nmbr-ln 5
						str-lft-02 (substr str-04 1 (vl-string-search "," str-04))
			);setq
			
			(1000-delete-items-le-cgv nmbr-ln x-pnt-ins y-pnt-ins);удаление предыдущей записи
			(setvar "osmode" 0)
			(setvar "cmdecho" 0)
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Модуль вывода дискретных сигналов")
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "Siemens, серия S7-300, " str-02 ","))
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 (strcat "артикул " str-03 ","))
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 3)) 4)) 2.5 0 str-lft-02)
			(command "_TEXT" "_MC" (list (+ x-pnt-ins 142.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 str-99)
		);progn
	);if	
	
	;/////////////////////////////////////////////////////////////////////////////////////////////////
	(if (and (= str-01 "Модуль связи") (= str-02 "CP 341"))
		(progn
			(setq nmbr-ln 5
						str-lft-02 (substr str-04 1 (vl-string-search "," str-04))
						str-04 (substr str-04 (+ (vl-string-search "," str-04) 2));3 \\
						str-lft-03 (vl-string-left-trim " " (substr str-04 1 (vl-string-search ", 0,3" str-04)))
			);setq
			(1000-delete-items-le-cgv nmbr-ln x-pnt-ins y-pnt-ins);удаление предыдущей записи
			(setvar "osmode" 0)
			(setvar "cmdecho" 0)		
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Модуль коммуникационный Siemens,")
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "серия S7-300, " str-02 ", артикул"))
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 (strcat str-03 ", " str-lft-02 ","))
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 3)) 4)) 2.5 0 str-lft-03)
			(command "_TEXT" "_MC" (list (+ x-pnt-ins 142.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 str-99)
		);progn
	);if

	(if (and (= str-01 "Модуль связи") (= str-02 "CSM 377"))
		(progn
			(setq nmbr-ln 4
						str-lft-02 (substr str-04 1 (vl-string-search "," str-04))
						str-04 (substr str-04 (+ (vl-string-search "," str-04) 2));3 \\
						str-lft-03 (vl-string-left-trim " " (substr str-04 1 (vl-string-search ", эл" str-04)))
			);setq
			(1000-delete-items-le-cgv nmbr-ln x-pnt-ins y-pnt-ins);удаление предыдущей записи
			(setvar "osmode" 0)
			(setvar "cmdecho" 0)		
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Коммутатор компактный Siemens,")
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "серия S7-300, " str-02 ", артикул"))
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 (strcat str-03 ", " str-lft-02 ","))
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 3)) 4)) 2.5 0 str-lft-03)
			(command "_TEXT" "_MC" (list (+ x-pnt-ins 142.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 str-99)
		);progn
	);if

	(if (and (= str-01 "Модуль связи") (= str-02 "CP 343-1"))
		(progn
			(setq nmbr-ln 6
						str-lft-02 (substr str-04 1 (vl-string-search "," str-04))
						str-04 (substr str-04 (+ (vl-string-search "," str-04) 2));3 \\
						str-lft-03 (vl-string-left-trim " " (substr str-04 1 (vl-string-search ", эл" str-04)))
			);setq
			(1000-delete-items-le-cgv nmbr-ln x-pnt-ins y-pnt-ins);удаление предыдущей записи
			(setvar "osmode" 0)
			(setvar "cmdecho" 0)		
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Процессор коммуникационный")
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "Siemens, серия S7-300, " str-02 ","))
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 (strcat "артикул" str-03 ","))
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 3)) 4)) 2.5 0 (strcat str-lft-02))
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 4)) 4)) 2.5 0 str-lft-03)
			(command "_TEXT" "_MC" (list (+ x-pnt-ins 142.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 str-99)
		);progn
	);if



	;/////////////////////////////////////////////////////////////////////////////////////////////////
	(if (and (= str-01 "Блок питания") (= str-02 "PS 307"))
		(progn
			(setq nmbr-ln 5
						str-lft-02 (vl-string-left-trim " " (substr str-04 (vl-string-search "мак" str-04)))
			);setq
			(1000-delete-items-le-cgv nmbr-ln x-pnt-ins y-pnt-ins);удаление предыдущей записи
			(setvar "osmode" 0)
			(setvar "cmdecho" 0)
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Блок питания Siemens, серия S7-300,")
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat str-02 ", артикул " str-03 ","))
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 "выходное напряжение =24В,")
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 3)) 4)) 2.5 0 str-lft-02)
		);progn
	);if

	;;;;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////
	(if (= "Штекер (для модуля связи)" str-01)
		(progn
			(setq nmbr-ln 7
						str-lft-02 (substr str-04 (vl-string-search "угол" str-04))
						str-lft-02 (vl-string-left-trim " " (substr str-lft-02 1 (vl-string-search "град" str-lft-02)))
			);setq
			(1000-delete-items-le-cgv nmbr-ln x-pnt-ins y-pnt-ins);удаление предыдущей записи
			(setvar "osmode" 0)
			(setvar "cmdecho" 0)
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Соединитель штекерный Siemens")
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 "(для модулей коммуникационных,")
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 "коммутаторов), серия S7-300,")
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 3)) 4)) 2.5 0 (strcat str-02 ", артикул"))
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 4)) 4)) 2.5 0 (strcat str-03 ","))
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 5)) 4)) 2.5 0 (strcat str-lft-02 "градусов"))
			(command "_TEXT" "_MC" (list (+ x-pnt-ins 142.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 str-99)
		);progn
	);if

	;;;;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////
	(if (= "Соединитель фронтальный" str-01)
		(progn
			(setq str-04 (cdr (assoc 4 str-tmp))
						nmbr-ln 5
			);setq
			(1000-delete-items-le-cgv nmbr-ln x-pnt-ins y-pnt-ins);удаление предыдущей записи
			(setvar "osmode" 0)
			(setvar "cmdecho" 0)
			(cond
				((= "20 полюсов, контакты под винт" str-04)	(setq str-03 (strcat str-03 ", 20 полюсов,") str-04 "контакты под винт"));
				((= "20 полюсов, контакты-защелки" str-04) (setq str-03 (strcat str-03 ", 20 полюсов,") str-04 "контакты-защелки"));
				((= "20 полюсов, с поддержкой технологии FastConnect" str-04)	(setq str-03 (strcat str-03 ", 20 полюсов,") str-04 "с поддержкой технологии FastConnect"));
				((= "40 полюсов, контакты под винт" str-04)	(setq str-03 (strcat str-03 ", 40 полюсов,") str-04 "контакты под винт"));
				((= "40 полюсов, контакты-защелки" str-04) (setq str-03 (strcat str-03 ", 40 полюсов,") str-04 "контакты-защелки"));
				((= "40 полюсов, с поддержкой технологии FastConnect" str-04)	(setq str-03 (strcat str-03 ", 40 полюсов,") str-04 "с поддержкой технологии FastConnect"));
			);cond
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Соединитель фронтальный Siemens,")
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 "серия S7-300, артикул")
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 str-03)
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 3)) 4)) 2.5 0 str-04)	
			(command "_TEXT" "_MC" (list (+ x-pnt-ins 142.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 str-99)			
		);progn
	);if

	;;;;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////
	(if (= "Шина профильная" str-01)
		(progn
			(setq nmbr-ln 5);setq
			(1000-delete-items-le-cgv nmbr-ln x-pnt-ins y-pnt-ins);удаление предыдущей записи
			(setvar "osmode" 0)
			(setvar "cmdecho" 0)
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Шина профильная Siemens")
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "(для монтажа контроллеров, модулей),"))
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 (strcat "артикул " str-03 ","))
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 3)) 4)) 2.5 0 (strcat (strcase str-04 1)))		
			(command "_TEXT" "_MC" (list (+ x-pnt-ins 142.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 str-99)
		);progn
	);if

;/////////////////////////////////////////////////////////////////////////////////////////////////
	(if (= str-01 "Карта Flash-EEPROM")
		(progn
			(setq nmbr-ln 4
						str-lft-02 (substr str-04 1 (vl-string-search "," str-04))
			);setq
			(1000-delete-items-le-cgv nmbr-ln x-pnt-ins y-pnt-ins);удаление предыдущей записи
			(setvar "osmode" 0)
			(setvar "cmdecho" 0)		
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Микрокарта памяти Siemens,")
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "артикул " str-03 ","))			
			(command "_TEXT" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 (strcat "объем " str-lft-02)) ;Тип, марка, обозначение документа, опросного листа			
			(command "_TEXT" "_MC" (list (+ x-pnt-ins 142.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 str-99)		
		);progn
	);if



	(repeat nmbr-ln
  	(command "_insert" "овш-пэ-пустая-строка" "_X" 1 "_Y" 1 "_Z" 1 "_R" 0 (list x-pnt-ins y-pnt-ins-1))
  	(setq y-pnt-ins-1 (- y-pnt-ins-1 8));setq
	);repeat
 
	(setq cntr-1 (+ cntr-1 1));setq
);repeat

(princ)
)
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////