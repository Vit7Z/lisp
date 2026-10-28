;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////                                                              ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun 101-04-lamp-relay-and-auto

( / adoc dcl-id file-name file-open list-00 list-01 list-02 list-03 list-04 list-05 list-06 list-07 list-901 list-902 path-file-open str-f type-list)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(setq str-f 1;переменные

			str-01 nil
			list-01 (list "СКЛ14" "ТСМ" "ТСБ")
      list-901 nil
      list-902 nil
			file-name nil
			file-open nil
			path-file-open nil
);setq

(tmp-strt-101-04-lamp-relay-and-auto)

(if (< (setq dcl-id (load_dialog "dia-101-04-lamp-relay-and-auto.dcl")) 0) ;ищем диалог
		(progn
			(alert "Не найден dcl-файл")
			(exit)
		);progn
);if

(if (not (new_dialog "dia_101_04_lamp_relay_and_auto" dcl-id))
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
  (strcat "(tmp-strt-101-04-lamp-relay-and-auto)");srcat
);action_tile

(action_tile "txt-03"
  (strcat "(txt-03-101-04-lamp-relay-and-auto)");srcat
);action_tile

(action_tile "but1"
  (strcat "(tmp-filling-fields-101-04-lamp-relay-and-auto)"
					"(list-filling \"txt-04\" list-04)"
					"(list-filling \"txt-05\" list-05)"
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

(if (= type-list "le") (tmp-le-101-04-lamp-relay-and-auto));if
(if (= type-list "spcf") (tmp-spcf-101-04-lamp-relay-and-auto));if
(if (= type-list "lecgv") (tmp-lecgv-101-04-lamp-relay-and-auto));if

(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(vla-endundomark adoc)
(gc)
(princ)
)
;/////// конец программы ///////

;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun tmp-strt-101-04-lamp-relay-and-auto

( / )

(if (= nil str-01) 
	(setq str-01 "СКЛ14");setq
	(setq str-01 (nth (atoi (get_tile "txt-01")) list-01));setq
);if

(cond
	((= str-01 "СКЛ14")
		(set_tile "ptxt-111" "Светодиодная коммутаторная лампа")
		(setq list-02 (list "Желтый" "Красный" "Зеленый")
      		list-03 (list "~220В" "~380В" "~127В" "=24В" "=12В" "=48В" "=110В" "=220В")
      		list-04 (list "~220В" "~380В" "~127В" "=24В" "=12В" "=48В" "=110В" "=220В")
      		list-05 (list "Повышенная" "Нормальная")
		);setq
	); str-1

	((= str-01 "ТСМ")
		(set_tile "ptxt-111" "Табло световое малое")
		(setq list-02 (list "Белый")
      		list-03 (list "Перемен. ток, 50Гц")
      		list-04 (list "220" "127" "60")
      		list-05 (list "")
		);setq
	); str-1

	((= str-01 "ТСБ")
		(set_tile "ptxt-111" "Табло световое большое")
		(setq list-02 (list "Белый")
      		list-03 (list "Перемен. ток, 50Гц")
      		list-04 (list "220" "127" "60")
      		list-05 (list "")
		);setq
	); str-1

); cond

(list-filling "txt-02" list-02)
(list-filling "txt-03" list-03)
(list-filling "txt-04" list-04)
(list-filling "txt-05" list-05)

(set_tile "txt-02" "0")
(set_tile "txt-03" "0")
(set_tile "txt-04" "0")
(set_tile "txt-05" "0")

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun txt-03-101-04-lamp-relay-and-auto

( / str-01 str-03)

(setq str-01 (nth (atoi (get_tile "txt-01")) list-01)
			str-03 (nth (atoi (get_tile "txt-03")) list-03)
);setq

(if (= str-01 "СКЛ14")
	(cond
		((= str-03 "Перемен. ток, 50Гц") (setq list-04 (list "220" "380" "127"))); =	
		((= str-03 "Постоянный ток") (setq list-04 (list "=24 В" "=12В" "=48В" "=110В" "=220В"))); =	
	); cond
);if

(list-filling "txt-04" list-04)

(set_tile "txt-04" "0")

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма формирования данных/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun tmp-filling-fields-101-04-lamp-relay-and-auto

( / str-01 str-02 str-03 str-04 str-05 swtch tmp-list-902)

;заполняем поле "выбрано"
(setq swtch list-901);setq

(setq str-01 (nth (atoi (get_tile "txt-01")) list-01));setq

(if (/= swtch nil) (setq list-902 (reverse list-902)));setq


(if (= str-01 "СКЛ14")
	(progn
		(setq str-01 (nth (atoi (get_tile "txt-01")) list-01);считываем выбранные данные
					str-02 (nth (atoi (get_tile "txt-02")) list-02)
					str-03 (nth (atoi (get_tile "txt-03")) list-03)
					str-04 (nth (atoi (get_tile "txt-04")) list-04)
					str-05 (nth (atoi (get_tile "txt-05")) list-05)
		);setq

  	(setq list-901 (vl-list* (strcat str-01 "  Цвет " str-02 "  " str-03  "  " str-04 "В  Яркость " str-05) list-901));setq
  	
		(setq tmp-list-902 (list (cons 1 str-01) (cons 2 str-02) (cons 3 str-03) (cons 4 str-04) (cons 5 str-05) (cons 99 "0,05"))
					list-902 (vl-list*  tmp-list-902 list-902)
		);setq
	);progn	
);if =

(if (or (= str-01 "ТСМ") (= str-01 "ТСБ"))
	(progn
		(setq str-01 (nth (atoi (get_tile "txt-01")) list-01);считываем выбранные данные
					str-02 (nth (atoi (get_tile "txt-02")) list-02)
					str-03 (nth (atoi (get_tile "txt-03")) list-03)
					str-04 (nth (atoi (get_tile "txt-04")) list-04)
					str-05 (nth (atoi (get_tile "txt-05")) list-05)
		);setq

  	(setq list-901 (vl-list* (strcat str-01 "  Цвет " str-02 "  " str-03  "  " str-04 "В" str-05) list-901));setq
  	
		(setq tmp-list-902 (list (cons 1 str-01) (cons 2 str-02) (cons 3 str-03) (cons 4 str-04) (cons 99 "0,4"))
					list-902 (vl-list*  tmp-list-902 list-902)
		);setq
	);progn	
);if =

(if (= swtch nil) (setq list-902 (reverse list-902)));if

(if (/= swtch nil) (setq list-902 (reverse list-902)));if

(list-filling "txt-901" (reverse list-901))

(princ)
)
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в ПЭ                   /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun tmp-le-101-04-lamp-relay-and-auto

( / cntr-1 dlt-y nmbr-ln pnt-ins str-tmp str-tmp-1 str-tmp-2 str-tmp-3 str-tmp-4 str-tmp-5 x-pnt-ins y-pnt-ins y-pnt-ins-1)

(setq cntr-1 0 ;счетчик
);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-tmp-1 (cdr (assoc 1 str-tmp))
				str-tmp-2 (cdr (assoc 2 str-tmp))
				str-tmp-3 (cdr (assoc 3 str-tmp))
				str-tmp-4 (cdr (assoc 4 str-tmp))
	);setq
	
;	(princ "\n         str-tmp = ") (princ str-tmp);Erase_DV
;	(getstring "\nPress Enter to continue...");Erase_DV
	
	(setvar "osmode" 6199)
	
	(setq pnt-ins (getpoint "\nУкажите точку вставки\n")); setq
	
	;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	(if (= str-tmp-1 "СКЛ14")
		(progn
			(setq str-tmp-5 (cdr (assoc 5 str-tmp)));setq
		
			(cond
				((= str-tmp-2 "Желтый") (setq str-tmp-2 "желтый цвет")); =
				((= str-tmp-2 "Красный") (setq str-tmp-2 "красный цвет")); =
				((= str-tmp-2 "Зеленый") (setq str-tmp-2 "зеленый цвет")); =
			); cond
		
			(cond
				((= str-tmp-3 "Перемен. ток, 50Гц") (setq str-tmp-3 "переменный ток, 50Гц")); =
				((= str-tmp-3 "Постоянный ток") (setq str-tmp-3 "постоянный ток")); =
			); cond
		
			(setq str-txt (strcat "Светодиодная сигнальная лампа, " str-tmp-1 ", " str-tmp-2 ", " str-tmp-3 ", " str-tmp-4 "В"));setq
		);progn	
	);if =
 
	;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	(if (or (= str-tmp-1 "ТСМ") (= str-tmp-1 "ТСБ"))
		(progn
			(cond
				((= str-tmp-2 "Белый") (setq str-tmp-2 "белый")); =
			);cond
		
			(cond
				((= str-tmp-3 "Перемен. ток, 50Гц") (setq str-tmp-3 "переменный ток")); =
			);cond
		
			(setq str-txt (strcat "Табло световое " str-tmp-1 ", цвет " str-tmp-2 ", " str-tmp-4 "В, " str-tmp-3));setq
		);progn	
	);if = 
 
 
 
 
 

	(setq cntr-1 (1+ cntr-1));setq
);repeat

(princ)
)
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в спцф                   ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun tmp-spcf-101-04-lamp-relay-and-auto

( / cntr-1 dlt-y nmbr-ln pnt-ins str-tmp str-tmp-0 str-tmp-1 str-tmp-2 str-tmp-2-1 str-tmp-2-2 str-tmp-3 str-tmp-3-1 str-tmp-3-2 str-tmp-4 str-tmp-5 str-tmp-5-1 str-tmp-5-2 str-txt x-pnt-ins y-pnt-ins y-pnt-ins-1)

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
	
	(princ "\n         str-tmp = ") (princ str-tmp);Erase_DV
(getstring "\nPress Enter to continue...");Erase_DV
	
	(setvar "osmode" 6199)
	
	(setq pnt-ins		(getpoint "\nУкажите точку вставки\n")
	  		x-pnt-ins (nth 0 pnt-ins)
	 			y-pnt-ins (nth 1 pnt-ins)
	  		y-pnt-ins-1 y-pnt-ins
	  		dlt-y 8
	);setq
	
	(101-empt-lin-spcf)

	;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	(if (= "СКЛ14" str-tmp-0)
		(progn
			(cond
				((= str-tmp-2 "Желтый") 
					(setq str-tmp-2-1 "желтый цвет"
								str-tmp-2-2 "Ж"
				)); =
				((= str-tmp-2 "Красный") 
					(setq str-tmp-2-1 "красный цвет"
								str-tmp-2-2 "К"
				)); =
				((= str-tmp-2 "Зеленый") 
				(setq str-tmp-2-2 "Л"
							str-tmp-2-1 "зеленый цвет"
				)); =
			); cond
		
			(cond
				((= str-tmp-3 "Перемен. ток, 50Гц") 
					(setq str-tmp-3-1 "переменный ток, 50Гц"
								str-tmp-3-2 "3"
				)); =
				((= str-tmp-3 "Постоянный ток") 
					(setq str-tmp-3-1 "постоянный ток"
								str-tmp-3-2 "1"
				)); =
			); cond
			
			(cond
				((= str-tmp-5 "Повышенная") 
					(setq str-tmp-5-1 "повышенная"
								str-tmp-5-2 "Б"
				)); =
				((= str-tmp-5 "Нормальная") 
					(setq str-tmp-5-1 "нормальная"
								str-tmp-5-2 "А"
				)); =
			); cond
			
			(setq nmbr-ln 5
						str-txt (strcat str-tmp-1 ".-" str-tmp-5-2 "-" str-tmp-2-2 "-" str-tmp-3-2 "-" str-tmp-4)
			);setq
			
			
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 str-tmp-0)
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "- " str-tmp-2-1))
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 (strcat "- " str-tmp-3-1 ", " str-tmp-4 "В"))
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 3)) 4)) 2.5 0 (strcat "- группа яркости " str-tmp-5-1))
			
			(split-str-parts-spcf-60-01 str-txt nil pnt-ins)
			
			(command "_text" "_MC" (list (+ x-pnt-ins 322.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "0,02")
		);progn
	);if

	

		

	(repeat nmbr-ln
  	(command "_insert" "зс-пустая-строка" "_X" 1 "_Y" 1 "_Z" 1 "_R" 0 (list x-pnt-ins y-pnt-ins-1))
  	(setq y-pnt-ins-1 (- y-pnt-ins-1 8));setq
	);repeat
								
	(command "_text" "_MC" (list (+ x-pnt-ins 247.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "ООО \"Реле и Автоматика\",")
	(command "_text" "_MC" (list (+ x-pnt-ins 247.5) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 "г. Москва")	
			
	(command "_text" "_MC" (list (+ x-pnt-ins 280) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "шт.")
 
	(setq cntr-1 (+ cntr-1 1));setq
);repeat

(princ)
)
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в овш               ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun tmp-lecgv-101-04-lamp-relay-and-auto

( / cntr-1 dlt-y nmbr-ln nmbr-ln-1 pnt-ins str-tmp str-tmp-0 str-tmp-1 str-tmp-11 str-tmp-12 str-tmp-13 str-tmp-14 str-tmp-15 str-tmp-16 str-tmp-17 str-tmp-2 str-tmp-2-1 
str-tmp-2-2 str-tmp-3 str-tmp-3-1 str-tmp-3-2 str-tmp-4 str-tmp-5 str-tmp-5-1 str-tmp-5-2 str-tmp-6 str-tmp-7 x-pnt-ins y-pnt-ins y-pnt-ins-1)

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
	);setq

	;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	(if (= "Светодиодная сигнальная лампа" str-tmp-0)
		(progn
			(cond
				((= str-tmp-2 "Желтый") 
					(setq str-tmp-2-1 "желтый цвет"
								str-tmp-2-2 "Ж"
				)); =
				((= str-tmp-2 "Красный") 
					(setq str-tmp-2-1 "красный цвет"
								str-tmp-2-2 "К"
				)); =
				((= str-tmp-2 "Зеленый") 
				(setq str-tmp-2-2 "Л"
							str-tmp-2-1 "зеленый цвет"
				)); =
			); cond
		
			(cond
				((= str-tmp-3 "Перемен. ток, 50Гц") 
					(setq str-tmp-3-1 "переменный ток, 50Гц"
								str-tmp-3-2 "3"
				)); =
				((= str-tmp-3 "Постоянный ток") 
					(setq str-tmp-3-1 "постоянный ток"
								str-tmp-3-2 "1"
				)); =
			); cond
			
			(cond
				((= str-tmp-5 "Повышенная") 
					(setq str-tmp-5-1 "повышенная"
								str-tmp-5-2 "Б"
				)); =
				((= str-tmp-5 "Нормальная") 
					(setq str-tmp-5-1 "нормальная"
								str-tmp-5-2 "А"
				)); =
			); cond
			
			(setq nmbr-ln 5
						str-tmp-11 (strcat str-tmp-0 "," )
						str-tmp-12 (strcat "ООО \"Реле и Автоматика\",")
						str-tmp-13 (strcat str-tmp-1 ".-" str-tmp-5-2 "-" str-tmp-2-2 "-" str-tmp-3-2 "-" str-tmp-4 ", " str-tmp-2-1 ",")
						str-tmp-14 (strcat str-tmp-3-1 ", " str-tmp-4 "В")
			);setq
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 str-tmp-11)
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 str-tmp-12)
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 str-tmp-13)
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 3)) 4)) 2.5 0 str-tmp-14)
			(command "_TEXT" "_MC" (list (+ x-pnt-ins 142.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "0,2")
		);progn
	);if
;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	

;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	(if (= "Реле времени" str-tmp-0)
		(progn
			(setq nmbr-ln 8
						str-tmp-6 (cdr (assoc 6 str-tmp))
			);setq
			
			(cond
				((= str-tmp-2 "3 перекл.") 
					(setq str-tmp-2-1 "3 переключающих"
				)); =
				((= str-tmp-2 "2 перекл.") 
					(setq str-tmp-2-1 "2 переключающих"
				)); =
			); cond
			
			(cond
				((= str-tmp-3 "Перемен. ток, 50Гц") (setq str-tmp-3-1 "переменный ток, 50Гц")); =
				((= str-tmp-3 "Постоянный ток") (setq str-tmp-3-1 "постоянный ток")); =
			); cond
			
			(cond
				((= str-tmp-5 "Тип 1") 
					(setq str-tmp-5 "крепление винтами"
				)); =
				((= str-tmp-5 "Тип 2") 
					(setq str-tmp-5 "крепление на DIN-рейку"
				)); =
				((= str-tmp-5 "Тип 3") 
					(setq str-tmp-5 "крепление винтами"
				)); =
			); cond
			(setq str-tmp-11 (strcat str-tmp-0 "," )
						str-tmp-12 (strcat "ООО \"Реле и Автоматика\",")
						str-tmp-13 (strcat str-tmp-1 ", " str-tmp-2-1)
						str-tmp-14 (strcat "контакта, напряжение включающей")
						str-tmp-15 (strcat "катушки " str-tmp-4 "В, " str-tmp-3-1 ",")
						str-tmp-16 (strcat str-tmp-5 ", диапазон")
						str-tmp-17 (strcat "выдержки времени " str-tmp-6)
			);setq
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 str-tmp-11)
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 str-tmp-12)
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 str-tmp-13)
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 3)) 4)) 2.5 0 str-tmp-14)
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 4)) 4)) 2.5 0 str-tmp-15)
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 5)) 4)) 2.5 0 str-tmp-16)
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 6)) 4)) 2.5 0 str-tmp-17)
			(command "_TEXT" "_MC" (list (+ x-pnt-ins 142.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "0,02")
		);progn
	);if
;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////		
	
;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	(if (= "Выключатель кнопочный" str-tmp-0)
		(progn	
			(setq str-tmp-7 (cdr (assoc 7 str-tmp))
			);setq
			(cond
				((= str-tmp-2 "4 (1з)") 
					(setq str-tmp-2 "исп. 4 (1 замыкающий контакт)," 
					)); =
				((= str-tmp-2 "5 (1р)") 
					(setq str-tmp-2 "исп. 5 (1 размыкающий контакт)," 
					)); =
				((= str-tmp-2 "1 (2з)") 
					(setq str-tmp-2 "исп. 1 (2 замыкающих контакта)," 
					)); =
				((= str-tmp-2 "2 (1з, 1р)") 
					(setq str-tmp-2 "исп. 5 (1 замыкающий контакт," 
								str-tmp-2-1 "1 размыкающий контакт), "
					)); =
				((= str-tmp-2 "3 (2р)") 
					(setq str-tmp-2 "исп. 3 (2 размыкающих контакта)" 
					)); =
			); cond
		    
			(cond
				((= str-tmp-3 "Черный") (setq str-tmp-3 "черный")); =
				((= str-tmp-3 "Красный") (setq str-tmp-3 "красный")); =
			); cond
	
			(setq nmbr-ln 5
						str-tmp-11 (strcat str-tmp-0 " " str-tmp-1 "," )
						str-tmp-12 (strcat "ООО \"Реле и Автоматика\",")
						str-tmp-13 (strcat str-tmp-2)
						str-tmp-14 (strcat str-tmp-3 " цвет") 
			);setq
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 str-tmp-11)
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 str-tmp-12)
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 str-tmp-13)
			(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 3)) 4)) 2.5 0 str-tmp-14)
			(command "_TEXT" "_MC" (list (+ x-pnt-ins 142.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "0,19")
		);progn
	);if
	;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		
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