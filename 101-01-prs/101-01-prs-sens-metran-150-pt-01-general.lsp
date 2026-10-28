;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////                                                              ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun 101-01-prs-sens-metran-150-pt-01-general

( / adoc dcl-id list-001 list-010 list-020 list-030 list-040 list-050 list-060 list-080 list-090 list-100 list-110 list-120 list-130 list-220 list-901 list-902 type-list)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(setvar "cmdecho" 0)
(setvar "textstyle" "Standard")

(setq list-001 (list "Вода" "Пар перегретый" "Пар насыщенный" "Газ природный" "Воздух" "Этиленгликоль")
      list-010 (list "150TG")
      list-901 nil
      list-902 nil
);setq

(txt-010-101-01-prs-sens-metran-150-pt)

(if (< (setq dcl-id (load_dialog "dia-101-01-prs-sens-metran-150-pt.dcl")) 0) ;ищем диалог
		(progn
			(alert "Не найден dcl-файл")
			(exit)
		);progn
);if

(if (not (new_dialog "dia_101_metran_150_pt" dcl-id))
		(exit)
);if

(list-filling "txt-001" list-001)
(list-filling "txt-010" list-010)
(list-filling "txt-020" list-020)
(list-filling "txt-030" list-030)
(list-filling "txt-040" list-040)
(list-filling "txt-050" list-050)
(list-filling "txt-060" list-060)

(list-filling "txt-080" list-080)
(list-filling "txt-090" list-090)
(list-filling "txt-100" list-100)
(list-filling "txt-110" list-110)
(list-filling "txt-120" list-120)
(list-filling "txt-130" list-130)
(list-filling "txt-220" list-220)

(set_tile "txt-001" "0")
(set_tile "txt-010" "0")
(set_tile "txt-020" "0")
(set_tile "txt-030" "0")
(set_tile "txt-040" "0")
(set_tile "txt-050" "0")
(set_tile "txt-060" "0")
(set_tile "txt-080" "0")
(set_tile "txt-090" "0")
(set_tile "txt-100" "0")
(set_tile "txt-110" "0")
(set_tile "txt-120" "0")
(set_tile "txt-130" "0")
(set_tile "txt-220" "0")

(action_tile "txt-010"
  (strcat "(txt-010-101-01-prs-sens-metran-150-pt)");strcat
);action_tile

(action_tile "txt-030"
  (strcat "(txt-030-101-01-prs-sens-metran-150-pt)");strcat
);action_tile

(action_tile "txt-090"
  (strcat "(txt-090-101-01-prs-sens-metran-150-pt)");strcat
);action_tile

(action_tile "txt-110"
  (strcat "(txt-110-101-01-prs-sens-metran-150-pt)");strcat
);action_tile

(action_tile "but1"
  (strcat "(but1-101-01-prs-sens-metran-150-pt)");srcat
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

(if (= type-list "le") (le-101-01-prs-sens-metran-150-pt));if

(if (= type-list "spcf") (spcf-101-01-prs-sens-metran-150-pt));if

(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(vla-endundomark adoc)
(princ)
)
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun txt-010-101-01-prs-sens-metran-150-pt
( / str-010)

(if (= nil str-010) 
	(setq str-010 "150TG")
	(setq str-010 (nth (atoi (get_tile "txt-010")) list-010));setq
);if

(if (= "150TG" str-010)
	(progn
		(setq list-020 (list "3,2...160 (0,0032...0,16)" "20...1000 (0,02...1)" "120...6000 (0,12...6)" "500...25000 (0,5...25)" "1600...60000 (16...60)")
					list-030 (list "2G М20х1,5" "2B 1/2NРT внутр.")
					list-040 (list "2 Нерж. сталь 316, Нерж. сталь 316" "3 Hastelloy, Hastelloy")
					list-050 (list "1 Силиконовое масло") ; "2 Инертный наполнит."
					list-060 (list "A 4-20 мА, HART" "B 0-5 мА")
					list-080 (list "M5 ЖКИ с клавиатурой")
					list-090 (list "Нет" "IM 0ЕхiaIIСT5" "EM 1ЕхdIIСТ6, 1ЕхdIIСТ5")
					list-100 (list "Нет" "S5 Да")
					list-110 (list "2F Ниппель с гайкой М20х1,5"
												 "2A Переходник с резьбой 1/4NРT внутр."
												 "2D Переходник с резьбой 1/4NРT наружн."
												 "2E Переходник с резьбой 1/2NРT наружн.")
					
					list-120 (list "2 Сталь 12Х10Н10T" "4 Углеродистая сталь" "5 Сталь 09Г2C")
					
					list-130 (list "Нет" "B4 На трубе диам. 50...60" "B1 На панели")	
					
					list-220 (list "K01 Латунь (для небронир. кабеля диаметром 6,5...13,9мм)"
												 "K02 Нерж. сталь (для небронир. кабеля диаметром 6,5...13,9мм, для Exd)"
												 "K03 Латунь (для небронир. кабеля диаметром 6,1...11,6мм, для Exd)"
												 "K04 Полиамид (для небронир. кабеля диаметром 6...12мм)"
												 "K12 Латунь (для бронир. кабеля диаметром 12,5...20,9 мм, для Exd)"
												 "K14 Латунь (для бронир. кабеля диаметром 9,5...15,9 мм, для Exd)"					
												 "SC Вилка 2РМГ14, розетка 2РМ14"
												 "SC1 Штепсельный разъем DIN"
												 "SC2 Вилка 2РМ22, розетка 2РМ22")
		);setq
		
		(set_tile "txt-200" "0")
		(set_tile "txt-210" "0")
		(mode_tile "txt-140" 0)
		(mode_tile "txt-150" 0)
		(mode_tile "txt-160" 0)
		(mode_tile "txt-170" 0)
		(mode_tile "txt-180" 0)
		(mode_tile "txt-190" 0)
		(mode_tile "txt-200" 1)
		(mode_tile "txt-210" 1)
	);progn
);if

(list-filling "txt-001" list-001)
(list-filling "txt-010" list-010)
(list-filling "txt-020" list-020)
(list-filling "txt-030" list-030)
(list-filling "txt-040" list-040)
(list-filling "txt-050" list-050)
(list-filling "txt-060" list-060)

(list-filling "txt-080" list-080)
(list-filling "txt-090" list-090)
(list-filling "txt-100" list-100)
(list-filling "txt-110" list-110)
(list-filling "txt-120" list-120)
(list-filling "txt-130" list-130)
(list-filling "txt-220" list-220)

(set_tile "txt-001" "0")
(set_tile "txt-010" "0")
(set_tile "txt-020" "0")
(set_tile "txt-030" "0")
(set_tile "txt-040" "0")
(set_tile "txt-050" "0")
(set_tile "txt-060" "0")
(set_tile "txt-080" "0")
(set_tile "txt-090" "0")
(set_tile "txt-100" "0")
(set_tile "txt-110" "0")
(set_tile "txt-120" "0")
(set_tile "txt-130" "0")
(set_tile "txt-220" "0")

(princ)
)
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun txt-030-101-01-prs-sens-metran-150-pt
( / str-030)

(setq str-030 (nth (atoi (get_tile "txt-030")) list-030)
);setq
    
(cond
	((= "2G М20х1,5" str-030) 
		(setq list-110 (list "2F Ниппель с гайкой М20х1,5"
												 "2A Переходник с резьбой 1/4NРT внутр."
												 "2D Переходник с резьбой 1/4NРT наружн."
												 "2E Переходник с резьбой 1/2NРT наружн.")
					list-120 (list "2 Сталь 12Х10Н10T" "4 Углеродистая сталь" "5 Сталь 09Г2C")
	));=
		
	((/= "2G М20х1,5" str-030) 
		(setq list-110 (list "Нет")
					list-120 (list "Нет")
	));=
);cond

(list-filling "txt-110" list-110)
(list-filling "txt-120" list-120)

(set_tile "txt-110" "0")
(set_tile "txt-120" "0")

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun txt-090-101-01-prs-sens-metran-150-pt
( / str-010 str-080 str-090)

(setq str-010 (nth (atoi (get_tile "txt-010")) list-010)
			str-080 (nth (atoi (get_tile "txt-080")) list-080)
			str-090 (nth (atoi (get_tile "txt-090")) list-090)
);setq

(setq list-060 (list "A 4-20 мА, HART" "B 0-5 мА")

			list-220 (list "K01 Латунь (для небронир. кабеля диаметром 6,5...13,9мм)"
										 "K02 Нерж. сталь (для небронир. кабеля диаметром 6,5...13,9мм, для Exd)"
										 "K03 Латунь (для небронир. кабеля диаметром 6,1...11,6мм, для Exd)"
										 "K04 Полиамид (для небронир. кабеля диаметром 6...12мм)"
										 "K12 Латунь (для бронир. кабеля диаметром 12,5...20,9 мм, для Exd)"
										 "K14 Латунь (для бронир. кабеля диаметром 9,5...15,9 мм, для Exd)"
										 "SC Вилка 2РМГ14, розетка 2РМ14"
										 "SC1 Штепсельный разъем DIN"
										 "SC2 Вилка 2РМ22, розетка 2РМ22")
);setq

(if (and (= "150TG" str-010) (= "M5 ЖКИ с клавиатурой" str-080))
	(cond
		((= "Нет" str-090)
			(progn			
				(set_tile "txt-200" "0")
				(set_tile "txt-210" "0")
				(mode_tile "txt-140" 0)
				(mode_tile "txt-150" 0)
				(mode_tile "txt-160" 0)
				(mode_tile "txt-170" 0)
				(mode_tile "txt-180" 0)
				(mode_tile "txt-190" 0)
				(mode_tile "txt-200" 1)
				(mode_tile "txt-210" 1)
				(mode_tile "txt-220" 0)
			);progn
		);=
		
		((or (= "IM 0ЕхiaIIСT5" str-090) 
				 (= "EM 1ЕхdIIСТ6, 1ЕхdIIСТ5" str-090));or
			(progn
				(set_tile "txt-200" "0")
				(set_tile "txt-210" "0")
				(mode_tile "txt-140" 0)
				(mode_tile "txt-150" 0)
				(mode_tile "txt-160" 0)
				(mode_tile "txt-170" 0)
				(mode_tile "txt-180" 0)
				(mode_tile "txt-190" 0)
				(mode_tile "txt-200" 0)
				(mode_tile "txt-210" 1)
			);progn
		);=
	);cond
);if


(if (and (= "150TG" str-010) (= "M5 ЖКИ с клавиатурой" str-080))
	(if (= "IM 0ЕхiaIIСT5" str-090)
			(setq list-060 (list "A 4-20 мА, HART"));setq
	);if
);if

(if (and (= "150TG" str-010) (= "M5 ЖКИ с клавиатурой" str-080))
	(if (= "EM 1ЕхdIIСТ6, 1ЕхdIIСТ5" str-090)
		(setq list-220 (list "K01 Латунь (для небронир. кабеля диаметром 6,5...13,9мм)"
										 		 "K02 Нерж. сталь (для небронир. кабеля диаметром 6,5...13,9мм, для Exd)"
										     "K03 Латунь (для небронир. кабеля диаметром 6,1...11,6мм, для Exd)"
										     "K04 Полиамид (для небронир. кабеля диаметром 6...12мм)"
										     "K12 Латунь (для бронир. кабеля диаметром 12,5...20,9 мм, для Exd)"
										     "K14 Латунь (для бронир. кабеля диаметром 9,5...15,9 мм, для Exd)")
		);setq
	);if
);if

(list-filling "txt-060" list-060)
(list-filling "txt-220" list-220)

(set_tile "txt-060" "0")
(set_tile "txt-220" "0")

(princ)
)
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun txt-110-101-01-prs-sens-metran-150-pt
( / str-110)

(setq str-110 (nth (atoi (get_tile "txt-110")) list-110));setq
    
(cond
	((= "2F Ниппель с гайкой М20х1,5" str-110) (setq list-120 (list "2 Сталь 12Х10Н10T" "4 Углеродистая сталь" "5 Сталь 09Г2C")));=
	((/= "2F Ниппель с гайкой М20х1,5" str-110) (setq list-120 (list "2 Сталь 12Х10Н10T")));=
);cond

(list-filling "txt-120" list-120)

(set_tile "txt-120" "0")

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма формирования данных/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun but1-101-01-prs-sens-metran-150-pt

( / list-903 str-001 str-002 str-004 str-006 str-010 str-020 str-03 str-030 str-040 str-050 str-060 str-063 str-070 str-080 str-090 str-100 str-110 str-120 str-130 str-140 
str-150 str-160 str-170 str-180 str-190 str-200 str-210 str-220 str-230 str-240 str-250 str-260 str-270 str-280 str-290 str-300 str-310 str-320 swtch tmp-list-902)


;заполняем поле "выбрано"
(setq swtch list-901);setq

 (if (/= swtch nil) (setq list-902 (reverse list-902)));if

;считываем значения из полей диалога
(setq str-001 (nth (atoi (get_tile "txt-001")) list-001)
			str-002 (strcat (get_tile "txt-002") "..." (get_tile "txt-003")) ;диапазон измерения
			str-004 (strcat (get_tile "txt-004") "..." (get_tile "txt-005")) ;температура среды
			str-006 (strcat (get_tile "txt-006") "..." (get_tile "txt-007")) ;температура окружающей среды
			
			str-010 (nth (atoi (get_tile "txt-010")) list-010)
			str-020 (nth (atoi (get_tile "txt-020")) list-020)
			str-030 (nth (atoi (get_tile "txt-030")) list-030)
			str-040 (nth (atoi (get_tile "txt-040")) list-040)
			str-050 (nth (atoi (get_tile "txt-050")) list-050)
			str-060 (nth (atoi (get_tile "txt-060")) list-060)
			str-070 (get_tile "txt-070")
			str-080 (nth (atoi (get_tile "txt-080")) list-080)
			str-090 (nth (atoi (get_tile "txt-090")) list-090)
			str-100 (nth (atoi (get_tile "txt-100")) list-100)
			str-110 (nth (atoi (get_tile "txt-110")) list-110)
			str-120 (nth (atoi (get_tile "txt-120")) list-120)
			str-130 (nth (atoi (get_tile "txt-130")) list-130)
			str-140 (get_tile "txt-140")
			str-150 (get_tile "txt-150")
			str-160 (get_tile "txt-160")
			str-170 (get_tile "txt-170")
			str-180 (get_tile "txt-180")
			str-190 (get_tile "txt-190")
			str-200 (get_tile "txt-200")
			str-210 (get_tile "txt-210")
			str-220 (nth (atoi (get_tile "txt-220")) list-220)
			list-903 ""
);setq

;выходной сигнал для окна диалога
(cond
	((and (= str-060 "A 4-20 мА, HART") (= str-070 "0")) (setq str-063 "4-20 мА, HART"));=
	((and (= str-060 "A 4-20 мА, HART") (= str-070 "1")) (setq str-063 "20-4 мА, HART"));=
		
	((and (= str-060 "B 0-5 мА") (= str-070 "0")) (setq str-063 "0-5 мА"));=
	((and (= str-060 "B 0-5 мА") (= str-070 "1")) (setq str-063 "5-0 мА"));=
);cond

(if (= "1" str-140) (setq str-140 "LT" list-903 "LT "));if
(if (= "1" str-150) (setq str-150 "Q4" list-903 (strcat list-903 "Q4 ")));if
(if (= "1" str-160) (setq str-160 "C1" list-903 (strcat list-903 "C1 ")));if
(if (= "1" str-170) (setq str-170 "PA" list-903 (strcat list-903 "PA ")));if
(if (= "1" str-180) (setq str-180 "ML" list-903 (strcat list-903 "ML ")));if
(if (= "1" str-190) (setq str-190 "J5" list-903 (strcat list-903 "J5 ")));if
(if (= "1" str-200) (setq str-200 "AR" list-903 (strcat list-903 "AR ")));if
(if (= "1" str-210) (setq str-210 "T1" list-903 (strcat list-903 "T1 ")));if
(if (= list-903 "") (setq list-903 "Нет"));if

;определяем погрешность
(if (= "150TG" str-010)
	(cond
		((= "PA" str-170) (setq str-320 "0,2"));=
		((= "0" str-170) (setq str-320 "0,075"));=
 );cond
);if

(cond 
	((= list-903 "") (setq list-903 "Нет"));=
	((/= list-903 "") (setq list-903 (vl-string-right-trim " " list-903)));=
);cond

(if (= "150TG" str-010)
	(setq list-901 (vl-list* (strcat str-010 "  " 
																	 (substr str-020 1 (vl-string-search " " str-020)) " кПа  "
																 	 "Технолог. соед. " (substr str-030 1 (vl-string-search " " str-030)) "  "
																 	 "Мембр., дет. " (substr str-040 1 (vl-string-search " " str-040)) "  "
																 	 "Жидкость " (substr str-050 1 (vl-string-search " " str-050)) "  "
																 	 str-063 "  " ;выходной сигнал
																 	 (substr str-080 1 (vl-string-search " " str-080)) "  " ;индикатор
																 	 "Взрывозащ. " (substr str-090 1 (vl-string-search " " str-090)) "  "
																 	 "Кл. блок " (substr str-100 1 (vl-string-search " " str-100)) "  "
																 	 "Монт. части " (substr str-110 1 (vl-string-search " " str-110)) "  "
																 	 "Матер. " (substr str-120 1 (vl-string-search " " str-120)) "  "
																 	 "Кроншт. " (substr str-130 1 (vl-string-search " " str-130)) "  "
																 	 "Спец. опц. " list-903 "  "
																 	 "Каб. ввод " (substr str-220 1 (vl-string-search " " str-220)) "  "
																 	 ) list-901)
	);setq
);if

(setq tmp-list-902 (list (cons 0 "Датчик избыточного давления") 
												 (cons 1 str-001) 
												 (cons 2 str-002) 
												 (cons 4 str-004)
												 (cons 6 str-006)
												 (cons 320 str-320);погрешность
												 (cons 10 (substr str-010 1 (vl-string-search " " str-010)))
												 (cons 20 (substr str-020 1 (vl-string-search " " str-020)))
												 (cons 30 (substr str-030 1 (vl-string-search " " str-030)))
												 (cons 40 (substr str-040 1 (vl-string-search " " str-040)))
												 (cons 50 (substr str-050 1 (vl-string-search " " str-050)))
												 (cons 60 (substr str-060 1 (vl-string-search " " str-060)))
												 (cons 70 str-070)
												 (cons 80 (substr str-080 1 (vl-string-search " " str-080)))
												 (cons 90 (substr str-090 1 (vl-string-search " " str-090)))
												 (cons 100 (substr str-100 1 (vl-string-search " " str-100)))
												 (cons 110 (substr str-110 1 (vl-string-search " " str-110)))
												 (cons 120 (substr str-120 1 (vl-string-search " " str-120)))
												 (cons 130 (substr str-130 1 (vl-string-search " " str-130)))
												 (cons 140 str-140)
												 (cons 150 str-150)
												 (cons 160 str-160)
												 (cons 170 str-170)
												 (cons 180 str-180)
												 (cons 190 str-190)
												 (cons 200 str-200)
												 (cons 210 str-210)
												 (cons 220 (substr str-220 1 (vl-string-search " " str-220)))
									 			 (cons 99 "1,7"));list
			list-902 (vl-list*  tmp-list-902 list-902)
);setq

(setq list-902 (reverse list-902));setq

(list-filling "txt-901" (reverse list-901))

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в ПЭ                   //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun le-101-01-prs-sens-metran-150-pt

( / cntr-1 pnt-ins str-701 str-702 str-tmp tmp-00 tmp-10 tmp-20)

(setq cntr-1 0
			str-702 nil
);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				tmp-00 (cdr (assoc 0 str-tmp))
				tmp-10 (cdr (assoc 10 str-tmp))
				tmp-20 (cdr (assoc 20 str-tmp))
	);setq

	(setvar "osmode" 6199)
	
	(setq pnt-ins (getpoint "\nУкажите точку вставки\n"));setq

	(if (= "150TG" tmp-10)
		(setq str-701 (strcat tmp-00 " Метран-" tmp-10 ", диапазон измерений " tmp-20 " кПа"));setq
	);if
	
	(split-str-parts-le-01-general str-701 str-702 pnt-ins "**1**");
	
	(setq cntr-1 (1+ cntr-1));setq
);repeat

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в СПЦФ                 //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun spcf-101-01-prs-sens-metran-150-pt

( / cntr-1 pnt-ins str-000 str-001 str-002 str-004 str-006 str-010 str-020 str-021 str-030 str-031 str-040 str-050 str-060 str-061 str-070 str-080 str-081 str-090 str-091 
str-100 str-101 str-110 str-111 str-120 str-121 str-130 str-131 str-140 str-150 str-160 str-170 str-180 str-190 str-200 str-210 str-220 str-221 str-222 str-320 str-61 str-701 
str-702 str-99 str-manufact str-note str-order str-tmp str-unit)

(setq cntr-1 0);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-000 (cdr (assoc 0 str-tmp))
				str-001 (cdr (assoc 1 str-tmp))
				str-001 (strcase str-001 1)
				
				str-002 (cdr (assoc 2 str-tmp))
				str-004 (cdr (assoc 4 str-tmp))
				str-006 (cdr (assoc 6 str-tmp))
				str-320 (cdr (assoc 320 str-tmp))
				str-010 (cdr (assoc 10 str-tmp))
				str-020 (cdr (assoc 20 str-tmp))
				str-030 (cdr (assoc 30 str-tmp))
				str-040 (cdr (assoc 40 str-tmp))
				str-050 (cdr (assoc 50 str-tmp))
				str-060 (cdr (assoc 60 str-tmp))
				str-070 (cdr (assoc 70 str-tmp))
				str-080 (cdr (assoc 80 str-tmp))
				str-090 (cdr (assoc 90 str-tmp))
				str-100 (cdr (assoc 100 str-tmp))
				str-110 (cdr (assoc 110 str-tmp))
				str-120 (cdr (assoc 120 str-tmp))
				str-130 (cdr (assoc 130 str-tmp))
				str-140 (cdr (assoc 140 str-tmp))
				str-150 (cdr (assoc 150 str-tmp))
				str-160 (cdr (assoc 160 str-tmp))
				str-170 (cdr (assoc 170 str-tmp))
				str-180 (cdr (assoc 180 str-tmp))
				str-190 (cdr (assoc 190 str-tmp))
				str-200 (cdr (assoc 200 str-tmp))
				str-210 (cdr (assoc 210 str-tmp))
				str-220 (cdr (assoc 220 str-tmp))
				str-99 (cdr (assoc 99 str-tmp))
	);setq
     

	(if (or (= str-002 "...") (= str-004 "+...+") (= str-006 "+...+"))
		(progn
			(alert "Некоторые поля не заданы!!!")
			(if (= str-002 "...") (setq str-002 "***...***"));if
			(if (= str-004 "...") (setq str-004 "+***...+***"));if
			(if (= str-006 "...") (setq str-006 "+***...+***"));if
		);progn
	);if

	(if (= str-010 "150TG")
		(progn
			(cond
				((= str-020 "3,2...160") (setq str-021 "1"));=
				((= str-020 "20...1000") (setq str-021 "2"));=
				((= str-020 "120...6000") (setq str-021 "3"));=
				((= str-020 "500...25000") (setq str-021 "4"));=
				((= str-020 "1600...60000") (setq str-021 "5"));=
			);cond
		);progn
	);if

	;присоединение к процессу
	(cond
		((= str-030 "2G") (setq str-031 "резьба М20х1,5 (наружн.)"));=
		((= str-030 "2B") (setq str-031 "резьба 1/2NРT (внутр.)"));=
	);cond

	;выходной сигнал
	(cond
		((and (= str-060 "A") (= str-070 "0")) (setq str-061 "4-20 мА, HART"));=
		((and (= str-060 "A") (= str-070 "1")) (setq str-061 "20-4 мА, HART"));=
			
		((and (= str-060 "B") (= str-070 "0")) (setq str-61 "0-5 мА"));=
		((and (= str-060 "B") (= str-070 "1")) (setq str-61 "5-0 мА"));=
	);cond

	;индикатор
	(cond
		((= str-080 "M5") (setq str-080 "M5" str-081 "встроенный ЖКИ с клавиатурой"));=
		((= str-080 "MA") (setq str-080 "MA" str-081 "встроенный ЖКИ без клавиатуры"));=
	);cond

	;взрывозащита
	(cond
		((= "Нет" str-090) (setq str-090 "" str-091 "общепромышленное, IP65 по ГОСТ 14254"));=
		((= "IM" str-090) (setq str-090 "IM" str-091 "0ЕхiaIIСT5"));=
		((= "EM" str-090) (setq str-090 "EM" str-091 "1ЕхdIIСТ6, 1ЕхdIIСТ5"));=
		((= "UC" str-090) (setq str-090 "UC" str-091 "для работы на газообразном кислороде или кислородосодержащих газовых смесях"));=
	);cond

	;встроенный клапанный блок
	(cond
		((= str-100 "S5") (setq str-100 "S5" str-101 "со встроенным клапанным блоком"));=
		((= str-100 "Нет") (setq str-100 "" str-101 "без встроенного клапанного блока"));=
	);cond

	;монтажные части
	(cond
		((= str-110 "Нет") (setq str-110 "" str-111 "Нет"));=
		((= str-110 "2F") (setq str-110 "2F" str-111 "ниппель с гайкой М20х1,5"));=
		((= str-110 "2A") (setq str-110 "2A" str-111 "переходник с резьбой 1/4NРT (внутр.)"));=
		((= str-110 "2D") (setq str-110 "2D" str-111 "переходник с резьбой 1/4NРT (наружн.)"));=
		((= str-110 "2E") (setq str-110 "2E" str-111 "переходник с резьбой 1/2NРT (наружн.)"));=
	);cond

	;материал монтажных частей
	(cond
		((= str-120 "Нет") (setq str-120 "" str-121 "Нет"));=
		((= str-120 "2") (setq str-120 "2" str-121 "сталь 12Х10Н10T"));=
		((= str-120 "4") (setq str-120 "4" str-121 "углеродистая сталь"));=
		((= str-120 "5") (setq str-120 "5" str-121 "сталь 09Г2C"));=
	);cond

	;кронштейн
	(cond
		((= str-130 "Нет") (setq str-130 "" str-131 "Нет"));=
		((= str-130 "B1") (setq str-131 "кронштейн для крепления на панели"));=
		((= str-130 "B4") (setq str-131 "кронштейн для крепления на трубе диам. 50...60 мм или панели"));=
	);cond

	;обрабатываем спецопции
	(if (= str-140 "0") (setq str-140 ""));if
	(if (= str-150 "0") (setq str-150 ""));if
	(if (= str-160 "0") (setq str-160 ""));if
	(if (= str-170 "0") (setq str-170 ""));if
	(if (= str-180 "0") (setq str-180 ""));if
	(if (= str-190 "0") (setq str-190 ""));if
	(if (= str-200 "0") (setq str-200 ""));if
	(if (= str-210 "0") (setq str-210 ""));if

	;кабельный ввод
	(cond
		((= str-220 "SC") (setq str-221 "вилка 2РМГ14, розетка 2РМ14"));=
			
		((= str-220 "SC1") (setq str-221 "штепсельный разъем DIN"));=
		
		((= str-220 "SC2") (setq str-221 "вилка 2РМ22, розетка 2РМ22"));=
		
		((= str-220 "K01") (setq str-221 "кабельный ввод латунь (для небронир. кабеля диам. до 13,9мм)"));=
		
		((= str-220 "K02") (setq str-221 "кабельный ввод нерж. сталь (для небронир. кабеля диам. до 13,9мм)"));=
		((= str-220 "K03") (setq str-221 "кабельный ввод латунь (для небронир. кабеля диам. до 11,6мм)"));=
		((= str-220 "K04") (setq str-221 "кабельный ввод полиамид (для небронир. кабеля диам. до 12мм)"));=
		((= str-220 "K12") (setq str-221 "кабельный ввод латунь (для бронир. кабеля диам. до 20,9мм)"));=
		((= str-220 "K14") (setq str-221 "кабельный ввод латунь (для бронир. кабеля диам. до 15,9мм)"));=
	);cond
		
	(setvar "osmode" 6199)
	
	(setq pnt-ins (getpoint "\nУкажите точку вставки\n"));setq
	
	;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	(if (= str-010 "150TG")
		(progn
			(setq str-unit "шт."
						str-manufact "ПГ \"Метран\", г. Челябинск"
						
						str-note "Документ об утв. типа СИ №53672/1" ;;;;;;; примечание, текстовая строка
			
						str-701 str-000
						
						str-702 (list (cons 1 (strcat "измеряемая среда " str-001 ", диапазон изм. " str-002 " МПа"))
													(cons 2 (strcat "температура изм. среды " str-004 " %%dС"))
													(cons 3 (strcat "температура окр. среды " str-006 " %%dС"))
													(cons 4 (strcat "пределы измерений датчика " str-020 " кПа"))
													(cons 5 (strcat "предел осн. приведенной погрешности " str-320 " %"))
													(cons 6 (strcat "вых. сигнал " str-061))
													(cons 7 (strcat "технологич. присоединение " str-031)));list
			);setq
			
			;монтажные части
			(cond 
				((= str-030 "2G")
					(setq str-tmp (list (cons 8 (strcat "монтажные части " str-111)))
								str-702 (append str-702 str-tmp)
					);setq
				);=
			);cond
			
			;кабельный ввод
			(setq str-tmp (list (cons 9 str-221))
						str-702 (append str-702 str-tmp)
			);setq
			
			;исполнение датчика
			(setq str-tmp (list (cons 11 (strcat "исп. датчика " str-091)))
						str-702 (append str-702 str-tmp)
			);setq
			
			;индикация, клапанный блок
			(setq str-tmp (list (cons 12 (strcat str-081 ", " str-101)))
						str-702 (append str-702 str-tmp)
			);setq
			
			;монтажный кронштейн
			(if (/= str-131 "Нет") 
				(setq str-tmp (list (cons 11 (strcat str-131)))
							str-702 (append str-702 str-tmp)
				);setq
			);ша
			
			(setq str-order (strcat "Метран-" str-010 str-021 "-(" str-020 "кПа)-" str-030 "-" str-040 "-" str-050 "-" str-060 "-" str-080 "-" str-090 "-" str-100 "-" str-110 "-" 
																								str-120 "-" str-130  "-" str-140 "-" str-150 "-" str-160 "-" str-170 "-" str-180 "-" str-190 "-" str-200 "-" str-210 "-" str-220)
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

	(split-str-parts-spcf-01-general str-701 str-702 str-order str-manufact str-unit str-99 str-note pnt-ins);

	(setq cntr-1 (+ cntr-1 1));setq
);repeat

(princ)
)
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
