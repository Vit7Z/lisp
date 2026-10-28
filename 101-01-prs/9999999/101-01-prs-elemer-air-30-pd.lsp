;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////                                                              ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun 101-01-press-sens-elemer-air-30-pd

( / adoc cntr-1 dcl-id list-01 list-02 list-03 list-04 list-05 list-06 list-07 list-08 list-09 list-10 list-11 list-12 list-13 list-14 list-15 list-16 list-17 list-901 list-902 str-01 type-list)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object)))) ; start undo

(setvar "cmdecho" 0)

(setq cntr-1 0
      list-01 (list "- Общепромышленное*"
      							"Ex Искробезопасная эл. цепь"
      							"АЕх Атомное, взрывозащищенное"
      							)
 			str-01 nil							 										
 			
      list-901 nil
      list-902 nil
);setq

(txt-01-101-01-press-sens-elemer-air-30-pd)

(if (< (setq dcl-id (load_dialog "dia-101-01-press-sens-elemer-air-30-pd.dcl")) 0) ;ищем диалог
		(progn
			(alert "Не найден dcl-файл")
			(exit)
		);progn
);if

(if (not (new_dialog "dia_101_elemer_air_30_pd" dcl-id))
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
(list-filling "txt-13" list-13)
(list-filling "txt-14" list-14)
(list-filling "txt-15" list-15)
(list-filling "txt-16" list-16)
(list-filling "txt-17" list-17)

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
(set_tile "txt-13" "0")
(set_tile "txt-14" "0")
(set_tile "txt-15" "0")
(set_tile "txt-16" "0")
(set_tile "txt-17" "0")

(action_tile "txt-01" 
	(strcat "(txt-01-101-01-press-sens-elemer-air-30-pd)")
);action_tile

(action_tile "txt-02" 
	(strcat "(txt-02-101-01-press-sens-elemer-air-30-pd)")
);action_tile

(action_tile "txt-03" 
	(strcat "(txt-03-101-01-press-sens-elemer-air-30-pd)")
);action_tile

(action_tile "txt-04" 
	(strcat "(set_tile \"txt-03\" $value)")
);action_tile



(action_tile "txt-14"
  (strcat "(txt-14-101-01-press-sens-elemer-air-30-pd)"
  );strcat
);action_tile

(action_tile "but1"
  (strcat "(but1-101-01-press-sens-elemer-air-30-pd)");srcat
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

(if (= type-list "le") (le-101-metran-150-pd));if

(if (= type-list "spcf") (spcf-101-metran-150-pd));if

(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(vla-endundomark adoc)
(princ)
)
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun txt-01-101-01-press-sens-elemer-air-30-pd
( / )

(if (= nil str-01) 
  (setq str-01 (nth 0 list-01));setq
  (setq str-01 (nth (atoi (get_tile "txt-01")) list-01));setq
);if

(setq list-02 (list "S2 Емкостной"
      							"S3 Тензорезистивный")
			list-03 (list "CD1 0,025...1,6 кПа"
      							"CD3 0,1...6,3 кПа"
      							"CD4 0,16...10 кПа"
      							"CD6 0,63...40 кПа"
      							"CDH6 0,63...40 кПа"
      							"CD9 4...250 кПа"
      							"CDH9 4...250 кПа")
			list-04 (list "4" "10" "16" "25" "40" "25" "40")
			list-06 (list "С04 0,4%")
			list-08 (list "11P 316L (мембрана), 316L (штуцер), фторопласт (уплотнит. кольцо)"
										"11V 316L (мембрана), 316L (штуцер), витон уплотнит. кольцо"
										"31P Тантал (мембрана), 316L (штуцер), фторопласт (уплотнит. кольцо)"
										"35P Тантал (мембрана), Хастеллой-С (штуцер), фторопласт (уплотнит. кольцо)"
										"41P Монель (мембрана), 316L (штуцер), фторопласт (уплотнит. кольцо)"
										"44P Монель (мембрана), Монель (штуцер), фторопласт (уплотнит. кольцо)"
 										"51P Хастеллой-С (мембрана), 316L (штуцер), фторопласт (уплотнит. кольцо)"
 										"55P Хастеллой-С (мембрана), Хастеллой-С (штуцер), фторопласт (уплотнит. кольцо)")
			list-10 (list "42* 4...20 мА"
 										"05 0...5 или 4...20 мА"
 										"42H 4...20 мА, HART")
			list-11 (list "Р1* Кнопки на панели индикатора под крышкой со стеклом"
 										"Р2 Кнопки на наружном блоке управления"
 										"Р3 Кнопки на панели индикатора под крышкой без стекла")
 			list-12 (list "LP* ЖК темные символы на светлом фоне"
 										"LN ЖК светлые символы на темном фоне")
			list-16 (list "- Нет"										
										"Y(A30) ЭЛЕМЕР-БК-А30 3 вентиля без дренажа подключение импульсных линий через фланцы"
										"Y(A52) ЭЛЕМЕР-БК-А52 5 вентилей с дренажом подключение импульсных линий через фланцы"
										"Y(C20) ЭЛЕМЕР-БК-C20 2 вентиля без дренажа подключение импульсных линий через штуцеры с наружной резьбой М20х1,5 или отверстия К1/2\", К1/4\""
										"Y(C30) ЭЛЕМЕР-БК-C30 3 вентиля без дренажа подключение импульсных линий через штуцеры с наружной резьбой М20х1,5 или отверстия К1/2\", К1/4\""
										"Y(C52) ЭЛЕМЕР-БК-C52 5 вентилей с дренажом подключение импульсных линий через штуцеры с наружной резьбой М20х1,5 или отверстия К1/2\", К1/4\"")
 			list-17 (list "КР3 Кронштейн для крепления на трубе Ду50 мм (12Х18Н10Т)"
 										"КР4 Кронштейн для крепления на трубе Ду50 мм (12Х18Н10Т)"
 										"КР5 Кронштейн для крепления вентильного блока на трубе Ду50 мм (12Х18Н10Т)")							
);setq

(if (= "- Общепромышленное*" str-01)
	(progn
		(setq list-05 (list "- Нет")
 					list-07 (list "t2570* -25...+70" "t1070 -10...+70" "t4070 -40...+70")
					list-09 (list "- Нет"
												"С1Р Кольцо резина МБС 2, Фланец с внутр. резьбой K1/4\" (1/4\"NPT) 12Х18Н10Т"
 												"С5РФ Кольцо резина МБС 2, Фланец (М20х1,5) 12Х18Н10Т, Прокладка Ф-4УВ15, Ниппель 12Х18Н10Т, Гайка М20х1,5"
 												"С5ФФ Прокладка Ф-4, Фланец (М20х1,5) 12Х18Н10Т, Прокладка Ф-4УВ15, Ниппель 12Х18Н10Т, Гайка М20х1,5")
 					list-13 (list "PGK* Кабельный ввод VG NPT 1/2\"6-12-K68 (пластик), диаметр кабеля 6-12 мм"
 												"PGМ Кабельный ввод VG NPT 1/2\"-МS 68 (металл), диаметр кабеля 6-12 мм"
 												"ШР14 Вилка 2РМГ14"
 												"ШР22 Вилка 2РМГ22"
 												"КВМ-15 Кабельный ввод под металлорукав МГП15 в ПВХ оболочке 15 мм"
 												"КВМ-16 Кабельный ввод под металлорукав МГ16"
 												"КВМ-22 Кабельный ввод под металлорукав МГ22"
 												"КВП-15 Кабельный ввод под пластиковый рукав 15 мм"
 												"КВП-16 Кабельный ввод под пластиковый рукав 16 мм"
 												"К-13 Кабельный ввод для небронированного кабеля 6...13 мм и для бронир. (экранир.) кабеля 6...10 мм с броней (экраном) 10...13 мм"
 												"КБ-13 Кабельный ввод для бронир. (экранир.) кабеля 6...10 мм с броней (экраном) 10...13 мм")
 					list-14 (list "- Нет*"
												"RO Оптореле 250 В, 80 мА"
												"RМ Электромеханическое реле 250 В, 3 А")
 					list-15 (list "- Нет")
 										
 			
		);setq
	);progn
);if





(princ)
)
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun txt-02-101-01-press-sens-elemer-air-30-pd
( / str-02)

(setq str-02 (nth (atoi (get_tile "txt-02")) list-02));setq

(if (= "S2 Емкостной" str-02)
	(setq list-03 (list "CD1 0,025...1,6 кПа"
      								"CD3 0,1...6,3 кПа"
      								"CD4 0,16...10 кПа"
      								"CD6 0,63...40 кПа"
      								"CDH6 0,63...40 кПа"
      								"CD9 4...250 кПа"
      								"CDH9 4...250 кПа")
 				list-04 (list "4" "10" "16" "25" "40" "25" "40")								
 			
	);setq
);if

(if (= "S3 Тензорезистивный" str-02)
	(setq list-03 (list "CD4 0,16...10 кПа"
      								"CD8 1,6...100 кПа"
      								"CD10 6,3...400 кПа")
 				list-04 (list "5" "16" "16")								
 			
	);setq
);if


(list-filling "txt-03" list-03)
(list-filling "txt-04" list-04)

(set_tile "txt-03" "0")
(set_tile "txt-04" "0")

(princ)
)
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun txt-03-101-01-press-sens-elemer-air-30-pd
( / str-02 str-03 str-03-1)

(setq str-02 (nth (atoi (get_tile "txt-02")) list-02)
			str-03 (nth (atoi (get_tile "txt-03")) list-03)
			str-03-1 (get_tile "txt-03")
);setq

(set_tile "txt-04" str-03-1)


(if (= "S2 Емкостной" str-02)
	(cond
		((= "CD1 0,025...1,6 кПа" str-03) (setq list-06 (list "С04 0,4%")));=
		((= "CD3 0,1...6,3 кПа" str-03) (setq list-06 (list "С04 0,4%")));=
		((= "CD4 0,16...10 кПа" str-03) (setq list-06 (list "С04 0,4%")));=
		((= "CD6 0,63...40 кПа" str-03) (setq list-06 (list "B02 0,2%" "С04 0,4%")));=
		((= "CDH6 0,63...40 кПа" str-03) (setq list-06 (list "B02 0,2%" "С04 0,4%")));=
		((= "CD9 4...250 кПа" str-03) (setq list-06 (list "B02 0,2%" "С04 0,4%")));=
		((= "CDH9 4...250 кПа" str-03) (setq list-06 (list "B02 0,2%" "С04 0,4%")));=

	);cond
);if


(if (= "S3 Тензорезистивный" str-02)
	(setq list-06 (list "А00 0,075%" "А01 0,1%" "B02 0,2%" "С04 0,4%")
	);setq
);if


(list-filling "txt-06" list-06)

(set_tile "txt-06" "0")

(princ)
)
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun txt-14-101-01-press-sens-elemer-air-30-pd

( / str-02 str-03 str-03-1)

(setq str-14 (nth (atoi (get_tile "txt-14")) list-14)

);setq



(cond
	((= "- Нет*" str-14) 
		(setq list-15 (list "- Нет"))
	);if
	
	((/= "- Нет*" str-14) 
		(setq list-15 (list "PGK* Кабельный ввод VG NPT 1/2\"6-12-K68 (пластик), диаметр кабеля 6-12 мм"
 												"PGМ Кабельный ввод VG NPT 1/2\"-МS 68 (металл), диаметр кабеля 6-12 мм"
 												"ШР22-10 Вилка 2РМГ22-10"
 												"КВМ-15 Кабельный ввод под металлорукав МГП15 в ПВХ оболочке 15 мм"
 												"КВМ-16 Кабельный ввод под металлорукав МГ16"
 												"КВМ-22 Кабельный ввод под металлорукав МГ22"
 												"КВП-15 Кабельный ввод под пластиковый рукав 15 мм"
 												"КВП-16 Кабельный ввод под пластиковый рукав 16 мм"
 												"К-13 Кабельный ввод для небронированного кабеля 6...13 мм и для бронир. (экранир.) кабеля 6...10 мм с броней (экраном) 10...13 мм"
 												"КБ-13 Кабельный ввод для бронир. (экранир.) кабеля 6...10 мм с броней (экраном) 10...13 мм")
 		);setq
 	);if
);cond


(list-filling "txt-15" list-15)

(set_tile "txt-15" "0")

(princ)
)
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////




;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма формирования данных/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun but1-101-01-press-sens-elemer-air-30-pd

( / cntr-1 str-01 str-01-1 str-02 str-02-1 str-03 str-04 str-05 str-05-1 str-06 str-06-1 str-07 str-07-1 str-08 str-08-1 str-09 str-09-1 str-10 str-10-1 str-11 str-11-1 
str-12 str-12-1 str-13 str-13-1 str-14 str-14-1 str-15 str-15-1 str-16 str-16-1 str-17 str-17-1 str-18 str-19 str-20 str-99 swtch tmp-list-902)

(setq swtch list-901
      cntr-1 0
);setq

(if (/= swtch nil) (setq list-902 (reverse list-902)));if

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
			str-13 (nth (atoi (get_tile "txt-13")) list-13)
			str-14 (nth (atoi (get_tile "txt-14")) list-14)
			str-15 (nth (atoi (get_tile "txt-15")) list-15)
			str-16 (nth (atoi (get_tile "txt-16")) list-16)
			str-17 (nth (atoi (get_tile "txt-17")) list-17)
			str-18 (get_tile "txt-18")
			str-19 (get_tile "txt-19")
			str-20 (get_tile "txt-20")
);setq



(setq str-01-1 (substr str-01 1 (vl-string-search " " str-01))
			str-02-1 (substr str-02 1 (vl-string-search " " str-02))
			str-05-1 (substr str-05 1 (vl-string-search " " str-05))
			str-06-1 (substr str-06 1 (vl-string-search " " str-06))
			str-07-1 (substr str-07 1 (vl-string-search " " str-07))
			str-08-1 (substr str-08 1 (vl-string-search " " str-08))
			str-09-1 (substr str-09 1 (vl-string-search " " str-09))
			str-10-1 (substr str-10 1 (vl-string-search " " str-10))
			str-11-1 (substr str-11 1 (vl-string-search " " str-11))
			str-12-1 (substr str-12 1 (vl-string-search " " str-12))
			str-13-1 (substr str-13 1 (vl-string-search " " str-13))
			str-14-1 (substr str-14 1 (vl-string-search " " str-14))
			str-15-1 (substr str-15 1 (vl-string-search " " str-15))
			str-16-1 (substr str-16 1 (vl-string-search " " str-16))
			str-17-1 (substr str-17 1 (vl-string-search " " str-17))
);setq
      							

(cond
	((= str-18 "0") (setq str-18 "-"));=
	((= str-18 "1") (setq str-18 "List"));=
);cond

(cond
	((= str-19 "0") (setq str-19 "-"));=
	((= str-19 "1") (setq str-19 "360П"));=
);cond

(cond
	((= str-20 "0") (setq str-20 "-"));=
	((= str-20 "1") (setq str-20 "ГП"));=
);cond

(setq list-901 (vl-list* (strcat "АИР-30  "
																 str-01-1 "  "
																 str-02-1 "  " 
																 str-03 "  "
																 "Ризб " str-04 "МПа  "
																 str-05-1 "  "
																 str-06-1 "  "
																 str-07-1 "  "
																 str-08-1 "  "
																 str-09-1 "  "
																 str-10-1 "  "
																 str-11-1 "  "
																 str-12-1 "  "
																 str-13-1 "  "
																 str-14-1 "  "
																 str-15-1 "  "
																 str-16-1 "  "
																 str-17-1 "  "
																 str-18 "  "
																 str-19 "  "
																 str-20
																 	) list-901)
);setq

(cond
	((= str-02 "S2 Емкостной") (setq str-99 "4"));=
	((= str-02 "S3 Тензорезистивный") (setq str-99 "3,5"));=
);cond

(setq tmp-list-902 (list (cons 1 str-01) 
												 (cons 2 str-02) 
												 (cons 3 str-03) 
												 (cons 4 str-04)
												 (cons 5 str-05)
												 (cons 6 str-06)
												 (cons 7 str-07)
												 (cons 8 str-08)
												 (cons 9 str-09)
												 (cons 10 str-10)
												 (cons 11 str-11)
												 (cons 12 str-12)
												 (cons 13 str-13)
												 (cons 14 str-14)
												 (cons 15 str-15)
												 (cons 16 str-16)
												 (cons 17 str-17)
												 (cons 18 str-18)
												 (cons 19 str-19)
												 (cons 20 str-20)
									 			 (cons 99 str-99));list
			list-902 (vl-list* tmp-list-902 list-902)
);setq

(setq list-902 (reverse list-902));setq

(list-filling "txt-901" (reverse list-901))

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в ПЭ                   //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun le-101-metran-150-pd

( / cntr-1 pnt-ins str-01 str-02 str-03 str-03-1 str-tmp str-txt str-txt-01)

(setq cntr-1 0);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-01 (cdr (assoc 1 str-tmp))
				str-02 (cdr (assoc 2 str-tmp))
				str-03 (cdr (assoc 3 str-tmp))
	);setq

;(princ "\n         str-tmp = ") (princ str-tmp);Erase_DV
;(getstring "\nPress Enter to continue...");Erase_DV

	(setvar "osmode" 6199)
	
	(setq pnt-ins		(getpoint "\nУкажите точку вставки\n"));setq

	(setq str-02 (substr str-02 1 2)
				str-03-1 (substr str-03 1 (vl-string-search " " str-03))
				str-03 (substr str-03 (+ (vl-string-search " " str-03) 2))
	);setq
	
	(if (= "- Общепромышленное*" str-01)
		(setq str-txt (strcat "Преобразователь разности давлений Элемер-АИР-30, исполнение "
													"общепромышленное, пределы изм. " str-03 ", код сенсора " str-02 ", "
													"модель " str-03-1)
					str-txt-01 nil
		);setq
	);if






	(setq cntr-1 (1+ cntr-1));setq
);repeat

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в СПЦФ                 //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun spcf-101-metran-150-pd

( / cntr-1 dlt-y length-str nmbr-ln nmbr-str pnt-ins str-01 str-01-1 str-01-2 str-02 str-02-1 str-02-2 str-03 str-03-1 str-03-2 str-04 str-05 str-05-1 str-05-2 str-06 
str-06-1 str-06-2 str-07 str-07-1 str-07-2 str-08 str-08-1 str-08-2 str-09 str-09-1 str-09-2 str-10 str-10-1 str-10-2 str-11 str-11-1 str-11-2 str-12 str-12-1 str-12-2 
str-13 str-13-1 str-13-2 str-14 str-14-1 str-14-2 str-15 str-15-1 str-15-2 str-16 str-16-1 str-16-2 str-17 str-17-1 str-17-2 str-18 str-19 str-20 str-99 str-order-1 str-order-2 
str-order-3 str-tmp x-pnt-ins y-pnt-ins y-pnt-ins-1)

(setq cntr-1 0);setq

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
				str-12 (cdr (assoc 12 str-tmp))
				str-13 (cdr (assoc 13 str-tmp))
				str-14 (cdr (assoc 14 str-tmp))
				str-15 (cdr (assoc 15 str-tmp))
				str-16 (cdr (assoc 16 str-tmp))
				str-17 (cdr (assoc 17 str-tmp))
				str-18 (cdr (assoc 18 str-tmp))
				str-19 (cdr (assoc 19 str-tmp))
				str-20 (cdr (assoc 20 str-tmp))
				str-99 (cdr (assoc 99 str-tmp))
	);setq
     
;(princ "\n         str-tmp = ") (princ str-tmp);Erase_DV
;(getstring "\nPress Enter to continue...");Erase_DV

	(setq str-01-1 (substr str-01 1 (vl-string-search " " str-01))
				str-01-2 (substr str-01 (+ (vl-string-search " " str-01) 2))
				
				str-02-1 (substr str-02 1 (vl-string-search " " str-02))
				str-02-2 (substr str-02 (+ (vl-string-search " " str-02) 2))
				
				str-03-1 (substr str-03 1 (vl-string-search " " str-03))
				str-03-2 (substr str-03 (+ (vl-string-search " " str-03) 2))
				
				str-05-1 (substr str-05 1 (vl-string-search " " str-05))
				str-05-2 (substr str-05 (+ (vl-string-search " " str-05) 2))
				
				str-06-1 (substr str-06 1 (vl-string-search " " str-06))
				str-06-2 (substr str-06 (+ (vl-string-search " " str-06) 2))
				
				str-07-1 (substr str-07 1 (vl-string-search " " str-07))
				str-07-1 (vl-string-right-trim "*" str-07-1)
				str-07-2 (substr str-07 (+ (vl-string-search " " str-07) 2))
				
				str-08-1 (substr str-08 1 (vl-string-search " " str-08))
				str-08-2 (substr str-08 (+ (vl-string-search " " str-08) 2))
				
				str-09-1 (substr str-09 1 (vl-string-search " " str-09))
				str-09-2 (substr str-09 (+ (vl-string-search " " str-09) 2))				
				
				str-10-1 (substr str-10 1 (vl-string-search " " str-10))
				str-10-1 (vl-string-right-trim "*" str-10-1)
				str-10-2 (substr str-10 (+ (vl-string-search " " str-10) 2))
				
				str-11-1 (substr str-11 1 (vl-string-search " " str-11))
				str-11-1 (vl-string-right-trim "*" str-11-1)
				str-11-2 (substr str-11 (+ (vl-string-search " " str-11) 2))
				
				str-12-1 (substr str-12 1 (vl-string-search " " str-12))
				str-12-1 (vl-string-right-trim "*" str-12-1)
				str-12-2 (substr str-12 (+ (vl-string-search " " str-12) 2))
				
				str-13-1 (substr str-13 1 (vl-string-search " " str-13))
				str-13-1 (vl-string-right-trim "*" str-13-1)
				str-13-2 (substr str-13 (+ (vl-string-search " " str-13) 2))				
				
				str-14-1 (substr str-14 1 (vl-string-search " " str-14))
				str-14-2 (substr str-14 (+ (vl-string-search " " str-14) 2))				
				
				str-15-1 (substr str-15 1 (vl-string-search " " str-15))
				str-15-1 (vl-string-right-trim "*" str-15-1)
				str-15-2 (substr str-15 (+ (vl-string-search " " str-15) 2))				
			
	);setq

	(cond
		((= str-01-2 "Общепромышленное*") (setq str-01-2 "общепромышленное, код -"));=
		((= str-01-2 "Искробезопасная эл. цепь") (setq str-01-2 "искробезопасная эл. цепь, код Ex"));=
		((= str-01-2 "Атомное, взрывозащищенное") (setq str-01-2 "атомное, взрывозащищенное, код AEx"));=

	);cond

	(cond
		((= str-16 "- Нет") (setq str-16-1 "-" str-16-2 "без установки вентильного блока и опрессовки"));=
		((/= str-16 "- Нет")
			(setq str-16-1 (substr str-16 1 (vl-string-search " " str-16))
						str-16 (substr str-16 (+ (vl-string-search " " str-16) 2))
						str-16-2 (substr str-16 1 (vl-string-search " " str-16))
			);setq
		);=
	);cond

	(cond
		((= str-17 "КР3 Кронштейн для крепления на трубе Ду50 мм (12Х18Н10Т)") (setq str-17-1 "КР3" str-17-2 "кронштейн для крепления на трубе Ду50 мм"));=
		((= str-17 "КР4 Кронштейн для крепления на трубе Ду50 мм (12Х18Н10Т)") (setq str-17-1 "КР4" str-17-2 "кронштейн для крепления на трубе Ду50 мм"));=
		((= str-17 "КР5 Кронштейн для крепления вентильного блока на трубе Ду50 мм (12Х18Н10Т)") (setq str-17-1 "КР5" str-17-2 "кронштейн для крепления вентильного блока на трубе Ду50 мм"));=
	);cond

	(setvar "osmode" 6199)
	
	(setq pnt-ins		(getpoint "\nУкажите точку вставки\n")
				x-pnt-ins (nth 0 pnt-ins)
				y-pnt-ins (nth 1 pnt-ins)
				y-pnt-ins-1 y-pnt-ins
				dlt-y 8
	);setq

	(101-empt-lin-spcf)

	;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	(setq nmbr-ln 14
				nmbr-str 10
	);setq
			
	(1000-delete-items-spcf nmbr-ln pnt-ins)
	(1000-delete-items-spcf-crtf nmbr-ln pnt-ins)

	(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Преобразователь разности давлений")
	(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "- исполнение " str-01-2))
	(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 (strcat "- код сенсора " str-02-1 ", модель " str-03-1))
	(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 3)) 4)) 2.5 0 (strcat "- пределы измерений " str-03-2 ", макс. избыточное давление до " str-04 " МПа"))
	(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 4)) 4)) 2.5 0 (strcat "- предел допускаемой основной приведенной погрешности " str-06-2 ", код  " str-06-1))
	(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 5)) 4)) 2.5 0 (strcat "- климатическое исполнение " str-07-2 "%%dС, код " str-07-1))
	(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 6)) 4)) 2.5 0 (strcat "- код исполнения по материалам " str-08-1 ", код присоединения к процессу " str-09-1))
	(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 7)) 4)) 2.5 0 (strcat "- выходной сигнал " str-10-2 ", код " str-10-1))
	(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 8)) 4)) 2.5 0 (strcat "- код исполнения корпуса " str-11-1 ", код типа встроенного индикатора " str-12-1))			
	(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 9)) 4)) 2.5 0 (strcat "- код электрического присоединения измерительной цепи " str-13-1))
			
	(cond
		((= str-14 "- Нет*")
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 10)) 4)) 2.5 0 (strcat "- без устройства сигнализации"))
			(setq nmbr-str (+ nmbr-str 1));setq
		);=

		((/= str-14 "- Нет*")
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 10)) 4)) 2.5 0 (strcat "- код исполнительного устройства сигнализации " str-14-1))
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 11)) 4)) 2.5 0 (strcat "- код электрического присоединения цепи сигнализации " str-15-1))
			(setq nmbr-ln (+ nmbr-ln 1)
						nmbr-str (+ nmbr-str 2)
			);setq
		);=
	);cond
			
	(cond
		((= str-16 "- Нет")
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y nmbr-str)) 4)) 2.5 0 (strcat "- " str-16-2))
			(setq nmbr-str (+ nmbr-str 1));setq
		);=

		((/= str-16 "- Нет")
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y nmbr-str)) 4)) 2.5 0 (strcat "- установка вентильного блока " str-16-2 " (заказывается отдельно)"))
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y (+ nmbr-str 1))) 4)) 2.5 0 (strcat "и опрессовка, код " str-16-1))
			(setq nmbr-ln (+ nmbr-ln 1)
						nmbr-str (+ nmbr-str 2)
			);setq
		);=
	);cond
			
	(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y nmbr-str)) 4)) 2.5 0 (strcat "- " str-17-2 ", код " str-17-1));кронштейн
			
	(setq nmbr-str (+ nmbr-str 1))
			
	(if (= str-18 "List") ;заводские настройки
		(progn
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y nmbr-str)) 4)) 2.5 0 "- заводские настройки в соответсвии с опросным листом, код List")
			(setq nmbr-ln (1+ nmbr-ln)
						nmbr-str (+ nmbr-str 1)
			);setq
		);progn
	);setq
			
	(if (= str-19 "360П") ;наработка
		(progn
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y nmbr-str)) 4)) 2.5 0 "- дополнительные стендовые испытания в течение 360 ч, код 360П")
			(setq nmbr-ln (1+ nmbr-ln)
						nmbr-str (+ nmbr-str 1)
			);setq
		);progn
	);setq
			
	(if (= str-20 "ГП") ;госповерка
		(progn
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y nmbr-str)) 4)) 2.5 0 "- госповерка, код ГП")
			(setq nmbr-ln (1+ nmbr-ln));setq
		);progn
	);setq
			
	(command "_TEXT" "_MC" (list (+ x-pnt-ins 160) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 (strcat "Элемер-АИР-30 / " str-01-1 " / " str-02-1 " / " str-03-1 " / "))
	(command "_TEXT" "_MC" (list (+ x-pnt-ins 160) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat str-04 " / " str-05-1 " / " str-06-1 " / " str-07-1 " / " str-08-1 " / " ))
	(command "_TEXT" "_MC" (list (+ x-pnt-ins 160) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 (strcat str-09-1 " / " str-10-1 " / " str-11-1 " / " str-12-1 " / " str-13-1 " / "))
	(command "_TEXT" "_MC" (list (+ x-pnt-ins 160) (- (- y-pnt-ins (* dlt-y 3)) 4)) 2.5 0 (strcat str-14-1 " / " str-15-1 " / " str-16-1 " / " ))
	(command "_TEXT" "_MC" (list (+ x-pnt-ins 160) (- (- y-pnt-ins (* dlt-y 4)) 4)) 2.5 0 (strcat str-17-1 " / " str-18 " / " str-19 " / " str-20 " / "))
	
	
	
	
	
	(command "_TEXT" "_MC" (list (+ x-pnt-ins 160) (- (- y-pnt-ins (* dlt-y 5)) 4)) 2.5 0 "ТУ 4212-077-13282997-08")

		
	(command "_text" "_ML" (list (+ x-pnt-ins 336) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Свидетельство об")
	(command "_text" "_ML" (list (+ x-pnt-ins 336) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 "утверждении типа")
	(command "_text" "_ML" (list (+ x-pnt-ins 336) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 "средств измерений")
	(command "_text" "_ML" (list (+ x-pnt-ins 336) (- (- y-pnt-ins (* dlt-y 3)) 4)) 2.5 0 "RU.C.30.004.A")
	(command "_text" "_ML" (list (+ x-pnt-ins 336) (- (- y-pnt-ins (* dlt-y 4)) 4)) 2.5 0 "№51795")
	
	
	(command "_text" "_MC" (list (+ x-pnt-ins 247.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "ООО НПП \"ЭЛЕМЕР\",")
	(command "_text" "_MC" (list (+ x-pnt-ins 247.5) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 "г. Москва, Зеленоград")		
	
	(command "_text" "_MC" (list (+ x-pnt-ins 280) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "шт.")
	
	(command "_text" "_MC" (list (+ x-pnt-ins 322.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 str-99);масса
	
	(repeat nmbr-ln
		(command "_insert" "зс-пустая-строка" "_X" 1 "_Y" 1 "_Z" 1 "_R" 0 (list x-pnt-ins y-pnt-ins-1))
		(setq y-pnt-ins-1 (- y-pnt-ins-1 8));setq
	);repeat

	(setq cntr-1 (+ cntr-1 1));setq
);repeat

(princ)
)
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
