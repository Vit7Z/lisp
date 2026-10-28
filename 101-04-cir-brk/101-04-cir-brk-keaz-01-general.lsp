;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////                                                              ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun 101-04-auto-swtch-keaz

( / adoc dcl-id list-00 list-01 list-02 list-03 list-04 list-05 list-06 list-07 list-08 list-901 list-902 str-00 str-f type-list)

(vl-load-com)
(vla-startundomark
  (setq adoc (vla-get-activedocument (vlax-get-acad-object))
  );setq
);start undo

(setq str-f 1;переменные
			str-00 nil
			
			list-00 (list "АП50Б3МТ")
			
      list-901 nil
      list-902 nil
);setq

(txt-00-101-04-auto-swtch-keaz)

(if (< (setq dcl-id (load_dialog "dia-101-04-auto-swtch-keaz.dcl")) 0) ;ищем диалог
		(progn
			(alert "Не найден dcl-файл")
			(exit)
		);progn
);if

(if (not (new_dialog "dia_101_04_auto_swtch_keaz" dcl-id))
		(exit)
);if

(list-filling "txt-00" list-00)
(list-filling "txt-01" list-01)
(list-filling "txt-02" list-02)
(list-filling "txt-03" list-03)
(list-filling "txt-04" list-04)
(list-filling "txt-05" list-05)
(list-filling "txt-06" list-06)
(list-filling "txt-07" list-07)
(list-filling "txt-08" list-08)

(set_tile "txt-00" "0")
(set_tile "txt-01" "0")
(set_tile "txt-02" "0")
(set_tile "txt-03" "0")
(set_tile "txt-04" "0")
(set_tile "txt-05" "0")
(set_tile "txt-06" "0")
(set_tile "txt-07" "0")
(set_tile "txt-08" "0")

(action_tile "txt-00"
  (strcat "(txt-00-101-04-auto-swtch-keaz)");srcat
);action_tile

(action_tile "but1"
  (strcat "(but1-101-04-auto-swtch-keaz)");strcat
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
	((= type-list "le") (le-101-04-auto-swtch-keaz));=
	((= type-list "spcf") (spcf-101-04-auto-swtch-keaz));=
	((= type-list "lecgv") (lecgv-101-04-auto-swtch-keaz));=
);cond

(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(vla-endundomark adoc)
(gc)
(princ)
)
;/////// конец программы ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun txt-00-101-04-auto-swtch-keaz

()


(cond
	((= nil str-00) (setq str-00 (nth 0 list-00)));=
	((/= nil str-00) (setq str-00 (nth (atoi (get_tile "txt-00")) list-00)));=
);cond

(cond
	((= str-00 "АП50Б3МТ") 
		(setq list-01 (list "1,6" "2,5" "4,0" "6,3" "10" "16" "25" "40" "50" "63")
					list-02 (list "3")
					list-03 (list "500")
					list-04 (list "3,5" "10")
					list-05 (list "Да, 3 полюса")
					list-06 (list "Да, 3 полюса")
					list-07 (list "1П 1 перекл." "2П 2 перекл.")
					list-08 (list "У3 (-10...+40), без доп. оболочки"
												"Т3 (-10...+45), без доп. оболочки" 
												"ХЛ5 (-10...+35), без доп. оболочки"
												"У2 (-45...+40), с доп. оболочкой, IP54"
												"Т2 (-10...+50), с доп. оболочкой, IP54" 
												"ХЛ5 (-10...+35), с доп. оболочкой, IP54")
		);setq
	);=



);cond

(list-filling "txt-01" list-01)
(list-filling "txt-03" list-03)
(list-filling "txt-04" list-04)
(list-filling "txt-05" list-05)
(list-filling "txt-06" list-06)
(list-filling "txt-07" list-07)
(list-filling "txt-08" list-08)

(set_tile "txt-01" "0")
(set_tile "txt-03" "0")
(set_tile "txt-04" "0")
(set_tile "txt-05" "0")
(set_tile "txt-06" "0")
(set_tile "txt-07" "0")
(set_tile "txt-08" "0")

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма формирования данных//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun but1-101-04-auto-swtch-keaz

( / cntr-1 str-00 str-01 str-02 str-03 str-04 str-05 str-06 str-07 str-08 str-99 swtch tmp-list-902)

;заполняем поле "выбрано"
(setq str-00 (nth (atoi (get_tile "txt-00")) list-00)
      swtch list-901
      cntr-1 0
);setq

(if (/= swtch nil) (setq list-902 (reverse list-902)));if

(setq str-00 (nth (atoi (get_tile "txt-00")) list-00);считываем выбранные данные
			str-01 (nth (atoi (get_tile "txt-01")) list-01)
			str-02 (nth (atoi (get_tile "txt-02")) list-02)
			str-03 (nth (atoi (get_tile "txt-03")) list-03)
			str-04 (nth (atoi (get_tile "txt-04")) list-04)
			str-05 (nth (atoi (get_tile "txt-05")) list-05)
			str-06 (nth (atoi (get_tile "txt-06")) list-06)
			str-07 (nth (atoi (get_tile "txt-07")) list-07)
			str-08 (nth (atoi (get_tile "txt-08")) list-08)
);setq

(setq str-99
	(cond	
		((= str-00 "АП50Б3МТ") "1,3")
		
	);cond
);setq
		
(setq list-901 (vl-list* (strcat str-00 "  " 
  															 "Ток " str-01  "А  "
  															 "Кол. полюсов " str-02 "  " 
  															 "Уставка по току " str-04 "  "
  															 "Доп. контакты " str-07 "  "
  															 str-08) list-901)
);setq
  
(setq tmp-list-902 (list (cons 0 str-00) (cons 1 str-01) (cons 2 str-02) (cons 3 str-03) (cons 4 str-04) (cons 7 str-07) (cons 8 str-08)
												 (cons 99 str-99))
			list-902 (vl-list*  tmp-list-902 list-902)
);setq

(setq list-902 (reverse list-902))

(list-filling "txt-901" (reverse list-901))

(princ)
)
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в ПЭ                   /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun le-101-04-auto-swtch-keaz

( / cntr-1 dlt-y nmbr-ln pnt-ins str-tmp str-tmp-0 str-tmp-1 str-tmp-2 str-tmp-3 str-tmp-4 str-tmp-7 x-pnt-ins y-pnt-ins y-pnt-ins-1)

(setq cntr-1 0 ;счетчик
);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-tmp-0 (cdr (assoc 0 str-tmp))
				str-tmp-1 (cdr (assoc 1 str-tmp))
				str-tmp-2 (cdr (assoc 2 str-tmp))
				str-tmp-3 (cdr (assoc 3 str-tmp))
				str-tmp-4 (cdr (assoc 4 str-tmp))
				str-tmp-7 (cdr (assoc 7 str-tmp))
	);setq
	
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
	
	;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
	(if (= str-tmp-0 "АП50Б3МТ")
		(progn
			(setq nmbr-ln 4);setq
			
			(1000-delete-items-le nmbr-ln x-pnt-ins y-pnt-ins);удаление предыдущей записи
			(setvar "osmode" 0)
			(setvar "cmdecho" 0)
			
			(cond
				((= str-tmp-7 "1П 1 перекл.") (setq str-tmp-7 "1 переключающий контакт"));=
				((= str-tmp-7 "2П 2 перекл.") (setq str-tmp-7 "2 переключающих контакта"));=
			);cond
			
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 (strcat "Выключатель автоматический " str-tmp-0 ", номинальный ток " str-tmp-1 "A,"))
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "количество полюсов " str-tmp-2 ", уставка по току мгновенного"))
  		(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 (strcat "срабатывания " str-tmp-4 ", " str-tmp-7))
		);progn
	);if
	
	(setq cntr-1 (1+ cntr-1));setq
		
	(repeat nmbr-ln
  	(command "_insert" "пэ-пустая-строка" "_X" 1 "_Y" 1 "_Z" 1 "_R" 0 (list x-pnt-ins y-pnt-ins-1))
  	(setq y-pnt-ins-1 (- y-pnt-ins-1 8));setq
	);repeat
);repeat

(princ)
)
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в спцф                   ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun spcf-101-04-auto-swtch-keaz

( / cntr-1 dlt-y nmbr-ln pnt-ins str-tmp str-tmp-0 str-tmp-1 str-tmp-2 str-tmp-3 str-tmp-4 str-tmp-7 str-tmp-71 str-tmp-72 str-tmp-8 str-tmp-82 str-tmp-99 
x-pnt-ins y-pnt-ins y-pnt-ins-1)

(setq cntr-1 0);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-tmp-0 (cdr (assoc 0 str-tmp))
				str-tmp-1 (cdr (assoc 1 str-tmp))
				str-tmp-2 (cdr (assoc 2 str-tmp))
				str-tmp-3 (cdr (assoc 3 str-tmp))
				str-tmp-4 (cdr (assoc 4 str-tmp))
				str-tmp-7 (cdr (assoc 7 str-tmp))
				str-tmp-8 (cdr (assoc 8 str-tmp))
				str-tmp-99 (cdr (assoc 99 str-tmp))
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

	(cond
		((= str-tmp-7 "1П 1 перекл.") (setq str-tmp-71 "1 переключающий контакт" str-tmp-72 "1П"));=
		((= str-tmp-7 "2П 2 перекл.") (setq str-tmp-71 "2 переключающих контакта" str-tmp-72 "2П"));=
	);cond
	
	(cond
		((= str-tmp-8 "У3 (-10...+40), без доп. оболочки") (setq str-tmp-82 "У3"));=
		((= str-tmp-8 "Т3 (-10...+45), без доп. оболочки") (setq str-tmp-82 "Т3"));=
		((= str-tmp-8 "ХЛ5 (-10...+35), без доп. оболочки") (setq str-tmp-82 "ХЛ5"));=
		((= str-tmp-8 "У2 (-45...+40), с доп. оболочкой, IP54") (setq str-tmp-82 "У2"));=
		((= str-tmp-8 "Т2 (-10...+50), с доп. оболочкой, IP54") (setq str-tmp-82 "У2"));=
		((= str-tmp-8 "ХЛ5 (-10...+35), с доп. оболочкой, IP54") (setq str-tmp-82 "ХЛ5"));=
	);cond
												
	(setq nmbr-ln 7);setq
			
	(1000-delete-items-spcf nmbr-ln x-pnt-ins y-pnt-ins);удаление предыдущей записи
			
	(setvar "osmode" 0)
	
	(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Выключатель автоматический")
	(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "- количество полюсов " str-tmp-2))
	(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 (strcat "- номинальный ток " str-tmp-1 "А"))
	(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 3)) 4)) 2.5 0 (strcat "- уставка по току мгновенного срабатывания " str-tmp-4))
	(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 4)) 4)) 2.5 0 (strcat "- " str-tmp-71))
	(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 5)) 4)) 2.5 0 (strcat "- климатическое исполнение " str-tmp-8))
			
	(command "_TEXT" "_MC" (list (+ x-pnt-ins 160) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 (strcat str-tmp-0 str-tmp-82 ", " str-tmp-1 "х" str-tmp-4 ", " str-tmp-72)) ;Тип, марка, обозначение документа, опросного листа
	(command "_text" "_MC" (list (+ x-pnt-ins 160) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 "ТУ16-522.139-92Д")

	(command "_text" "_MC" (list (+ x-pnt-ins 322.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 str-tmp-99)

	(repeat nmbr-ln
  	(command "_insert" "зс-пустая-строка" "_X" 1 "_Y" 1 "_Z" 1 "_R" 0 (list x-pnt-ins y-pnt-ins-1))
  	(setq y-pnt-ins-1 (- y-pnt-ins-1 8));setq
	);repeat
								
	(command "_text" "_MC" (list (+ x-pnt-ins 247.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "ЗАО \"Курский")
	(command "_text" "_MC" (list (+ x-pnt-ins 247.5) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 "электроаппаратный завод\",")
	(command "_text" "_MC" (list (+ x-pnt-ins 247.5) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 "г. Курск")	
			
	(command "_text" "_MC" (list (+ x-pnt-ins 280) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "шт.")
 
	(setq cntr-1 (+ cntr-1 1));setq
);repeat

(princ)
)
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в овш               ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun lecgv-101-04-auto-swtch-keaz

( / cntr-1 dlt-y nmbr-ln pnt-ins str-tmp str-tmp-0 str-tmp-1 str-tmp-2 str-tmp-3 str-tmp-4 str-tmp-7 str-tmp-71 str-tmp-72 str-tmp-8 str-tmp-82 str-tmp-99 x-pnt-ins y-pnt-ins y-pnt-ins-1)

(setq cntr-1 0);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-tmp-0 (cdr (assoc 0 str-tmp))
				str-tmp-1 (cdr (assoc 1 str-tmp))
				str-tmp-2 (cdr (assoc 2 str-tmp))
				str-tmp-3 (cdr (assoc 3 str-tmp))
				str-tmp-4 (cdr (assoc 4 str-tmp))
				str-tmp-7 (cdr (assoc 7 str-tmp))
				str-tmp-8 (cdr (assoc 8 str-tmp))
				str-tmp-99 (cdr (assoc 99 str-tmp))
	);setq

	(setvar "osmode" 6199)
	
	(setq pnt-ins		(getpoint "\nУкажите точку вставки\n")
	  		x-pnt-ins (nth 0 pnt-ins)
	 			y-pnt-ins (nth 1 pnt-ins)
	  		y-pnt-ins-1 y-pnt-ins
	  		dlt-y 8
	);setq
	
	(09-empt-lin-le-cgv)

	;обработка данных	

		(cond
		((= str-tmp-7 "1П 1 перекл.") (setq str-tmp-71 "1 переключающий контакт" str-tmp-72 "1П"));=
		((= str-tmp-7 "2П 2 перекл.") (setq str-tmp-71 "2 переключающих контакта" str-tmp-72 "2П"));=
	);cond
	
	(cond
		((= str-tmp-8 "У3 (-10...+40), без доп. оболочки") (setq str-tmp-82 "У3"));=
		((= str-tmp-8 "Т3 (-10...+45), без доп. оболочки") (setq str-tmp-82 "Т3"));=
		((= str-tmp-8 "ХЛ5 (-10...+35), без доп. оболочки") (setq str-tmp-82 "ХЛ5"));=
		((= str-tmp-8 "У2 (-45...+40), с доп. оболочкой, IP54") (setq str-tmp-82 "У2"));=
		((= str-tmp-8 "Т2 (-10...+50), с доп. оболочкой, IP54") (setq str-tmp-82 "У2"));=
		((= str-tmp-8 "ХЛ5 (-10...+35), с доп. оболочкой, IP54") (setq str-tmp-82 "ХЛ5"));=
	);cond
	
	(setq nmbr-ln 7);setq
	
	(1000-delete-items-le-cgv nmbr-ln x-pnt-ins y-pnt-ins)
	
	(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Выключатель автоматический,")
	(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat str-tmp-0 str-tmp-82 ", " str-tmp-1 "х" str-tmp-4 ", " str-tmp-72 ", полюсов " str-tmp-2 ","))
	(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 (strcat "номинальный ток " str-tmp-1 "А, уставка по"))
	(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 3)) 4)) 2.5 0 (strcat "току мгновенного срабатывания " str-tmp-4 ","))
	(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 4)) 4)) 2.5 0 (strcat str-tmp-71 ", исполнен."))
	(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 5)) 4)) 2.5 0 (strcat str-tmp-8))
	
	(command "_TEXT" "_MC" (list (+ x-pnt-ins 142.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 str-tmp-99)

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