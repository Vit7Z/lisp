;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// РАСХОДОМЕРЫ ЖИДКОСТИ УЛЬТРАЗВУКОВЫЕ ДВУХКАНАЛЬНЫЕ УРЖ2КМ     ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun 101-urg2km

( / adoc counter dcl-id list-010 list-020 list-030 list-040 list-050 list-090 list-110 list-120 list-130 list-140 list-150 list-901 list-902 list-903 str-f type-list)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(setq str-f 1
      counter 0
      list-010 (list "Модель 1" "Модель 2")
      list-020 (list "1 канал х 1 луч" "1 канал х 2 луча" "2 канала х 1 луч")
      list-030 (list "O Фланцевое" "Z Резьбовое" "Без труб") 
    	list-040 (list "F Углеродистая" "G Коррозионно-стойкая")
			list-050 (list "50 (0,5...75)" 
      							 "65 (0,9...127)" 
      							 "80 (1,3...192)" 
      							 "100 (2,0...300)" 
      							 "150 (4,5...675)" 
      							 "200 (8,0...1200)"
      					);list
      list-090 (list "")
      list-110 (list "Q Технологическая" "P Имитационная" "К Проливная")
      list-120 (list "A Архиватор, RS-232, RS-485" "D Архиватор, RS-232" "U Без архиватора, RS-232")
      list-130 (list "V Ethernet")
      list-140 (list "B По диаметру" "H По двум диаметрам")
      list-150 (list "T 4-20" "S 0-5")
      list-901 nil
      list-902 nil
      list-903 nil
);setq

(if (< (setq dcl-id (load_dialog "dia-101-urg2km.dcl")) 0) ;ищем диалог
		(progn
			(alert "Не найден dcl-файл")
			(exit)
		);progn
);if

(if (not (new_dialog "dia_101_urg2km" dcl-id))
		(exit)
);if

(list-filling "txt-010" list-010)
(list-filling "txt-020" list-020)
(list-filling "txt-030" list-030)
(list-filling "txt-040" list-040)
(list-filling "txt-050" list-050)

(list-filling "txt-090" list-090)

(list-filling "txt-110" list-110)
(list-filling "txt-120" list-120)
(list-filling "txt-130" list-130)
(list-filling "txt-140" list-140)
(list-filling "txt-150" list-150)

(set_tile "txt-010" "0")
(set_tile "txt-020" "0")
(set_tile "txt-030" "0")
(set_tile "txt-040" "0")
(set_tile "txt-050" "0")

(set_tile "txt-090" "0")

(set_tile "txt-110" "0")
(set_tile "txt-120" "0")
(set_tile "txt-130" "0")
(set_tile "txt-140" "0")
(set_tile "txt-150" "0")

(action_tile "txt-010" 
  (strcat "(setq str-010 (nth (atoi (get_tile \"txt-010\")) list-010))"
  				"(txt-010-101-urg2km str-010)"
  );strcat
);action_tile

(action_tile "txt-020" 
  (strcat "(txt-020-101-urg2km)");strcat
);action_tile

(action_tile "txt-030" 
  (strcat "(txt-030-101-urg2km)");strcat
);action_tile

(action_tile "txt-050" 
  (strcat "(txt-050-101-urg2km)");strcat
);action_tile

(action_tile "but1"
  (strcat "(but1-101-urg2km)");srcat
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

(action_tile "but5"
  (strcat "(delete-item)"
  );strcat
);action_tile

(action_tile "accept"
  (strcat "(done_dialog)"
          "(exit)"
  );strcat
);action_tile

(action_tile "but4"
  (strcat "(setq type-list \"lecgv\")"
          "(done_dialog)"
  );strcat
);action_tile

(start_dialog)
(unload_dialog dcl-id)

(if (= type-list "le") (le-101-urg2km));if

(if (= type-list "spcf") (spcf-101-urg2km));if

(if (= type-list "lecgv") (lecgv-101-urg2km));if

(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(vla-endundomark adoc)
(princ)
)
;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// КОНЕЦ ПРОГРАММЫ                                              ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun txt-010-101-urg2km

(str-010 / )

(if (= str-010 "Модель 1")
	(progn
		(setq list-130 (list "V Ethernet"));setq
		(set_tile "txt-160" "0")
		(mode_tile "txt-160" 1)
	);progn
);if

(if (= str-010 "Модель 2")
	(progn
		(setq list-130 (list "V Ethernet" "W Ethernet, USB" "I USB"));setq
		(mode_tile "txt-160" 0)
	);progn
);if

(list-filling "txt-130" list-130)

(set_tile "txt-130" "0")

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun txt-020-101-urg2km

( / str-020)

(setq str-020 (nth (atoi (get_tile "txt-020")) list-020)
);setq

(if (= "1 канал х 1 луч" str-020)
  (progn
    (setq list-030 (list "O Фланцевое" "Z Резьбовое" "Без труб")  
    			;list-040 (list "F Углеродистая" "G Коррозионно-стойкая")
    			list-090 (list "")
    			list-110 (list "Q Технологическая" "P Имитационная" "К Проливная")
    );setq
    (list-filling "txt-090" list-090)
    (set_tile "txt-090" "0")
    (set_tile "txt-100" "")
		(mode_tile "txt-090" 1)
    (mode_tile "txt-100" 1)
  );progn
);if

(if (= "1 канал х 2 луча" str-020)
  (progn
    (setq list-030 (list "O Фланцевое" "E Сварное" "Без труб") 
    			;list-040 (list "F Углеродистая")
    			list-090 (list "")
    			list-110 (list "Q Технологическая" "P Имитационная" "К Проливная")
    );setq
    (list-filling "txt-090" list-090)
    (set_tile "txt-090" "0")
    (set_tile "txt-100" "")
		(mode_tile "txt-090" 1)
    (mode_tile "txt-100" 1)
  );progn
);if

(if (= "2 канала х 1 луч" str-020)
  (progn
    (setq list-030 (list "O Фланцевое" "Z Резьбовое" "Без труб") 
    			;list-040 (list "G Коррозионно-стойкая")
    			list-110 (list "Q Технологическая" "P Имитационная" "К Проливная")
    );setq
    (set_tile "txt-100" "")
		(mode_tile "txt-090" 0)
    (mode_tile "txt-100" 0)
  );progn
);if


(list-filling "txt-030" list-030)
;(list-filling "txt-040" list-040)
(list-filling "txt-110" list-110)

(set_tile "txt-030" "0")
;(set_tile "txt-040" "0")
(set_tile "txt-110" "0")

(txt-030-101-urg2km)

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun txt-030-101-urg2km

( / str-020 str-030 str-040)

(setq str-020 (nth (atoi (get_tile "txt-020")) list-020)
			str-030 (nth (atoi (get_tile "txt-030")) list-030)
			str-040 (nth (atoi (get_tile "txt-040")) list-040)
);setq

(if (and (= "O Фланцевое" str-030) (= "1 канал х 1 луч" str-020))
	(setq list-040 (list "F Углеродистая" "G Коррозионно-стойкая")
				list-050 (list "15 (0,03...3,5)" 
      								 "20 (0,05...5)" 
      								 "25 (0,07...8)" 
      								 "32 (0,16...11)" 
      								 "40 (0,2...17)"
											 "50 (0,5...75)" 
      								 "65 (0,9...127)" 
      								 "80 (1,3...192)" 
      								 "100 (2,0...300)" 
      								 "150 (4,5...675)" 
      								 "200 (8,0...1200)"
      						);list
      	list-140 (list "B По диаметру")
   );setq
);if

(if (and (= "Z Резьбовое" str-030) (= "1 канал х 1 луч" str-020))
	(setq list-040 (list "F Углеродистая" "G Коррозионно-стойкая")
				list-050 (list "15 (0,03...3,5)" 
      								 "20 (0,05...5)" 
      								 "25 (0,07...8)" 
      								 "32 (0,16...11)" 
      								 "40 (0,2...17)"
      						);list
      	list-140 (list "B По диаметру")
   );setq
);if


(if (and (= "Без труб" str-030) (= "1 канал х 1 луч" str-020))
	(setq list-040 (list "Нет")
				list-050 (list "Нет")
      	list-140 (list "B По диаметру")
   );setq
);if


(if (and (= "O Фланцевое" str-030) (= "1 канал х 2 луча" str-020))
	(setq list-040 (list "F Углеродистая")
				list-050 (list "32 (0,2...36)" 
      								 "40 (0,3...48)" 
      								 "50 (0,5...75)" 
      								 "65 (0,9...127)" 
      								 "80 (1,3...192)" 
      								 "100 (2,0...300)" 
      								 "150 (4,5...675)" 
      								 "200 (8,0...1200)" 
      								 "250 (12,5...1875)" 
      								 "300 (18...2700)" 
      								 "350 (24,5...3675)" 
      								 "400 (32...4800)" 
      								 "500 (50...7500)"
      						);list
      	list-140 (list "B По диаметру" "H По двум диаметрам")
   );setq
);if

(if (and (= "E Сварное" str-030) (= "1 канал х 2 луча" str-020))
	(setq list-040 (list "F Углеродистая")
				list-050 (list "600 (72...10800)" 
      								 "700 (98...14700)" 
      								 "800 (128...19200)" 
      								 "900 (162...24300)" 
      								 "1000 (200...30000)"
      						);list
      	list-140 (list "B По диаметру" "H По двум диаметрам" "L По одной хорде" "J По двум хордам")
   );setq
);if

(if (and (= "Без труб" str-030) (= "1 канал х 2 луча" str-020))
	(setq list-040 (list "Нет")
      	list-050 (list "Нет")
      	list-140 (list "B По диаметру" "H По двум диаметрам" "L По одной хорде" "J По двум хордам")
   );setq
);if


(if (and (= "Z Резьбовое" str-030) (= "2 канала х 1 луч" str-020))
	(setq list-040 (list "G Коррозионно-стойкая")
				list-050 (list "15 (0,03...3,5)" 
      								 "20 (0,05...5)" 
      								 "25 (0,07...8)" 
      								 "32 (0,16...11)" 
      								 "40 (0,2...17)"
      						);list
      	list-090 list-050
      	list-140 (list "B По диаметру" "H По двум диаметрам")
   );setq
);if

(if (and (= "O Фланцевое" str-030) (= "2 канала х 1 луч" str-020))
	(setq list-040 (list "G Коррозионно-стойкая")
				list-050 (list "15 (0,03...3,5)" 
      								 "20 (0,05...5)" 
      								 "25 (0,07...8)" 
      								 "32 (0,16...11)" 
      								 "40 (0,2...17)"
      								 "50 (0,3...24)"
      						);list
      	list-090 list-050
      	list-140 (list "B По диаметру" "H По двум диаметрам")
   );setq
);if

(if (and (= "Без труб" str-030) (= "2 канала х 1 луч" str-020))
	(progn
		(setq list-040 (list "Нет")
					list-050 (list "Нет")
					list-090 list-050
  	);setq
	);progn
);if

(list-filling "txt-040" list-040)
(list-filling "txt-050" list-050)
(list-filling "txt-090" list-090)
(list-filling "txt-140" list-140)

(set_tile "txt-040" "0")
(set_tile "txt-050" "0")
(set_tile "txt-090" "0")
(set_tile "txt-140" "0")

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun txt-050-101-urg2km

( / str-050)

(setq str-050 (atoi (nth (atoi (get_tile "txt-050")) list-050)));setq

(cond 
	((> 250 str-050) (setq list-140 (list "B По диаметру" "H По двум диаметрам")));=
	((< 250 str-050) (setq list-140 (list "B По диаметру" "H По двум диаметрам" "L По одной хорде" "J По двум хордам")));=
);cond

(cond 
	((< 100 str-050) (setq list-110 (list "P Имитационная" "К Проливная")));=
	((>= 100 str-050) (setq list-110 (list "Q Технологическая" "P Имитационная" "К Проливная")));=
);cond

(list-filling "txt-110" list-110)
(list-filling "txt-140" list-140)

(set_tile "txt-110" "0")
(set_tile "txt-140" "0")

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма формирования данных/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun but1-101-urg2km

( / list-903 str-010 str-020 str-030 str-031 str-040 str-050 str-051 str-052 str-060 str-090 str-091 str-092 str-100 str-110 str-120 str-130 str-140 str-150 str-160 
str-170 str-992 str-993 swtch tmp-list-902)


 (if (/= list-901 nil) (setq list-902 (reverse list-902)));if

;считываем значения из полей диалога
(setq str-010 (nth (atoi (get_tile "txt-010")) list-010)
			str-020 (nth (atoi (get_tile "txt-020")) list-020)
			str-030 (nth (atoi (get_tile "txt-030")) list-030)
			str-040 (nth (atoi (get_tile "txt-040")) list-040)
			str-050 (nth (atoi (get_tile "txt-050")) list-050)
			str-060 (get_tile "txt-060")
			str-090 (nth (atoi (get_tile "txt-090")) list-090)
			str-100 (get_tile "txt-100")
			str-110 (nth (atoi (get_tile "txt-110")) list-110)
			str-120 (nth (atoi (get_tile "txt-120")) list-120)
			str-130 (nth (atoi (get_tile "txt-130")) list-130)
			str-140 (nth (atoi (get_tile "txt-140")) list-140)
			str-150 (nth (atoi (get_tile "txt-150")) list-150)
			str-160 (get_tile "txt-160")
			str-170 (get_tile "txt-170")
			list-903 ""
);setq

;обрабатываем соединение
(setq str-031
	(cond 
		((= "Без труб" str-030) "Без труб");=
		((/= "Без труб" str-030) (substr str-030 (+ (vl-string-search " " str-030) 2)));=
	);cond
);setq


;обрабатываем диаметр и пределы измерения
(cond
	((/= "Нет" str-050)
		(setq str-051 (substr str-050 1 (vl-string-search " " str-050));диаметр
					str-052 (vl-string-right-trim ")" (substr str-050 (+ (vl-string-search "(" str-050) 2))) ;пределы измерений
		);setq
	);=
	((= "Нет" str-050)
		(setq str-051 "Нет"
					str-052 "Нет"
		);setq
	);=
);=

(cond
	((and (/= "" str-090) (/= "Нет" str-090))
		(setq str-091 (substr str-090 1 (vl-string-search " " str-090));диаметр
					str-092 (vl-string-right-trim ")" (substr str-090 (+ (vl-string-search "(" str-090) 2))) ;пределы измерений
		);setq
	);=
	((or (= "Нет" str-090) (= "" str-090))
		(setq str-091 "Нет"
					str-092 "Нет"
		);setq
	);=
);cond

;если длина кабеля не задана
(if (= "" str-060) (setq str-060 "***"));if
(if (= "" str-100) (setq str-100 "***"));if

;обрабатываем спец опции
(cond 
	((= "1" str-160) (setq str-160 "Y" list-903 "Y "));=
	((= "0" str-160) (setq str-160 "X"));=
);cond

(cond
	((= "1" str-170) (setq str-170 "Z" list-903 (strcat list-903 "Z")));=
	((= "0" str-170) (setq str-170 "X"));=
);cond

(if (= list-903 "") (setq list-903 "Нет"));if

(cond
	((/= list-903 "") (setq list-903 (vl-string-right-trim " " list-903)));=
);cond

;обрабатываем массу упр
(setq str-992 ;канал 1
	(cond
		((= str-051 "15") "7");=
		((= str-051 "20") "7,6");=
		((= str-051 "25") "8");=
		((= str-051 "32") "9");=
		((= str-051 "40") "11");=
		((= str-051 "50") "33");=
		((= str-051 "65") "45");=
		((= str-051 "80") "51");=
		((= str-051 "100") "61");=
		((= str-051 "150") "97");=
		((= str-051 "200") "131");=
		((= str-051 "Нет") "0,7");=
		("> 150");=
	);cond
);if

(setq str-993 ;канал 2
	(cond
		((= str-091 "15") "7");=
		((= str-091 "20") "7,6");=
		((= str-091 "25") "8");=
		((= str-091 "32") "9");=
		((= str-091 "40") "11");=
		((= str-091 "50") "33");=
		((= str-091 "65") "45");=
		((= str-091 "80") "51");=
		((= str-091 "100") "61");=
		((= str-091 "150") "97");=
		((= str-091 "200") "131");=
		((= str-091 "Нет") "0,7");=
		("> 150");=
	);cond
);if

(if (= "1 канал х 1 луч" str-020)
	(setq list-901 (vl-list* (strcat str-010 "  " 
																	 str-020 "  "
																 	 str-031 "  "
																 	 (if (/= str-040 "Нет")
																 	 	(strcat "Материал " (substr str-040 1 (vl-string-search " " str-040)) "  ")
																 	 	(strcat "")
																 	 );if
																 	 (if (/= str-051 "Нет")
																 	 	(strcat "Ду " str-051 " мм  ")
																 	 	(strcat "")
																 	 );if
																 	 "Длина кабеля " str-060 " м  "
																 	 "Поверка " (substr str-110 1 (vl-string-search " " str-110)) "  "
																 	 "Исп. ЭБ " (substr str-120 1 (vl-string-search " " str-120)) "  "
																 	 "Доп. выходы " (substr str-130 1 (vl-string-search " " str-130)) "  "
																 	 "Врезка ПЭП " (substr str-140 1 (vl-string-search " " str-140)) "  "
																 	 "Ток. выход " (substr str-150 1 (vl-string-search " " str-150)) "  "
																 	 "Спец. опции " list-903
																 	 ) list-901)
	);setq
);if


(if (= "1 канал х 2 луча" str-020)
	(setq list-901 (vl-list* (strcat str-010 "  " 
																	 str-020 "  "
																 	 str-031 "  "
																 	 (if (/= str-040 "Нет")
																 	 	(strcat "Материал " (substr str-040 1 (vl-string-search " " str-040)) "  ")
																 	 	(strcat "")
																 	 );if
																 	 (if (/= str-051 "Нет")
																 	 	(strcat "Ду " str-051 " мм  ")
																 	 	(strcat "")
																 	 );if
																 	 "Длина кабеля " str-060 " м  "
																 	 "Поверка " (substr str-110 1 (vl-string-search " " str-110)) "  "
																 	 "Исп. ЭБ " (substr str-120 1 (vl-string-search " " str-120)) "  "
																 	 "Доп. выходы " (substr str-130 1 (vl-string-search " " str-130)) "  "
																 	 "Врезка ПЭП " (substr str-140 1 (vl-string-search " " str-140)) "  "
																 	 "Ток. выход " (substr str-150 1 (vl-string-search " " str-150)) "  "
																 	 "Спец. опции " list-903
																 	 ) list-901)
	);setq
);if

(if (= "2 канала х 1 луч" str-020)
	(setq list-901 (vl-list* (strcat str-010 "  " 
																	 str-020 "  "
																	 str-031 "  "
																	 (if (/= str-040 "Нет")
																		(strcat "Материал " (substr str-040 1 (vl-string-search " " str-040)) "  ")
																 	 	(strcat "")
																 	 );if
																	 "Канал 1 ("																 	 
																 	 (if (/= str-051 "Нет")
																 	 	(strcat "Ду " str-051 " мм  ")
																 	 	(strcat "")
																 	 );if
																 	 "Дл. кабеля " str-060 " м)  "
																 	 "Канал 2 ("
																 	 (if (/= str-091 "Нет")
																 	 	(strcat "Ду " str-091 " мм  ")
																 	 	(strcat "")
																 	 );if
																 	 "Дл. кабеля " str-100 " м)  "
																 	 "Поверка " (substr str-110 1 (vl-string-search " " str-110)) "  "
																 	 "Исп. ЭБ " (substr str-120 1 (vl-string-search " " str-120)) "  "
																 	 "Доп. выходы " (substr str-130 1 (vl-string-search " " str-130)) "  "
																 	 "Врезка ПЭП " (substr str-140 1 (vl-string-search " " str-140)) "  "
																 	 "Ток. выход " (substr str-150 1 (vl-string-search " " str-150)) "  "
																 	 "Спец. опции " list-903
																 	 ) list-901)
	);setq
);if

(setq tmp-list-902 (list (cons 0 "Ультразвуковой расходомер") 
												 (cons 10 str-010)
												 (cons 20 str-020)
												 (cons 30 (substr str-030 1 (vl-string-search " " str-030)))
												 (cons 40 (substr str-040 1 (vl-string-search " " str-040)))
												 (cons 51 str-051);диаметр
												 (cons 52 str-052);пределы измерений
												 (cons 60 str-060)
												 (cons 91 str-091);диаметр
												 (cons 92 str-092);пределы измерений
												 (cons 100 str-100)
												 (cons 110 (substr str-110 1 (vl-string-search " " str-110)))
												 (cons 120 (substr str-120 1 (vl-string-search " " str-120)))
												 (cons 130 (substr str-130 1 (vl-string-search " " str-130)))
												 (cons 140 (substr str-140 1 (vl-string-search " " str-140)))
												 (cons 150 (substr str-150 1 (vl-string-search " " str-150)))
												 (cons 160 str-160)
												 (cons 170 str-170)
									 			 (cons 991 "1,7");массса электронного блока
									 			 (cons 992 str-992);массса УПР, канала 1
									 			 (cons 993 str-993);массса УПР, канала 2
									 			 );list
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
(defun le-101-urg2km

( / cntr-1 dlt-y nmbr-ln pnt-ins str-tmp tmp-000 tmp-010 tmp-020 tmp-030 tmp-050 tmp-051 tmp-052 tmp-053 tmp-070 tmp-090 tmp-091 
tmp-092 tmp-093 x-pnt-ins y-pnt-ins y-pnt-ins-1)

(setq cntr-1 0 ;счетчик
);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				tmp-000 (cdr (assoc 0 str-tmp))
				tmp-010 (cdr (assoc 10 str-tmp))
				tmp-020 (cdr (assoc 20 str-tmp))
				tmp-030 (cdr (assoc 30 str-tmp))
				tmp-051 (cdr (assoc 51 str-tmp))
				tmp-052 (cdr (assoc 52 str-tmp))
				tmp-091 (cdr (assoc 91 str-tmp))
				tmp-092 (cdr (assoc 92 str-tmp))
	);setq


	(setq tmp-053
		(cond
			((= tmp-051 "Нет") (strcat "исполнение без труб"));=
			((/= tmp-051 "Нет") (strcat "Ду " tmp-051 " мм, пределы измерений " tmp-052 " м3/ч"));=
		);cond
	);setq

	(setq tmp-093
		(cond
			((= tmp-091 "Нет") (strcat "исполнение без труб"));=
			((/= tmp-091 "Нет") (strcat "Ду " tmp-091 " мм, пределы измерений " tmp-092 " м3/ч"));=
		);cond
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

	;;;;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	(if (= "1 канал х 1 луч" tmp-020)
		(progn
			(setq nmbr-ln 6);setq
						
			(1000-delete-items-le nmbr-ln x-pnt-ins y-pnt-ins)
			(1000-delete-items-le-2 (- nmbr-ln 2) x-pnt-ins (- y-pnt-ins 8)); удаление в графе "количество"
			
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 (strcat tmp-000 " УРЖ2КМ, " (strcase tmp-010 1) ", однолучевой,"))
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat tmp-053 ", в составе:"))
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 (strcat "- электронный блок"))
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 3)) 4)) 2.5 0 (strcat "- пьезоэлектрический  преобразователь"))
			(command "_text" "_MC" (list (+ x-pnt-ins 115) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 "1")
			
			(cond ;количество ПЭП или УПР
				((= tmp-051 "Нет") (command "_text" "_MC" (list (+ x-pnt-ins 115) (- (- y-pnt-ins (* dlt-y 4)) 4)) 2.5 0 "2"));=
				((/= tmp-051 "Нет") (command "_text" "_MC" (list (+ x-pnt-ins 115) (- (- y-pnt-ins (* dlt-y 4)) 4)) 2.5 0 "1"));=
			);cond
		);progn
	);if

	;;;;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////		
	(if (= "1 канал х 2 луча" tmp-020)
		(progn
			(setq nmbr-ln 5
			);setq
			
			(1000-delete-items-le nmbr-ln x-pnt-ins y-pnt-ins)
			(1000-delete-items-le-2 (- nmbr-ln 2) x-pnt-ins (- y-pnt-ins 8)); удаление в графе "количество"
			
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 (strcat tmp-000 " УРЖ2КМ, " (strcase tmp-010 1) ", двухлучевой,"))
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat tmp-053 ", в составе:"))
			;
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 (strcat "- электронный блок"))
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 3)) 4)) 2.5 0 (strcat "- пьезоэлектрический  преобразователь"))
			(command "_text" "_MC" (list (+ x-pnt-ins 115) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 "1")
			(command "_text" "_MC" (list (+ x-pnt-ins 115) (- (- y-pnt-ins (* dlt-y 3)) 4)) 2.5 0 "4")
		);progn
	);if

	(if (= "2 канала х 1 луч" tmp-020)
		(progn
			(if (/= tmp-091 tmp-051)
				(setq nmbr-ln 6);setq
				(setq nmbr-ln 5);setq
			);if
						
			(1000-delete-items-le nmbr-ln x-pnt-ins y-pnt-ins)
			(1000-delete-items-le-2 (- nmbr-ln 2) x-pnt-ins (- y-pnt-ins 8)); удаление в графе "количество"
			
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 (strcat tmp-000 " УРЖ2КМ, " (strcase tmp-010 1) ", однолучевой,"))
			(if (/= tmp-091 tmp-051)
				(progn
					(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "канал 1 (" tmp-053 "),"))
					(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 (strcat "канал 2 (" tmp-093 "), в составе:"))
					;
					(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 3)) 4)) 2.5 0 (strcat "- электронный блок"))
					(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 4)) 4)) 2.5 0 (strcat "- пьезоэлектрический  преобразователь"))
					(command "_text" "_MC" (list (+ x-pnt-ins 115) (- (- y-pnt-ins (* dlt-y 3)) 4)) 2.5 0 "1")
					(command "_text" "_MC" (list (+ x-pnt-ins 115) (- (- y-pnt-ins (* dlt-y 4)) 4)) 2.5 0 "4")
				);progn
			);if

			(if (= tmp-091 tmp-051)
				(progn
					(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "канал 1 и 2 (" tmp-053 ") в составе:"))
					;
					(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 (strcat "- электронный блок"))
					(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 3)) 4)) 2.5 0 (strcat "- пьезоэлектрический  преобразователь"))
					(command "_text" "_MC" (list (+ x-pnt-ins 115) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 "1")
					(command "_text" "_MC" (list (+ x-pnt-ins 115) (- (- y-pnt-ins (* dlt-y 3)) 4)) 2.5 0 "4")
				);progn
			);if
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
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в СПЦФ                 //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun spcf-101-urg2km

( / cntr-1 dlt-y nmbr-ln nmbr-str pnt-ins str-000 str-010 str-020 str-030 str-031 str-032 str-040 str-041 str-042 str-051 str-052 str-054 str-060 str-091 str-092 str-094 
str-100 str-110 str-111 str-120 str-121 str-130 str-131 str-140 str-141 str-150 str-151 str-160 str-161 str-162 str-170 str-171 str-172 str-991 str-992 str-993 str-tmp 
x-pnt-ins y-pnt-ins y-pnt-ins-1)

(setq cntr-1 0);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-000 (cdr (assoc 0 str-tmp))
				str-010 (cdr (assoc 10 str-tmp))
				str-020 (cdr (assoc 20 str-tmp))
				str-030 (cdr (assoc 30 str-tmp))
				str-040 (cdr (assoc 40 str-tmp))
				str-051 (cdr (assoc 51 str-tmp)) ;диаметр
				str-052 (cdr (assoc 52 str-tmp)) ;пределы измерений
				str-060 (cdr (assoc 60 str-tmp))
				str-091 (cdr (assoc 91 str-tmp)) ;диаметр
				str-092 (cdr (assoc 92 str-tmp)) ;пределы измерений
				str-100 (cdr (assoc 100 str-tmp))
				str-110 (cdr (assoc 110 str-tmp))
				str-120 (cdr (assoc 120 str-tmp))
				str-130 (cdr (assoc 130 str-tmp))
				str-140 (cdr (assoc 140 str-tmp))
				str-150 (cdr (assoc 150 str-tmp))
				str-160 (cdr (assoc 160 str-tmp))
				str-170 (cdr (assoc 170 str-tmp))
				str-991 (cdr (assoc 991 str-tmp))
				str-992 (cdr (assoc 992 str-tmp))
				str-993 (cdr (assoc 993 str-tmp))
	);setq
     

	(if (or (= str-060 "***") (= str-100 "***"))
		(alert "Длину(ы) кабеля(ей) не заданы!!!")
	);if

	(cond
		((= str-030 "O") (setq str-032 "O" str-031 "фланцевое"));=
		((= str-030 "E") (setq str-032 "E" str-031 "сварное"));=
		((= str-030 "Z") (setq str-032 "Z" str-031 "резьбовое"));=
		((= str-030 "Без") (setq str-032 "X"));=
	);cond

	(cond
		((= str-040 "F") (setq str-042 "F" str-041 "углеродистая сталь"));=
		((= str-040 "G") (setq str-042 "G" str-041 "коррозионно-стойкая сталь"));=
		((= str-040 "Нет") (setq str-042 "X"));=
	);cond

	(cond ;обрабатываем диаметр
		((/= str-051 "Нет")
			(if (/= (vl-position str-051 (list "15" "20" "25" "32" "40" "50" "65" "80")) nil) ;прибавляем "0" если Ду меньше 100
  			(setq str-054 (strcat "0" str-051));setq
  			(setq str-054 str-051);setq
  		);if
		);=
		
		((= str-051 "Нет")
			(setq str-054 "000"	;для строки заказа
			);setq
		);=
	);cond

	(cond ;обрабатываем диаметр
		((/= str-091 "Нет")
			(if (/= (vl-position str-091 (list "15" "20" "25" "32" "40" "50" "65" "80")) nil) ;прибавляем "0" если Ду меньше 100
  			(setq str-094 (strcat "0" str-091));setq
  			(setq str-094 str-091);setq
			);if
		);=
		
		((= str-091 "Нет")
			(setq str-094 "000"	;для строки заказа
			);setq
		);=
	);cond

	(cond
		((= str-110 "Q") (setq str-111 "технологическая"));=
		((= str-110 "P") (setq str-111 "имитационная"));=
		((= str-110 "K") (setq str-111 "проливная"));=
	);cond
	
	(cond
		((= str-120 "A") (setq str-121 "архиватор, RS-232, RS-485"));=
		((= str-120 "D") (setq str-121 "архиватор, RS-232"));=
		((= str-120 "U") (setq str-121 "без архиватора, RS-232"));=
	);cond

	(cond
		((= str-130 "V") (setq str-131 "Ethernet"));=
		((= str-130 "W") (setq str-131 "Ethernet, USB"));=
		((= str-130 "I") (setq str-131 "USB"));=
	);cond

	(cond
		((= str-140 "B") (setq str-141 "по диаметру"));=
		((= str-140 "L") (setq str-141 "по одной хорде"));=
		((= str-140 "J") (setq str-141 "по двум хордам"));=
		((= str-140 "H") (setq str-141 "по двум диаметрам"));=
	);cond

	(cond
		((= str-150 "T") (setq str-151 "4...20"));=
		((= str-150 "S") (setq str-151 "0...5"));=
	);cond

	(cond
		((= str-160 "Y") (setq str-162 "-Y" str-161 "автономным питанием"));=
		((/= str-160 "Y") (setq str-162 "-X"));=
	);cond

	(cond
		((= str-170 "Z") (setq str-172 "-Z" str-171 "усилитель на 6 Дб с гальванической развязкой, встроенный в ПЭП"));=
		((/= str-170 "Z") (setq str-172 "-X"));=
	);cond
	
	(setvar "osmode" 6199)
	(setq pnt-ins		(getpoint "\nУкажите точку вставки\n")
				x-pnt-ins (nth 0 pnt-ins)
				y-pnt-ins (nth 1 pnt-ins)
				y-pnt-ins-1 y-pnt-ins
				dlt-y 8
	); setq

	(101-empt-lin-spcf)
	
	;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	(if (= str-020 "1 канал х 1 луч")
		(progn
		
			(cond
				((/= str-051 "Нет") (setq nmbr-ln 13 nmbr-str 11));=
				((= str-051 "Нет") (setq nmbr-ln 10 nmbr-str 8));=
			);cond

			(1000-delete-items-spcf nmbr-ln pnt-ins)
			(1000-delete-items-spcf-crtf nmbr-ln pnt-ins)
			(1000-delete-items-spcf-parts nmbr-ln pnt-ins)
				
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 (strcat str-000 " в составе:"))
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 "- электронный блок (далее - ЭБ)")

			(cond
				((/= str-051 "Нет")
					(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 (strcat "- ультразвуковой преобразователь расхода (далее - УПР), " "Ду " 
						str-051 " мм,"))
					(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 3)) 4)) 2.5 0 (strcat "пределы измерений " str-052 " м3/ч"))
					(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 4)) 4)) 2.5 0 (strcat "- длина кабеля " str-060 " м"))
					(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 5)) 4)) 2.5 0 (strcat "- соединение УПР " str-031))
					(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 6)) 4)) 2.5 0 (strcat "- материал УПР " str-041))
					(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 7)) 4)) 2.5 0 (strcat "- поверка " str-111))
					(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 8)) 4)) 2.5 0 (strcat "- исполнение ЭБ " str-121))
					(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 9)) 4)) 2.5 0 (strcat "- ЭБ с " str-131))
					(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 10)) 4)) 2.5 0 (strcat "- врезка пъезоэлектрических преобразователей " str-141))
					(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 11)) 4)) 2.5 0 (strcat "- токовый выход " str-151 " мА"))
					;
					(command "_text" "_MC" (list (+ x-pnt-ins 300) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 "1");кол. ЭБ
					(command "_text" "_MC" (list (+ x-pnt-ins 300) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 "1");кол. УПР
					;
					(command "_text" "_MC" (list (+ x-pnt-ins 280) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 "шт.")
					(command "_text" "_MC" (list (+ x-pnt-ins 280) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 "шт.")
				);=
				
				((= str-051 "Нет")
					(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 "- пьезоэлектрический  преобразователь (исполнение без труб)")
					(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 3)) 4)) 2.5 0 (strcat "- длина кабеля " str-060 " м"))
					(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 4)) 4)) 2.5 0 (strcat "- поверка " str-111))
					(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 5)) 4)) 2.5 0 (strcat "- исполнение ЭБ " str-121))
					(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 6)) 4)) 2.5 0 (strcat "- ЭБ с " str-131))
					(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 7)) 4)) 2.5 0 (strcat "- врезка пъезоэлектрических преобразователей " str-141))
					(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 8)) 4)) 2.5 0 (strcat "- токовый выход " str-151 " мА"))
					;
					(command "_text" "_MC" (list (+ x-pnt-ins 300) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 "1");кол. ЭБ
					(command "_text" "_MC" (list (+ x-pnt-ins 300) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 "2");кол. ПЭП
					;
					(command "_text" "_MC" (list (+ x-pnt-ins 280) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 "шт.")
					(command "_text" "_MC" (list (+ x-pnt-ins 280) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 "шт.")
				);=
			);cond
			
			(cond
				((= str-160 "Y") ;автономное питание
					(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y (+ nmbr-str 1))) 4)) 2.5 0 (strcat "- с " str-161))
					(setq nmbr-ln (1+ nmbr-ln)
								nmbr-str (1+ nmbr-str)
					);setq
				);=

				((/= str-160 "Y") ;автономное питание
					(cond
						((/= str-051 "Нет") (setq nmbr-ln 13 nmbr-str 11));=
						((= str-051 "Нет") (setq nmbr-ln 10 nmbr-str 8));=
					);cond
				);=
			);cond

			(if (= str-170 "Z") ;усилитель
				(progn
					(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y (+ nmbr-str 1))) 4)) 2.5 0 (strcat "- " str-171))
					(setq nmbr-ln (1+ nmbr-ln));setq
				);progn
			);setq
			;
			(command "_text" "_MC" (list (+ x-pnt-ins 322.5) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 str-991);масса ЭБ
			(command "_text" "_MC" (list (+ x-pnt-ins 322.5) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 str-992);масса УПР
			
			;подготавливаем сроку заказа
			(command "_TEXT" "_MC" (list (+ x-pnt-ins 160) (- y-pnt-ins 4)) 2.5 0 (strcat "УРЖ2КМ-" (substr str-010 (+ (vl-string-search " " str-010) 2)) "-" str-054 "/000-" 
				str-060 "/XXX-"))
			(command "_TEXT" "_MC" (list (+ x-pnt-ins 160) (- y-pnt-ins 12)) 2.5 0 (strcat str-032 "-" str-042 "-" str-110 "-" str-120 "-" str-130 "-" str-140 "-" str-150  
				str-162 str-172))
		);progn
	);if
	

	;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	(if (= str-020 "1 канал х 2 луча")
		(progn
		
			(cond
				((/= str-051 "Нет") (setq nmbr-ln 13 nmbr-str 11));=
				((= str-051 "Нет") (setq nmbr-ln 10 nmbr-str 8));=
			);cond
		
			(1000-delete-items-spcf nmbr-ln pnt-ins)
			(1000-delete-items-spcf-crtf nmbr-ln pnt-ins)
			(1000-delete-items-spcf-parts nmbr-ln pnt-ins)

			(cond 
				((/= "Нет" str-051)
					(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 (strcat str-000 " в составе:"))
					(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 "- электронный блок (далее - ЭБ)")
					(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 (strcat "- ультразвуковой преобразователь расхода (далее - УПР), Ду " 
					str-051 " мм"))
					(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 3)) 4)) 2.5 0 (strcat "- пределы измерений " str-052 " м3/ч"))
					(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 4)) 4)) 2.5 0 (strcat "- длина кабеля " str-060 " м"))
					(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 5)) 4)) 2.5 0 (strcat "- соединение УПР " str-031))
					(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 6)) 4)) 2.5 0 (strcat "- материал УПР " str-041))
					(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 7)) 4)) 2.5 0 (strcat "- поверка " str-111))
					(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 8)) 4)) 2.5 0 (strcat "- исполнение ЭБ " str-121))
					(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 9)) 4)) 2.5 0 (strcat "- ЭБ с " str-131))
					(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 10)) 4)) 2.5 0 (strcat "- врезка пъезоэлектрических преобразователей " str-141))
					(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 11)) 4)) 2.5 0 (strcat "- токовый выход " str-151 " мА"))
					;
					(command "_text" "_MC" (list (+ x-pnt-ins 300) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 "1");кол. УПР
				);=
				
				((= "Нет" str-051)				
					(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 (strcat str-000 " в составе:"))
					(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 "- электронный блок (далее - ЭБ)")
					(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 "- пьезоэлектрический  преобразователь (исполнение без труб)")
					(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 3)) 4)) 2.5 0 (strcat "- длина кабеля " str-060 " м"))
					(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 4)) 4)) 2.5 0 (strcat "- поверка " str-111))
					(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 5)) 4)) 2.5 0 (strcat "- исполнение ЭБ " str-121))
					(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 6)) 4)) 2.5 0 (strcat "- ЭБ с " str-131))
					(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 7)) 4)) 2.5 0 (strcat "- врезка пъезоэлектрических преобразователей " str-141))
					(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 8)) 4)) 2.5 0 (strcat "- токовый выход " str-151 " мА"))
					;
					(command "_text" "_MC" (list (+ x-pnt-ins 300) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 "4");кол. ПЭП
				);=
			);cond
		
			(cond
				((= str-160 "Y") ;автономное питание
					(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y (+ nmbr-str 1))) 4)) 2.5 0 (strcat "- с " str-161))
					(setq nmbr-ln (1+ nmbr-ln)
								nmbr-str (1+ nmbr-str)
					);setq
				);=

				((/= str-160 "Y") ;автономное питание
					(cond
						((/= str-051 "Нет") (setq nmbr-ln 13 nmbr-str 11));=
						((= str-051 "Нет") (setq nmbr-ln 10 nmbr-str 8));=
					);cond
				);=
			);cond

			(if (= str-170 "Z") ;усилитель
				(progn
					(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y (+ nmbr-str 1))) 4)) 2.5 0 (strcat "- " str-171))
					(setq nmbr-ln (1+ nmbr-ln));setq
				);progn
			);setq
			;
			(command "_text" "_MC" (list (+ x-pnt-ins 300) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 "1");кол. ЭБ
			;
			(command "_text" "_MC" (list (+ x-pnt-ins 280) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 "шт.")
			(command "_text" "_MC" (list (+ x-pnt-ins 280) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 "шт.")
			;
			(command "_text" "_MC" (list (+ x-pnt-ins 322.5) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 str-991);масса ЭБ
			(command "_text" "_MC" (list (+ x-pnt-ins 322.5) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 str-992);масса УПР
			
			;подготавливаем сроку заказа
			(command "_TEXT" "_MC" (list (+ x-pnt-ins 160) (- y-pnt-ins 4)) 2.5 0 (strcat "УРЖ2КМ-" (substr str-010 (+ (vl-string-search " " str-010) 2)) "-" str-054 "/000-" 
				str-060 "/XXХ-"))
			(command "_TEXT" "_MC" (list (+ x-pnt-ins 160) (- y-pnt-ins 12)) 2.5 0 (strcat str-032 "-" str-042 "-" str-110 "-" str-120 "-" str-130 "-" str-140 "-" str-150
				str-162 str-172))
		);progn
	);if


	;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	(if (= str-020 "2 канала х 1 луч")
		(progn
			(cond
				((/= str-051 "Нет") (setq nmbr-ln 14 nmbr-str 12));=
				((= str-051 "Нет") (setq nmbr-ln 10 nmbr-str 8));=
			);cond

			(1000-delete-items-spcf nmbr-ln pnt-ins)
			(1000-delete-items-spcf-crtf nmbr-ln pnt-ins)
			(1000-delete-items-spcf-parts nmbr-ln pnt-ins)
				
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 (strcat str-000 " в составе:"))
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 "- электронный блок (далее - ЭБ)")

			(cond
				((and (/= str-051 "Нет") (/= str-091 "Нет"))
					(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 (strcat "- ультразвуковой преобразователь расхода (далее - УПР), Ду " 
						str-051 " мм,"))
					(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 3)) 4)) 2.5 0 (strcat "пределы измерений " str-052 " м3/ч (канал 1)"))
					(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 4)) 4)) 2.5 0 (strcat "- УПР, ДУ " str-091 "мм, пределы измерений " str-092 " м3/ч (канал 2)"))
					(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 5)) 4)) 2.5 0 (strcat "- длина кабеля (канал 1 / канал 2) " str-060 " / " str-060 " м"))
					(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 6)) 4)) 2.5 0 (strcat "- соединение УПР " str-031))
					(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 7)) 4)) 2.5 0 (strcat "- материал УПР " str-041))
					(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 8)) 4)) 2.5 0 (strcat "- поверка " str-111))
					(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 9)) 4)) 2.5 0 (strcat "- исполнение ЭБ " str-121))
					(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 10)) 4)) 2.5 0 (strcat "- ЭБ с " str-131))
					(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 11)) 4)) 2.5 0 (strcat "- врезка пъезоэлектрических преобразователей " str-141))
					(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 12)) 4)) 2.5 0 (strcat "- токовый выход " str-151 " мА"))
					;
					(command "_text" "_MC" (list (+ x-pnt-ins 300) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 "1");кол. ЭБ
					(command "_text" "_MC" (list (+ x-pnt-ins 300) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 "1");кол. УПР, канал 1
					(command "_text" "_MC" (list (+ x-pnt-ins 300) (- (- y-pnt-ins (* dlt-y 4)) 4)) 2.5 0 "1");кол. УПР, канал 1
					;
					(command "_text" "_MC" (list (+ x-pnt-ins 280) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 "шт.")
					(command "_text" "_MC" (list (+ x-pnt-ins 280) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 "шт.")
					(command "_text" "_MC" (list (+ x-pnt-ins 280) (- (- y-pnt-ins (* dlt-y 4)) 4)) 2.5 0 "шт.")
					;
					(command "_text" "_MC" (list (+ x-pnt-ins 322.5) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 str-992);масса УПР, канал 1
					(command "_text" "_MC" (list (+ x-pnt-ins 322.5) (- (- y-pnt-ins (* dlt-y 4)) 4)) 2.5 0 str-993);масса УПР, канал 1
				);=
				
				((and (= str-051 "Нет") (= str-091 "Нет"))
					(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 "- пьезоэлектрический  преобразователь (исполнение без труб)")
					(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 3)) 4)) 2.5 0 (strcat "- длина кабеля (канал 1 / канал 2) " str-060 " / " str-100 " м"))
					(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 4)) 4)) 2.5 0 (strcat "- поверка " str-111))
					(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 5)) 4)) 2.5 0 (strcat "- исполнение ЭБ " str-121))
					(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 6)) 4)) 2.5 0 (strcat "- ЭБ с " str-131))
					(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 7)) 4)) 2.5 0 (strcat "- врезка пъезоэлектрических преобразователей " str-141))
					(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 8)) 4)) 2.5 0 (strcat "- токовый выход " str-151 " мА"))
					;
					(command "_text" "_MC" (list (+ x-pnt-ins 300) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 "1");кол. ЭБ
					(command "_text" "_MC" (list (+ x-pnt-ins 300) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 "1");кол. УПР, канал 1
					;
					(command "_text" "_MC" (list (+ x-pnt-ins 280) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 "шт.")
					(command "_text" "_MC" (list (+ x-pnt-ins 280) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 "шт.")
				);=
			);cond
			
			(cond
				((= str-160 "Y") ;автономное питание
					(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y (+ nmbr-str 1))) 4)) 2.5 0 (strcat "- с " str-161))
					(setq nmbr-ln (1+ nmbr-ln)
								nmbr-str (1+ nmbr-str)
					);setq
				);=

				((/= str-160 "Y") ;автономное питание
					(cond
						((/= str-051 "Нет") (setq nmbr-ln 14 nmbr-str 12));=
						((= str-051 "Нет") (setq nmbr-ln 10 nmbr-str 8));=
					);cond
				);=
			);cond

			(if (= str-170 "Z") ;усилитель
				(progn
					(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y (+ nmbr-str 1))) 4)) 2.5 0 (strcat "- " str-171))
					(setq nmbr-ln (1+ nmbr-ln));setq
				);progn
			);setq
			;
			(command "_text" "_MC" (list (+ x-pnt-ins 322.5) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 str-991);масса ЭБ
			
			;подготавливаем сроку заказа
			(command "_TEXT" "_MC" (list (+ x-pnt-ins 160) (- y-pnt-ins 4)) 2.5 0 (strcat "УРЖ2КМ-" (substr str-010 (+ (vl-string-search " " str-010) 2)) "-" str-054 "/" 
				str-094 "-" str-060 "/" str-100 "-"))
			(command "_TEXT" "_MC" (list (+ x-pnt-ins 160) (- y-pnt-ins 12)) 2.5 0 (strcat str-032 "-" str-042 "-" str-110 "-" str-120 "-" str-130 "-" str-140 "-" str-150  
				str-162 str-172))
		);progn
	);if


	(command "_text" "_MC" (list (+ x-pnt-ins 247.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "ЗАО Фирма")
	(command "_text" "_MC" (list (+ x-pnt-ins 247.5) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 "\"ТЕСС-инжиниринг\",")		
	(command "_text" "_MC" (list (+ x-pnt-ins 247.5) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 "г. Чебоксары")
	;
	(command "_text" "_MC" (list (+ x-pnt-ins 280) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "компл.")
	;
	(command "_TEXT" "_ML" (list (+ x-pnt-ins 336) (- y-pnt-ins 4)) 2.5 0 "Внесен в Госреестр");сертификат
	(command "_TEXT" "_ML" (list (+ x-pnt-ins 336) (- y-pnt-ins 12)) 2.5 0 "средств измерений,")
	(command "_TEXT" "_ML" (list (+ x-pnt-ins 336) (- y-pnt-ins 20)) 2.5 0 "№23363-07, сертификат")
	(command "_TEXT" "_ML" (list (+ x-pnt-ins 336) (- y-pnt-ins 28)) 2.5 0 "об утверждении типа")
	(command "_TEXT" "_ML" (list (+ x-pnt-ins 336) (- y-pnt-ins 36)) 2.5 0 "средств измерений")
	(command "_TEXT" "_ML" (list (+ x-pnt-ins 336) (- y-pnt-ins 44)) 2.5 0 "RU.C.29.006.A №28095")
	(command "_TEXT" "_ML" (list (+ x-pnt-ins 336) (- y-pnt-ins 52)) 2.5 0 "от 11.06.2007г.")
	
	(repeat nmbr-ln
		(command "_insert" "зс-пустая-строка" "_X" 1 "_Y" 1 "_Z" 1 "_R" 0 (list x-pnt-ins y-pnt-ins-1))
		(setq y-pnt-ins-1 (- y-pnt-ins-1 8));setq
	);repeat

	(setq cntr-1 (+ cntr-1 1));setq
);repeat

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в овш               /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun lecgv-101-urg2km

( / cntr-1 dlt-y nmbr-ln pnt-ins str-010 str-011 str-020 str-021 str-022 str-030 str-040 str-110 str-111 str-120 str-121 str-130 str-131 str-150 str-151 str-160 str-161 
str-991 str-tmp x-pnt-ins y-pnt-ins y-pnt-ins-1)

(setq cntr-1 0 ;счетчик
);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-010 (cdr (assoc 10 str-tmp))
				str-020 (cdr (assoc 20 str-tmp))
				str-030 (cdr (assoc 30 str-tmp))
				str-040 (cdr (assoc 40 str-tmp))
				str-110 (cdr (assoc 110 str-tmp))
				str-120 (cdr (assoc 120 str-tmp))
				str-130 (cdr (assoc 130 str-tmp))
				str-150 (cdr (assoc 150 str-tmp))
				str-160 (cdr (assoc 160 str-tmp))
				str-991 (cdr (assoc 991 str-tmp))
	);setq

	(cond
		((= str-010 "Модель 1") (setq str-011 "модель 1"));=
		((= str-010 "Модель 2") (setq str-011 "модель 2"));=
	);cond

	(cond
		((= str-020 "1 канал х 1 луч") (setq str-021 "одноканальный" str-022 "однолучевой"));=
		((= str-020 "1 канал х 2 луча") (setq str-021 "одноканальный" str-022 "двухлучевой"));=
		((= str-020 "2 канала х 1 луч") (setq str-021 "двухканальный" str-022 "однолучевой"));=
	);cond

	(cond
		((= str-110 "Q") (setq str-111 "технологическая"));=
		((= str-110 "P") (setq str-111 "имитационная"));=
		((= str-110 "K") (setq str-111 "проливная"));=
	);cond
	
	(cond
		((= str-120 "A") (setq str-121 "архиватор, RS-232, RS-485"));=
		((= str-120 "D") (setq str-121 "архиватор, RS-232"));=
		((= str-120 "U") (setq str-121 "без архиватора, RS-232"));=
	);cond

	(cond
		((= str-130 "V") (setq str-131 "Ethernet"));=
		((= str-130 "W") (setq str-131 "Ethernet, USB"));=
		((= str-130 "I") (setq str-131 "USB"));=
	);cond

	(cond
		((= str-150 "T") (setq str-151 "4...20"));=
		((= str-150 "S") (setq str-151 "0...5"));=
	);cond

	(cond
		((= str-160 "Y") (setq str-161 "автономным питанием"));=
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
	
	(setq nmbr-ln 7);setq

	(1000-delete-items-le-cgv nmbr-ln x-pnt-ins y-pnt-ins);удаление предыдущей записи
	
	;обработка данных	
	;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Электронный блок из состава")
	(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 "расходомера ультразвукового")
	(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 (strcat "УРЖ2КМ, " str-011 ", " str-021 ","))
	(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 3)) 4)) 2.5 0 (strcat str-022 ", " str-111 " поверка,"))
	(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 4)) 4)) 2.5 0 (strcat str-121 ","))
	(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 5)) 4)) 2.5 0 (strcat str-131 ", " str-151 " мА"))
	
	(cond
	 ((= str-160 "Y")
	 	(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 5)) 4)) 2.5 0 (strcat str-131 ", " str-151 " мА,"))
	 	(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 6)) 4)) 2.5 0 (strcat "с " str-161))
	 	(setq nmbr-ln 8);setq
	 );=
	 
	 ((/= str-160 "Y")
	 	(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 5)) 4)) 2.5 0 (strcat str-131 ", " str-151 " мА"))
	 );=
	);cond
		
	(command "_TEXT" "_MC" (list (+ x-pnt-ins 142.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 str-991)
		
	(repeat nmbr-ln
  	(command "_insert" "овш-пэ-пустая-строка" "_X" 1 "_Y" 1 "_Z" 1 "_R" 0 (list x-pnt-ins y-pnt-ins-1))
  	(setq y-pnt-ins-1 (- y-pnt-ins-1 8));setq
	);repeat
 
	(setq cntr-1 (+ cntr-1 1));setq
);repeat

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
















