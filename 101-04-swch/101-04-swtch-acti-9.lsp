;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////                                                              ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun 101-04-swtch-acti-9

( / adoc dcl-id list-01 list-01-read-file list-02 list-02-read-file list-03 list-03-read-file list-04 list-04-read-file list-05 list-05-read-file type-list)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(read-file-for-dialog-box "101-04-swtch-acti-9.txt" 5)

(setq list-01 list-01-read-file
			list-02 list-02-read-file
			list-03 list-03-read-file
			list-04 list-04-read-file
			list-05 list-05-read-file
);setq

(if (< (setq dcl-id (load_dialog "dia-101-04-swtch-acti-9.dcl")) 0) ;ищем диалог
		(progn
			(alert "Не найден dcl-файл")
			(exit)
		);progn
);if

(if (not (new_dialog "dia_101_04_swtch_acti_9" dcl-id))
		(exit)
);if

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

(action_tile "txt-01"
  (strcat "(list-filling \"txt-02\" list-02)"
  				"(list-filling \"txt-03\" list-03)"
  				"(list-filling \"txt-04\" list-04)"
  				"(list-filling \"txt-05\" list-05)"
  				"(set_tile \"txt-02\" $value)"
  				"(set_tile \"txt-03\" $value)"
  				"(set_tile \"txt-04\" $value)"
  				"(set_tile \"txt-05\" $value)"
  );srcat
);action_tile

(action_tile "txt-02"
  (strcat "(list-filling \"txt-01\" list-01)"
  				"(list-filling \"txt-03\" list-03)"
  				"(list-filling \"txt-04\" list-04)"
  				"(list-filling \"txt-05\" list-05)"
  				"(set_tile \"txt-01\" $value)"
  				"(set_tile \"txt-03\" $value)"
  				"(set_tile \"txt-04\" $value)"
  				"(set_tile \"txt-05\" $value)"
  );srcat
);action_tile

(action_tile "txt-05"
  (strcat "(list-filling \"txt-01\" list-01)"
  				"(list-filling \"txt-02\" list-02)"
  				"(list-filling \"txt-03\" list-03)"
  				"(list-filling \"txt-04\" list-04)"
  				"(set_tile \"txt-01\" $value)"
  				"(set_tile \"txt-02\" $value)"
  				"(set_tile \"txt-03\" $value)"
  				"(set_tile \"txt-04\" $value)"
  );srcat
);action_tile

(action_tile "but1"
  (strcat "(but1-101-04-swtch-acti-9)"
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
	((= type-list "le") (le-101-04-swtch-acti-9));=
	((= type-list "spcf") (spcf-101-04-swtch-acti-9));=
	((= type-list "lecgv") (lecgv-101-04-swtch-acti-9));=
);cond

(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(vla-endundomark adoc)
(gc)
(princ)
)
;/////// конец программы ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма формирования данных/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun but1-101-04-swtch-acti-9

( / cntr-1 str-00 str-01 str-02 swtch tmp-list-902 tmp-str-01 tmp-str-02 tmp-str-03 tmp-str-04 tmp-str-05 tmp-str-06 tmp-str-07 tmp-str-08)

;заполняем поле "выбрано"
(setq str-00 (nth (atoi (get_tile "txt-00")) list-00)

      cntr-1 0
);setq

(if (/= list-901 nil) 
	(setq list-901 (reverse list-901)
				list-902 (reverse list-902)
	);setq
);if

(setq str-00 (nth (atoi (get_tile "txt-00")) list-00);считываем выбранные данные
			str-01 (get_tile "txt-01")
			str-01 (strcat "(" str-01 ")")
			str-01 (read str-01)
);setq
		
(repeat (length str-01)
  (setq tmp-str-01 (nth (nth cntr-1 str-01) list-01)
  			tmp-str-02 (nth (nth cntr-1 str-01) list-02)
  			tmp-str-03 (nth (nth cntr-1 str-01) list-03)
  			tmp-str-04 (nth (nth cntr-1 str-01) list-04)
  			tmp-str-05 (nth (nth cntr-1 str-01) list-05)

  			
  			list-901 (vl-list* (strcat str-00 "  " 
  																 tmp-str-01 "  "
  																 tmp-str-02 "  "
  																 "Цвет " tmp-str-03 "  "
  																 "Подсветка " tmp-str-04 "  "
  																 tmp-str-05 "  "
  																 tmp-str-06 "  "
  																 tmp-str-07 "  "
  																 tmp-str-08 "  "
  																 ) list-901)
  );setq
  
	(setq tmp-list-902 (list (cons 0 str-00) 
													 (cons 1 tmp-str-01) 
													 (cons 2 tmp-str-02) 
													 (cons 3 tmp-str-03) 
													 (cons 4 tmp-str-04) 
													 (cons 5 tmp-str-05) 
													 (cons 6 tmp-str-06) 
													 (cons 7 tmp-str-07) 
													 (cons 8 tmp-str-08))
				list-902 (vl-list*  tmp-list-902 list-902)
	);setq
	(setq cntr-1 (1+ cntr-1));setq
);repeat

(setq list-902 (vl-list* tmp-list-902 list-902)
			list-902 (reverse list-902)
			list-901 (reverse list-901)
);setq

(list-filling "txt-901" (reverse list-901))

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в ПЭ                   //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun le-101-04-swtch-acti-9

( / cntr-1 dlt-y nmbr-ln pnt-ins str-0 str-1 str-2 str-20 str-21 str-3 str-4 str-5 str-50 str-51 str-6 str-7 str-tmp x-pnt-ins y-pnt-ins y-pnt-ins-1)

(setq cntr-1 0);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-0 (cdr (assoc 0 str-tmp))
				str-1 (cdr (assoc 1 str-tmp))
				str-2 (cdr (assoc 2 str-tmp))
				str-3 (cdr (assoc 3 str-tmp))
				str-4 (cdr (assoc 4 str-tmp))
				str-5 (cdr (assoc 5 str-tmp))
				str-6 (cdr (assoc 6 str-tmp))
				str-7 (cdr (assoc 7 str-tmp))
	);setq

	(setvar "osmode" 6199)
	
	(setq pnt-ins		(getpoint "\nУкажите точку вставки\n"));setq

	
	(cond
		((= str-2 "1НО") (setq str-20 "1 замыкающий контакт" str-21 ""));=
		((= str-2 "1НЗ") (setq str-20 "1 размыкающий контакт" str-21 ""));=
		((= str-2 "1НО, 1НЗ") (setq str-20 "1 замыкающий контакт," str-21 "1 размыкающий контакт"));=
	);cond

	(cond
		((= str-3 "Зеленый") (setq str-3 "зеленый"));=
		((= str-3 "Красный") (setq str-3 "красный"));=
	);cond
	
	(cond
		((= str-4 "Нет") (setq str-4 "без подсветки"));=
		((= str-4 "Да") (setq str-4 "с подсветкой"));=
	);cond

	(cond
		((= str-5 "220 В, перем. ток") (setq str-50 "220В переменного тока"));=
		((= str-5 "24 В, перем./пост. ток") (setq str-50 "24В переменного или" str-51 "постоянного тока"));=
	);cond

	(cond
		((= str-6 "Круг") (setq str-6 "круглая"));=
	);cond

	(cond
		((= str-7 "Пружина") (setq str-7 "с возвратом"));=
		((= str-7 "Фиксатор") (setq str-7 "с фиксацией"));=
	);cond
	
	(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Кнопка Schneider Electric, серия Harmony, артикул")
	
	(cond 
		((and (/= str-2 "1НО, 1НЗ") (= str-5 "24 В, перем./пост. ток"))
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat str-1 ", " str-20 ", цвет " str-3 ","))
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 (strcat str-4 ", " str-50 " " str-51 ","))
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 3)) 4)) 2.5 0 (strcat str-6 ", " str-7))
		);=

		((and (= str-2 "1НО, 1НЗ") (= str-5 "24 В, перем./пост. ток"))
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat str-1 ", "  str-20 " " str-21 ","))
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 (strcat "цвет " str-3 ", " str-4 ", " str-50))
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 3)) 4)) 2.5 0 (strcat str-51 ", " str-6 ", " str-7))
		);=

		((and (/= str-2 "1НО, 1НЗ") (= str-5 "220 В, перем. ток"))
			(setq nmbr-ln 4);setq
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat str-1 ", " str-20 ", цвет " str-3 ","))
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 (strcat str-4 ", " str-50 ", " str-6 ", " str-7))
		);=

		((and (= str-2 "1НО, 1НЗ") (= str-5 "220 В, перем. ток"))
			(setq nmbr-ln 5);setq
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat str-1 ", "  str-20 " " str-21 ","))
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 (strcat "цвет " str-3 ", " str-4 ", " str-50 ","))
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 3)) 4)) 2.5 0 (strcat str-6 ", " str-7))
		);=
	);cond
	
	(setq cntr-1 (1+ cntr-1));setq
);repeat

(princ)
)
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в спцф                   //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun tmp-spcf-101-04-swtch-acti-9

( / cntr-1 dlt-y nmbr-ln pnt-ins str-tmp str-tmp-0 str-tmp-1 str-tmp-10 str-tmp-11 str-tmp-12 str-tmp-13 str-tmp-2 str-tmp-21 str-tmp-22 str-tmp-3 str-tmp-31 
str-tmp-32 str-tmp-4 str-tmp-5 x-pnt-ins y-pnt-ins y-pnt-ins-1)

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
	(101-empt-lin-spcf)
	(setvar "osmode" 0)
	(setvar "cmdecho" 0)

	;обработка данных
	(if (= "Выключатель автоматический, Multi 9" str-tmp-0)
		(progn
			(cond
				((= str-tmp-3 "1 полюс")
					(setq str-tmp-31 "1"
								str-tmp-32 "1P"
					);setq
				); =
				((= str-tmp-3 "2 полюса")
					(setq str-tmp-31 "2"
								str-tmp-32 "2P"
					);setq
				); =
				((= str-tmp-3 "3 полюса")
					(setq str-tmp-31 "3"
								str-tmp-32 "3P"
					);setq
				); =
				((= str-tmp-3 "4 полюса")
					(setq str-tmp-31 "4"
								str-tmp-32 "4P"
					);setq
				); =
			); cond
			(setq nmbr-ln 5
						str-tmp-10 (strcat str-tmp-0)
						str-tmp-11 (strcat "- номинальный ток " str-tmp-4 "А")
						str-tmp-12 (strcat "- кривая срабатывания расцепителя " str-tmp-2)
						str-tmp-13 (strcat "- количество полюсов " str-tmp-31)
						str-tmp-21 (strcat str-tmp-1 " " str-tmp-32 " " str-tmp-4 "А кривая " str-tmp-2 ",")
						str-tmp-22 (strcat "артикул " str-tmp-5)
			);setq
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 str-tmp-10)
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 str-tmp-11)
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 str-tmp-12)
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 3)) 4)) 2.5 0 str-tmp-13)
			
			(command "_TEXT" "_MC" (list (+ x-pnt-ins 160) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 (strcat str-tmp-21)) ;Тип, марка, обозначение документа, опросного листа
			(command "_text" "_MC" (list (+ x-pnt-ins 160) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat str-tmp-22))

			(command "_text" "_MC" (list (+ x-pnt-ins 322.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "0,2")
		);progn
	);if

	(repeat nmbr-ln
  	(command "_insert" "зс-пустая-строка" "_X" 1 "_Y" 1 "_Z" 1 "_R" 0 (list x-pnt-ins y-pnt-ins-1))
  	(setq y-pnt-ins-1 (- y-pnt-ins-1 8)
  	);setq
	);repeat
								
	(command "_text" "_MC" (list (+ x-pnt-ins 247.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "\"Schneider Electric\",")
	(command "_text" "_MC" (list (+ x-pnt-ins 247.5) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 "г. Москва")
			
	(command "_text" "_MC" (list (+ x-pnt-ins 280) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "шт.")
	(command "_text" "_MC" (list (+ x-pnt-ins 300) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "***")
 
	(setq cntr-1 (+ cntr-1 1)
	);setq
);repeat

(princ)
)
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в овш               ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun tmp-lecgv-101-04-swtch-acti-9

( / cntr-1 dlt-y nmbr-ln pnt-ins str-tmp str-tmp-0 str-tmp-1 str-tmp-11 str-tmp-12 str-tmp-13 str-tmp-14 str-tmp-15 str-tmp-16 str-tmp-2 str-tmp-21 str-tmp-3 str-tmp-3-1 
str-tmp-4 str-tmp-4-1 str-tmp-4-2 str-tmp-5 str-tmp-6 str-tmp-99 x-pnt-ins y-pnt-ins y-pnt-ins-1)

(setq cntr-1 0 ;счетчик
);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-tmp-0 (cdr (assoc 0 str-tmp))
	);setq
(princ "\n       str-tmp = ") (princ str-tmp);Erase_DV
(getstring "\nPress Enter to continue...");Erase_DV

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
	(if (= "Выключатель автоматический, Multi 9" str-tmp-0)
		(progn
			(setq str-tmp-1 (cdr (assoc 1 str-tmp))
						str-tmp-2 (cdr (assoc 2 str-tmp))
						str-tmp-3 (cdr (assoc 3 str-tmp))
						str-tmp-4 (cdr (assoc 4 str-tmp))
						str-tmp-5 (cdr (assoc 5 str-tmp))
			);setq
			(setq nmbr-ln 5
			);setq
			
			(1000-delete-items-le-cgv nmbr-ln x-pnt-ins y-pnt-ins)
			
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 (strcat str-tmp-0))
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "Schneider Electric, серия " str-tmp-1 ","))
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 (strcat "артикул " str-tmp-5 ", " str-tmp-3 ","))
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 3)) 4)) 2.5 0 (strcat "Iном.=" str-tmp-4 "А, кривая " str-tmp-2))
			(command "_TEXT" "_MC" (list (+ x-pnt-ins 142.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "0,2")
		);progn
	);if  /////////////////////////////////////////////////////////////////////////////////////////////////////////////


	(if (= str-tmp-0 "Блок доп. контактов, серия К")
		(progn
			(setq str-tmp-1 (cdr (assoc 1 str-tmp))
						str-tmp-2 (cdr (assoc 2 str-tmp))
						str-tmp-3 (cdr (assoc 3 str-tmp))
						nmbr-ln 4
			);setq
			
			(1000-delete-items-le-cgv nmbr-ln x-pnt-ins y-pnt-ins)
			
			(cond
				((= str-tmp-2 "2НО") (setq str-tmp-2 "2 замыкающих контакта" str-tmp-21 nil));=
		  	((= str-tmp-2 "2НЗ") (setq str-tmp-2 "1 замыкающий контакт" str-tmp-21 nil));=
		  	((= str-tmp-2 "1НО, 1НЗ") (setq str-tmp-2 "1 замыкающий контакт," str-tmp-21 "1 размыкающий контакт" nmbr-ln 5));=
		  	((= str-tmp-2 "4НО") (setq str-tmp-2 "4 замыкающих контакта" str-tmp-21 nil));=
		  	((= str-tmp-2 "3НО, 1НЗ") (setq str-tmp-2 "3 замыкающих контакта," str-tmp-21 "1 замыкающий контакт" nmbr-ln 5));=
		  	((= str-tmp-2 "2НО, 2НЗ") (setq str-tmp-2 "2 замыкающих контакта," str-tmp-21 "2 размыкающих контакта" nmbr-ln 5));=
		  	((= str-tmp-2 "1НО, 3НЗ") (setq str-tmp-2 "1 замыкающий контакт," str-tmp-21 "1 размыкающий контакт" nmbr-ln 5));=
		  	((= str-tmp-2 "4НЗ") (setq str-tmp-2 "1 замыкающий контакт," str-tmp-21 "1 размыкающий контакт" nmbr-ln 5));=
			);cond
			
			(setq str-tmp-11 (strcat "Блок дополнительных контактов")
						str-tmp-12 (strcat "Schneider Electric, серия К, артикул")
						str-tmp-13 (strcat str-tmp-3 ", " str-tmp-2)
			);setq
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 str-tmp-11)
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 str-tmp-12)
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 str-tmp-13)
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 3)) 4)) 2.5 0 str-tmp-21)

			(command "_TEXT" "_MC" (list (+ x-pnt-ins 142.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "0,2")
		);progn	
	);if = str-00   /////////////////////////////////////////////////////////////////////////////////////////////////////////////

	(if (= str-tmp-0 "Реле перегрузки по току LR97")
		(progn
			(setq str-tmp-1 (cdr (assoc 1 str-tmp))
						str-tmp-2 (cdr (assoc 2 str-tmp))
						str-tmp-3 (cdr (assoc 3 str-tmp))
						str-tmp-4 (cdr (assoc 4 str-tmp))
						str-tmp-5 (cdr (assoc 5 str-tmp))
						str-tmp-6 (cdr (assoc 6 str-tmp))
						nmbr-ln 7
			);setq
			
			(1000-delete-items-le-cgv nmbr-ln x-pnt-ins y-pnt-ins)
			
			(cond
				((= str-tmp-4 "220, перем. ток") (setq str-tmp-4 "220В, переменного тока"));=
		  	((= str-tmp-4 "110, перем. ток") (setq str-tmp-4 "110В, переменного тока"));=
		  	((= str-tmp-4 "24, пост./перем. ток") (setq str-tmp-4 "24В, постоянного (переменного) тока"));=
			);cond
			
			(cond
				((= str-tmp-6 "Контактор") (setq str-tmp-6 "монтаж на контактор"));=
				((= str-tmp-6 "DIN-рейка") (setq str-tmp-6 "монтаж на DIN-рейку"));=
			);cond
			
			(setq str-tmp-11 (strcat "Реле перегрузки по току Schneider")
						str-tmp-12 (strcat "Electric, артикул " str-tmp-2 ",")
						str-tmp-13 (strcat "диапазон уставок " str-tmp-1 "А,")
						str-tmp-14 (strcat "управляющее напряжение")
						str-tmp-15 (strcat str-tmp-4 ",")
						str-tmp-16 (strcat str-tmp-6)
			);setq
			
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 str-tmp-11)
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 str-tmp-12)
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 str-tmp-13)
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 3)) 4)) 2.5 0 str-tmp-14)
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 4)) 4)) 2.5 0 str-tmp-15)
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 5)) 4)) 2.5 0 str-tmp-16)
			
			(repeat nmbr-ln
  			(command "_insert" "овш-пэ-пустая-строка" "_X" 1 "_Y" 1 "_Z" 1 "_R" 0 (list x-pnt-ins y-pnt-ins-1))
  			(setq y-pnt-ins-1 (- y-pnt-ins-1 8)
  			);setq
			);repeat
			
			(setvar "osmode" 6199)
			(setq pnt-ins		(getpoint "\nУкажите точку вставки\n")
  					x-pnt-ins (nth 0 pnt-ins)
 						y-pnt-ins (nth 1 pnt-ins)
 						nmbr-ln 4
			);setq
			(setvar "osmode" 0)
			
			(1000-delete-items-le-cgv nmbr-ln x-pnt-ins y-pnt-ins)
			
			(if (= str-tmp-6 "монтаж на контактор")
				(if (= str-tmp-5 "LC1 D09...D38")
					(progn
							(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Комплект для монтажа реле перегрузки")
							(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 "по току на контакторе Schneider")
							(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 "Electric, артикул LAD 7C1")							
					);progn
				);if
			);if

			(if (= str-tmp-6 "монтаж на контактор")					
				(if (= str-tmp-5 "LC1 D25...D38")
					(progn
						(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Комплект для монтажа реле перегрузки")
						(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 "по току на контакторе Schneider")
						(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 "Electric, артикул LAD 7C2")							
					);progn
				);if
			);if
						
			(if (= str-tmp-6 "монтаж на DIN-рейку")
				(progn
					(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Комплект для монтажа реле перегрузки")
					(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 "по току на DIN-рейке Schneider")
					(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 "Electric, артикул LAD 7B106")
				);progn
			);if


		);progn	
	);if = str-00   /////////////////////////////////////////////////////////////////////////////////////////////////////////////

	(if (= str-tmp-0 "Реле тепловое, серия К")
		(progn
			(setq str-tmp-1 (cdr (assoc 1 str-tmp))
						str-tmp-2 (cdr (assoc 2 str-tmp))
						str-tmp-3 (cdr (assoc 3 str-tmp))
						str-tmp-4 (cdr (assoc 4 str-tmp))
						str-tmp-5 (cdr (assoc 5 str-tmp))
						str-tmp-6 (cdr (assoc 6 str-tmp))
						nmbr-ln 5
			);setq
			
			(1000-delete-items-le-cgv nmbr-ln x-pnt-ins y-pnt-ins)
			
			(cond
				((= str-tmp-6 "Контактор") (setq str-tmp-6 "монтаж на контактор"));=
				((= str-tmp-6 "DIN-рейка") (setq str-tmp-6 "монтаж на DIN-рейку"));=
			);if
			
			(setq str-tmp-11 (strcat "Реле тепловое Schneider Electric,")
						str-tmp-12 (strcat "серия К, артикул " str-tmp-3 ",")
						str-tmp-13 (strcat "диапазон уставок " str-tmp-2 "А,")
						str-tmp-14 (strcat str-tmp-6)
			);setq
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 str-tmp-11)
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 str-tmp-12)
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 str-tmp-13)
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 3)) 4)) 2.5 0 str-tmp-14)			
			
			(if (= str-tmp-6 "монтаж на DIN-рейку")
				(progn
					(repeat nmbr-ln
  					(command "_insert" "овш-пэ-пустая-строка" "_X" 1 "_Y" 1 "_Z" 1 "_R" 0 (list x-pnt-ins y-pnt-ins-1))
  					(setq y-pnt-ins-1 (- y-pnt-ins-1 8)
  					);setq
					);repeat
			
					(setvar "osmode" 6199)
					(setq pnt-ins		(getpoint "\nУкажите точку вставки\n")
  							x-pnt-ins (nth 0 pnt-ins)
 								y-pnt-ins (nth 1 pnt-ins)
 								nmbr-ln 4
					);setq
					(setvar "osmode" 0)
			
					(1000-delete-items-le-cgv nmbr-ln x-pnt-ins y-pnt-ins)		
				
					(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Комплект для монтажа реле теплового")
					(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 "серии К на DIN-рейке Schneider")
					(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 "Electric, артикул LA7-K0064")
					(command "_TEXT" "_MC" (list (+ x-pnt-ins 142.5) (- (- y-pnt-ins (* dlt-y 5)) 0)) 2.5 0 "0,2")
				);progn
			);if
		);progn	
	);if = str-00   /////////////////////////////////////////////////////////////////////////////////////////////////////////////

	(if (= str-tmp-0 "Реле контроля фаз")
		(progn
			(setq str-tmp-1 (cdr (assoc 1 str-tmp))
						str-tmp-2 (cdr (assoc 2 str-tmp))
						str-tmp-3 (cdr (assoc 3 str-tmp))
						str-tmp-4 (cdr (assoc 4 str-tmp))
						nmbr-ln 6
			);setq
			
			(1000-delete-items-le-cgv nmbr-ln x-pnt-ins y-pnt-ins)	
			
			(cond
				((= str-tmp-3 "208...480, перем. ток") (setq str-tmp-3 "208...480В" str-tmp-3-1 "переменный ток"));=
			);cond
			(cond
				((= str-tmp-4 "1 перекл. контакт") (setq str-tmp-4 "1 переключающий" str-tmp-4-1 "контакт"));=
			);cond
			(setq str-tmp-11 (strcat "Реле контроля трехфазного питания")
						str-tmp-12 (strcat "Schneider Electric, артикул ")
						str-tmp-13 (strcat str-tmp-1 ", напряжение " str-tmp-3 ",")
						str-tmp-14 (strcat str-tmp-3-1 ", " str-tmp-4)
						str-tmp-15 (strcat str-tmp-4-1)
			);setq
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 str-tmp-11)
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 str-tmp-12)
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 str-tmp-13)
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 3)) 4)) 2.5 0 str-tmp-14)
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 4)) 4)) 2.5 0 str-tmp-15)
			(command "_TEXT" "_MC" (list (+ x-pnt-ins 142.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "0,2")
		);progn	
	);if = str-00   /////////////////////////////////////////////////////////////////////////////////////////////////////////////

	(if (= str-tmp-0 "Кнопка, серия Multi 9")
		(progn
			(setq str-tmp-1 (cdr (assoc 1 str-tmp))
						str-tmp-2 (cdr (assoc 2 str-tmp))
						str-tmp-3 (cdr (assoc 3 str-tmp))
						str-tmp-4 (cdr (assoc 4 str-tmp))
						str-tmp-5 (cdr (assoc 5 str-tmp))
						nmbr-ln 4
			);setq
			
			(1000-delete-items-le-cgv nmbr-ln x-pnt-ins y-pnt-ins)	
			
			(if (= str-tmp-1 "18032")
				(progn
					(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Кнопка Schneider Electric, серия Multi 9,")
					(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 "артикул 18032, 1 кнопка,")
					(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 "1 замыкающий контакт")
				);progn
			);if


		);progn	
	);if = str-00 ;;;;////////////////////////////////////////////////////////////////////////

	(if (= str-tmp-0 "Кнопка, серия Harmony")
		(progn
			(setq str-tmp-1 (cdr (assoc 1 str-tmp))
						str-tmp-2 (cdr (assoc 2 str-tmp))
						str-tmp-3 (cdr (assoc 3 str-tmp))
						str-tmp-4 (cdr (assoc 4 str-tmp))
						str-tmp-5 (cdr (assoc 5 str-tmp))
			);setq
			
			(cond
				((= str-tmp-2 "2НЗ, 1НО") (setq str-tmp-2 "2 размыкающих, 1 замыкающий"));=
				((= str-tmp-2 "1НО") (setq str-tmp-2 "1 замыкающий"));=
				((= str-tmp-2 "1НЗ") (setq str-tmp-2 "1 размыкающий"));=
			);cond
			
			(cond
				((= str-tmp-3 "Красный") (setq str-tmp-3 "красный"));=
				((= str-tmp-3 "Зеленый") (setq str-tmp-3 "зеленый"));=
			);cond
			
			(cond
				((= str-tmp-4 "Нет, 220В") (setq str-tmp-4 "без индикатора" str-tmp-4-1 "220В" str-tmp-4-2 "переменный"));=
				((= str-tmp-4 "Да, 220В") (setq str-tmp-4 "с индикатором" str-tmp-4-1 "220В" str-tmp-4-2 "переменный"));=
			);cond
			
			(cond
				((= str-tmp-5 "Пружинный возврат") (setq str-tmp-5 "с самовозвратом"));=
			);cond
			
			(if (= str-tmp-1 "XB6AS8349B")
				(progn
					(setq nmbr-ln 6
					);setq
			
					(1000-delete-items-le-cgv nmbr-ln x-pnt-ins y-pnt-ins)
				
					(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Кнопка Schneider Electric, серия")
					(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 "Harmony, артикул XB6 AS8349B,")
					(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 "2 размыкающих, 1 замыкающий") 
					(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 3)) 4)) 2.5 0 "контакт, аварийного останова,")
					(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 4)) 4)) 2.5 0 "толкатель типа \"Гриб\"")
				);progn
			);if
			
			(if (= (vl-string-mismatch "XB7EA" str-tmp-1) 5)
				(progn
					(setq nmbr-ln 6
					);setq
			
					(1000-delete-items-le-cgv nmbr-ln x-pnt-ins y-pnt-ins)
				
					(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Кнопка Schneider Electric, серия")
					(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "Harmony, артикул " str-tmp-1 ","))
					(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 (strcat str-tmp-2 " контакт, " str-tmp-3 " цвет,"))
					(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 3)) 4)) 2.5 0 (strcat str-tmp-4 ", " str-tmp-4-1 ", " str-tmp-4-2))
					(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 4)) 4)) 2.5 0 (strcat "ток, " str-tmp-5))
				);progn
			);if
		);progn	
	);if = str-00 ;;;;////////////////////////////////////////////////////////////////////////

	(if (= str-tmp-0 "Переключатель, серия Harmony")
		(progn
			(setq str-tmp-1 (cdr (assoc 1 str-tmp))
						str-tmp-2 (cdr (assoc 2 str-tmp))
						str-tmp-3 (cdr (assoc 3 str-tmp))
						str-tmp-4 (cdr (assoc 4 str-tmp))
						str-tmp-5 (cdr (assoc 5 str-tmp))
						nmbr-ln 5
			);setq
			
			(1000-delete-items-le-cgv nmbr-ln x-pnt-ins y-pnt-ins)
			
			(if (= str-tmp-1 "XB4 BG33")
				(progn
					(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Переключатель Schneider Electric,")
					(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 "серия Harmony, артикул XB4 BG33,")
					(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 "3 положения, 2 замыкающих контакта,")
					(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 3)) 4)) 2.5 0 "фиксация с ключом")
				);progn
			);if
		);progn	
	);if = str-00 ;;;;////////////////////////////////////////////////////////////////////////

	(if (= str-tmp-0 "Лампа сигнальная, серия Harmony")
		(progn
			(setq str-tmp-1 (cdr (assoc 1 str-tmp))
						str-tmp-2 (cdr (assoc 2 str-tmp))
						str-tmp-3 (cdr (assoc 3 str-tmp))
						str-tmp-4 (cdr (assoc 4 str-tmp))
						str-tmp-5 (cdr (assoc 5 str-tmp))
						str-tmp-6 (cdr (assoc 6 str-tmp))
			);setq
			
			(cond
				((= str-tmp-2 "Красный") (setq str-tmp-2 "красный"));=
				((= str-tmp-2 "Зеленый") (setq str-tmp-2 "зеленый"));=
			);cond
			
			(cond
				((= str-tmp-4 "Переменный, 50Гц") (setq str-tmp-4 "переменный"));=
			);cond

			(cond
				((= str-tmp-5 "Винт") (setq str-tmp-5 "винтовой"));=
			);cond
					
			(if (= (vl-string-mismatch "XB7EV" str-tmp-1) 5)
				(progn
					(setq nmbr-ln 5
					);setq
			
					(1000-delete-items-le-cgv nmbr-ln x-pnt-ins y-pnt-ins)
				
					(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Лампа сигнальная Schneider Electric,")
					(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "серия Harmony, " "артикул " str-tmp-1 ","))
					(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 (strcat str-tmp-2 " цвет, " str-tmp-3 "В, " str-tmp-4 " ток,"))
					(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 3)) 4)) 2.5 0 (strcat str-tmp-5 " зажим"))
				);progn
			);if
		);progn	
	);if = str-00 ;;;;////////////////////////////////////////////////////////////////////////

	;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	(if (= str-tmp-0 "Выключатель автоматический, TeSys")
		(progn
			(setq str-tmp-1 (cdr (assoc 1 str-tmp))
						str-tmp-2 (cdr (assoc 2 str-tmp))
						str-tmp-3 (cdr (assoc 3 str-tmp))
						str-tmp-4 (cdr (assoc 4 str-tmp))
						str-tmp-5 (cdr (assoc 5 str-tmp))	
						str-tmp-6 (cdr (assoc 6 str-tmp))
						str-tmp-99 (cdr (assoc 99 str-tmp))
			);setq
			
			(cond
				((= str-tmp-6 "Пружинный") (setq str-tmp-6 "пружинные"));=

			);cond
			
			(setq nmbr-ln 8 ;количество строк
			);setq
			
			(1000-delete-items-le-cgv nmbr-ln x-pnt-ins y-pnt-ins)
				
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Выключатель автоматический")
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 "Schneider Electric, серия TeSys,")
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 (strcat "артикул " str-tmp-2 ", диапазон"))
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 3)) 4)) 2.5 0 (strcat "теплового расцепителя " str-tmp-3 "А,"))
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 4)) 4)) 2.5 0 "уставка электромагнитного")
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 5)) 4)) 2.5 0 (strcat "расцепителя " str-tmp-4 "А,"))
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 6)) 4)) 2.5 0 (strcat str-tmp-6 " контакты"))
			
			(command "_TEXT" "_MC" (list (+ x-pnt-ins 142.5) (- (- y-pnt-ins (* dlt-y 5)) 0)) 2.5 0 str-tmp-99)
		);progn	
	);if = str-00 



























	(repeat nmbr-ln
  	(command "_insert" "овш-пэ-пустая-строка" "_X" 1 "_Y" 1 "_Z" 1 "_R" 0 (list x-pnt-ins y-pnt-ins-1))
  	(setq y-pnt-ins-1 (- y-pnt-ins-1 8)
  	);setq
	);repeat
 
	(setq cntr-1 (+ cntr-1 1)
	);setq
);repeat

(princ)
)
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////