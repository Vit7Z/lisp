;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// клапанные блоки "прибор"                                     ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun 101-08-valvate-block-pribor

( / adoc dcl-id file-name file-open list-01 list-02 list-03 list-04 list-05 list-06 list-07 list-08 list-09 list-10 list-901 list-902 path-file-open str-01 str-f type-list)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(setvar "cmdecho" 0)
(setvar "textstyle" "Standard")

(setq str-f 1;переменные
			str-01 nil
      list-01 (list "Серия А"
      							"Серия Е")
			list-02 nil
			list-03 nil
			list-04 nil
			list-05 nil
			list-06 nil
			list-07 nil
			list-08 nil
			list-09 nil
			list-10 nil
			list-901 nil	
			list-902 nil	
			file-name nil
			file-open nil
			path-file-open nil
);setq

(start-101-08-valvate-block-pribor)

(if (< (setq dcl-id (load_dialog "dia-101-08-valvate-block-pribor.dcl")) 0) ;ищем диалог
		(progn
			(alert "Не найден dcl-файл")
			(exit)
		);progn
);if

(if (not (new_dialog "dia_101_klapanny_block_pribor" dcl-id))
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

(action_tile "txt-01"
  (strcat "(start-101-08-valvate-block-pribor)"
  );srcat
);action_tile

(action_tile "txt-02"
  (strcat "(txt-02-101-08-valvate-block-pribor)"
  );srcat
);action_tile

(action_tile "txt-05"
  (strcat "(txt-05-101-08-valvate-block-pribor)"
  );srcat
);action_tile

(action_tile "but1"
  (strcat "(but1-101-08-valvate-block-pribor)"
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

(cond
	((= type-list "le") (le-101-08-valvate-block-pribor));=
	((= type-list "spcf") (spcf-101-08-valvate-block-pribor));=
);if

(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(vla-endundomark adoc)
(princ)
)
;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// конец программы                                             ////////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun start-101-08-valvate-block-pribor

( / )

(if (= nil str-01) 
	(setq str-01 "Серия А"
	);setq
	(setq str-01 (nth (atoi (get_tile "txt-01")) list-01)
	);setq
);if

(cond
	((= str-01 "Серия А")
		(progn
			(set_tile "ptxt-01" "Предназначены для присоединения импульсных линий к клапанному блоку через монтажные фланцы")
			(set_tile "lbl-041" "Материал корпуса")
			(set_tile "lbl-042" "код (расшифровка)")
			(set_tile "lbl-051" "Спец. исполнение")
			(set_tile "lbl-052" "код (расшифровка)")
			(set_tile "lbl-061" "Монтажные части, код (расшифровка)")
			(set_tile "lbl-071" "Монтажные части для крепления")
			(set_tile "lbl-072" "блока на трубе, код (расшифровка)")
			(set_tile "lbl-081" "Монтажные части для крепления")
			(set_tile "lbl-082" "датчика на трубе, код (расшифровка)")
			(set_tile "lbl-091" "Технические")
			(set_tile "lbl-092" "условия")
			(set_tile "lbl-101" "")
			(set_tile "lbl-102" "")
			(set_tile "lbl-103" "")			
			(setq list-02 (list "3" "5")
						list-03 (list "0 (Без дренажа, без возможности подключ. метрологич. оборудования)" 
													"1 (Дренажные клапаны до изолирующего вентиля)"
													"2 (Дренажные клапаны после изолирующего вентиля)")
      			list-04 (list "02 (12Х18Н10Т)")
     				list-05 (list "Нет" "К (Для работы с кислородом)" "АС (Для АЭС)")
      			list-06 (list "Н (Монтажн. флан., ниппель 12Х18Н10Т, сварка по диаметру 14мм.)"
      										"М20 (Монтажн. флан., ниппель 12Х18Н10Т, гайка М20х1,5, сварка по диаметру 14мм.)"
      										"К1/4 (Монтажн. флан., отверстие К1/4\")"
      										"1/4NPT (Монтажн. флан., отверстие 1/4NPT"
      										"К1/2 (Монтажн. флан., отверстие К1/2\")"
      										"1/2NPT (Монтажн. флан., отверстие 1/2NPT"
      										)
      			list-07 (list "Нет" "Т (Скоба, кронштейн для крепл на трубе Ду50)")
      			list-08 (list "Нет" "СК (Скоба, кронштейн для крепл на трубе Ду50)")
      			list-09 (list "1603.000ТУ")
			);setq
		);progn
	);=

	((= str-01 "Серия Е")
		(progn
			(set_tile "ptxt-01" "Предназначены для подключения датчиков избыточного, абсолютного, вакуумметрического давления, давления-разрежения к импульсным линиям")
			(set_tile "lbl-041" "Резьба, вход")
			(set_tile "lbl-042" "среды")
			(set_tile "lbl-051" "Резьба, выход")
			(set_tile "lbl-052" "среды")
			(set_tile "lbl-061" "")
			(set_tile "lbl-071" "Монтажные части")
			(set_tile "lbl-072" "для крепления блока")
			(set_tile "lbl-073" "на трубе")
			(set_tile "lbl-081" "Монтажные части")
			(set_tile "lbl-082" "для крепления датчика")
			(set_tile "lbl-083" "на трубе")
			(set_tile "lbl-091" "Технические")
			(set_tile "lbl-092" "условия")
			(set_tile "lbl-101" "Материал")
			(set_tile "lbl-102" "корпуса")
			(set_tile "lbl-103" "")	
			(setq list-02 (list "1" "2")
						list-03 (list "Дренажные клапаны до изолирующего вентиля"
													"Дренажные клапаны после изолирующего вентиля")
      			list-04 (list "12Х18Н10Т")
     				list-05 (list "Нет" "Для работы с кислородом" "Для АЭС")
      			list-06 (list "Монтажный фланец, ниппель из стали 12Х18Н10Т, сварка по диаметру 14мм.")
      			list-07 (list "Скоба, кронштейн для крепл на трубе Ду50")
      			list-08 (list "Скоба, кронштейн для крепл на трубе Ду50")
      			list-09 (list "1603.000ТУ")
			);setq
		);progn
	);=
);cond

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
(list-filling "txt-13" list-13)

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
(set_tile "txt-13" "0")

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////                                                              ///////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun txt-02-101-08-valvate-block-pribor

( / str-01 str-02)

(setq str-01 (nth (atoi (get_tile "txt-01")) list-01)
			str-02 (nth (atoi (get_tile "txt-02")) list-02)
);setq

(if (= str-01 "Серия А")
	(cond
		((= str-02 "3")
			(setq list-03 (list "0 (Без дренажа, без возможности подключ. метрологич. оборудования)" 
													"1 (Дренажные клапаны до изолирующего вентиля)"
													"2 (Дренажные клапаны после изолирующего вентиля)")
			);setq
		);=

		((= str-02 "5")
			(setq list-03 (list "1 (Дренажные клапаны до изолирующего вентиля)"
													"2 (Дренажные клапаны после изолирующего вентиля)")
			);setq
		);=
	);cond
);if


(list-filling "txt-03" list-03)

(set_tile "txt-03" "0")

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////                                                              ///////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun txt-05-101-08-valvate-block-pribor

( / str-05)

(setq str-05 (nth (atoi (get_tile "txt-05")) list-05)
);setq

(cond
	((/= str-05 "АС (Для АЭС)") (setq list-09 (list "1603.000ТУ")));=
	((= str-05 "АС (Для АЭС)") (setq list-09 (list "1633.000ТУ")));=
);cond

(list-filling "txt-09" list-09)
(set_tile "txt-09" "0")
(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// формирование данных, заполнение поля "выбрано"               ///////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun but1-101-08-valvate-block-pribor

( / cntr-1 str-01 str-02 str-03 str-04 str-05 str-06 str-07 str-08 str-09 str-10 str-902 str-99 swtch)

(setq str-01 (nth (atoi (get_tile "txt-01")) list-01)
			str-02 (nth (atoi (get_tile "txt-02")) list-02)
			str-03 (nth (atoi (get_tile "txt-03")) list-03)
			str-04 (nth (atoi (get_tile "txt-04")) list-04)
			str-05 (nth (atoi (get_tile "txt-05")) list-05)
			str-06 (nth (atoi (get_tile "txt-06")) list-06)
			str-07 (nth (atoi (get_tile "txt-07")) list-07)
			str-08 (nth (atoi (get_tile "txt-08")) list-08)
			str-09 (nth (atoi (get_tile "txt-09")) list-09)
			str-98 (get_tile "ptxt-01")
      swtch list-901
      cntr-1 0
);setq

(if (/= swtch nil);если есть уже выбраннное то переворачиваем
	(setq list-902 (reverse list-902);список характеристик для спецификации
	);setq
);if

(cond	;масса
	((= str-01 "Серия А") (setq str-99 "1,5"));=
	((= str-01 "Серия Е")
		(setq str-99 "0,8"
					str-10 (nth (atoi (get_tile "txt-10")) list-10)
		);setq
	);=
);cond

(if (= str-01 "Серия А")
	(progn
		;для диалога
		(setq list-901 (vl-list* (strcat str-01 "  " 
																		 "Кол. вентилей " str-02 "  " 
																		 "Гидравлич. схема " (vl-string-right-trim " " (substr str-03 1 (vl-string-search "(" str-03))) "  "
																		 "Материал " (vl-string-right-trim " " (substr str-04 1 (vl-string-search "(" str-04))) "  "
																		 "Спец. исполнение " (vl-string-right-trim " " (substr str-05 1 (vl-string-search "(" str-05))) "  " 
																		 "Монтажные части " (vl-string-right-trim " " (substr str-06 1 (vl-string-search "(" str-06))) "  "
																		 "Монтажные части для крепления блока " (vl-string-right-trim " " (substr str-07 1 (vl-string-search "(" str-07))) "  " 
																		 "Монтажные части для крепления датчика " (vl-string-right-trim " " (substr str-08 1 (vl-string-search "(" str-08))) "  "
																		  ) list-901)  
																		  
		);setq

		
		;для пэ, зс
		(setq str-902 (list (cons 1 str-01) (cons 2 str-02) (cons 3 str-03) (cons 4 str-04) (cons 5 str-05) (cons 6 str-06) (cons 7 str-07)	(cons 8 str-08) (cons 9 str-09)
												(cons 98 str-98) (cons 99 str-99))
					list-902 (vl-list* str-902 list-902)
		);setq
	);progn	
);if

(setq list-902 (reverse list-902));=

(list-filling "txt-901" (reverse list-901))

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// вывод в ПЭ                                                   ///////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun le-101-08-valvate-block-pribor

( / cntr-1 dlt-y nmbr-ln pnt-ins str-tmp str-tmp-1 str-tmp-11 str-tmp-12 str-tmp-2 str-tmp-3 x-pnt-ins y-pnt-ins y-pnt-ins-1)

(setq cntr-1 0 ;счетчик
);setq

(setvar "textstyle" "Standard")

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-tmp-1 (cdr (assoc 1 str-tmp))
				str-tmp-2 (cdr (assoc 2 str-tmp))
				str-tmp-3 (cdr (assoc 3 str-tmp))
				str-tmp-11 nil
				str-tmp-12 nil
	);setq

	(setvar "osmode" 6199)
	
	(setq pnt-ins		(getpoint "\nУкажите точку вставки\n"));setq
	
	(setq str-tmp-1 
		(cond
			((= str-tmp-1 "Серия А") "серия А");=
			((= str-tmp-1 "Серия Е") "серия Е");=
		);cond
	);setq

	(setq str-tmp-3 
		(cond
			((= str-tmp-3 "0 (Без дренажа, без возможности подключ. метрологич. оборудования)") "без дренажных клапанов");=
			((/= str-tmp-3 "0 (Без дренажа, без возможности подключ. метрологич. оборудования)") "с дренажными клапанами");=
		);cond
	);setq
	
	(if (= str-tmp-1 "серия А")
		(progn
			(setq nmbr-ln 3 ;количество строк
						str-tmp-11 (strcat "Клапанный блок \"Завод \"Прибор\", " str-tmp-1 ", количество вентилей " str-tmp-2 ",")
						str-tmp-12 (strcat str-tmp-3)
			);setq
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 str-tmp-11)
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 str-tmp-12)
		);progn
	);if
	
	(setq cntr-1 (1+ cntr-1));setq
);repeat

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// вывод в СПЦФ базовая                                         ///////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun spcf-101-08-valvate-block-pribor

( / cntr-1 str-tmp str-tmp-1)

(setq cntr-1 0 ;счетчик
);setq

(setvar "textstyle" "Standard")

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-tmp-1 (cdr (assoc 1 str-tmp))
	);setq
	
	(if (= str-tmp-1 "Серия А")
		(spcf-101-08-valvate-block-pribor-series-a str-tmp)
	);if
 
; 	(if (= str-tmp-1 "Серия Е")
;		(spcf-101-08-valvate-block-pribor-series-e str-tmp)
;	);if
	
	(setq cntr-1 (+ cntr-1 1)
	);setq
);repeat

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// вывод в СПЦФ серия а                                         ///////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun spcf-101-08-valvate-block-pribor-series-a

(str-tmp / cntr-1 dlt-y dt-1-3 dt-1-4 dt-1-5 dt-1-61 dt-1-62 dt-1-71 dt-2-3 dt-2-5 dt-2-71 nmbr-ln nmbr-ln-1 pnt-ins str-tmp-10 str-tmp-2 str-tmp-3 str-tmp-4 str-tmp-5 
str-tmp-6 str-tmp-7 str-tmp-8 str-tmp-9 str-tmp-98 str-tmp-99 x-pnt-ins y-pnt-ins y-pnt-ins-1)

(setq cntr-1 0 ;счетчик
);setq

(setvar "textstyle" "Standard")

(setq str-tmp-2 (cdr (assoc 2 str-tmp))
			str-tmp-3 (cdr (assoc 3 str-tmp))
			str-tmp-4 (cdr (assoc 4 str-tmp))
			str-tmp-5 (cdr (assoc 5 str-tmp))
			str-tmp-6 (cdr (assoc 6 str-tmp))
			str-tmp-7 (cdr (assoc 7 str-tmp))
			str-tmp-8 (cdr (assoc 8 str-tmp))
			str-tmp-9 (cdr (assoc 9 str-tmp))
			str-tmp-10 (cdr (assoc 10 str-tmp))
			str-tmp-98 (cdr (assoc 98 str-tmp));конструктивн особенности
			str-tmp-99 (cdr (assoc 99 str-tmp));масса
);setq

(setvar "osmode" 6199)
(setq pnt-ins		(getpoint "\nУкажите точку вставки\n")
	  	x-pnt-ins (nth 0 pnt-ins)
	 		y-pnt-ins (nth 1 pnt-ins)
	  	y-pnt-ins-1 y-pnt-ins
	  	dlt-y 8
	  	nmbr-ln 4
	  	nmbr-ln-1 4
); setq

(101-empt-lin-spcf)
(setvar "osmode" 0)
(setvar "cmdecho" 0)

	
(cond
	((= str-tmp-3 "0 (Без дренажа, без возможности подключ. метрологич. оборудования)")
		(setq dt-1-3 "- без дренажа, без возможности подключения метрологического оборудования"
					dt-2-3 "0"
		);setq
	);=
	((= str-tmp-3 "1 (Дренажные клапаны до изолирующего вентиля)")
		(setq dt-1-3 "- дренажные клапаны до изолирующего вентиля"
					dt-2-3 "1"
		);setq
	);=
	((= str-tmp-3 "2 (Дренажные клапаны после изолирующего вентиля)")
		(setq dt-1-3 "- дренажные клапаны после изолирующего вентиля"
					dt-2-3 "2"
		);setq
	);=
);cond

(cond
	((= str-tmp-4 "02 (12Х18Н10Т)")
		(setq dt-2-4 "02"
		);setq
	);=
	((= str-tmp-5 "К (Для работы с кислородом)")
		(setq dt-1-5 "- для работы с кислородом"
					dt-2-5 "К"
		);setq
	);=
	((= str-tmp-5 "АС (Для АЭС)")
		(setq dt-1-5 "- для работы на АЭС"
					dt-2-5 "АС"
		);setq
	);=
);cond

(cond
	((= str-tmp-5 "Нет")
		(setq dt-1-5 "- исполнение общепромышленное"
					dt-2-5 ""
		);setq
	);=
	((= str-tmp-5 "К (Для работы с кислородом)")
		(setq dt-1-5 "- для работы с кислородом"
					dt-2-5 "К"
		);setq
	);=
	((= str-tmp-5 "АС (Для АЭС)")
		(setq dt-1-5 "- для работы на АЭС"
					dt-2-5 "АС"
		);setq
	);=
);cond
	 
(cond
	((= str-tmp-6 "Н (Монтажн. флан., ниппель 12Х18Н10Т, сварка по диаметру 14мм.)")
		(progn
			(setq dt-2-6 "Н"
			);setq
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y nmbr-ln-1)) 4)) 2.5 0 "- монтажный фланец, ниппель из стали 12Х18Н10Т,")
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y (1+ nmbr-ln-1))) 4)) 2.5 0 "сварка по диаметру 14мм.")
			(setq nmbr-ln (+ nmbr-ln 3)
						nmbr-ln-1 (+ nmbr-ln-1 2)
			);setq
		);progn
	);=

	((= str-tmp-6 "М20 (Монтажн. флан., ниппель 12Х18Н10Т, гайка М20х1,5, сварка по диаметру 14мм.)")
		(progn
			(setq dt-2-6 "М20"
			);setq
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y nmbr-ln-1)) 4)) 2.5 0 "- монтажный фланец, ниппель из стали 12Х18Н10Т,")
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y (1+ nmbr-ln-1))) 4)) 2.5 0 "гайка накидная, сварка по диаметру 14мм.")
			(setq nmbr-ln (+ nmbr-ln 3)
						nmbr-ln-1 (+ nmbr-ln-1 2)
			);setq
		);progn
	);=

	((= str-tmp-6 "К1/4 (Монтажн. флан., отверстие К1/4\")")
		(progn
			(setq dt-2-6 "К1/4"
			);setq
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y nmbr-ln-1)) 4)) 2.5 0 "- монтажный фланец с отверстиями К1/4\"")
			(setq nmbr-ln (+ nmbr-ln 2)
						nmbr-ln-1 (+ nmbr-ln-1 1)
			);setq
		);progn
	);=
	
	((= str-tmp-6 "1/4NPT (Монтажн. флан., отверстие 1/4NPT")
		(progn
			(setq dt-2-6 "1/4NPT"
			);setq
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y nmbr-ln-1)) 4)) 2.5 0 "- монтажный фланец с отверстиями 1/4NPT")
			(setq nmbr-ln (+ nmbr-ln 2)
						nmbr-ln-1 (+ nmbr-ln-1 1)
			);setq
		);progn
	);=
	
	((= str-tmp-6 "К1/2 (Монтажн. флан., отверстие К1/2\")")
		(progn
			(setq dt-2-6 "К1/2" 
			);setq
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y nmbr-ln-1)) 4)) 2.5 0 "- монтажный фланец с отверстиями К1/2\"")
			(setq nmbr-ln (+ nmbr-ln 2)
						nmbr-ln-1 (+ nmbr-ln-1 1)
			);setq
		);progn
	);=
	
	((= str-tmp-6 "1/2NPT (Монтажн. флан., отверстие 1/2NPT")
		(progn
			(setq dt-2-6 "1/2NPT"
			);setq
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y nmbr-ln-1)) 4)) 2.5 0 "- монтажный фланец с отверстиями 1/2NPT")
			(setq nmbr-ln (+ nmbr-ln 2)
						nmbr-ln-1 (+ nmbr-ln-1 1)
			);setq
		);progn
	);=
);cond

(cond
	((= str-tmp-7 "Нет")
		(progn	
			(setq dt-2-7 ""
			);setq
		);progn
	);=
	
	((= str-tmp-7 "Т (Скоба, кронштейн для крепл на трубе Ду50)")
		(progn	
			(setq dt-2-7 "Т"
			);setq
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y nmbr-ln-1)) 4)) 2.5 0 "- скоба, кронштейн для крепления клапанного блока на трубе Ду50")
			(setq nmbr-ln (+ nmbr-ln 1)
						nmbr-ln-1 (+ nmbr-ln-1 1)
			);setq
		);progn
	);=
);cond

(cond
	((= str-tmp-8 "Нет")
		(progn	
			(setq dt-2-8 ""
			);setq
		);progn
	);=
	
	((= str-tmp-8 "СК (Скоба, кронштейн для крепл на трубе Ду50)")
		(progn	
			(setq dt-2-8 "СК"
			);setq
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y nmbr-ln-1)) 4)) 2.5 0 "- скоба, кронштейн для крепления датчика на трубе Ду50")
			(setq nmbr-ln (+ nmbr-ln 1)
			);setq
		);progn
	);=
);cond

(setq str-tmp-21 (strcat "А" str-tmp-2 dt-2-3 dt-2-4 dt-2-5 dt-2-6 dt-2-7 dt-2-8)
			;
);setq
(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 (strcat "Клапанный блок"))
(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 "- присоединение импульсных линий через монтажные фланцы")
(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 dt-1-3)
(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 3)) 4)) 2.5 0 dt-1-4)
(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 3)) 4)) 2.5 0 dt-1-5)

(command "_TEXT" "_MC" (list (+ x-pnt-ins 160) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 str-tmp-21) ;Тип, марка, обозначение документа, опросного листа
	
(command "_TEXT" "_MC" (list (+ x-pnt-ins 247.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "ФГУП \"Завод \"Прибор\",");производитель
(command "_TEXT" "_MC" (list (+ x-pnt-ins 247.5) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 "г. Челябинск")
(command "_text" "_MC" (list (+ x-pnt-ins 280) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "шт.")
(command "_text" "_MC" (list (+ x-pnt-ins 300) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "***")
(command "_text" "_MC" (list (+ x-pnt-ins 322.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 str-tmp-99);масса

(repeat nmbr-ln
  (command "_insert" "зс-пустая-строка" "_X" 1 "_Y" 1 "_Z" 1 "_R" 0 (list x-pnt-ins y-pnt-ins-1))
  (setq y-pnt-ins-1 (- y-pnt-ins-1 8)
  );setq
);repeat

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////