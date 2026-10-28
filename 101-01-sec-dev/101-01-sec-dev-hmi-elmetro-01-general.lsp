;/////// ************************************************************ /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////                                                              /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun 101-01-secondary-device-elmetro

( / adoc counter dcl-id list-01 list-02 list-03 list-04 list-05 list-06 list-07 list-08 list-09 list-10 list-11 list-12 list-901 list-902 str-02 str-f type-list)

(setvar "cmdecho" 0)
(setvar "osmode" 6199)
(setvar "textstyle" "standard")

(vl-load-com)
(vla-startundomark
  (setq adoc (vla-get-activedocument (vlax-get-acad-object)));setq
);start undo

(setq str-f 1
			str-02 nil
      counter 0
      list-01 (list "Элметро-ВиЭР-104К")
      list-02 (list "4АВ" "4АП" "4АЕ" "8ДВ" "8ЧВ" "4ИП")
			list-03 (list "4АВ" "4АП" "4АЕ" "8ДВ" "8ЧВ" "4ИП")
			list-04 (list "4АВ" "4АП" "4АЕ" "8ДВ" "8ЧВ" "4ИП")
			list-05 (list "4АВ" "4АП" "4АЕ" "8ДВ" "8ЧВ" "4ИП")
			list-06 (list "4АВ" "4АП" "4АЕ" "8ДВ" "8ЧВ" "4ИП")
			list-07 (list "4Р" "8Р" "16Р" "8РП" "16РП" "8РС" "16РС" "8С" "16С")
			list-08 (list "Ethernet, RS-485" "Ethernet, CAN, RS-485 (2 шт.)")
			list-09 (list "0...+55" "0...+60" "-10...+50")
			list-10 (list "Нет" "360 ч.")
			list-11 (list "Нет" "1" "2" "3" "4" "5" "6" "7" "8" "9" "10" "11" "12")
			list-12 (list "Да" "Нет")
			
      list-901 nil
      list-902 nil
);setq


(if (< (setq dcl-id (load_dialog "dia-101-01-secondary-device-elmetro.dcl")) 0) ;ищем диалог
		(progn
			(alert "Не найден dcl-файл")
			(exit)
		);progn
);if

(if (not (new_dialog "dia_101_01_secondary_device_elmetro" dcl-id))
		(exit)
);if

(list-filling "txt-01" list-01)
(list-filling "txt-02" list-02)
(list-filling "txt-03" list-03)
(list-filling "txt-04" list-04)
(list-filling "txt-05" list-05)
(list-filling "txt-06" list-06)
(list-filling "txt-07" list-07)
(list-filling "txt-08" list-08)
(list-filling "txt-09" list-09)
(list-filling "txt-10" list-10)
(list-filling "txt-11" list-11)
(list-filling "txt-12" list-12)

(set_tile "txt-01" "0")
(set_tile "txt-02" "0")
(set_tile "txt-03" "0")
(set_tile "txt-04" "0")
(set_tile "txt-05" "0")
(set_tile "txt-06" "0")
(set_tile "txt-07" "0")
(set_tile "txt-08" "0")
(set_tile "txt-09" "0")
(set_tile "txt-10" "0")
(set_tile "txt-11" "0")
(set_tile "txt-12" "0")

(action_tile "txt-01"
  (strcat "(txt-01-101-01-secondary-device-elmetro)"
  );srcat
);action_tile

(action_tile "txt-07"
  (strcat "(txt-07-101-01-secondary-device-elmetro)"
  );srcat
);action_tile

(action_tile "but1" 
	(strcat "(filling-fields-101-01-secondary-device-elmetro)"  
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
	((= type-list "le") (le-101-01-secondary-device-elmetro));=
	((= type-list "spcf") (spcf-101-01-secondary-device-elmetro));=
	((= type-list "lecgv") (lecgv-101-01-secondary-device-elmetro));=
);cond

(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(vla-endundomark adoc)
(princ)
)
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;//// конец программы //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;/////// ************************************************************ /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////                                                              /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun txt-01-101-01-secondary-device-elmetro

( / )

(if (= nil str-01) 
	(setq str-01 "Элметро-ВиЭР-104К");setq
	(setq str-01 (nth (atoi (get_tile "txt-01")) list-01));setq
);if

(if (= str-01 "Элметро-ВиЭР-104К")
	(progn
		(setq list-02 (list "4АВ" "4АП" "4АЕ" "8ДВ" "8ЧВ" "4ИП")
					list-03 (list "4АВ" "4АП" "4АЕ" "8ДВ" "8ЧВ" "4ИП")
					list-04 (list "4АВ" "4АП" "4АЕ" "8ДВ" "8ЧВ" "4ИП")
					list-05 (list "4АВ" "4АП" "4АЕ" "8ДВ" "8ЧВ" "4ИП")
					list-06 (list "4АВ" "4АП" "4АЕ" "8ДВ" "8ЧВ" "4ИП")
					list-07 (list "4Р" "8Р" "16Р" "8РП" "16РП" "8РС" "16РС" "8С" "16С")
					list-08 (list "Ethernet, RS-485" "Ethernet, CAN, RS-485 (2 шт.)")
					list-09 (list "0...+55" "0...+60" "-10...+50")
					list-10 (list "Нет" "360 ч.")
					list-11 (list "Нет" "1" "2" "3" "4" "5" "6" "7" "8" "9" "10" "11" "12")
					list-12 (list "Да" "Нет")
		);setq
	);progn
);if

(list-filling "txt-02" list-02)
(list-filling "txt-03" list-03)
(list-filling "txt-04" list-04)
(list-filling "txt-05" list-05)
(list-filling "txt-06" list-06)
(list-filling "txt-07" list-07)
(list-filling "txt-08" list-08)
(list-filling "txt-09" list-09)
(list-filling "txt-10" list-10)
(list-filling "txt-11" list-11)
(list-filling "txt-12" list-12)

(set_tile "txt-02" "0")
(set_tile "txt-03" "0")
(set_tile "txt-04" "0")
(set_tile "txt-05" "0")
(set_tile "txt-06" "0")
(set_tile "txt-07" "0")
(set_tile "txt-08" "0")
(set_tile "txt-09" "0")
(set_tile "txt-10" "0")
(set_tile "txt-11" "0")
(set_tile "txt-12" "0")

(princ)
)
;/////// ************************************************************ /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////                                                              /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;/////// ************************************************************ /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////                                                              /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun txt-02-101-01-secondary-device-elmetro

( / str-07)

(setq str-07 (nth (atoi (get_tile "txt-07")) list-07)
);setq

(if (= str-07 "Общепромышленное")
	(setq list-08 (list "Нет")
				list-09 (list "ОТК")
	);setq
);if

(if (= str-07 "АЭС")
	(setq list-08 (list "3" "4")
				list-09 (list "Росэнергоатом")
	);setq
);if

(list-filling "txt-08" list-08)
(list-filling "txt-09" list-09)

(set_tile "txt-08" "0")
(set_tile "txt-09" "0")

(princ)
)
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма формирования данных///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun filling-fields-101-01-secondary-device-elmetro

( / cntr-1 str-01 str-02 str-03 str-04 str-05 str-06 str-07 str-08 str-09 str-10 str-11 str-12 str-902 swtch)

;заполняем поле "выбрано"
(setq str-01 (nth (atoi (get_tile "txt-01")) list-01)
			str-02 (nth (atoi (get_tile "txt-02")) list-02)
			str-03 (nth (atoi (get_tile "txt-03")) list-03)
			str-04 (nth (atoi (get_tile "txt-04")) list-04)
			str-05 (nth (atoi (get_tile "txt-05")) list-05)
			str-06 (nth (atoi (get_tile "txt-06")) list-06)
			str-07 (nth (atoi (get_tile "txt-07")) list-07)
			str-08 (nth (atoi (get_tile "txt-08")) list-08)
			str-09 (nth (atoi (get_tile "txt-09")) list-09)
			str-10 (nth (atoi (get_tile "txt-10")) list-10)
			str-11 (nth (atoi (get_tile "txt-11")) list-11)
			str-12 (nth (atoi (get_tile "txt-12")) list-12)
      swtch list-901 ;запоминаем первоначальное состояние списка в поле "выбрано"
      cntr-1 0 ;счетчик, номер элемента в списке
);setq

(if (/= swtch nil) (setq list-902 (reverse list-902)));if



(setq str-902 (list (cons 1 str-01) (cons 2 str-02) (cons 3 str-03) (cons 4 str-04) (cons 5 str-05) (cons 6 str-06) (cons 7 str-07) (cons 8 str-08) (cons 9 str-09) (cons 10 str-10) (cons 11 str-11) (cons 12 str-12) (cons 99 "3,5"))
  			
  		list-902 (vl-list*  str-902 list-902);список характеристик для спецификации
  			
  		list-901 (vl-list* (strcat str-01 "  " str-02 "  " str-03 "  " str-04 "  " str-05 "  " str-06 "  " str-07 "  " str-08 "  " 
  															 str-09 " °С  Наработка " str-10 "  Компенс. холодн. спая " str-11 "  Поверка " str-12) list-901)
);setq

(cond
	((= swtch nil) (setq list-902 (reverse list-902)))
	((/= swtch nil) (setq list-902 (reverse list-902)))
);cond

(list-filling "txt-901" (reverse list-901))

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в ПЭ                   //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun le-101-01-secondary-device-regigraf

( / cntr-1 dlt-y nmbr-ln pnt-ins str-01 str-02 str-03 str-04 str-041 str-042 str-07 str-tmp x-pnt-ins y-pnt-ins y-pnt-ins-1)

(setq cntr-1 0);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-01 (cdr (assoc 1 str-tmp))
				str-02 (cdr (assoc 2 str-tmp))
				str-03 (cdr (assoc 3 str-tmp))
				str-04 (cdr (assoc 4 str-tmp))
				str-07 (cdr (assoc 7 str-tmp))
	);setq
	
;(princ "\n         str-tmp = ") (princ str-tmp);Erase_DV
;(getstring "\nPress Enter to continue...");Erase_DV

	(setvar "osmode" 6199)
	(setq pnt-ins		(getpoint "\nУкажите точку вставки\n")
  			x-pnt-ins (nth 0 pnt-ins)
 				y-pnt-ins (nth 1 pnt-ins)
  			y-pnt-ins-1 y-pnt-ins
  			dlt-y 8
  			nmbr-ln 5
	);setq
	
	(100-empt-lin-le)
	(setvar "osmode" 0)
	(setvar "cmdecho" 0)
	
	(1000-delete-items-le nmbr-ln x-pnt-ins y-pnt-ins)
	(setvar "osmode" 0)
	(setvar "cmdecho" 0)
	
	(if (= "Нет" str-02) (setq str-02 "нет"));if
	
	(if (= "Нет" str-03) (setq str-03 "нет"));if
		
	(cond
		((= str-04 "220 (перем. ток)") (setq str-041 "220В (переменный ток)"));=
		((= str-04 "24 (пост. ток)") (setq str-041 "24В (постоянный ток)"));=
		((= str-04 "220 (перем. ток), питание датчиков") (setq str-041 "220В (переменный ток), питание" str-042 "датчиков от регистратора"));=
		((= str-04 "24 (пост. ток), питание датчиков") (setq str-041 "24В (постоянный ток), питание" str-042 "датчиков от регистратора"));=
	);cond

	(cond
		((= str-07 "Общепромышленное") (setq str-07 "общепромышленное"));=
		((= str-07 "АЭС") (setq str-07 "для АЭС"));=
	);cond

	
	(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Регистратор щитовой электронный многоканальный Ф1771-АД,")
	(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "аналоговый вход " str-01 ", аналоговый выход " str-02 ","))
	
	(if (or (= str-04 "220 (перем. ток)") (= str-04 "24 (пост. ток)"))
		(if (/= nil str-03)
			(progn
				(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 (strcat "дискретный выход " str-03 ", " str-041 ", исполнение"))
				(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 3)) 4)) 2.5 0 str-07)
				(setq nmbr-ln 5)
			);progn
		);if
	);if

	(if (or (= str-04 "220 (перем. ток), питание датчиков") (= str-04 "24 (пост. ток), питание датчиков"))
		(if (/= nil str-03)
			(progn
				(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 (strcat "дискретный выход " str-03 ", " str-041))
				(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 3)) 4)) 2.5 0 (strcat str-042 ", исполнение " str-07))
				(setq nmbr-ln 5)
			);progn
		);if
	);if
	
	(repeat nmbr-ln
  	(command "_insert" "пэ-пустая-строка" "_X" 1 "_Y" 1 "_Z" 1 "_R" 0 (list x-pnt-ins y-pnt-ins-1))
  	(setq y-pnt-ins-1 (- y-pnt-ins-1 8));setq
	);repeat

	(setq cntr-1 (+ cntr-1 1));setq

);repeat

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в спцф                   ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun spcf-101-01-secondary-device-regigraf

( / cntr-1 dlt-y nmbr-ln pnt-ins str-01 str-01-02 str-02 str-02-02 str-03 str-03-02 str-04 str-04-01 str-04-02 str-05 str-05-01 str-05-02 str-06 str-06-01 str-06-02 str-07 str-07-01 str-08 str-09 str-10 
str-11 str-99 str-tmp x-pnt-ins y-pnt-ins y-pnt-ins-1)

(setq cntr-1 0);setq

(setvar "textstyle" "Standard")

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-01 (cdr (assoc 1 str-tmp))
				str-02 (cdr (assoc 2 str-tmp))
				str-03 (cdr (assoc 3 str-tmp))	
				str-04 (cdr (assoc 4 str-tmp))
				str-05 (cdr (assoc 5 str-tmp))
				str-06 (cdr (assoc 6 str-tmp))
				str-07 (cdr (assoc 7 str-tmp))
				str-08 (cdr (assoc 8 str-tmp))
				str-09 (cdr (assoc 9 str-tmp))
				str-10 (cdr (assoc 10 str-tmp))
				str-11 (cdr (assoc 11 str-tmp))
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
  
	(cond
		((= str-01 "4 канала") (setq str-01-02 "04"));=
		((= str-01 "8 каналов") (setq str-01-02 "08"));=
		((= str-01 "16 каналов") (setq str-01-02 "16"));=
	);cond

	(cond
		((= str-02 "Нет") (setq str-02 "нет" str-02-02 "0"));=
		((= str-02 "2 канала") (setq str-02-02 "1"));=
		((= str-02 "4 канала") (setq str-02-02 "2"));=
	);cond
	
	(cond
		((= str-03 "Нет") (setq str-03 "нет" str-03-02 "0"));=
		((= str-03 "8 реле") (setq str-03-02 "1"));=
		((= str-03 "16 реле") (setq str-03-02 "2"));=
	);cond
		
	(cond
		((= str-04 "220 (перем. ток)") (setq str-04-01 "220В, переменного тока)" str-04-02 "1"));=
		((= str-04 "24 (пост. ток)") (setq str-04-01 "24В (постоянный ток)" str-04-02 "2"));=
		((= str-04 "220 (перем. ток), питание датчиков") (setq str-04-01 "220В (переменный ток), питание датчиков от регистратора" str-04-02 "3"));=
		((= str-04 "24 (пост. ток), питание датчиков") (setq str-04-01 "24В (постоянный ток), питание датчиков от регистратора" str-04-02 "4"));=
	);cond

	(cond
		((= str-05 "Нет") (setq str-05-01 "без дополнительного интерфейса" str-05-02 "00"));=
		((= str-05 "Ethernet") (setq str-05-01 "дополнительный интерфейс Ethernet" str-05-02 "01"));=
	);cond

	(cond
		((= str-06 "Нет") (setq str-06-01 "извлечение квадратного корня (стандартное исполнение)" str-06-02 "0"));=
		((= str-06 "Да") (setq str-06-01 "8 математических каналов" str-06-02 "1"));=
	);cond

	(cond
		((= str-07 "Общепромышленное") (setq str-07-01 "общепромышленное"));=
		((= str-07 "АЭС") (setq str-07-01 (strcat "для АЭС, класс безопасности по ОПБ88/97" str-08)));=
	);cond

	(cond
		((= str-09 "Росэнергоатом") (setq str-09 "УО Концерн \"Росэнергоатом\""));=
	);cond

	(cond
		((= str-10 "Да") (setq str-10 "с поверкой"));=
		((= str-10 "Нет") (setq str-10 "без поверки"));=
	);cond

	(cond
		((= str-11 "Влагозащитная") (setq str-11 "влагозащитная"));=
		((= str-11 "Обычная") (setq str-11 "обычная"));=
	);cond
 
	;;;;;обработка данных//////////////////////////////////////////////////////////////////////////////////////////////
	(setq nmbr-ln 12);setq
			
	(1000-delete-items-spcf nmbr-ln x-pnt-ins y-pnt-ins);удаление предыдущей записи
	(1000-delete-items-spcf-crtf nmbr-ln x-pnt-ins y-pnt-ins);удаление предыдущего сертификата
	(setvar "osmode" 0)
	(setvar "cmdecho" 0)
			
	(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Регистратор щитовой электронный многоканальный")
	(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "- аналоговые входы " str-01))
	(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 (strcat "- аналоговые выходы " str-02))
	(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 3)) 4)) 2.5 0 (strcat "- релейные выходы " str-03))
	(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 4)) 4)) 2.5 0 (strcat "- электропитание " str-04-01))
	(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 5)) 4)) 2.5 0 (strcat "- " str-05-01))
	(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 6)) 4)) 2.5 0 (strcat "- " str-06-01))
	
	(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 7)) 4)) 2.5 0 (strcat "- исполнение " str-07-01))
	
	(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 8)) 4)) 2.5 0 (strcat "- приемка " str-09))
	(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 9)) 4)) 2.5 0 (strcat "- " str-10))
	(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 10)) 4)) 2.5 0 (strcat "- упаковка " str-11))
	
	(command "_TEXT" "_MC" (list (+ x-pnt-ins 160) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 (strcat "Ф1771-АД-" str-01-02 "-" str-02-02 "-" str-03-02 "-" str-04-02 "-" str-05-02 "-" str-06-02)) 
	(command "_text" "_MC" (list (+ x-pnt-ins 160) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 "ТУ 4389-0184-05755097-2005")
	
	(command "_text" "_ML" (list (+ x-pnt-ins 336) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Свидетельство об");
	(command "_text" "_ML" (list (+ x-pnt-ins 336) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 "утверждении средств")
	(command "_text" "_ML" (list (+ x-pnt-ins 336) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 "измерений")
	(command "_text" "_ML" (list (+ x-pnt-ins 336) (- (- y-pnt-ins (* dlt-y 3)) 4)) 2.5 0 "RU.C.34.001.A")
	(command "_text" "_ML" (list (+ x-pnt-ins 336) (- (- y-pnt-ins (* dlt-y 4)) 4)) 2.5 0 "№33022, №29715-08 в")
	(command "_text" "_ML" (list (+ x-pnt-ins 336) (- (- y-pnt-ins (* dlt-y 5)) 4)) 2.5 0 "в Госреестре СИ")
			
	(command "_text" "_MC" (list (+ x-pnt-ins 322.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 str-99);масса

	(command "_text" "_MC" (list (+ x-pnt-ins 247.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Группа компаний")
	(command "_text" "_MC" (list (+ x-pnt-ins 247.5) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 "\"ЭлМетро\",")
	(command "_text" "_MC" (list (+ x-pnt-ins 247.5) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 "г. Челябинск")
	
	(command "_text" "_MC" (list (+ x-pnt-ins 280) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "шт.")
			
	(repeat nmbr-ln
  	(command "_insert" "зс-пустая-строка" "_X" 1 "_Y" 1 "_Z" 1 "_R" 0 (list x-pnt-ins y-pnt-ins-1))
  	(setq y-pnt-ins-1 (- y-pnt-ins-1 8));setq
	);repeat
 
	(setq cntr-1 (+ cntr-1 1));setq
);repeat

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в овш                   /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun lecgv-101-01-secondary-device-regigraf

( / cntr-1 dlt-y nmbr-ln pnt-ins str-01 str-01-02 str-02 str-02-02 str-03 str-03-02 str-04 str-04-01 str-04-02 str-05 str-05-01 str-05-02 str-06 str-06-01 str-06-02 str-07 str-07-01 str-08 str-09 str-10 str-11 str-99 str-tmp str-tmp-4-1 str-tmp-4-2 str-tmp-5-1 str-tmp-5-2 str-tmp-6-1 str-tmp-6-2 str-tmp-6-4 str-tmp-99 x-pnt-ins y-pnt-ins y-pnt-ins-1)

(setq cntr-1 0 ;счетчик
);setq

(setvar "textstyle" "Standard")

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-01 (cdr (assoc 1 str-tmp))
				str-02 (cdr (assoc 2 str-tmp))
				str-03 (cdr (assoc 3 str-tmp))	
				str-04 (cdr (assoc 4 str-tmp))
				str-05 (cdr (assoc 5 str-tmp))
				str-06 (cdr (assoc 6 str-tmp))
				str-07 (cdr (assoc 7 str-tmp))
				str-08 (cdr (assoc 8 str-tmp))
				str-09 (cdr (assoc 9 str-tmp))
				str-10 (cdr (assoc 10 str-tmp))
				str-11 (cdr (assoc 11 str-tmp))
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
	
;	(princ "\n         str-tmp = ") (princ str-tmp);Erase_DV
;	(getstring "\nPress Enter to continue...");Erase_DV

	(cond
		((= str-01 "4 канала") (setq str-01-02 "04"));=
		((= str-01 "8 каналов") (setq str-01-02 "08"));=
		((= str-01 "16 каналов") (setq str-01-02 "16"));=
	);cond

	(cond
		((= str-02 "Нет") (setq str-02 "нет" str-02-02 "0"));=
		((= str-02 "2 канала") (setq str-02-02 "1"));=
		((= str-02 "4 канала") (setq str-02-02 "2"));=
	);cond
	
	(cond
		((= str-03 "Нет") (setq str-03 "нет" str-03-02 "0"));=
		((= str-03 "8 реле") (setq str-03-02 "1"));=
		((= str-03 "16 реле") (setq str-03-02 "2"));=
	);cond
		
	(cond
		((= str-04 "220 (перем. ток)") (setq str-04-01 "220В, переменного тока)" str-04-02 "1"));=
		((= str-04 "24 (пост. ток)") (setq str-04-01 "24В (постоянный ток)" str-04-02 "2"));=
		((= str-04 "220 (перем. ток), питание датчиков") (setq str-04-01 "220В (переменный ток), питание датчиков от регистратора" str-04-02 "3"));=
		((= str-04 "24 (пост. ток), питание датчиков") (setq str-04-01 "24В (постоянный ток), питание датчиков от регистратора" str-04-02 "4"));=
	);cond

	(cond
		((= str-05 "Нет") (setq str-05-01 "без дополнительного интерфейса" str-05-02 "00"));=
		((= str-05 "Ethernet") (setq str-05-01 "дополнительный интерфейс Ethernet" str-05-02 "01"));=
	);cond

	(cond
		((= str-06 "Нет") (setq str-06-01 "извлечение квадратного корня (стандартное исполнение)" str-06-02 "0"));=
		((= str-06 "Да") (setq str-06-01 "8 математических каналов" str-06-02 "1"));=
	);cond

	(cond
		((= str-07 "Общепромышленное") (setq str-07-01 "общепромышленное"));=
		((= str-07 "АЭС") (setq str-07-01 (strcat "для АЭС, класс безопасности по ОПБ88/97" str-08)));=
	);cond

	(cond
		((= str-09 "Росэнергоатом") (setq str-09 "УО Концерн \"Росэнергоатом\""));=
	);cond

	(cond
		((= str-10 "Да") (setq str-10 "с поверкой"));=
		((= str-10 "Нет") (setq str-10 "без поверки"));=
	);cond

	(cond
		((= str-11 "Влагозащитная") (setq str-11 "влагозащитная"));=
		((= str-11 "Обычная") (setq str-11 "обычная"));=
	);cond
	
	

	

		
	;обработка данных
	(setq nmbr-ln 6);setq
	
	(1000-delete-items-le-cgv nmbr-ln x-pnt-ins y-pnt-ins)
	(setvar "osmode" 0)
	(setvar "cmdecho" 0)
			
	(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Регистратор щитовой электронный многоканальный")
	(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "Ф1771-АД-" str-01-02 "-" str-02-02 "-" str-03-02 "-" str-04-02 "-" str-05-02 "-" str-06-02))
	(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 (strcat "выход 1 " str-tmp-4-1 ","))
	(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 3)) 4)) 2.5 0 (strcat "выход 2 "str-tmp-5-1 ","))
	(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 4)) 4)) 2.5 0 (strcat "монтаж " str-tmp-6-1 ", " str-tmp-6-2 "мм"))
	
	(command "_text" "_MC" (list (+ x-pnt-ins 142.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 str-tmp-99);масса
	(command "_text" "_MC" (list (+ x-pnt-ins 130) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "***")		
			
	(repeat nmbr-ln
  	(command "_insert" "овш-пэ-пустая-строка" "_X" 1 "_Y" 1 "_Z" 1 "_R" 0 (list x-pnt-ins y-pnt-ins-1))
  	(setq y-pnt-ins-1 (- y-pnt-ins-1 8));setq
	);repeat
 
	(setq cntr-1 (+ cntr-1 1));setq
);repeat

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
