;/////// ************************************************************ //////////////////////////////////////////////////////////////////
;/////// ниппельные соединения                           							//////////////////////////////////////////////////////////////////
;/////// ************************************************************ //////////////////////////////////////////////////////////////////
(defun 101-08-connecting-pipe-adapter

( / adoc dcl-id list-01 list-01-read-file list-02 list-02-read-file list-03 list-03-read-file list-04 list-04-read-file list-05 list-05-read-file list-06 list-06-read-file list-07 list-07-read-file list-901 list-902 type-list)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(setq list-901 nil
      list-902 nil
);setq

(read-file-for-dialog-box "101-08-connecting-pipe-adapter.txt" 7)

(setq list-01 list-01-read-file
      list-02 list-02-read-file
      list-03 list-03-read-file
      list-04 list-04-read-file
      list-05 list-05-read-file
      list-06 list-06-read-file
      list-07 list-07-read-file
);setq

(if (< (setq dcl-id (load_dialog "dia-101-08-connecting-pipe-adapter.dcl")) 0) ;ищем диалог
		(progn
			(alert "Не найден dcl-файл")
			(exit)
		);progn
);if

(if (not (new_dialog "dia_101_08_connecting_pipe_adapter" dcl-id))
		(exit)
);if

(list-filling "txt-01" list-01)
(list-filling "txt-02" list-02)
(list-filling "txt-03" list-03)
(list-filling "txt-04" list-04)
(list-filling "txt-05" list-05)
(list-filling "txt-06" list-06)
(list-filling "txt-07" list-07)

(set_tile "txt-01" "0")
(set_tile "txt-02" "0")
(set_tile "txt-03" "0")
(set_tile "txt-04" "0")
(set_tile "txt-05" "0")
(set_tile "txt-06" "0")
(set_tile "txt-07" "0")

(action_tile "txt-01"
  (strcat "(set_tile \"txt-02\" $value)"
          "(set_tile \"txt-03\" $value)"
          "(set_tile \"txt-04\" $value)"
          "(set_tile \"txt-05\" $value)"
          "(set_tile \"txt-06\" $value)"
          "(set_tile \"txt-07\" $value)"
  );srcat
);action_tile

(action_tile "txt-02"
  (strcat "(set_tile \"txt-01\" $value)"
          "(set_tile \"txt-03\" $value)"
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
          "(set_tile \"txt-07\" $value)"
  );srcat
);action_tile

(action_tile "but1"
  (strcat "(tmp-filling-fields-101-08-connecting-pipe-adapter)"
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

(action_tile "accept"
  (strcat "(done_dialog)"
          "(exit)"
  );strcat
);action_tile

(start_dialog)
(unload_dialog dcl-id)

(if (= type-list "le") (tmp-le-101-08-connecting-pipe-adapter));if
(if (= type-list "spcf") (tmp-spcf-101-08-connecting-pipe-adapter));if

(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(vla-endundomark adoc)
(princ)
)
;/////// *************************************************************///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// КОНЕЦ ПРОГРАММЫ                                              ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// *************************************************************///////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма формирования данных/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun tmp-filling-fields-101-08-connecting-pipe-adapter

( / str-01 str-02 str-03 str-04 str-05 str-06 str-07 swtch tmp-str-902)

(setq swtch list-901);setq

(if (/= swtch nil) (setq list-902 (reverse list-902)));if

(setq str-01 (nth (atoi (get_tile "txt-01")) list-01)
			str-02 (nth (atoi (get_tile "txt-02")) list-02)
			str-03 (nth (atoi (get_tile "txt-03")) list-03)
			str-04 (nth (atoi (get_tile "txt-04")) list-04)
			str-05 (nth (atoi (get_tile "txt-05")) list-05)
			str-06 (nth (atoi (get_tile "txt-06")) list-06)
			str-07 (nth (atoi (get_tile "txt-07")) list-07)
);setq

(setq list-901 (vl-list* (strcat "Перехоник " str-07 " " str-01 " Вход " str-02 " Выход " str-03 " " str-04) list-901))

(setq tmp-str-902 (list (cons 1 str-01) (cons 2 str-02) (cons 3 str-03) (cons 4 str-04) (cons 5 str-05) (cons 6 str-06) (cons 7 str-07));список для спецификации
  		list-902 (vl-list*  tmp-str-902 list-902)
);setq

(setq list-902 (reverse list-902));setq

(list-filling "txt-901" (reverse list-901))

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в ПЭ                   /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun tmp-le-101-08-connecting-pipe-adapter

( / cntr-1 dlt-y nmbr-ln pnt-ins str-tmp str-tmp-1 str-tmp-2 str-tmp-3 str-tmp-4 str-tmp-5 str-tmp-6 str-tmp-7 x-pnt-ins y-pnt-ins)

(setq cntr-1 0);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-tmp-1 (cdr (assoc 1 str-tmp))
				str-tmp-2 (cdr (assoc 2 str-tmp))
				str-tmp-3 (cdr (assoc 3 str-tmp))
				str-tmp-4 (cdr (assoc 4 str-tmp))
				str-tmp-5 (cdr (assoc 5 str-tmp))
				str-tmp-6 (cdr (assoc 6 str-tmp))
				str-tmp-7 (cdr (assoc 7 str-tmp))
	);setq

	(cond
		((/= str-tmp-2 "Свар. диам. 14мм.") (setq str-tmp-2 (strcat "резьба " str-tmp-2)));=
		((= str-tmp-2 "Свар. диам. 14мм.") (setq str-tmp-2 "под сварку, по наружнему диаметру 14мм."));=
	);cond
	
	(cond
		((and (/= str-tmp-3 "Свар. диам. 10мм.") (/= str-tmp-3 "Свар. диам. 14мм.")) (setq str-tmp-3 (strcat "резьба " str-tmp-3)));=
		((= str-tmp-3 "Свар. диам. 10мм.") (setq str-tmp-3 "под сварку, по наружнему диаметру 10мм."));=
		((= str-tmp-3 "Свар. диам. 14мм.") (setq str-tmp-3 "под сварку, по наружнему диаметру 14мм."));=
	);cond

	(setvar "osmode" 6199)
	
	(setq pnt-ins		(getpoint "\nУкажите точку вставки\n"));setq
		
	(if (= str-tmp-7 "Гималаи")
		(progn
			(setq nmbr-ln 5);setq
								
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 (strcat "Переходник ООО НПП \"Гималаи\", " str-tmp-1 ","))
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "присоединение (вход) " str-tmp-2 ","))
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 (strcat "присоединение (выход) " str-tmp-3 ","))
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 3)) 4)) 2.5 0 (strcat str-tmp-4 ", Рраб. до " str-tmp-5 "кгс/см2, Траб. " str-tmp-6 "%%dС"))
		);progn
	);if

	(if (= str-tmp-7 "РОСМА")
		(progn
			(setq nmbr-ln 5);setq
			(1000-delete-items-le nmbr-ln x-pnt-ins y-pnt-ins);удаление предыдущей записи
					
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 (strcat "Переходник ЗАО \"РОСМА\", присоединение (вход)"))
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat str-tmp-2 ", присоединение (выход)"))
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 (strcat str-tmp-3 ", " str-tmp-4 ","))
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 3)) 4)) 2.5 0 (strcat "Рраб. до " str-tmp-5 "кгс/см2, Траб. " str-tmp-6 "%%dС"))
		);progn
	);if

	(if (= str-tmp-7 "Danfoss")
		(progn
			(setq nmbr-ln 5);setq
			(1000-delete-items-le nmbr-ln x-pnt-ins y-pnt-ins);удаление предыдущей записи
					
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 (strcat "Переходник Danfoss, присоединение (вход)"))
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat str-tmp-2 ", присоединение (выход)"))
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 (strcat str-tmp-3 ", " str-tmp-4 ","))
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 3)) 4)) 2.5 0 (strcat "Рраб. до " str-tmp-5 "кгс/см2, Траб. " str-tmp-6 "%%dС"))
		);progn
	);if

	(setq cntr-1 (1+ cntr-1));setq
);repeat

(princ)
)
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в спцф                   ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun tmp-spcf-101-08-connecting-pipe-adapter

( / cntr-1 dlt-y nmbr-ln pnt-ins str-tmp str-tmp-0 str-tmp-1 str-tmp-2 str-tmp-21 str-tmp-22 str-tmp-3 str-tmp-31 str-tmp-32 str-tmp-4 str-tmp-4-1 str-tmp-5 str-tmp-6 
str-tmp-7 x-pnt-ins y-pnt-ins y-pnt-ins-1)

(setq cntr-1 0);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-tmp-0 (cdr (assoc 0 str-tmp))
				str-tmp-1 (cdr (assoc 1 str-tmp))
				str-tmp-2 (cdr (assoc 2 str-tmp))
				str-tmp-3 (cdr (assoc 3 str-tmp))
				str-tmp-4 (cdr (assoc 4 str-tmp))
				str-tmp-5 (cdr (assoc 5 str-tmp))
				str-tmp-6 (cdr (assoc 6 str-tmp))
				str-tmp-7 (cdr (assoc 7 str-tmp))
	);setq
	
	(setvar "osmode" 6199)
	(setq pnt-ins		(getpoint "\nУкажите точку вставки\n")
	  		x-pnt-ins (nth 0 pnt-ins)
	 			y-pnt-ins (nth 1 pnt-ins)
	  		y-pnt-ins-1 y-pnt-ins
	  		dlt-y 8
	);setq
	
	(101-empt-lin-spcf)
	
	(cond
		((/= str-tmp-2 "Свар. диам. 14мм.") (setq str-tmp-2 (strcat "резьба " str-tmp-2)));=
		((= str-tmp-2 "Свар. диам. 14мм.") (setq str-tmp-2 "под сварку, по наружнему диаметру 14мм."));=
	);cond
	
	(cond
		((and (/= str-tmp-3 "Свар. диам. 10мм.") (/= str-tmp-3 "Свар. диам. 14мм.")) (setq str-tmp-3 (strcat "резьба " str-tmp-3)));=
		((= str-tmp-3 "Свар. диам. 10мм.") (setq str-tmp-3 "под сварку, по наружнему диаметру 10мм."));=
		((= str-tmp-3 "Свар. диам. 14мм.") (setq str-tmp-3 "под сварку, по наружнему диаметру 14мм."));=
	);cond
	
	(cond
		((= str-tmp-4 "Углерод. сталь") (setq str-tmp-4-1 "углеродистая сталь")); =
		((= str-tmp-4 "Нерж. сталь") (setq str-tmp-4-1 "нержавеющая сталь")); =
	); cond

	;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	(if (or (= str-tmp-7 "Гималаи")
					(= str-tmp-7 "Danfoss"));or
		(progn
			(setq nmbr-ln 6);setq
						
			(1000-delete-items-spcf nmbr-ln x-pnt-ins y-pnt-ins);удаление предыдущей записи
						
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Переходник")
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "- присоединение (вход) " str-tmp-21))
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 (strcat "- присоединение (выход) " str-tmp-31))
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 3)) 4)) 2.5 0 (strcat "- " str-tmp-4-1 ", Рраб. до " str-tmp-5 "кгс/см2, tраб. " str-tmp-6 "%%dС"))
					
			(command "_TEXT" "_MC" (list (+ x-pnt-ins 160) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 (strcat str-tmp-1)) ;Тип, марка, обозначение документа, опросного листа
						
			(command "_text" "_MC" (list (+ x-pnt-ins 322.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "0,1")	
		);progn
	);if
			
	;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	(if (= str-tmp-7 "РОСМА")
		(progn
			(setq nmbr-ln 6);setq
						
			(cond		
				((= str-tmp-2 "M20х1,5 внутр.") (setq str-tmp-22 "М20х1,5, внутренняя -")); =
				((= str-tmp-2 "G1/4 внутр.") (setq str-tmp-22 "G1/4, внутренняя -")); =
			);cond
	
			(cond		
				((= str-tmp-3 "G1/2 наружн.") (setq str-tmp-32 "G1/2, наружняя")); =
				((= str-tmp-3 "G3/8 наружн.") (setq str-tmp-32 "G3/8, наружняя")); =
			);cond
						
			(1000-delete-items-spcf nmbr-ln x-pnt-ins y-pnt-ins);удаление предыдущей записи
						
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Переходник")
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "- присоединение (вход) " str-tmp-21))
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 (strcat "- присоединение (выход) " str-tmp-31))
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 3)) 4)) 2.5 0 (strcat "- " str-tmp-4-1 ", Рраб.= до " str-tmp-5 "кгс/см2, tраб.=" str-tmp-6 "%%dС"))
					
			(command "_TEXT" "_MC" (list (+ x-pnt-ins 160) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Переходник") ;Тип, марка, обозначение документа, опросного листа
			(command "_TEXT" "_MC" (list (+ x-pnt-ins 160) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 str-tmp-22)
			(command "_TEXT" "_MC" (list (+ x-pnt-ins 160) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 str-tmp-32)
					
			(command "_text" "_MC" (list (+ x-pnt-ins 247.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "ЗАО \"РОСМА\",")
			(command "_text" "_MC" (list (+ x-pnt-ins 247.5) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 "г. Санкт-Петербург")						
		
			(command "_text" "_MC" (list (+ x-pnt-ins 322.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "0,1")
		);progn
	);if



	(if (= "Гималаи" str-tmp-7)
		(progn
			(command "_text" "_MC" (list (+ x-pnt-ins 247.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "ООО НПП \"Гималаи\",")
			(command "_text" "_MC" (list (+ x-pnt-ins 247.5) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 "г. Самара")		
		);progn
	);if

	(if (= "Danfoss" str-tmp-7)
		(progn
			(command "_text" "_MC" (list (+ x-pnt-ins 247.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Данфосс Россия,")
			(command "_text" "_MC" (list (+ x-pnt-ins 247.5) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 "г. Москва")		
		);progn
	);if

	(repeat nmbr-ln
  	(command "_insert" "зс-пустая-строка" "_X" 1 "_Y" 1 "_Z" 1 "_R" 0 (list x-pnt-ins y-pnt-ins-1))
  	(setq y-pnt-ins-1 (- y-pnt-ins-1 8));setq
	);repeat

	(command "_text" "_MC" (list (+ x-pnt-ins 280) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "шт.")

	(setq cntr-1 (+ cntr-1 1));setq
);repeat

(princ)
)
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
