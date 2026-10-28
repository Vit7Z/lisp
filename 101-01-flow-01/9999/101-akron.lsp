;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////                                                              ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun 101-akron

( / adoc dcl-id file-name file-open list-00 list-04 list-05 list-06 list-07 list-09 list-901 list-902 path-file-open str-1 str-f type-list)

(vl-load-com)
(vla-startundomark
  (setq adoc (vla-get-activedocument (vlax-get-acad-object))
  );setq
);start undo

(setq str-f 1;переменные
      list-901 nil
      list-902 nil
      list-00 (list "Вода")
			list-04 (list "Нет" "4-20" "0-5" "0-20")
			list-05 (list "RS485" "RS232")
			list-06 (list "40" "40" "50" "50" "65" "65" "80" "80" "100" "100" "125" "125" "150" "150" "200" "200" "250" "250" "350" "350" "400" "400" 
			"500" "500" "650" "650" "800" "800" "1000" "1000" "2000" "2000")
			list-07 (list "0,16...8" "1...50" "0,2...10" "2...100" "0,25...12,5" "3,2...160" "0,32...16" "5...250" "0,4...20" "6,4...320" "0,5...25" "8...400" 
			"0,64...32" "12...600" "0,8...40" "20...1000" "1...50" "25...1250"
			"1,2...60" "32...1600" "1,6...80" "40...2000" "2...100" "64...3200" "2,5...125" "80...4000" "3,2...160" "160...8000" 
			"4...200" "320...16000" "8...400" "800...40000")
			list-09 (list "Нет" "Да")
			str-1 nil
			file-name nil
			file-open nil
			path-file-open nil
);setq

(if (< (setq dcl-id (load_dialog "dia-101-akron.dcl")) 0) ;ищем диалог
		(progn
			(alert "Не найден dcl-файл")
			(exit)
		);progn
);if

(if (not (new_dialog "dia_akron" dcl-id))
		(exit)
);if

(list-filling "txt-00" list-00)
(list-filling "txt-04" list-04)
(list-filling "txt-05" list-05)
(list-filling "txt-06" list-06)
(list-filling "txt-07" list-07)
(list-filling "txt-09" list-09)

(set_tile "txt-00" "0")
(set_tile "txt-04" "0")
(set_tile "txt-05" "0")
(set_tile "txt-06" "0")
(set_tile "txt-07" "0")
(set_tile "txt-09" "0")

(action_tile "txt-06"
  (strcat "(list-filling \"txt-07\" list-07)"
  				"(set_tile \"txt-07\" $value)"
  );srcat
);action_tile

(action_tile "txt-07"
  (strcat "(list-filling \"txt-06\" list-06)"
  				"(set_tile \"txt-06\" $value)"
  );srcat
);action_tile

(action_tile "but1"
  (strcat "(tmp-filling-fields-101-akron)"
  				"(list-filling \"txt-00\" list-00)"
  				"(list-filling \"txt-04\" list-04)"
					"(list-filling \"txt-05\" list-05)"
					"(list-filling \"txt-06\" list-06)"
					"(list-filling \"txt-07\" list-07)"
					"(list-filling \"txt-09\" list-09)"
					"(set_tile \"txt-00\" \"0\")"
					"(set_tile \"txt-04\" \"0\")"
          "(set_tile \"txt-05\" \"0\")" 
          "(set_tile \"txt-06\" \"0\")"
          "(set_tile \"txt-07\" \"0\")"
          "(set_tile \"txt-09\" \"0\")"
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
  (strcat "(setq type-list \"letech\")"
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

(if (= type-list "le")
	(tmp-le-101-akron)
);if

(if (= type-list "spcf")
	(tmp-spcf-101-akron)
);if

(if (= type-list "letech")
	(tmp-letech-101-akron)
);if

(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(vla-endundomark adoc)
(princ)
)
;/////// конец программы ///////


;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма формирования данных/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun tmp-filling-fields-101-akron

( / cntr-1 str-06 swtch tmp-str-00 tmp-str-011 tmp-str-012 tmp-str-02 tmp-str-031 tmp-str-032 tmp-str-04 tmp-str-041 tmp-str-05 tmp-str-06 tmp-str-07 
tmp-str-08 tmp-str-09 tmp-str-902)

(setq swtch list-901 ;запоминаем первоначальное состояние списка в поле "выбрано"
      cntr-1 0 ;счетчик, номер элемента в списке
);setq
  
(setq tmp-str-00 (nth (atoi (get_tile "txt-00")) list-00)
			tmp-str-011 (get_tile "txt-011")
			tmp-str-012 (get_tile "txt-012")
			tmp-str-02 (get_tile "txt-02")
			tmp-str-031 (get_tile "txt-031")
			tmp-str-032 (get_tile "txt-032")
			tmp-str-04 (nth (atoi (get_tile "txt-04")) list-04)
			tmp-str-05 (nth (atoi (get_tile "txt-05")) list-05)
			str-06 (get_tile "txt-06")
			tmp-str-08 (get_tile "txt-08")
			tmp-str-09 (nth (atoi (get_tile "txt-09")) list-09)
);setq

(setq str-06 (strcat "(" str-06 ")");преобразуем строку в список
      str-06 (read str-06)
);setq

(if (/= swtch nil);если есть уже выбраннное то переворачиваем
	(setq list-902 (reverse list-902);список характеристик для спецификации
	);setq
);if

(repeat (length str-06)
  (setq tmp-str-06 (nth (nth cntr-1 str-06) list-06)
  			tmp-str-07 (nth (nth cntr-1 str-06) list-07)
  );setq

	(cond
		((= tmp-str-04 "Нет") (setq tmp-str-041 "Ток. сигн. нет"
		)); =
		((= tmp-str-04 "4-20") (setq tmp-str-041 "4-20мА"
		)); =
		((= tmp-str-04 "0-5") (setq tmp-str-041 "0-5мА"
		)); =
		((= tmp-str-04 "0-20") (setq tmp-str-041 "0-20мА"
		)); =
	); cond

	(setq list-901 (vl-list* (strcat "Акрон-01 Ду" tmp-str-06 "мм " tmp-str-07 "м3/ч " tmp-str-041 " " tmp-str-05) list-901);список для "выбрано"
	);setq
	
	(setq tmp-str-902 (list (cons 0 tmp-str-00) (cons 1 (strcat tmp-str-011 "..." tmp-str-012)) (cons 2 tmp-str-02) (cons 3 (strcat tmp-str-031 "..." tmp-str-032)) 
													(cons 4 tmp-str-04) (cons 5 tmp-str-05) (cons 6 tmp-str-06) (cons 7 tmp-str-07) (cons 8 tmp-str-08) (cons 9 tmp-str-09));список для спецификации
  			list-902 (vl-list*  tmp-str-902 list-902)
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
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в ПЭ                   ////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun tmp-le-101-akron

( / cntr-1 dlt-y nmbr-ln pnt-ins str-tmp str-tmp-0 str-tmp-1 str-tmp-11 str-tmp-12 str-tmp-2 str-tmp-3 str-tmp-4 str-tmp-41 str-tmp-5 str-tmp-6 
str-tmp-7 str-tmp-8 str-tmp-9 x-pnt-ins y-pnt-ins y-pnt-ins-1)

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
				str-tmp-6 (cdr (assoc 6 str-tmp))
				str-tmp-7 (cdr (assoc 7 str-tmp))
				str-tmp-8 (cdr (assoc 8 str-tmp))
				str-tmp-9 (cdr (assoc 9 str-tmp))
	);setq

	(cond
		((= str-tmp-4 "Нет") (setq str-tmp-41 "Ток. сигн. нет"
		)); =
		((= str-tmp-4 "4-20") (setq str-tmp-41 "4-20мА"
		)); =
		((= str-tmp-4 "0-5") (setq str-tmp-41 "0-5мА"
		)); =
		((= str-tmp-4 "0-20") (setq str-tmp-41 "0-20мА"
		)); =
	); cond
		
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
	

	(setq nmbr-ln 3 ;количество строк
						str-tmp-11 (strcat "Расходомер ультразвуковой с накладными излучателями")
						str-tmp-12 (strcat "Акрон-01, Ду" str-tmp-6 ", диапазон измеряемых расходов " str-tmp-7 "м3/ч")
	);setq
	(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 str-tmp-11)
	(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 str-tmp-12)

	(setq cntr-1 (1+ cntr-1);счетчик
	);setq
	
	(command "_text" "_MC" (list (+ x-pnt-ins 115) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "***")
	
	(repeat nmbr-ln
  	(command "_insert" "пэ-пустая-строка" "_X" 1 "_Y" 1 "_Z" 1 "_R" 0 (list x-pnt-ins y-pnt-ins-1))
  	(setq y-pnt-ins-1 (- y-pnt-ins-1 8)
  	);setq
	);repeat
);repeat

(princ)
)
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в спцф                   ////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun tmp-spcf-101-akron

( / cntr-1 dlt-y nmbr-ln pnt-ins str-tmp str-tmp-0 str-tmp-1 str-tmp-10 str-tmp-11 str-tmp-110 str-tmp-12 str-tmp-13 str-tmp-14 str-tmp-15 str-tmp-16 
str-tmp-17 str-tmp-18 str-tmp-19 str-tmp-2 str-tmp-21 str-tmp-22 str-tmp-3 str-tmp-4 str-tmp-41 str-tmp-5 str-tmp-6 str-tmp-7 str-tmp-8 str-tmp-9 
str-tmp-91 x-pnt-ins y-pnt-ins y-pnt-ins-1)

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
				str-tmp-6 (cdr (assoc 6 str-tmp))
				str-tmp-7 (cdr (assoc 7 str-tmp))
				str-tmp-8 (cdr (assoc 8 str-tmp))
				str-tmp-9 (cdr (assoc 9 str-tmp))
	);setq
(princ "\n         str-tmp = ") (princ str-tmp);Erase_DV
(getstring "\nPress Enter to continue...");Erase_DV
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


	(cond
		((= str-tmp-4 "Нет") 
			(setq str-tmp-41 "нет"
						str-tmp-42 ""
			);setq
		); =
		((= str-tmp-4 "4-20") 
			(setq str-tmp-41 "4-20мА"
						str-tmp-42 "4-20мА-"
			);setq
		); =
		((= str-tmp-4 "0-5") 
			(setq str-tmp-41 "0-5мА"
						str-tmp-42 "0-5мА-"
			);setq
		); =
		((= str-tmp-4 "0-20") 
			(setq str-tmp-41 "0-20мА"
						str-tmp-42 "0-20мА-"
			);setq
		); =
	); cond
	
	(cond
		((= "Нет" str-tmp-9) 
			(setq str-tmp-91 "без GSM-модема")
		); =
		((= "Да" str-tmp-9) 
			(setq str-tmp-91 "GSM-модем")
		); =
	);cond

	;обработка данных
	(setq nmbr-ln 12
				str-tmp-10 (strcat "Расходомер ультразвуковой с накладными излучателями")
				str-tmp-11 (strcat "- измеряемая среда " (strcase str-tmp-0 1))
				str-tmp-12 (strcat "- температура среды " str-tmp-1 "%%dC")
				str-tmp-13 (strcat "- давление среды " str-tmp-2 "кгс/см2")
				str-tmp-14 (strcat "- расход (требуемый) " str-tmp-3 "м3/ч")
				str-tmp-15 (strcat "- пределы измерений " str-tmp-7 "м3/ч")
				str-tmp-16 (strcat "- диаметр расходомера Ду" str-tmp-6 "мм")
				str-tmp-17 (strcat "- токовый сигнал " str-tmp-41)
				str-tmp-18 (strcat "- интерфейс " str-tmp-5)
				str-tmp-19 (strcat "- длина кабеля связи " str-tmp-8 "м")
				str-tmp-110 (strcat "- " str-tmp-91)
				str-tmp-21 (strcat "Акрон-01-" str-tmp-42 str-tmp-5 "-")
				str-tmp-22 (strcat "ТУ 4213-011-18623641-05")
	);setq
	(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 str-tmp-10)
	(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 str-tmp-11)
	(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 str-tmp-12)
	(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 3)) 4)) 2.5 0 str-tmp-13)
	(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 4)) 4)) 2.5 0 str-tmp-14)
	(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 5)) 4)) 2.5 0 str-tmp-15)
	(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 6)) 4)) 2.5 0 str-tmp-16)
	(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 7)) 4)) 2.5 0 str-tmp-17)
	(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 8)) 4)) 2.5 0 str-tmp-18)
	(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 9)) 4)) 2.5 0 str-tmp-19)
	(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 10)) 4)) 2.5 0 str-tmp-110)
			
	(command "_TEXT" "_MC" (list (+ x-pnt-ins 160) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 (strcat str-tmp-21)) ;Тип, марка, обозначение документа, опросного листа
	(command "_text" "_MC" (list (+ x-pnt-ins 160) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat str-tmp-22))

	(command "_text" "_MC" (list (+ x-pnt-ins 322.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 str-tmp-4)










	(repeat nmbr-ln
  	(command "_insert" "зс-пустая-строка" "_X" 1 "_Y" 1 "_Z" 1 "_R" 0 (list x-pnt-ins y-pnt-ins-1))
  	(setq y-pnt-ins-1 (- y-pnt-ins-1 8)
  	);setq
	);repeat
								
	(command "_text" "_MC" (list (+ x-pnt-ins 247.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "ООО \"Риттал\",")
			(command "_text" "_MC" (list (+ x-pnt-ins 247.5) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 "г. Москва")	
			
	(command "_text" "_MC" (list (+ x-pnt-ins 280) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "шт.")
	(command "_text" "_MC" (list (+ x-pnt-ins 300) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "***")
 
	(setq cntr-1 (+ cntr-1 1)
	);setq
);repeat

(princ)
)
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в ПЭ ОВШ               ////////////////////////////////////////////////////////////////////
(defun tmp-lecgv-101-cases-rittal

( / cntr-1 dlt-y nmbr-ln pnt-ins str-tmp str-tmp-0 str-tmp-1 str-tmp-11 str-tmp-12 str-tmp-13 str-tmp-14 str-tmp-2 
str-tmp-3 str-tmp-4 str-tmp-5 x-pnt-ins y-pnt-ins y-pnt-ins-1)

(setq cntr-1 0 ;счетчик
);setq

(repeat (length list-spcf)
	(setq str-tmp (nth cntr-1 list-spcf)
				str-tmp-0 (cdr (assoc 0 str-tmp))
				str-tmp-1 (cdr (assoc 1 str-tmp))
				str-tmp-2 (cdr (assoc 2 str-tmp))
				str-tmp-3 (cdr (assoc 3 str-tmp))
				str-tmp-4 (cdr (assoc 4 str-tmp))
				str-tmp-5 (cdr (assoc 5 str-tmp))
	);setq

	(cond
		((= "RAL7022" str-tmp-5)
				(setq str-tmp-14 (strcat "(коричнево-серый)")
				);setq
		); = str-1

		((= "RAL7035" str-tmp-5)
				(setq str-tmp-14 (strcat "(светло-коричневый)")
				);setq
		); = str-1

		((= "RAL9005" str-tmp-5)
				(setq str-tmp-14 (strcat "(иссиня-черный)")
				);setq
		); = str-1
	);cond

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
	(if (= "Корпус шкафа, серия TS 8" str-tmp-0)
		(progn
			(setq nmbr-ln 5
						str-tmp-11 (strcat str-tmp-0 ", Rittal,")
						str-tmp-12 (strcat "арт. № TS " str-tmp-2 ", размеры (ШхВхГ)")
						str-tmp-13 (strcat str-tmp-1 "мм., цвет " str-tmp-5)
						str-tmp-14 (strcat str-tmp-14)
			);setq
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 str-tmp-11)
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 str-tmp-12)
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 str-tmp-13)
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 3)) 4)) 2.5 0 str-tmp-14)
		);progn
	);if
		

	


	(repeat nmbr-ln
  	(command "_insert" "овш-пэ-пустая-строка" "_X" 1 "_Y" 1 "_Z" 1 "_R" 0 (list x-pnt-ins y-pnt-ins-1))
  	(setq y-pnt-ins-1 (- y-pnt-ins-1 8)
  	);setq
	);repeat
		
	(command "_text" "_MC" (list (- x-pnt-ins 7.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "***");номер по овш
	(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "*******");поз по пэ
	(command "_TEXT" "_MC" (list (+ x-pnt-ins 130) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "шт.");количество
 
	(setq cntr-1 (+ cntr-1 1)
	);setq
);repeat

(princ)
)
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////
