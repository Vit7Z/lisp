;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////                                                              ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun 101-01-plc-s7-300

( / adoc dcl-id list-01 list-01-read-file list-02 list-02-read-file list-03 list-03-read-file list-04 list-801 list-802 list-901 list-902 list-99 str-01 type-list)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(read-file-for-dialog-box "101-01-plc-s7-300-01-general.txt" 3)

(setq list-901 nil
      list-902 nil
			list-01 list-01-read-file
			list-801 list-02-read-file
			list-802 list-03-read-file
			str-01 nil	
);setq

(start-101-01-plc-s7-300)

(if (< (setq dcl-id (load_dialog "dia-101-01-plc-s7-300.dcl")) 0) ;ищем диалог
	(progn
		(alert "Не найден dcl-файл")
		(exit)
	);progn
);if

(if (not (new_dialog "dia_101_s7_300_siemens" dcl-id))
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
  (strcat "(start-101-01-plc-s7-300)");srcat
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
  (strcat "(but1-101-01-plc-s7-300)");srcat
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
	((= type-list "le") (le-101-01-plc-s7-300));=
	((= type-list "spcf") (spcf-101-01-plc-s7-300));=
	((= type-list "lecgv") (lecgv-101-01-plc-s7-300));=
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
(defun start-101-01-plc-s7-300

( / list-01-read-file list-02-read-file list-03-read-file list-04-read-file name-file-1 num-flds)

(if (= nil str-01) 
	(setq str-01 (nth 0 list-01)
				name-file-1 (nth 0 list-801)
				num-flds (atoi (nth 0 list-802))
	);setq
	
	(setq str-01 (nth (atoi (get_tile "txt-01")) list-01)
				name-file-1 (nth (atoi (get_tile "txt-01")) list-801)
				num-flds (atoi (nth (atoi (get_tile "txt-01")) list-802))
	);setq
);if

(read-file-for-dialog-box (strcat name-file-1 ".txt") num-flds)

(setq list-02 list-01-read-file
			list-03 list-02-read-file
			list-04 list-03-read-file
			list-99 list-04-read-file	
);setq

(if (or (= str-01 "Соединитель фронтальный")
				(= str-01 "Шина профильная")
				(= str-01 "Карта Flash-EEPROM")
		);
	(setq list-02 nil
				list-03 list-01-read-file
				list-04 list-02-read-file
				list-99 list-03-read-file	
	);setq
);if

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
(defun but1-101-01-plc-s7-300

( / cntr-1 str-01 str-02 str-03 str-04 str-99 swtch tmp-list-902)

(setq str-01 (nth (atoi (get_tile "txt-01")) list-01)
      swtch list-901
      cntr-1 0
);setq

 (if (/= swtch nil) (setq list-902 (reverse list-902)));if

;заполняем поле "выбрано"
(setq str-01 (nth (atoi (get_tile "txt-01")) list-01)
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
	
		(setq str-02 (nth (atoi (get_tile "txt-02")) list-02)
					list-901 (vl-list* (strcat str-01 "  " str-02 "  " str-04) list-901)
					tmp-list-902 (list (cons 1 str-01) (cons 2 str-02) (cons 3 str-03) (cons 4 str-04) (cons 99 str-99))					
		);setq
);if

(if (or (= str-01 "Соединитель фронтальный")
				(= str-01 "Шина профильная")
				(= str-01 "Карта Flash-EEPROM")
		);
	
		(setq list-901 (vl-list* (strcat str-01 "  " str-03 "  " str-04) list-901)
					tmp-list-902 (list (cons 1 str-01) (cons 3 str-03) (cons 4 str-04) (cons 99 str-99))					
		);setq
);if

(setq list-902 (vl-list*  tmp-list-902 list-902)
			list-902 (reverse list-902)
);setq

(list-filling "txt-901" (reverse list-901))

(princ)
)
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в ПЭ                   /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun le-101-01-plc-s7-300

( / cntr-1 pnt-ins str-01 str-02 str-03 str-04 str-99 str-lft-02 str-tmp str-txt str-txt-01)

(setq cntr-1 0);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-01 (cdr (assoc 1 str-tmp))
				str-02 (cdr (assoc 2 str-tmp))
				str-03 (cdr (assoc 3 str-tmp))
				str-04 (cdr (assoc 4 str-tmp))
				str-99 (cdr (assoc 99 str-tmp))
	);setq
	
	(setq pnt-ins (getpoint "\nУкажите точку вставки\n"));setq
	
	(100-empt-lin-le)
	
	;/////////////////////////////////////////////////////////////////////////////////////////////////
	(if (= str-01 "Процессор")
		(setq str-txt (strcat "Контроллер Siemens, серия S7-300, " str-02 ", артикул " str-03)
					str-txt-01 nil
		);setq
	);if

	;/////////////////////////////////////////////////////////////////////////////////////////////////
	(if (= str-01 "Аналоговый ввод")
		(setq str-lft-02 (substr str-04 1 (vl-string-search "," str-04))
					str-701 (strcat "Модуль ввода аналоговых сигналов Siemens, серия S7-300, " str-02 ", артикул " str-03 ", " str-lft-02)
					str-702 nil
		);setq
	);if

	;/////////////////////////////////////////////////////////////////////////////////////////////////
	(if (= str-01 "Аналоговый вывод")
		(setq str-lft-02 (substr str-04 1 (vl-string-search "," str-04))
					str-txt (strcat "Модуль вывода аналоговых сигналов Siemens, серия S7-300, " str-02 ", артикул " str-03 ", " str-lft-02)
					str-txt-01 nil
		);setq
	);if
	
	;/////////////////////////////////////////////////////////////////////////////////////////////////
	(if (= str-01 "Дискретный ввод")
		(setq str-lft-02 (substr str-04 1 (vl-string-search "," str-04))
					str-txt (strcat "Модуль ввода дискретных сигналов Siemens, серия S7-300, " str-02 ", артикул " str-03 ", " str-lft-02)
					str-txt-01 nil
		);setq
	);if
	
	;/////////////////////////////////////////////////////////////////////////////////////////////////
	(if (= str-01 "Дискретный вывод")
		(setq str-lft-02 (substr str-04 1 (vl-string-search "," str-04))
					str-txt (strcat "Модуль вывода дискретных сигналов Siemens, серия S7-300, " str-02 ", артикул " str-03 ", " str-lft-02)
					str-txt-01 nil
		);setq
	);if	
	
	;/////////////////////////////////////////////////////////////////////////////////////////////////
	(if (and (= str-01 "Модуль связи") (= str-02 "CP 341"))
		(setq str-lft-02 (substr str-04 1 (vl-string-search "," str-04))
					str-txt (strcat "Модуль коммуникационный Siemens, серия S7-300, " str-02 ", артикул " str-03 ", " str-lft-02)
					str-txt-01 nil
		);setq
	);if

	(if (and (= str-01 "Модуль связи") (= str-02 "CSM 377"))
		(setq str-lft-02 (substr str-04 1 (vl-string-search "," str-04))
					str-txt (strcat "Коммутатор компактный Siemens, серия S7-300, " str-02 ", артикул " str-03 ", " str-lft-02)
					str-txt-01 nil
		);setq
	);if

	(if (and (= str-01 "Модуль связи") (= str-02 "CP 343-1"))
		(setq str-lft-02 (substr str-04 1 (vl-string-search "," str-04))
					str-txt (strcat "Процессор коммуникационный Siemens, серия S7-300, " str-02 ", артикул " str-03 ", " str-lft-02)
					str-txt-01 nil
		);setq
	);if

	;/////////////////////////////////////////////////////////////////////////////////////////////////
	(if (and (= str-01 "Блок питания") (= str-02 "PS 307"))
		(setq str-lft-02 (vl-string-left-trim " " (substr str-04 (vl-string-search "мак" str-04)))
					str-txt (strcat "Блок питания Siemens, серия S7-300, " str-02 ", артикул " str-03 ", Uвых. =24В, " str-lft-02)
					str-txt-01 nil
		);setq
	);if

	;/////////////////////////////////////////////////////////////////////////////////////////////////
	(if (= str-01 "Штекер (для модуля связи)")
		(setq str-txt (strcat "Соединитель штекерный Siemens (для модулей коммуникационных коммутаторов), " str-02 ", артикул " str-03)
					str-txt-01 nil
		);setq
	);if
	
	;/////////////////////////////////////////////////////////////////////////////////////////////////
	(if (= str-01 "Соединитель фронтальный")
		(setq str-txt (strcat "Соединитель фронтальный Siemens, серия S7-300, артикул " str-03 ", " str-04)
					str-txt-01 nil
		);setq
	);if

	;/////////////////////////////////////////////////////////////////////////////////////////////////
	(if (= str-01 "Шина профильная")
		(setq str-txt (strcat "Шина профильная Siemens (для монтажа контроллеров, модулей сигнальных), серия S7-300, артикул " str-03 ", " (strcase str-04 1))
					str-txt-01 nil
		);setq
	);if


	;/////////////////////////////////////////////////////////////////////////////////////////////////
	(if (= str-01 "Карта Flash-EEPROM")
		(setq str-txt (strcat "Микрокарта памяти Siemens, артикул " str-03)
					str-txt-01 nil
		);setq
	);if
	
	(split-str-parts-le-01-general str-701 str-702 pnt-ins);
	
	(setq cntr-1 (1+ cntr-1));setq
);repeat

(princ)
)
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в спцф                   ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun spcf-101-01-plc-s7-300

( / cntr-1 dlt-y nmbr-ln pnt-ins str-01 str-02 str-03 str-04 str-99 str-lft-02 str-lft-03 str-tmp str-txt str-unt x-pnt-ins y-pnt-ins y-pnt-ins-1)

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
	
	(setq pnt-ins		(getpoint "\nУкажите точку вставки\n"));setq

	;;;;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////
	(if (= "Процессор" str-01)
		(progn
			
			(setq nmbr-ln 3
						str-unt "шт."
						str-txt (strcat str-02 ", артикул " str-03)
			);setq
			
			(1000-delete-items-spcf nmbr-ln pnt-ins)
			(1000-delete-items-spcf-crtf nmbr-ln pnt-ins)

			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 (strcat str-01 ", серия S7-300"))
		);progn
	);if

	;;;;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////
	(if (= str-01 "Аналоговый ввод")
		(progn
			(setq nmbr-ln 3
						str-lft-02 (substr str-04 1 (vl-string-search "," str-04))
						str-04 (substr str-04 (+ (vl-string-search "," str-04) 2));3 \\
						str-lft-03 (substr str-04 1 (vl-string-search ", раз" str-04))
						str-unt "шт."
						str-txt (strcat str-02 ", артикул " str-03)
			);setq
			
			(1000-delete-items-spcf nmbr-ln pnt-ins)
			(1000-delete-items-spcf-crtf nmbr-ln pnt-ins)

			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Модуль ввода аналоговых сигналов, серия S7-300")
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "- " str-lft-02 ", " str-lft-03))
		);progn
	);if

	;;;;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////
	(if (= str-01 "Аналоговый вывод")
		(progn
			(setq nmbr-ln 3
						str-lft-02 (substr str-04 1 (vl-string-search "," str-04))
						str-04 (substr str-04 (+ (vl-string-search "," str-04) 2));3 \\
						str-lft-03 (substr str-04 1 (vl-string-search ", раз" str-04))
						str-unt "шт."
						str-txt (strcat str-02 ", артикул " str-03)
			);setq
			
			(1000-delete-items-spcf nmbr-ln pnt-ins)
			(1000-delete-items-spcf-crtf nmbr-ln pnt-ins)

			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Модуль вывода аналоговых сигналов, серия S7-300")
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "- " str-lft-02 ", " str-lft-03))	
		);progn
	);if

	;;;;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////
	(if (= str-01 "Дискретный ввод")
		(progn
			(setq nmbr-ln 4
						str-lft-02 (substr str-04 1 (vl-string-search "," str-04))
						str-04 (substr str-04 (+ (vl-string-search "," str-04) 2));3 \\
						str-lft-03 (substr str-04 1 (vl-string-search ", раз" str-04))
						str-unt "шт."
						str-txt (strcat str-02 ", артикул " str-03)
			);setq
			
			(1000-delete-items-spcf nmbr-ln pnt-ins)
			(1000-delete-items-spcf-crtf nmbr-ln pnt-ins)

			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Модуль ввода дискретных сигналов, серия S7-300")
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "- " str-lft-02 ", " str-lft-03))		
		);progn
	);if


	;;;;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////
	(if (= str-01 "Дискретный вывод")
		(progn
			(setq nmbr-ln 3
						str-lft-02 (substr str-04 1 (vl-string-search ", сое" str-04))
						str-unt "шт."
						str-txt (strcat str-02 ", артикул " str-03)
			);setq
			
			(1000-delete-items-spcf nmbr-ln pnt-ins)
			(1000-delete-items-spcf-crtf nmbr-ln pnt-ins)

			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Модуль вывода дискретных сигналов, серия S7-300")
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "- " str-lft-02))
		);progn
	);if


	;;;;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////
	(if (and (= str-01 "Модуль связи") (= str-02 "CP 341"))
		(progn			
			(setq nmbr-ln 3
						str-lft-02 (substr str-04 1 (vl-string-search "," str-04))
						str-04 (substr str-04 (+ (vl-string-search "," str-04) 2));3 \\
						str-lft-03 (vl-string-left-trim " " (substr str-04 1 (vl-string-search ", 0,3" str-04)))
						str-unt "шт."
						str-txt (strcat str-02 ", артикул " str-03)
			);setq
			
			(1000-delete-items-spcf nmbr-ln pnt-ins)
			(1000-delete-items-spcf-crtf nmbr-ln pnt-ins)
			
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Модуль коммуникационный, серия S7-300")
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "- " str-lft-02 ", " str-lft-03))
		);progn
	);if


	(if (and (= str-01 "Модуль связи") (= str-02 "CSM 377"))
		(progn
			(setq nmbr-ln 3
						str-lft-02 (substr str-04 1 (vl-string-search "," str-04))
						str-04 (substr str-04 (+ (vl-string-search "," str-04) 2));3 \\
						str-lft-03 (vl-string-left-trim " " (substr str-04 1 (vl-string-search ", эл" str-04)))
						str-unt "шт."
						str-txt (strcat str-02 ", артикул " str-03)
			);setq
			
			(1000-delete-items-spcf nmbr-ln pnt-ins)
			(1000-delete-items-spcf-crtf nmbr-ln pnt-ins)

			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Коммутатор компактный, серия S7-300")
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "- " str-lft-02 ", " str-lft-03))
		);progn
	);if


	(if (and (= str-01 "Модуль связи") (= str-02 "CP 343-1"))
		(progn
			(setq nmbr-ln 3
						str-lft-02 (substr str-04 1 (vl-string-search "," str-04))
						str-04 (substr str-04 (+ (vl-string-search "," str-04) 2));3 \\
						str-lft-03 (vl-string-left-trim " " (substr str-04 1 (vl-string-search ", эл" str-04)))
						str-unt "шт."
						str-txt (strcat str-02 ", артикул " str-03)
			);setq
			
			(1000-delete-items-spcf nmbr-ln pnt-ins)
			(1000-delete-items-spcf-crtf nmbr-ln pnt-ins)

			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Процессор коммуникационный, серия S7-300")
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "- " str-lft-02 ", " str-lft-03))
		);progn
	);if


	;/////////////////////////////////////////////////////////////////////////////////////////////////
	(if (and (= str-01 "Блок питания") (= str-02 "PS 307"))
		(progn
			(setq nmbr-ln 3
						str-lft-02 (vl-string-left-trim " " (substr str-04 (vl-string-search "мак" str-04)))
						str-unt "шт."
						str-txt (strcat str-02 ", артикул " str-03)
			);setq
			
			(1000-delete-items-spcf nmbr-ln pnt-ins)
			(1000-delete-items-spcf-crtf nmbr-ln pnt-ins)

			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Блок питания, серия S7-300")
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "- Uвых. =24В, " str-lft-02))
			(command "_TEXT" "_MC" (list (+ x-pnt-ins 160) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 (strcat str-02 ", артикул"))
		);progn
	);if

	;;;;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////
	(if (= str-01 "Соединитель фронтальный")
		(progn
			(setq nmbr-ln 3
						str-unt "шт."
						str-txt (strcat "Артикул " str-03)
			);setq
			
			(1000-delete-items-spcf nmbr-ln pnt-ins)
			(1000-delete-items-spcf-crtf nmbr-ln pnt-ins)
					
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Соединитель фронтальный, серия S7-300")
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "- " str-04))
		);progn
	);if

	;;;;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////
	(if (= "Штекер (для модуля связи)" str-01)
		(progn
			(setq nmbr-ln 3
						str-lft-02 (substr str-04 (vl-string-search "угол" str-04))
						str-lft-02 (vl-string-left-trim " " (substr str-lft-02 1 (vl-string-search "град" str-lft-02)))
						str-unt "шт."
						str-txt (strcat "Артикул " str-03)
			);setq

			(1000-delete-items-spcf nmbr-ln pnt-ins)
			(1000-delete-items-spcf-crtf nmbr-ln pnt-ins)

			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Штекер (для модуля связи)")
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "- " str-lft-02 "градусов"))
		);progn
	);if

	;;;;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////
	(if (= "Шина профильная" str-01)
		(progn			
			(setq nmbr-ln 3
						str-04 (cdr (assoc 4 str-tmp))
						str-unt "шт."
						str-txt (strcat "Артикул " str-03)
			);setq
			
			(1000-delete-items-spcf nmbr-ln pnt-ins)
			(1000-delete-items-spcf-crtf nmbr-ln pnt-ins)
		
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Шина профильная, для монтажа контроллеров")
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "- " (strcase str-04 1)))
		);progn
	);if

	;/////////////////////////////////////////////////////////////////////////////////////////////////
	(if (= str-01 "Карта Flash-EEPROM")
		(progn
			(setq nmbr-ln 3
						str-lft-02 (substr str-04 1 (vl-string-search "," str-04))
						str-txt (strcat "Артикул " str-03)
						str-unt "шт."
			);setq
			
			(1000-delete-items-spcf nmbr-ln pnt-ins)
			(1000-delete-items-spcf-crtf nmbr-ln pnt-ins)
	
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Микрокарта памяти")
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "- объем " str-lft-02))
		);progn
	);if
	
	(split-str-parts-spcf-60-01 str-txt nil "," pnt-ins)
								
	(command "_text" "_MC" (list (+ x-pnt-ins 247.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Siemens, г. Москва")
	
	(command "_text" "_MC" (list (+ x-pnt-ins 280) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 str-unt)
	
	(command "_text" "_MC" (list (+ x-pnt-ins 322.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 str-99)

	(repeat nmbr-ln
  	(command "_insert" "зс-пустая-строка" "_X" 1 "_Y" 1 "_Z" 1 "_R" 0 (list x-pnt-ins y-pnt-ins-1))
  	(setq y-pnt-ins-1 (- y-pnt-ins-1 8));setq
	);repeat
	
	(setq cntr-1 (+ cntr-1 1));setq
);repeat

(princ)
)
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в овш               ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun lecgv-101-01-plc-s7-300

( / cntr-1 dlt-y pnt-ins str-01 str-02 str-03 str-04 str-99 str-lft-02 str-tmp str-txt x-pnt-ins y-pnt-ins y-pnt-ins-1)

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
	
	(setq pnt-ins		(getpoint "\nУкажите точку вставки\n"));setq
	
	;;;;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////
	(if (= "Процессор" str-01)
		(setq str-txt (strcat "Контроллер Siemens, серия S7-300, " str-02 ", артикул " str-03));setq
	);if

	;;;;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////
	(if (= "Аналоговый ввод" str-01)
		(setq str-lft-02 (substr str-04 1 (vl-string-search "," str-04))
					str-txt (strcat "Модуль ввода аналоговых сигналов Siemens, серия S7-300, " str-02 ", артикул " str-03 ", " str-lft-02)
		);setq
	);if
	
	;;;;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////
	(if (= "Аналоговый вывод" str-01)
		(setq str-lft-02 (substr str-04 1 (vl-string-search "," str-04))
					str-txt (strcat "Модуль вывода аналоговых сигналов Siemens, серия S7-300, " str-02 ", артикул " str-03 ", " str-lft-02)
		);setq
	);if
	
	;;;;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////
	(if (= "Дискретный ввод" str-01)
		(setq str-lft-02 (substr str-04 1 (vl-string-search "," str-04))
					str-txt (strcat "Модуль ввода дискретных сигналов Siemens, серия S7-300, " str-02 ", артикул " str-03 ", " str-lft-02)
		);setq
	);if
	
	;;;;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////
	(if (= "Дискретный вывод" str-01)
		(setq str-lft-02 (substr str-04 1 (vl-string-search "," str-04))
					str-txt (strcat "Модуль вывода дискретных сигналов Siemens, серия S7-300, " str-02 ", артикул " str-03 ", " str-lft-02)
		);setq
	);if
	
	;/////////////////////////////////////////////////////////////////////////////////////////////////
	(if (and (= str-01 "Модуль связи") (= str-02 "CP 341"))
		(setq str-lft-02 (substr str-04 1 (vl-string-search "," str-04))
					str-txt (strcat "Модуль коммуникационный Siemens, серия S7-300, " str-02 ", артикул " str-03 ", " str-lft-02)		
		);setq
	);if

	(if (and (= str-01 "Модуль связи") (= str-02 "CSM 377"))
		(setq str-lft-02 (substr str-04 1 (vl-string-search "," str-04))
					str-txt (strcat "Коммутатор компактный Siemens, серия S7-300, " str-02 ", артикул " str-03 ", " str-lft-02)
		);setq
	);if

	(if (and (= str-01 "Модуль связи") (= str-02 "CP 343-1"))
		(setq str-lft-02 (substr str-04 1 (vl-string-search "," str-04))
					str-txt (strcat "Процессор коммуникационный Siemens, серия S7-300, " str-02 ", артикул " str-03 ", " str-lft-02)
		);setq
	);if

	;/////////////////////////////////////////////////////////////////////////////////////////////////
	(if (and (= str-01 "Блок питания") (= str-02 "PS 307"))
		(setq str-lft-02 (vl-string-left-trim " " (substr str-04 (vl-string-search "мак" str-04)))
					str-txt (strcat "Блок питания Siemens, серия S7-300, " str-02 ", артикул " str-03 ", Uвых. =24В, " str-lft-02)
		);setq
	);if

	;;;;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////
	(if (= "Штекер (для модуля связи)" str-01)
		(setq str-txt (strcat "Соединитель штекерный Siemens (для модулей коммуникационных коммутаторов), " str-02 ", артикул " str-03));setq
	);if

	;;;;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////
	(if (= "Соединитель фронтальный" str-01)
		(setq str-txt (strcat "Соединитель фронтальный Siemens, серия S7-300, артикул " str-03 ", " str-04));setq	
	);if

	;;;;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////
	(if (= "Шина профильная" str-01)
		(setq str-txt (strcat "Шина профильная Siemens (для монтажа контроллеров, модулей сигнальных), серия S7-300, артикул " str-03 ", " (strcase str-04 1)));setq
	);if

;/////////////////////////////////////////////////////////////////////////////////////////////////
	(if (= str-01 "Карта Flash-EEPROM")
		(setq str-txt (strcat "Микрокарта памяти Siemens, артикул " str-03));setq
	);if
	
	(split-str-parts-lecgv-65-01 str-txt pnt-ins)
 
	(setq cntr-1 (+ cntr-1 1));setq
);repeat

(princ)
)
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////