;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////                                                              ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun 101-01-plc-s7-1500

( / adoc dcl-id list-01 list-01-read-file list-02 list-02-read-file list-03 list-03-read-file list-04 list-04-read-file list-801 list-802 list-900 list-901 list-902 list-99 str-01 type-list)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(read-file-for-dialog-box-01 "101-01-plc-s7-1500-01-general.txt" 3)

(setq str-01 "0"
			list-901 nil
			list-902 nil
			list-04-read-file nil

			list-01 list-01-read-file
			list-801 list-02-read-file
			list-802 list-03-read-file
);setq

(txt-01-101-01-plc-s7-1500 str-01)

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
(list-filling "txt-900" list-900)

(set_tile "txt-01" "0")
(set_tile "txt-02" "0")
(set_tile "txt-03" "0")
(set_tile "txt-04" "0")
(set_tile "txt-99" "0")

(action_tile "txt-01"
  (strcat "(setq str-01 (get_tile \"txt-01\"))"
  				"(txt-01-101-01-plc-s7-1500 str-01)"
  );srcat
);action_tile

(action_tile "txt-02"
  (strcat "(set_tile \"txt-03\" $value)"
  			 	"(set_tile \"txt-04\" $value)"
  				"(set_tile \"txt-900\" $value)"
  );srcat
);action_tile

(action_tile "txt-03"
  (strcat "(set_tile \"txt-02\" $value)"
  			 	"(set_tile \"txt-04\" $value)"
  			 	"(set_tile \"txt-900\" $value)"
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
	((= type-list "le") (le-101-01-plc-s7-1500 list-902));=
	((= type-list "spcf") (spcf-101-01-plc-s7-1500 list-902));=
	((= type-list "lecgv") (lecgv-101-01-plc-s7-1500 list-902));=
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
(defun txt-01-101-01-plc-s7-1500

(str-01 / list-01-read-file list-02-read-file list-03-read-file list-04-read-file list-900-dscr list-900-menu name-file-1 num-flds)

(setq name-file-1 (nth (atoi str-01) list-801)
			num-flds (atoi (nth (atoi str-01) list-802))
);setq

(read-file-for-dialog-box-01 name-file-1 num-flds)

(set_tile "ml-31" (nth 0 list-900-menu))
(set_tile "ml-32" (nth 1 list-900-menu))
(set_tile "ml-41" (nth 2 list-900-menu))
(set_tile "ml-42" (nth 3 list-900-menu))

(setq list-02 list-01-read-file
			list-03 list-02-read-file
			list-04 list-03-read-file
			list-99 list-04-read-file
			list-900 list-900-dscr
);setq

(if (/= list-900 nil) 
	(divide-text-into-parts list-900 26)
);if

(list-filling "txt-02" list-02)
(list-filling "txt-03" list-03)
(list-filling "txt-04" list-04)
(list-filling "txt-99" list-99)
(list-filling "txt-900" list-900)

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

( / str-01 str-02 str-03 str-04 str-902 str-99 str-prfx)

(setq str-01 (nth (atoi (get_tile "txt-01")) list-01)
			str-02 (nth (atoi (get_tile "txt-02")) list-02)
			str-03 (nth (atoi (get_tile "txt-03")) list-03)
			str-04 (nth (atoi (get_tile "txt-04")) list-04)
			str-99 (nth (atoi (get_tile "txt-99")) list-99)
			str-prfx "S7-1500"
);setq

(if (/= list-901 nil) 
	(setq list-901 (reverse list-901)
				list-902 (reverse list-902)
	);setq
);if


;;;;;;;;////////////////////////////////
(if (= str-01 "Процессор")
	(setq list-901 (vl-list* (strcat str-02 "  Uпит. " str-03 "  " str-04) list-901)
				str-902 (list (cons 1 str-01) 
											(cons 2 (strcat str-prfx " " str-02))
											(cons 3 (strcat "Uпит. " str-03))
											(cons 4 str-04) 
											(cons 99 str-99))	
	);setq
);if

;;;;;;;;////////////////////////////////
(if (= str-01 "Блок питания")
	(setq list-901 (vl-list* (strcat str-02 "  Uвх. " str-03 "  " str-04) list-901)
				str-902 (list (cons 1 str-01) 
											(cons 2 (strcat str-prfx " " str-02)) 
											(cons 3 (strcat "Uвх. " str-03))
											(cons 4 str-04) 
											(cons 99 str-99))	
	);setq
);if

;;;;;;;;////////////////////////////////
(if (or (= str-01 "Модуль A-in")
		  	(= str-01 "Модуль A-out")
		  	(= str-01 "Модуль D-in")
		  	(= str-01 "Модуль D-out"));or
	(progn
		(if (= str-03 "32")
			(setq str-chnl "канала")
			(setq str-chnl "каналов")
		);if
		
		(setq list-901 (vl-list* (strcat str-01 "  " str-02 "  " str-03 " " str-chnl " (" str-04 ")") list-901)
					str-902 (list (cons 1 str-01)
												(cons 2 (strcat str-prfx " " str-02)) 
												(cons 3 (strcat str-03 " " str-chnl " (" str-04 ")"))
												(cons 99 str-99))
		);setq
	);progn
);if

(setq list-902 (vl-list* str-902 list-902)
			list-901 (reverse list-901)
			list-902 (reverse list-902)
);setq

(list-filling "txt-901" list-901)

(princ)
)
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в ПЭ                   /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun le-101-01-plc-s7-1500

(list-902 / cntr-1 pnt-ins str-01 str-02 str-03 str-701 str-702 str-tmp)

(setq cntr-1 0);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-01 (cdr (assoc 1 str-tmp))
				str-02 (cdr (assoc 2 str-tmp))
				str-03 (cdr (assoc 3 str-tmp))
				
				str-702 nil
	);setq

	(setvar "osmode" 6199)
	
	(setq pnt-ins (getpoint "\nУкажите точку вставки\n"));setq
	
	;///////////////////////////////////////////////////////////////////
	(if (or (= str-01 "Процессор")
					(= str-01 "Блок питания"))
		(setq str-701 (strcat str-01 " " str-02 ", " str-03));setq
	);if
	
	;/////////////////////////////////////////////////////////////////////////////////////////////////
	(if (= str-01 "Модуль A-in")
		(setq str-701 (strcat "Модуль ввода аналоговых сигналов " str-02 ", " str-03));setq
	);if
	
	;/////////////////////////////////////////////////////////////////////////////////////////////////
	(if (= str-01 "Модуль A-out")
		(setq str-701 (strcat "Модуль вывода аналоговых сигналов " str-02 ", " str-03));setq
	);if
	
	;/////////////////////////////////////////////////////////////////////////////////////////////////
	(if (= str-01 "Модуль D-in")
		(setq str-701 (strcat "Модуль ввода дискретных сигналов " str-02 ", " str-03));setq
	);if	
	
	;/////////////////////////////////////////////////////////////////////////////////////////////////
	(if (= str-01 "Модуль D-out")
		(setq str-701 (strcat "Модуль вывода дискретных сигналов " str-02 ", " str-03));setq
	);if

	
	(split-str-parts-le-01-general str-701 str-702 pnt-ins "**1**");
	
	(setq cntr-1 (1+ cntr-1));setq
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