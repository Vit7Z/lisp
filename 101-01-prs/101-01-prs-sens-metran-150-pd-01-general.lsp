;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////                                                              ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun 101-01-prs-sens-metran-150-diff

( / adoc cntr-1 dcl-id list-02 list-03 list-03-0 list-04 list-05 list-06 list-07 list-08 list-09 list-10 list-11 list-12 list-13 list-14 list-15 list-16 list-17 list-19 
list-901 list-902 type-list)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(setvar "cmdecho" 0)
(setvar "textstyle" "Standard")

(setq cntr-1 0
      list-02 (list "150CD")
      list-03-0 (list "Вода" "Пар перегретый" "Пар насыщенный" "Газ природный" "Этиленгликоль" "Воздух")
      list-901 nil
      list-902 nil
);setq

(txt-02-101-01-prs-sens-metran-150-diff)

(if (< (setq dcl-id (load_dialog "dia-101-01-prs-sens-metran-150-diff.dcl")) 0) ;ищем диалог
		(progn
			(alert "Не найден dcl-файл")
			(exit)
		);progn
);if

(if (not (new_dialog "dia_101_01_press_sens_metran_150_pd" dcl-id))
		(exit)
);if

(list-filling "txt-02" list-02)
(list-filling "txt-03" list-03)
(list-filling "txt-03-0" list-03-0)
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
(list-filling "txt-14" list-14)
(list-filling "txt-15" list-15)
(list-filling "txt-16" list-16)
(list-filling "txt-17" list-17)
(list-filling "txt-19" list-19)

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
(set_tile "txt-14" "0")
(set_tile "txt-15" "0")
(set_tile "txt-16" "0")
(set_tile "txt-17" "0")
(set_tile "txt-19" "0")


(action_tile "txt-02"
  (strcat "(txt-02-101-01-prs-sens-metran-150-diff)");strcat
);action_tile

(action_tile "txt-03"
  (strcat "(txt-03-101-01-prs-sens-metran-150-diff)");strcat
);action_tile

(action_tile "txt-12"
  (strcat "(txt-12-101-01-prs-sens-metran-150-diff)");strcat
);action_tile

(action_tile "txt-14"
  (strcat "(txt-14-101-01-prs-sens-metran-150-diff)");strcat
);action_tile

(action_tile "but1"
  (strcat "(but1-101-01-prs-sens-metran-150-diff)");srcat
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

(if (= type-list "le") (le-101-01-prs-sens-metran-150-diff));if

(if (= type-list "spcf") (spcf-101-01-prs-sens-metran-150-diff));if

(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(vla-endundomark adoc)
(princ)
)
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun txt-02-101-01-prs-sens-metran-150-diff
( / str-02)

(if (= nil str-02) 
	(setq str-02 "150CD")
	(setq str-02 (nth (atoi (get_tile "txt-02")) list-02));setq
);if

(if (= "150CD" str-02)
	(progn
		(setq list-03 (list "0 0,025...0,63" 
												"1 0,25...6,3" 
												"2 1,25...63" 
												"3 5...250" 
												"4 32...1600" 
												"5 200...10000")
					list-04 (list "4")
					list-05 (list "2 Нерж. сталь 316" "3 Hastelloy")
					list-06 (list "2 Нерж. сталь 316")
					list-07 (list "1 Резина")
					list-08 (list "1 Силиконовое масло")
					list-09 (list "L3 Сталь 35ХГСА" "L4 Сталь 09Х16Н4В")
					list-10 (list "A 4...20 мА (HART)" "B 0...5 мА")
					list-11 (list "M5 ЖКИ с клавиатурой") 
					list-12 (list "IP65 по ГОСТ 14254" 
												"IM 0ЕхiaIIСT5" 
												"EM 1ЕхdIIСТ6" 
												"EM 1ЕхdIIСТ5"
												"UC Для раб. с кислородом")
					list-13 (list "S5 Да")
					list-14 (list "D5 Ниппель с гайкой М20х1,5 по наруж. диам. 14 мм"
												"D6 Ниппель по наруж. диам. 14 мм"
												"D1 Фланец с отверстием К1/4\""
												"D2 Фланец с отверстием К1/2\""
												"D3 Фланец с отверстием 1/4NРT"
												"D4 Фланец с отверстием 1/2NРT"
												"D7 Фланец со штуцером с резьбой 1/4NРT"
												"D8 Фланец со штуцером с резьбой 1/2NРT")
					list-15 (list "2 Сталь 12Х10Н10T" "4 Углеродистая сталь" "5 Сталь 09T2C")
					list-16 (list "Нет");"FE 50 мм, сталь 12Х18Н10" "FF 80 мм, сталь 12Х18Н10"
					list-17 (list "B1 На трубе диам. 55±5" "Нет")
					list-19 (list "K01 Латунь (для небронир. кабеля диаметром 6,5...13,9мм)"
												"K02 Нерж. сталь (для небронир. кабеля диаметром 6,5...13,9мм, для Exd)"
												"K03 Латунь (для небронир. кабеля диаметром 6,1...11,6мм, для Exd)"
												"K04 Полиамид (для небронир. кабеля диаметром 6...12мм)"
												"K12 Латунь (для бронир. кабеля диаметром 12,5...20,9 мм, для Exd)"
												"K14 Латунь (для бронир. кабеля диаметром 9,5...15,9 мм, для Exd"					
												"SC Вилка 2РМГ14, розетка 2РМ14"
												"SC1 Штепсельный разъем DIN");list
														
		);setq
		
		(set_tile "txt-18-4" "0")
		(set_tile "txt-18-8" "0")
		
		(mode_tile "txt-18-1" 0)
		(mode_tile "txt-18-2" 0)
		(mode_tile "txt-18-3" 0)
		(mode_tile "txt-18-4" 1)
		(mode_tile "txt-18-5" 0)
		(mode_tile "txt-18-6" 0)
		(mode_tile "txt-18-7" 0)
		(mode_tile "txt-18-8" 1)
		(mode_tile "txt-18-9" 0)
	);progn
);if

(list-filling "txt-02" list-02)
(list-filling "txt-03" list-03)
(list-filling "txt-03-0" list-03-0)
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
(list-filling "txt-14" list-14)
(list-filling "txt-15" list-15)
(list-filling "txt-16" list-16)
(list-filling "txt-17" list-17)
(list-filling "txt-19" list-19)

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
(set_tile "txt-14" "0")
(set_tile "txt-15" "0")
(set_tile "txt-16" "0")
(set_tile "txt-17" "0")
(set_tile "txt-19" "0")

(princ)
)
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun txt-03-101-01-prs-sens-metran-150-diff
( / str-02 str-03)

(setq str-02 (nth (atoi (get_tile "txt-02")) list-02)
			str-03 (nth (atoi (get_tile "txt-03")) list-03)
);setq
    
(if (= "150CD" str-02)
 (cond
 	((= "0,025...0,63" str-03)
 		(setq list-04 (list "4")
 					list-06 (list "2 Нерж. сталь 316")
 					list-07 (list "1 Резина")
 		);setq
 	);=
 	
 	((= "0,25...6,3" str-03) 
 		(setq list-04 (list "10")
 					list-06 (list "2 Нерж. сталь 316" "3 Hastelloy" "5 Тантал")
 					list-07 (list "1 Резина" "2 Фторопласт")
 		);setq
 	);=
 	
 	((or (= "1,25...63" str-03) (= "5...250" str-03) (= "32...1600" str-03) (= "200...10000" str-03)) 
		(setq list-04 (list "25")
					list-06 (list "2 Нерж. сталь 316" "3 Hastelloy" "5 Тантал")
					list-07 (list "1 Резина" "2 Фторопласт")
		);setq
 	);=
 	
 );cond
);if

(list-filling "txt-04" list-04)
(list-filling "txt-06" list-06)
(list-filling "txt-07" list-07)

(set_tile "txt-04" "0")
(set_tile "txt-06" "0")
(set_tile "txt-07" "0")

(princ)
)
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun txt-12-101-01-prs-sens-metran-150-diff
( / str-02 str-11 str-12)

(setq str-02 (nth (atoi (get_tile "txt-02")) list-02)
			str-11 (nth (atoi (get_tile "txt-11")) list-11)
			str-12 (nth (atoi (get_tile "txt-12")) list-12)
					
			list-19 (list "K01 Латунь (для небронир. кабеля диаметром 6,5...13,9мм)"
										"K02 Нерж. сталь (для небронир. кабеля диаметром 6,5...13,9мм, для Exd)"
										"K03 Латунь (для небронир. кабеля диаметром 6,1...11,6мм, для Exd)"
										"K04 Полиамид (для небронир. кабеля диаметром 6...12мм)"
										"K12 Латунь (для бронир. кабеля диаметром 12,5...20,9 мм, для Exd)"
										"K14 Латунь (для бронир. кабеля диаметром 9,5...15,9 мм, для Exd)"					
										"SC Вилка 2РМГ14, розетка 2РМ14"
										"SC1 Штепсельный разъем DIN");list
			
			list-10 (list "A 4...20 мА (HART)" 
										"B 0...5 мА");list
);setq
    
(if (and (= "150CD" str-02) 
				 (= "M5 ЖКИ с клавиатурой" str-11)
				 (= "Нет" str-12));and
	(progn
		(set_tile "txt-18-4" "0")
		(set_tile "txt-18-8" "0")
		(mode_tile "txt-18-1" 0)
		(mode_tile "txt-18-2" 0)
		(mode_tile "txt-18-3" 0)				
		(mode_tile "txt-18-4" 1)
		(mode_tile "txt-18-5" 0)
		(mode_tile "txt-18-6" 0)
		(mode_tile "txt-18-7" 0)				
		(mode_tile "txt-18-8" 1)
		(mode_tile "txt-18-9" 0)
	);progn
);=
		
		
(if (and (= "150CD" str-02) 
				 (= "M5 ЖКИ с клавиатурой" str-11)		
				 (= "IM 0ЕхiaIIСT5" str-12));and
	(progn
		(setq list-10 (list "A 4-20 мА (HART)"));setq
		(set_tile "txt-18-4" "0")
		
		(mode_tile "txt-18-1" 0)
		(mode_tile "txt-18-2" 0)
		(mode_tile "txt-18-3" 0)
		(mode_tile "txt-18-4" 1)
		(mode_tile "txt-18-5" 0)
		(mode_tile "txt-18-6" 0)
		(mode_tile "txt-18-7" 0)
		(mode_tile "txt-18-8" 0)
		(mode_tile "txt-18-9" 0)
	);progn
);if=

(if (and (= "150CD" str-02) 
				 (= "M5 ЖКИ с клавиатурой" str-11)
				 (or (= "EM 1ЕхdIIСТ6" str-12) (= "EM 1ЕхdIIСТ5" str-12)));and
	(progn 
		(setq list-19 (list "K01 Латунь, небронир. кабель диаметром 6,5...13,9 мм"
												"K02 Нерж. сталь, небронир. кабель диаметром 6,5...13,9 мм, ExdIIC"
												"K03 Латунь, небронир. кабель диаметром 6,1...11,6 мм, ExdIIC"
												"K04 Полиамид, небронир. кабель диаметром 6...12 мм"
												"K12 Латунь, бронир. кабель, диаметр кабеля 6,5...13,9 мм, диаметр брони 12,5...20,9 мм, ExdIIC"
												"K14 Латунь, бронир. кабель, диаметр кабеля 6,1...11,6 мм, диаметр брони 9,5...15,9 мм, ExdIIC")
		);setq
				
		(set_tile "txt-18-4" "0")
		(mode_tile "txt-18-1" 0)
		(mode_tile "txt-18-2" 0)
		(mode_tile "txt-18-3" 0)
		(mode_tile "txt-18-4" 1)
		(mode_tile "txt-18-5" 0)
		(mode_tile "txt-18-6" 0)
		(mode_tile "txt-18-7" 0)
		(mode_tile "txt-18-8" 0)
		(mode_tile "txt-18-9" 0)
	);progn
);if=




(list-filling "txt-10" list-10)
(list-filling "txt-19" list-19)

(set_tile "txt-10" "0")
(set_tile "txt-19" "0")

(princ)
)
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun txt-14-101-01-prs-sens-metran-150-diff
( / str-02 str-14)

(setq str-02 (nth (atoi (get_tile "txt-02")) list-02)
			str-14 (nth (atoi (get_tile "txt-14")) list-14)
);setq
    
(if (= "150CD" str-02)
	(cond
		((or (= "D5 Ниппель с гайкой М20х1,5 по наруж. диам. 14 мм" str-14) (= "D6 Ниппель по наруж. диам. 14 мм" str-14)) 
			(setq list-15 (list "2 Сталь 12Х10Н10T" "4 Углеродистая сталь" "5 Сталь 09T2C"))
		);=
		
		((and (/= "D5 Ниппель с гайкой М20х1,5 по наруж. диам. 14 мм" str-14) (/= "D6 Ниппель по наруж. диам. 14 мм" str-14)) 
			(setq list-15 (list "2 Сталь 12Х10Н10T"))
		);=
		
	);cond
);if

(list-filling "txt-15" list-15)

(set_tile "txt-15" "0")

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма формирования данных/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun but1-101-01-prs-sens-metran-150-diff

( / cntr-1 str-01 str-02 str-03 str-030 str-0300 str-0301 str-0302 str-0303 str-0304 str-0305 str-0306 str-0307 str-031 str-032 str-03-2 str-03-3 str-03-8 str-04 str-05 
str-051 str-052 str-06 str-061 str-062 str-07 str-071 str-072 str-08 str-081 str-082 str-09 str-091 str-092 str-10 str-101 str-10-1 str-102 str-10-2 str-11 str-111 str-112 
str-12 str-121 str-122 str-13 str-131 str-132 str-14 str-141 str-142 str-15 str-151 str-152 str-16 str-17 str-171 str-172 str-18-1 str-18-2 str-18-3 str-18-4 str-18-5 str-18-6 
str-18-7 str-18-8 str-18-9 str-18-list-901 str-19 str-191 str-192 tmp-list-902)

;заполняем поле "выбрано"
(setq cntr-1 0
);setq

(if (/= list-902 nil) (setq list-902 (reverse list-902)));if

;заполняем поле "выбрано"
(setq str-02 (nth (atoi (get_tile "txt-02")) list-02)
			
			;пределы изм. датчика
			str-03 (nth (atoi (get_tile "txt-03")) list-03)
			str-031 (substr str-03 1 1)			
			str-032 (substr str-03 (+ (vl-string-search " " str-03) 2))
			
			
			str-03-0 (nth (atoi (get_tile "txt-03-0")) list-03-0)
			str-03-1 (get_tile "txt-03-1")
			str-03-2 (get_tile "txt-03-2")
			str-03-3 (get_tile "txt-03-3")
			str-03-4 (get_tile "txt-03-4")
			str-03-5 (get_tile "txt-03-5")
			str-03-6 (get_tile "txt-03-6")
			str-03-7 (get_tile "txt-03-7")
			
			str-04 (nth (atoi (get_tile "txt-04")) list-04)
			
			str-05 (nth (atoi (get_tile "txt-05")) list-05)
			str-051 (substr str-05 1 (vl-string-search " " str-05))
			str-052 (substr str-05 (+ (vl-string-search " " str-05) 2))
			
			str-06 (nth (atoi (get_tile "txt-06")) list-06)
			str-061 (substr str-06 1 (vl-string-search " " str-06))
			str-062 (substr str-06 (+ (vl-string-search " " str-06) 2))
			
			str-07 (nth (atoi (get_tile "txt-07")) list-07)
			str-071 (substr str-07 1 (vl-string-search " " str-07))
			str-072 (substr str-07 (+ (vl-string-search " " str-07) 2))
			
			str-08 (nth (atoi (get_tile "txt-08")) list-08)
			str-081 (substr str-08 1 (vl-string-search " " str-08))
			str-082 (substr str-08 (+ (vl-string-search " " str-08) 2))
			
			str-09 (nth (atoi (get_tile "txt-09")) list-09)
			str-091 (substr str-09 1 (vl-string-search " " str-09))
			str-092 (substr str-09 (+ (vl-string-search " " str-09) 2))
			
			str-10 (nth (atoi (get_tile "txt-10")) list-10)
			str-10-1 (get_tile "txt-10-1")
			str-10-2 (get_tile "txt-10-2")
			str-101 (substr str-10 1 (vl-string-search " " str-10))
			
			str-11 (nth (atoi (get_tile "txt-11")) list-11)
			str-111 (substr str-11 1 (vl-string-search " " str-11))
			str-112 (substr str-11 (+ (vl-string-search " " str-11) 2))
			
			str-12 (nth (atoi (get_tile "txt-12")) list-12)
			
			str-13 (nth (atoi (get_tile "txt-13")) list-13)
			str-131 (substr str-13 1 (vl-string-search " " str-13))
						
			str-14 (nth (atoi (get_tile "txt-14")) list-14)
			str-141 (substr str-14 1 (vl-string-search " " str-14))
			str-142 (substr str-14 (+ (vl-string-search " " str-14) 2))
			
			str-15 (nth (atoi (get_tile "txt-15")) list-15)
			str-151 (substr str-15 1 (vl-string-search " " str-15))
			str-152 (substr str-15 (+ (vl-string-search " " str-15) 2))
			
			str-16 (nth (atoi (get_tile "txt-16")) list-16)
			
			str-17 (nth (atoi (get_tile "txt-17")) list-17)
			str-171 (substr str-17 1 (vl-string-search " " str-17))
			str-172 (substr str-17 (+ (vl-string-search " " str-17) 2))
			
			str-18-list-901 ""
			str-18-1 (get_tile "txt-18-1")
			str-18-2 (get_tile "txt-18-2")
			str-18-3 (get_tile "txt-18-3")
			str-18-4 (get_tile "txt-18-4")
			str-18-5 (get_tile "txt-18-5")
			str-18-6 (get_tile "txt-18-6")
			str-18-7 (get_tile "txt-18-7")
			str-18-8 (get_tile "txt-18-8")
			str-18-9 (get_tile "txt-18-9")
			
			str-19 (nth (atoi (get_tile "txt-19")) list-19)
			str-191 (substr str-19 1 (vl-string-search " " str-19))
			str-192 (substr str-19 (+ (vl-string-search " " str-19) 2))
);setq





;выходной сигнал для окна диалога
(cond
	((and (= str-10 "A 4...20 мА (HART)") (= str-10-1 "0") (= str-10-2 "0")) (setq str-102 "4...20 мА (HART)"));=
	((and (= str-10 "A 4...20 мА (HART)") (= str-10-1 "1") (= str-10-2 "0")) (setq str-102 "20...4 мА (HART)"));=
	((and (= str-10 "A 4...20 мА (HART)") (= str-10-1 "0") (= str-10-2 "1")) (setq str-102 "4...20 мА (HART, кв. корень)"));=
	((and (= str-10 "A 4...20 мА (HART)") (= str-10-1 "1") (= str-10-2 "1")) (setq str-102 "20...4 мА (HART, кв. корень)"));=
		
	((and (= str-10 "B 0...5 мА") (= str-10-1 "0") (= str-10-2 "0")) (setq str-102 "0...5 мА"));=
	((and (= str-10 "B 0...5 мА") (= str-10-1 "1") (= str-10-2 "0")) (setq str-102 "5...0 мА"));=
	((and (= str-10 "B 0...5 мА") (= str-10-1 "0") (= str-10-2 "1")) (setq str-102 "0...5 мА (кв. корень)"));=
	((and (= str-10 "B 0...5 мА") (= str-10-1 "1") (= str-10-2 "1")) (setq str-102 "5...0 мА (кв. корень)"));=
);cond

;взрывозащита
(cond
	((= "IP65 по ГОСТ 14254" str-12) (setq str-121 "" str-122 "IP65 по ГОСТ 14254"));=
	((setq str-121 (substr str-12 1 (vl-string-search " " str-12))
				 str-122 (substr str-12 (+ (vl-string-search " " str-12) 2))
	);setq
	);=
);cond

(if (= "1" str-18-1) (setq str-18-1 "LT" str-18-list-901 "LT "));if
(if (= "1" str-18-2) (setq str-18-2 "Q4" str-18-list-901 (strcat str-18-list-901 "Q4 ")));if
(if (= "1" str-18-3) (setq str-18-3 "C1" str-18-list-901 (strcat str-18-list-901 "C1 ")));if
(if (= "1" str-18-4) (setq str-18-4 "HP" str-18-list-901 (strcat str-18-list-901 "HP ")));if
(if (= "1" str-18-5) (setq str-18-5 "PA" str-18-list-901 (strcat str-18-list-901 "PA ")));if
(if (= "1" str-18-6) (setq str-18-6 "ML" str-18-list-901 (strcat str-18-list-901 "ML ")));if
(if (= "1" str-18-7) (setq str-18-7 "J5" str-18-list-901 (strcat str-18-list-901 "J5 ")));if
(if (= "1" str-18-8) (setq str-18-8 "AR" str-18-list-901 (strcat str-18-list-901 "AR ")));if
(if (= "1" str-18-9) (setq str-18-9 "T1" str-18-list-901 (strcat str-18-list-901 "T1 ")));if

;определяем погрешность
(if (and (= "PA" str-18-5) (= "150CD" str-02)) 
	(setq str-03-8 "0,2")
);if

(if (and (= "0" str-18-5) (= "150CD" str-02))
 (cond
 	((= "0,025...0,63" str-032) 
 		(setq str-03-8 "0,1")
 	);=
 	
 	((= "0,25...6,3" str-032) 
 		(setq str-03-8 "0,1")
 	);=
 	
 	((or (= "1,25...63" str-032) (= "5...250" str-032) (= "32...1600" str-032) (= "200...10000" str-032)) 
 		(setq str-03-8 "0,075")
 	);=
 );cond
);if

(cond 
	((= str-18-list-901 "") (setq str-18-list-901 "Нет"));=
	((/= str-18-list-901 "") (setq str-18-list-901 (vl-string-right-trim " " str-18-list-901)));=
);cond

(if (= "150CD" str-02)
	(setq str-01 "Датчик разности давлений"
				list-901 (vl-list* (strcat str-02 "  " 
																	 str-032 "кПа  "
																 	 "Матер. " str-051 "  "
																 	 "Мембр. " str-061 "  "
																 	 "Упл. кольца " str-071 "  "
																 	 "Жидк. " str-081 "  "
																 	 str-091 "  "
																 	 str-101 "  "
																 	 (substr str-11 1 (vl-string-search " " str-11)) "  " 
																 	 "Взрывозащ. " (substr str-12 1 (vl-string-search " " str-12)) "  "
																 	 "Кл. блок " (substr str-13 1 (vl-string-search " " str-13)) "  "
																 	 "Монт. части " (substr str-14 1 (vl-string-search " " str-14)) "  "
																 	 "Матер. " (substr str-15 1 (vl-string-search " " str-15)) "  "
																 	 "Флан. " (substr str-16 1 (vl-string-search " " str-16)) "  "
																 	 "Кроншт. " (substr str-17 1 (vl-string-search " " str-17)) "  "
																 	 "Спец. опц. " str-18-list-901 "  "
																 	 "Каб. ввод " (substr str-19 1 (vl-string-search " " str-19)) "  "
																 	 ) list-901)
	);setq
);if

(setq tmp-list-902 (list (cons 1 str-01) 
												 (cons 2 str-02) 
												 (cons 31 str-031) 
												 (cons 32 str-032)
												 
												 (cons 300 str-03-0)
												 (cons 301 (strcat str-03-1 "..." str-03-2)) 
												 (cons 303 str-03-3)
												 (cons 304 (strcat str-03-4 "..." str-03-5))
												 (cons 306 (strcat str-03-6 "..." str-03-7))
												 
												 (cons 38 str-03-8);погрешность
												 (cons 51 str-051) 
												 (cons 52 str-052)
												 (cons 61 str-061) 
												 (cons 62 str-062)
												 (cons 71 str-071) 
												 (cons 72 str-072)
												 (cons 81 str-081) 
												 (cons 82 str-082)
												 (cons 91 str-091) 
												 (cons 92 str-092)
												 (cons 101 str-101) 
												 (cons 102 str-102)
												 (cons 111 str-111) 
												 (cons 112 str-112)
												 (cons 121 str-121) 
												 (cons 122 str-122)
												 (cons 131 str-131)
												 (cons 141 str-141) 
												 (cons 142 str-142)
												 (cons 151 str-151) 
												 (cons 152 str-152)
												 (cons 16 str-16)					 											
												 (cons 171 str-171) 
												 (cons 172 str-172)
												 
												 (cons 181 str-18-1)
												 (cons 182 str-18-2)
												 (cons 183 str-18-3)
												 (cons 184 str-18-4)
												 (cons 185 str-18-5)
												 (cons 186 str-18-6)
												 (cons 187 str-18-7)
												 (cons 188 str-18-8)
												 (cons 189 str-18-9)
												 (cons 19 (substr str-19 1 (vl-string-search " " str-19)))
									 			 (cons 99 "3,1"));list
			list-902 (vl-list*  tmp-list-902 list-902)
);setq

(if (/= list-902 nil) (setq list-902 (reverse list-902)));if

(list-filling "txt-901" (reverse list-901))

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в ПЭ                   //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun le-101-01-prs-sens-metran-150-diff

( / cntr-1 pnt-ins str-01 str-02 str-102 str-112 str-121 str-122 str-32 str-701 str-702 str-tmp)

(setq cntr-1 0);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-01 (cdr (assoc 1 str-tmp))
				str-02 (cdr (assoc 2 str-tmp))
				str-32 (cdr (assoc 32 str-tmp))
				str-102 (cdr (assoc 102 str-tmp))
				str-112 (cdr (assoc 112 str-tmp))
				str-121 (cdr (assoc 121 str-tmp))
				str-122 (cdr (assoc 122 str-tmp))
	);setq

	(cond
		((= str-121 "") (setq str-122 "исп. IP65 по ГОСТ 14254"));=
		((= str-121 "UC") (setq str-122 "исп. для раб. с кислородом"));=
		((setq str-122 (strcat "маркировка взрывозащиты " str-122)));=
	);cond

	(setvar "osmode" 6199)
	
	(setq pnt-ins (getpoint "\nУкажите точку вставки\n"));setq

	(if (= "150CD" str-02)
		(setq str-701 (strcat str-01 " Метран-"  str-02 ", фланцевое исп., пределы изм. " str-32 "кПа, вых. сигнал " 
													str-102 ", " str-112 ", " str-122)
					str-702 nil
		);setq
	);if
	
	(split-str-parts-le-01-general str-701 str-702 pnt-ins);
	
	(setq cntr-1 (1+ cntr-1));setq
);repeat

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в СПЦФ                 //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun spcf-101-01-prs-sens-metran-150-diff

( / cntr-1 pnt-ins str-01 str-02 str-101 str-102 str-111 str-112 str-121 str-122 str-131 str-141 str-142 str-151 str-152 str-171 str-172 str-181 str-182 str-183 str-184 str-185 
str-186 str-187 str-188 str-189 str-19 str-191 str-300 str-301 str-302 str-303 str-304 str-306 str-31 str-32 str-38 str-51 str-52 str-61 str-62 str-701 str-702 str-71 str-72 
str-81 str-82 str-91 str-92 str-99 str-manufact str-note str-order str-tmp str-unit)

(setq cntr-1 0);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-01 (cdr (assoc 1 str-tmp))
				str-02 (cdr (assoc 2 str-tmp))
				
				str-31 (cdr (assoc 31 str-tmp))
				str-32 (cdr (assoc 32 str-tmp))
				
				str-300 (cdr (assoc 300 str-tmp))
				str-300 (strcase str-300 1)				
				str-301 (cdr (assoc 301 str-tmp))				
				str-303 (cdr (assoc 303 str-tmp))
				str-304 (cdr (assoc 304 str-tmp))
				str-306 (cdr (assoc 306 str-tmp))
				
				str-38 (cdr (assoc 38 str-tmp))
				str-51 (cdr (assoc 51 str-tmp))
				str-52 (cdr (assoc 52 str-tmp))
				str-61 (cdr (assoc 61 str-tmp))
				str-62 (cdr (assoc 62 str-tmp))
				str-71 (cdr (assoc 71 str-tmp))
				str-72 (cdr (assoc 72 str-tmp))
				str-81 (cdr (assoc 81 str-tmp))
				str-82 (cdr (assoc 82 str-tmp))
				str-91 (cdr (assoc 91 str-tmp))
				str-92 (cdr (assoc 92 str-tmp))
				
				str-101 (cdr (assoc 101 str-tmp))
				str-102 (cdr (assoc 102 str-tmp))
				str-111 (cdr (assoc 111 str-tmp))
				str-112 (cdr (assoc 112 str-tmp))
				
				str-121 (cdr (assoc 121 str-tmp))
				str-122 (cdr (assoc 122 str-tmp))
				
				str-131 (cdr (assoc 131 str-tmp))
				
				str-141 (cdr (assoc 141 str-tmp))
				str-142 (cdr (assoc 142 str-tmp))
				
				str-151 (cdr (assoc 151 str-tmp))
				str-152 (cdr (assoc 152 str-tmp))
				
				str-171 (cdr (assoc 171 str-tmp))
				str-172 (cdr (assoc 172 str-tmp))
				
				str-181 (cdr (assoc 181 str-tmp))
				str-182 (cdr (assoc 182 str-tmp))
				str-183 (cdr (assoc 183 str-tmp))
				str-184 (cdr (assoc 184 str-tmp))
				str-185 (cdr (assoc 185 str-tmp))
				str-186 (cdr (assoc 186 str-tmp))
				str-187 (cdr (assoc 187 str-tmp))
				str-188 (cdr (assoc 188 str-tmp))
				str-189 (cdr (assoc 189 str-tmp))
				str-19 (cdr (assoc 19 str-tmp))				
				str-99 (cdr (assoc 99 str-tmp))
	);setq
(princ "\n         str-tmp = ") (princ str-tmp);Erase_DV
(getstring "\nPress Enter to continue...");Erase_DV
 
	(if (or (= str-301 "...") (= str-302 "") (= str-303 "") (= str-304 "+...+") (= str-306 "+...+"))
		(progn
			(alert "Некоторые поля не заданы!!!")
			(if (= str-301 "...") (setq str-301 "***...***"));if
			
			
			(if (= str-303 "") (setq str-303 "***"));if
			(if (= str-304 "+...+") (setq str-304 "+***...+***"));if
			(if (= str-306 "+...+") (setq str-306 "+***...+***"));if
		);progn
	);if
	
	(setq str-52 (vl-string-subst "нерж." "Нерж." str-52)
				str-62 (vl-string-subst "нерж." "Нерж." str-62)
				str-72 (vl-string-subst "резина" "Резина" str-72)
				str-92 (vl-string-subst "сталь" "Сталь" str-92)
	);setq


	;обрабатываем спецопции
	(if (= str-181 "0") (setq str-181 ""));if
	(if (= str-182 "0") (setq str-182 ""));if
	(if (= str-183 "0") (setq str-183 ""));if
	(if (= str-184 "0") (setq str-184 ""));if
	(if (= str-185 "0") (setq str-185 ""));if
	(if (= str-186 "0") (setq str-186 ""));if
	(if (= str-187 "0") (setq str-187 ""));if
	(if (= str-188 "0") (setq str-188 ""));if
	(if (= str-189 "0") (setq str-189 ""));if

	;кабельный ввод
	(cond
		((= str-19 "Нет") (setq str-191 "не требуется"));=
		((= str-19 "SC") (setq str-191 "вилка 2РМГ14, розетка 2РМ14"));=
		((= str-19 "SC1") (setq str-191 "штепсельный разъем DIN"));=
		((= str-19 "SC2") (setq str-191 "вилка 2РМ22, розетка 2РМ22"));=
		((= str-19 "K01") (setq str-191 "латунь (для небронир. кабеля диам. до 13,9мм)"));=
		((= str-19 "K02") (setq str-191 "нержавеющая сталь (для небронир. кабеля диам. до 13,9мм, для Exd)"));=
		((= str-19 "K03") (setq str-191 "латунь (для небронир. кабеля диам. до 11,6мм, для Exd)"));=
		((= str-19 "K04") (setq str-191 "полиамид (для небронир. кабеля диам. до 12мм)"));=
		((= str-19 "K12") (setq str-191 "латунь (для бронир. кабеля диаметром до 20,9мм, для Exd)"));=
		((= str-19 "K14") (setq str-191 "латунь (для бронир. кабеля диаметром до 15,9мм, для Exd)"));=
	);cond
		
	(setvar "osmode" 6199)
	
	(setq pnt-ins (getpoint "\nУкажите точку вставки\n"));setq

	;/////////////////////////////////////////////////////////////////////////////////////////////////
	(if (= str-02 "150CD")
		(progn
			(setq str-unit "шт."
						str-manufact "ПГ \"Метран\", г. Челябинск"
						
						str-note "Свид. об утв. типа СИ №53672/1" ;;;;;;; примечание, текстовая строка
			
						str-701 str-01
						
						str-702 (list (cons 1 (strcat "изм. среда " str-300 ", диапазон изменений среды " str-301 "кПа"))
													(cons 2 (strcat "температура изм. среды " str-304 "%%dС"))
													(cons 3 (strcat "рабочее изб. давление " str-303 "МПа"))													
													(cons 4 (strcat "температура окр. среды " str-306 "%%dС"))
													(cons 5 (strcat "пределы изм. датчика" str-32 "кПа"))
													(cons 6 (strcat "предел осн. приведенной погр. " str-38 "%"))
													(cons 7 (strcat "материал деталей, конт. со средой " str-52))
													(cons 8 (strcat "материал мембраны " str-62))
													(cons 9 (strcat "материал уплотн. колец " str-72))
													(cons 10 (strcat "заполняющая жидкость " (strcase str-82 1)))
													(cons 11 (strcat "матерал крепеж. деталей " str-92))
													(cons 12 (strcat "вых. сигнал " str-102))
													(cons 13 str-112));list
			);setq
			





		;исп датчика
		(setq str-tmp (list (cons 14 str-122))
					str-702 (append str-702 str-tmp)
		);setq
			
		;клапанный блок
		(if (= str-131 "S5")
			(setq str-tmp (list (cons 15 "со встроенным клапанным блоком"))
						str-702 (append str-702 str-tmp)
			);setq
		);if
			
		;присоединение к процессу 
		(setq str-142 (vl-string-subst "ниппель" "Ниппель" str-142)
					str-142 (vl-string-subst "фланец" "фланец" str-142)
					
					str-tmp (list (cons 16 str-142))
					str-702 (append str-702 str-tmp)
		);setq

		;материал монтажн. деталей
		(setq str-152 (vl-string-subst "сталь" "Сталь" str-152)
										
					str-tmp (list (cons 17 (strcat "материал крепежн. деталей " str-152)))
					str-702 (append str-702 str-tmp)
		);setq

		;монтажный кронштейн
		(if (/= str-171 "В1") 
			(setq str-172 (vl-string-subst "на" "На" str-172)
						
						str-tmp (list (cons 18 (strcat "крепление " str-172)))
						str-702 (append str-702 str-tmp)
			);setq
		);if

		;печатаем кабельный ввод
		(setq str-tmp (list (cons 19 (strcat "кабельный ввод " str-191)))
					str-702 (append str-702 str-tmp)
		);setq


;			(setq str-tmp (list (cons 10 (strcat "исполнение датчика " str-12-1)))
;						str-702 (append str-702 str-tmp)
;			);setq
;			
;			;индикация, клапанный блок
;			(setq str-tmp (list (cons 11 (strcat str-11-1 ", " str-13-1)))
;						str-702 (append str-702 str-tmp)
;			);setq
;			
;			;фланцы уровня
;			(if (/= str-16-1 "Нет") 
;				(setq str-tmp (list (cons 12 (strcat "фланец уровня " str-16-1)))
;							str-702 (append str-702 str-tmp)
;				);setq
;			);if
;				
			
			(setq str-order (strcat "Метран-" str-02 str-31 "-(" str-32 "кПа)-" str-51 "-" str-61 "-" str-71 "-" str-81 "-" str-91 "-" 
																				str-101 "-" str-111 "-" str-131 "-" str-141 "-" str-151 "-" str-171 "-" str-181 "-" 
																				str-182 "-" str-183 "-" str-184 "-" str-185 "-" str-186 "-" str-187 "-" str-188 "-" 
																				str-189 "-" str-19)
			);setq
			
			(repeat 18
				(setq str-order (vl-string-subst "-" "--" str-order));setq
			);repeat
		
			(setq str-order (list (cons 1 str-order) 
														(cons 2 "-") 
														(cons 3 "ТУ 4212-022-51453097-2006") ;;;  здесь обозначение ТУ или НТД
											);list
			);setq
		);progn
	);if
;	
;	(princ "\n       str-order = ") (princ str-order);Erase_DV
;(getstring "\nPress Enter to continue...");Erase_DV
;	
	
	(split-str-parts-spcf-01-general str-701 str-702 str-order str-manufact str-unit str-99 str-note pnt-ins);

	(setq cntr-1 (+ cntr-1 1));setq
);repeat

(princ)
)
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
