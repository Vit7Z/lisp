;/////// ************************************************************ //////////////////////////////////////////////////
;///////                                                              //////////////////////////////////////////////////
;/////// ************************************************************ //////////////////////////////////////////////////
(defun 101-01-thermoponit-tsb-indust-01-general

( / adoc counter dcl-id list-01 list-02 list-03 list-04 list-05 list-06 list-07 list-08 list-09 list-10 list-11 
list-13 list-14 list-15 list-17 list-18 list-19 list-21 list-22 list-23 list-24 list-25 list-26 list-27 list-29 list-30 
list-31 list-32 list-33 list-901 list-902 str-01 str-f type-list)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(setq str-f 1
			str-01 nil
      counter 0
      list-01 (list "ТС-Б, головка тип Ж, крепл. НШ, прямой термобаллон"
      							"КТС-Б, головка тип Ж, крепл. ПШ, прямой термобаллон")
      list-901 nil
      list-902 nil
      
      ;для гильзы
      list-21 (list "ГЦР.103Н, для НШ")
			list-22 (list "6,3")
			list-23 (list "М20х1,5")
			list-24 (list "М20х1,5")
			list-25 (list "10")
      list-26 (list "8") 
      list-27 (list "60" "80" "100" "120" "160" "200" "250" "320" "400" "500")
      
      ;для бобышки
      list-29 (list "Прямая" "Угловая")
      list-30 (list "1/28-24-М20х1,5" "1/30-30-М20х1,5" "1/28-32-М20х1,5" "1/28-40-М20х1,5" "1/30-50-М20х1,5")
			list-31 (list "24" "30" "32" "40" "50")
			list-32 (list "М20х1,5")
			list-33 (list "Ст20" "12Х18Н10Т")
);setq

(start-101-01-thermoponit-tsb-indust-01-general)

(if (< (setq dcl-id (load_dialog "dia-101-01-thermoponit-tsb-indust-01-general.dcl")) 0) ;ищем диалог
  (progn
    (alert "Не найден dcl-файл")
    (exit)
  );progn
);if

(if (not (new_dialog "dia_101_01_thermoponit_ts_b" dcl-id))
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

(list-filling "txt-13" list-13)
(list-filling "txt-14" list-14)
(list-filling "txt-15" list-15)

(list-filling "txt-17" list-17)
(list-filling "txt-18" list-18)
(list-filling "txt-19" list-19)

(list-filling "txt-21" list-21)
(list-filling "txt-22" list-22)
(list-filling "txt-23" list-23)
(list-filling "txt-24" list-24)
(list-filling "txt-25" list-25)
(list-filling "txt-26" list-26)
(list-filling "txt-27" list-27)

(list-filling "txt-29" list-29)
(list-filling "txt-30" list-30)
(list-filling "txt-31" list-31)
(list-filling "txt-32" list-32)
(list-filling "txt-33" list-33)


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

(set_tile "txt-13" "0")
(set_tile "txt-14" "0")
(set_tile "txt-15" "0")

(set_tile "txt-17" "0")
(set_tile "txt-18" "0")
(set_tile "txt-19" "0")

(action_tile "txt-01"
  (strcat "(start-101-01-thermoponit-tsb-indust-01-general)");srcat
);action_tile

(action_tile "txt-03"
  (strcat "(txt-03-101-01-thermoponit-tsb-indust-01-general)");srcat
);action_tile

(action_tile "txt-05"
  (strcat "(txt-05-101-01-thermoponit-tsb-indust-01-general)"
  );srcat
);action_tile

(action_tile "txt-08"
  (strcat "(txt-05-101-01-thermoponit-tsb-indust-01-general)"
  );srcat
);action_tile

(action_tile "ptxt-201"
  (strcat "(set_tile \"ptxt-281\" \"0\")"
  				"(ptxt-201-101-01-thermoponit-tsb-indust-01-general)"
  				"(ptxt-281-101-01-thermoponit-tsb-indust-01-general)"
  );srcat
);action_tile

(action_tile "ptxt-281"
  (strcat "(set_tile \"ptxt-201\" \"0\")"
  				"(ptxt-281-101-01-thermoponit-tsb-indust-01-general)"
  				"(ptxt-201-101-01-thermoponit-tsb-indust-01-general)"
  );srcat
);action_tile

(action_tile "txt-30"
  (strcat "(set_tile \"txt-31\" $value)"
  );srcat
);action_tile


(action_tile "but1"
  (strcat "(fill-lists-101-01-thermoponit-tsb-indust-01-general)"
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
	((= type-list "le") (le-101-01-thermoponit-tsb-indust-01-general));=
	((= type-list "spcf") (spcf-101-01-thermoponit-tsb-indust-01-general));=
);cond

(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(vla-endundomark adoc)
(princ)
)
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// конец программы ///////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun start-101-01-thermoponit-tsb-indust-01-general

( / )

(if (= nil str-01) 
	(setq str-01 "ТС-Б, головка тип Ж, крепл. НШ, прямой термобаллон");setq
	(setq str-01 (nth (atoi (get_tile "txt-01")) list-01));setq
);if

(if (= "ТС-Б, головка тип Ж, крепл. НШ, прямой термобаллон" str-01)
	(progn
		(setq list-02 (list "Нет" )
					list-03 (list "Pt100" "Pt500" "Pt1000" "Pt'50" "Pt'100" "Pt'500" );"06 (штуцер подвижн.)" "07 (штуцер подвижн.)"
					list-04 (list "А" "В" "С")
					list-05 (list "х2" "х3" "х4" "2х2")
					list-06 (list "П - прямая")
					list-07 (list "-50...+50" "-50...+80" "-50...+100" "-50...+180" "-50...+200")
					list-08 (list "60" "80" "100" "120" "160" "200" "250" "320" "400" "500" "630" "800")
					list-09 (list "6" "8" "10")
					list-10 (list "Нет")
					list-11 (list "Нет")

					list-13 (list "50" "120")
					list-14 (list "6" "8" "10")
					list-15 (list "М20х1,5")

					list-17 (list "IP65" "IP68")
					list-18 (list "Нет")
					list-19 (list "Нет")
					list-20 (list "Нет")	
		);setq
		
		(set_tile "ptxt-101" "Длина")
		(set_tile "ptxt-102" "ступени")
		(set_tile "ptxt-103" "L1, мм")
		
	);progn
);if


(if (= "КТС-Б, головка тип Ж, крепл. ПШ, прямой термобаллон" str-01)
	(progn
		(setq list-02 (list "Нет" )
					list-03 (list "Pt100" "Pt500" "Pt1000" "Pt'50" "Pt'100" "Pt'500" );"06 (штуцер подвижн.)" "07 (штуцер подвижн.)"
					list-04 (list "А" "В")
					list-05 (list "х2" "х3" "х4")
					list-06 (list "П - прямая")
					list-07 (list "-50...+50" "-50...+80" "-50...+100" "-50...+180" "-50...+200")
					list-08 (list "60" "80" "100" "120" "160" "200" "250" "320" "400" "500")
					list-09 (list "6" "8" "10")
					list-10 (list "2" "3")
					list-11 (list "Нет")

					list-13 (list "50" "120")
					list-14 (list "6" "8" "10")
					list-15 (list "М20х1,5")

					list-17 (list "IP65" "IP68")
					list-18 (list "Нет")
					list-19 (list "Нет")
					list-20 (list "Нет")	
		);setq
		
		(set_tile "ptxt-101" "Мин. разн.")
		(set_tile "ptxt-102" "температур,")
		(set_tile "ptxt-103" "С")
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

(list-filling "txt-13" list-13)
(list-filling "txt-14" list-14)
(list-filling "txt-15" list-15)

(list-filling "txt-17" list-17)
(list-filling "txt-18" list-18)
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

(set_tile "txt-13" "0")
(set_tile "txt-14" "0")
(set_tile "txt-15" "0")

(set_tile "txt-17" "0")
(set_tile "txt-18" "0")
(set_tile "txt-19" "0")


(princ)
)
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun txt-03-101-01-thermoponit-tsb-indust-01-general

( / str-01 str-03)

(setq str-01 (nth (atoi (get_tile "txt-01")) list-01)
			str-03 (nth (atoi (get_tile "txt-03")) list-03)
);setq


(if (or (= str-01 "ТС-Б, головка тип Ж, крепл. НШ, прямой термобаллон")
				(= str-01 "КТС-Б, головка тип Ж, крепл. ПШ, прямой термобаллон"));
	(cond
		((or (= "Pt100" str-03)
				 (= "Pt500" str-03)
				 (= "Pt1000" str-03));or
    	(setq list-07 (list "-50...+50" "-50...+80" "-50...+100" "-50...+180" "-50...+200"));setq
		);=

		((or (= "Pt'50" str-03)
				 (= "Pt'100" str-03)
				 (= "Pt'500" str-03));or
    	(setq list-07 (list "-50...+250" "-50...+300" "-50...+400" "-50...+500" "-50...+600"));setq
		);=
	);cond
);if

(list-filling "txt-07" list-07)

(set_tile "txt-07" "0")

(princ)
)
;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun txt-05-101-01-thermoponit-tsb-indust-01-general

( / str-01 str-05 str-08)

(setq str-01 (nth (atoi (get_tile "txt-01")) list-01)
			str-05 (nth (atoi (get_tile "txt-05")) list-05)
			str-08 (nth (atoi (get_tile "txt-08")) list-08)
);setq


(if (= str-01 "ТС-Б, головка тип Ж, крепл. НШ, прямой термобаллон")
	(cond
		((= "2х2" str-05) (setq list-09 (list "8" "10")));=
		((/= "2х2" str-05)
			(cond 
				((= str-08 "60") (setq list-09 (list "6" "8" "10")));
				((= str-08 "80") (setq list-09 (list "6" "8" "10")));
				((= str-08 "100") (setq list-09 (list "6" "8" "10")));
				((= str-08 "120") (setq list-09 (list "6" "8" "10")));
				((= str-08 "160") (setq list-09 (list "6" "8" "10")));
				((= str-08 "200") (setq list-09 (list "6" "8" "10")));
				((= str-08 "250") (setq list-09 (list "6" "8" "10")));
				((= str-08 "320") (setq list-09 (list "6" "8" "10")));
				((= str-08 "400") (setq list-09 (list "8" "10")));
				((= str-08 "500") (setq list-09 (list "8" "10")));
				((= str-08 "630") (setq list-09 (list "8" "10")));
				((= str-08 "800") (setq list-09 (list "8" "10")));
			);cond
		
		);=
	);cond
);if

(if (= str-01 "КТС-Б, головка тип Ж, крепл. ПШ, прямой термобаллон")
	(cond 
		((= str-08 "60") (setq list-09 (list "6" "8" "10")));
		((= str-08 "80") (setq list-09 (list "6" "8" "10")));
		((= str-08 "100") (setq list-09 (list "6" "8" "10")));
		((= str-08 "120") (setq list-09 (list "6" "8" "10")));
		((= str-08 "160") (setq list-09 (list "6" "8" "10")));
		((= str-08 "200") (setq list-09 (list "6" "8" "10")));
		((= str-08 "250") (setq list-09 (list "6" "8" "10")));
		((= str-08 "320") (setq list-09 (list "6" "8" "10")));
		((= str-08 "400") (setq list-09 (list "8" "10")));
		((= str-08 "500") (setq list-09 (list "8" "10")));
		((= str-08 "630") (setq list-09 (list "8" "10")));
		((= str-08 "800") (setq list-09 (list "8" "10")));
	);cond
);if


(list-filling "txt-09" list-09)

(set_tile "txt-09" "0")

(princ)
)
;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun ptxt-201-101-01-thermoponit-tsb-indust-01-general

( / str-201)

(setq str-201 (get_tile "ptxt-201"));setq

(if (= "1" str-201)
	(progn
		(mode_tile "txt-21" 0)
		(mode_tile "txt-22" 0)
		(mode_tile "txt-23" 0)
		(mode_tile "txt-24" 0)
		(mode_tile "txt-25" 0)
		(mode_tile "txt-26" 0)
		(mode_tile "txt-27" 0)
		
		(set_tile "txt-21" "0")
		(set_tile "txt-22" "0")
		(set_tile "txt-23" "0")
		(set_tile "txt-24" "0")
		(set_tile "txt-25" "0")
		(set_tile "txt-26" "0")
		(set_tile "txt-27" "0")
	);progn

);if

(if (= "0" str-201)
	(progn
		(mode_tile "txt-21" 1)
		(mode_tile "txt-22" 1)
		(mode_tile "txt-23" 1)
		(mode_tile "txt-24" 1)
		(mode_tile "txt-25" 1)
		(mode_tile "txt-26" 1)
		(mode_tile "txt-27" 1)
	);progn

);if

(princ)
)
;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun ptxt-281-101-01-thermoponit-tsb-indust-01-general

( / str-281)

(setq str-281 (get_tile "ptxt-281"));setq

(if (= "1" str-281)
	(progn
		(mode_tile "txt-29" 0)
		(mode_tile "txt-30" 0)
		(mode_tile "txt-31" 0)
		(mode_tile "txt-32" 0)
		(mode_tile "txt-33" 0)
		
		(set_tile "txt-29" "0")
		(set_tile "txt-30" "0")
		(set_tile "txt-31" "0")
		(set_tile "txt-32" "0")
		(set_tile "txt-33" "0")
	);progn

);if

(if (= "0" str-281)
	(progn
		(mode_tile "txt-29" 1)
		(mode_tile "txt-30" 1)
		(mode_tile "txt-31" 1)
		(mode_tile "txt-32" 1)
		(mode_tile "txt-33" 1)
	);progn

);if

(princ)
)
;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun fill-lists-101-01-thermoponit-tsb-indust-01-general

( / cntr-1 str-01 str-02 str-03 str-04 str-05 str-06 str-07 str-08 str-09 str-10 str-11 str-13 str-14 str-15 str-17 str-18 str-19 str-20 str-201 str-21 str-22 
str-23 str-24 str-25 str-26 str-27 str-281 str-29 str-30 str-31 str-32 str-33 str-902 str-99 swtch)

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
			
			str-13 (nth (atoi (get_tile "txt-13")) list-13)
			str-14 (nth (atoi (get_tile "txt-14")) list-14)
			str-15 (nth (atoi (get_tile "txt-15")) list-15)
			
			str-17 (nth (atoi (get_tile "txt-17")) list-17)
			str-18 (nth (atoi (get_tile "txt-18")) list-18)
			str-19 (nth (atoi (get_tile "txt-19")) list-19)
			
      swtch list-901
      cntr-1 0
      
      ;гильза
      str-201 (get_tile "ptxt-201")
      
      ;бобышка
      str-281 (get_tile "ptxt-281")
);setq

(if (/= swtch nil) (setq list-902 (reverse list-902)));if

;///////////////////////////////////////////////////////////////////////////////////////////////////
(if (and (= str-01 "ТС-Б, головка тип Ж, крепл. НШ, прямой термобаллон") (= str-201 "0") (= str-281 "0"));if
	(progn

		(setq str-99
			(cond	
				((and (>= (atoi str-08) 60) (<= (atoi str-08) 120)) "0,5")
				((and (>= (atoi str-08) 160) (<= (atoi str-08) 500)) "0,6")
				((and (>= (atoi str-08) 630) (<= (atoi str-08) 1000)) "0,8")
				((and (>= (atoi str-08) 1250) (<= (atoi str-08) 2000)) "1,1")
				((>= (atoi str-08) 2500) "1,5")
			);cond
		);setq

		(setq str-902 (list (cons 1 str-01) (cons 2 str-02) (cons 3 str-03) (cons 4 str-04) (cons 5 str-05) (cons 6 str-06) (cons 7 str-07)	(cons 8 str-08) (cons 9 str-09) 
												(cons 10 str-10) (cons 11 str-11) (cons 13 str-13) (cons 14 str-14) (cons 15 str-15) (cons 17 str-17)  (cons 18 str-18) (cons 19 str-19)
												(cons 99 str-99))
					list-902 (vl-list*  str-902 list-902);список характеристик для спецификации
					
					list-901 (vl-list* (strcat str-01 "  " str-03 "  Кл. доп " str-04 "  Подкл " str-05 "  " str-06 "  " str-07 "  Длина " str-08 "мм  Диам. термобаллона " 
																		 str-09 "мм  " str-15) list-901)
		);setq
	);progn
);if


;///////////////////////////////////////////////////////////////////////////////////////////////////
(if (and (= str-01 "КТС-Б, головка тип Ж, крепл. ПШ, прямой термобаллон") (= str-201 "0") (= str-281 "0"));if
	(progn

		(setq str-99
			(cond	
				((and (>= (atoi str-08) 60) (<= (atoi str-08) 120)) "1,0")
				((and (>= (atoi str-08) 160) (<= (atoi str-08) 500)) "1,2")
				((and (>= (atoi str-08) 630) (<= (atoi str-08) 1000)) "1,6")
				((and (>= (atoi str-08) 1250) (<= (atoi str-08) 2000)) "2,2")
				((>= (atoi str-08) 2500) "1,5")
			);cond
		);setq

		(setq str-902 (list (cons 1 str-01) (cons 2 str-02) (cons 3 str-03) (cons 4 str-04) (cons 5 str-05) (cons 6 str-06) (cons 7 str-07)	(cons 8 str-08) (cons 9 str-09) 
												(cons 10 str-10) (cons 11 str-11) (cons 13 str-13) (cons 14 str-14) (cons 15 str-15) (cons 17 str-17)  (cons 18 str-18) (cons 19 str-19)
												(cons 99 str-99))
					list-902 (vl-list*  str-902 list-902);список характеристик для спецификации
					
					list-901 (vl-list* (strcat str-01 "  " str-03 "  Кл. доп " str-04 "  Подкл " str-05 "  " str-06 "  " str-07 "  Длина " str-08 "мм  Диам. термобаллона " 
																		 str-09 "мм  " str-15 "  Разн. температур " str-10 "С") list-901)
		);setq
	);progn
);if

;///////////////////////////////////////////////////////////////////////////////////////////////////
(if (= str-201 "1")
	(progn
		(setq str-21 (nth (atoi (get_tile "txt-21")) list-21)
    			str-22 (nth (atoi (get_tile "txt-22")) list-22)
    			str-23 (nth (atoi (get_tile "txt-23")) list-23)
    			str-24 (nth (atoi (get_tile "txt-24")) list-24)
   				str-25 (nth (atoi (get_tile "txt-25")) list-25)
    			str-26 (nth (atoi (get_tile "txt-26")) list-26)
    			str-27 (nth (atoi (get_tile "txt-27")) list-27)
    );setq
    
    (setq str-99
			(cond	
				((= str-27 "60") "0,52")
				((= str-27 "80") "0,52")
				((= str-27 "100") "0,52");=
				((= str-27 "120") "0,52");=
				((= str-27 "160") "0,65");=
				((= str-27 "200") "0,65");=
				((= str-27 "250") "0,65");=
				((= str-27 "320") "0,65");=
				((= str-27 "400") "0,65");=
				((= str-27 "500") "0,65");=
				((= str-27 "630") "0,65");=
				((= str-27 "800") "0,83");=
				((= str-27 "1000") "0,83");=
				((= str-27 "1250") "1,25");=
				((= str-27 "1600") "1,25");=
			);cond
		);setq
    
		(setq str-902 (list (cons 1 "Гильза") (cons 2 str-21) (cons 3 str-22) (cons 4 str-23) (cons 5 str-24) (cons 6 str-25) (cons 7 str-26) (cons 8 str-27) (cons 99 str-99))
						list-902 (vl-list*  str-902 list-902);список характеристик для спецификации
						list-901 (vl-list* (strcat "Гильза  " str-21 "  Давление до  " str-22 "МПа  Резьба внешн " str-23 "  Резьба внутрен " str-24 
																			 "  Диаметр внешн. " str-25 "мм"
																			 "  Диаметр внутр. " str-26 "мм"
																			 "  Длина " str-27 "мм"
						) list-901)
		);setq
	);progn
);if


;///////////////////////////////////////////////////////////////////////////////////////////////////
(if (= str-281 "1")
	(progn
		(setq str-29 (nth (atoi (get_tile "txt-29")) list-29)
      		str-30 (nth (atoi (get_tile "txt-30")) list-30)
      		str-31 (nth (atoi (get_tile "txt-31")) list-31)
      		str-32 (nth (atoi (get_tile "txt-32")) list-32)
      		str-33 (nth (atoi (get_tile "txt-33")) list-33)
    );setq
    
		(setq str-902 (list (cons 1 "Бобышка") (cons 2 str-29) (cons 3 str-30) (cons 4 str-31) (cons 5 str-32) (cons 6 str-33) (cons 99 "0,25"))
					list-902 (vl-list*  str-902 list-902);список характеристик для спецификации
					list-901 (vl-list* (strcat "Бобышка " str-29 "  " str-30 "  Длина " str-31 "мм  " str-32 "  " str-33) list-901)
		);setq
	);progn
);if


(setq list-902 (reverse list-902))

(list-filling "txt-901" (reverse list-901))

(princ)
)
;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun le-101-01-thermoponit-tsb-indust-01-general

( / cntr-1 dlt-y nmbr-ln pnt-ins str-01 str-02 str-03 str-04 str-05 str-06 str-07 str-08 str-10 str-15 str-tmp x-pnt-ins y-pnt-ins y-pnt-ins-1)

(setq cntr-1 0);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-01 (cdr (assoc 1 str-tmp))
				str-03 (cdr (assoc 3 str-tmp))
				str-07 (cdr (assoc 7 str-tmp))
				str-08 (cdr (assoc 8 str-tmp))
	);setq

	(setvar "osmode" 6199)
	
	(setq pnt-ins		(getpoint "\nУкажите точку вставки\n"));setq

	;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	(if (= str-01 "ТС-Б, головка тип Ж, крепл. НШ, прямой термобаллон")
		(setq str-15 (cdr (assoc 15 str-tmp))			
					str-txt (strcat "Термопреобразователь сопротивления ТС-Б, головка тип Ж, НСХ " str-03 ", пределы измерений " str-07 "%%dС, длина " str-08 "мм, "
													"присоединение " str-15)
		);setq
	);if

	;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	(if (= str-01 "КТС-Б, головка тип Ж, крепл. ПШ, прямой термобаллон")
		(progn
			(setq str-10 (cdr (assoc 10 str-tmp))
						str-15 (cdr (assoc 15 str-tmp))
			
						nmbr-ln 4
			);setq
			
			(1000-delete-items-le nmbr-ln x-pnt-ins y-pnt-ins)
			(1000-delete-items-le-1 nmbr-ln x-pnt-ins y-pnt-ins)
			(setvar "osmode" 0)
			(setvar "cmdecho" 0)
			
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Комплект термопреобразователей сопротивления КТС-Б,")
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "НСХ " str-03 ", пределы изм. " str-07 "%%dС, длина " str-08 "мм,"))
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 (strcat "присоединение " str-15 ", мин. разность температур " str-10 "%%dС"))
			
			(command "_text" "_ML" (list (+ x-pnt-ins 121) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Кол. в комплектах,")
			(command "_text" "_ML" (list (+ x-pnt-ins 121) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 "состоит из 2шт. ТС-Б")
		);progn
	);if

	;/////////////////////////////////////////////////////////////////////////////////////////////////
	(if (= "Гильза" str-01)
		(progn
			(setq str-02 (cdr (assoc 2 str-tmp))
						str-04 (cdr (assoc 4 str-tmp))
						str-05 (cdr (assoc 5 str-tmp))
			);setq
			
			(cond
				((= "ГЦР.103Н, для НШ" str-02) (setq str-02 "ГЦР.103Н"))

  		);cond
			
			(setq nmbr-ln 3);setq
			(1000-delete-items-le nmbr-ln x-pnt-ins y-pnt-ins);удаление предыдущей записи
			(setvar "osmode" 0)
			(setvar "cmdecho" 0)
	
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 (strcat "Гильза защитная ООО \"Поинт\", " str-02 ", длина " str-08 "мм, резьба"))
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "внешняя " str-04 ", резьба внутренняя " str-05))
		);progn
	);if

	;/////////////////////////////////////////////////////////////////////////////////////////////////
	(if (= "Бобышка" str-01)
		(progn
			(setq str-02 (cdr (assoc 2 str-tmp))
						str-04 (cdr (assoc 4 str-tmp))
						str-05 (cdr (assoc 5 str-tmp))
						str-06 (cdr (assoc 6 str-tmp))						
			);setq

			(cond
				((= "Прямая" str-02) (setq str-02 "прямая"))
				((= "Угловая" str-02) (setq str-02 "угловая"))
  		);cond

			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 (strcat "Бобышка ООО \"Поинт\", " str-02 ", присоединение " str-05 ","))
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "длина " str-04 "мм, материал " str-06))
		);progn
	);if











	(setq cntr-1 (1+ cntr-1));setq
);repeat

(princ)
)
;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun spcf-101-01-thermoponit-tsb-indust-01-general

( / cntr-1 dlt-y nmbr-ln pnt-ins str-01 str-02 str-02-1 str-02-2 str-03 str-04 str-05 str-05-1 str-06 str-06-2 str-07 str-08 str-09 str-10 str-13 str-15 str-17 
str-99 str-tmp x-pnt-ins y-pnt-ins y-pnt-ins-1)

(setq cntr-1 0);setq

(setvar "textstyle" "Standard")

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-01 (cdr (assoc 1 str-tmp))
				
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

	;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	(if (= str-01 "ТС-Б, головка тип Ж, крепл. НШ, прямой термобаллон")
		(progn
			(setq str-03 (cdr (assoc 3 str-tmp))
						str-04 (cdr (assoc 4 str-tmp))
						str-05 (cdr (assoc 5 str-tmp))
						
						str-07 (cdr (assoc 7 str-tmp))
						str-08 (cdr (assoc 8 str-tmp))
						str-09 (cdr (assoc 9 str-tmp))
						
						str-13 (cdr (assoc 13 str-tmp))
						
						str-15 (cdr (assoc 15 str-tmp))
						str-17 (cdr (assoc 17 str-tmp))
									
						nmbr-ln 10
			);setq
			
			(cond
				((= str-05 "х2") (setq str-05-1 "2-х проводная, 1 чувств. элемент"));=
				((= str-05 "х3") (setq str-05-1 "3-х проводная, 1 чувств. элемент"));=
				((= str-05 "х4") (setq str-05-1 "4-х проводная, 1 чувств. элемент"));=
				((= str-05 "2х2") (setq str-05-1 "2-х проводная, 2 чувств. элемент"));=
			);cond
				
			(1000-delete-items-spcf nmbr-ln pnt-ins)
			(1000-delete-items-spcf-crtf nmbr-ln pnt-ins)
				
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Термопреобразователь сопротивления")
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "- НСХ " str-03 ", класс допуска " str-04 ", диапазон измерений " str-07 "%%dC"))
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 (strcat "- схема подключения " str-05-1))
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 3)) 4)) 2.5 0 "- исполнение монтажной части прямое")
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 4)) 4)) 2.5 0 (strcat "- длина монтажной части " str-08 "мм, диаметр монтажной части " str-09 "мм"))
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 5)) 4)) 2.5 0 "- неподвижный штуцер (НШ)")
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 6)) 4)) 2.5 0 (strcat "- длина наружной части " str-13 "мм"))
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 7)) 4)) 2.5 0 (strcat "- присоединение " str-15))
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 8)) 4)) 2.5 0 "- клеммная головка типа Ж")
			
			(command "_TEXT" "_MC" (list (+ x-pnt-ins 160) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 (strcat "ТС-Б-" str-03 "-" str-04 "-" str-05 "-П-(" str-07 ")-")) ;Тип, марка, обозначение документа, опросного листа
			(command "_text" "_MC" (list (+ x-pnt-ins 160) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat str-08 "/" str-09 "-НШ." str-13 "." str-15 "-Ж-" str-17))
			
			(command "_text" "_MC" (list (+ x-pnt-ins 280) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "шт.")
							
			(command "_text" "_ML" (list (+ x-pnt-ins 336) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Свидетельство об")
			(command "_text" "_ML" (list (+ x-pnt-ins 336) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 "утверждении СИ")
			(command "_text" "_ML" (list (+ x-pnt-ins 336) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 "BY.С.32.999.А")
			(command "_text" "_ML" (list (+ x-pnt-ins 336) (- (- y-pnt-ins (* dlt-y 3)) 4)) 2.5 0 "№ 19689")
		);progn
	);if	


	;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	(if (= str-01 "КТС-Б, головка тип Ж, крепл. ПШ, прямой термобаллон")
		(progn
			(setq str-03 (cdr (assoc 3 str-tmp))
						str-04 (cdr (assoc 4 str-tmp))
						str-05 (cdr (assoc 5 str-tmp))
						
						str-07 (cdr (assoc 7 str-tmp))
						str-08 (cdr (assoc 8 str-tmp))
						str-09 (cdr (assoc 9 str-tmp))
						str-10 (cdr (assoc 10 str-tmp))
						
						str-13 (cdr (assoc 13 str-tmp))
						
						str-15 (cdr (assoc 15 str-tmp))
									
						nmbr-ln 9
			);setq
			
			(cond
				((= str-05 "х2") (setq str-05-1 "2-х проводная, 1 чувств. элемент"));=
				((= str-05 "х3") (setq str-05-1 "3-х проводная, 1 чувств. элемент"));=
				((= str-05 "х4") (setq str-05-1 "4-х проводная, 1 чувств. элемент"));=
			);cond
				
			(1000-delete-items-spcf nmbr-ln pnt-ins)
			(1000-delete-items-spcf-crtf nmbr-ln pnt-ins)
				
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Комплект термопреобразователей сопротивления")
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "- НСХ " str-03 ", класс допуска " str-04 ", диапазон измерений " str-07 "%%dC"))
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 (strcat "- схема подключения " str-05-1))
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 3)) 4)) 2.5 0 "- исполнение монтажной части прямое")
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 4)) 4)) 2.5 0 (strcat "- минимальная разность температур " str-10 "%%dC"))
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 5)) 4)) 2.5 0 (strcat "- длина монтажной части " str-08 "мм, диаметр монтажной части " str-09 "мм"))
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 6)) 4)) 2.5 0 (strcat "- подвижный штуцер (ПШ), длина наружной части " str-13 "мм"))
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 7)) 4)) 2.5 0 (strcat "- присоединение " str-15 ", клеммная головка типа Ж"))
			
			(command "_TEXT" "_MC" (list (+ x-pnt-ins 160) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 (strcat "КТС-Б-" str-03 "-" str-04 "-" str-05 "-П-" str-10 "-")) ;Тип, марка, обозначение документа, опросного листа
			(command "_text" "_MC" (list (+ x-pnt-ins 160) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat str-08 "/" str-09 "-ПШ." str-13 "." str-15 "-Ж"))
			
			(command "_text" "_MC" (list (+ x-pnt-ins 280) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "компл.")
				
			(command "_text" "_ML" (list (+ x-pnt-ins 336) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Госреестр СИ РФ")
			(command "_text" "_ML" (list (+ x-pnt-ins 336) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 "№ 43096-09")
		);progn
	);if	

	;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	(if (= "Гильза" str-01)
		(progn	
			(setq str-02 (cdr (assoc 2 str-tmp))
						str-03 (cdr (assoc 3 str-tmp))
						str-04 (cdr (assoc 4 str-tmp))
						str-05 (cdr (assoc 5 str-tmp))
						str-06 (cdr (assoc 6 str-tmp))
						str-07 (cdr (assoc 7 str-tmp))
						str-08 (cdr (assoc 8 str-tmp))
						str-99 (cdr (assoc 99 str-tmp))
			);setq
			
			(cond
				((= "ГЦР.103Н, для НШ" str-02) (setq str-02-1 "Гильза защитная (исполнение для неподвижного штуцера)" str-02-2 "ГЦР.103Н"))

  		);cond
			
			(setq nmbr-ln 5);setq
			
			(1000-delete-items-spcf nmbr-ln pnt-ins)
			(1000-delete-items-spcf-crtf nmbr-ln pnt-ins)
			
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 str-02-1)
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "- длина " str-08 "мм, давление до " str-03 "МПа"))
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 (strcat "- резьба внешняя " str-04 ", резьба внутренняя " str-05))
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 3)) 4)) 2.5 0 (strcat "- диаметр внешн. " str-06 "мм, диаметр внутр. " str-07 "мм"))		

			(command "_TEXT" "_MC" (list (+ x-pnt-ins 160) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 (strcat str-02-2 "-" str-04 "-" str-06 "/" str-07 "-" str-08)) ;Тип, марка, обозначение документа, опросного листа
		
			(command "_text" "_MC" (list (+ x-pnt-ins 280) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "шт.")
		);progn
	);if


	;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	(if (= "Бобышка" str-01)
		(progn	
			(setq str-02 (cdr (assoc 2 str-tmp))
						str-03 (cdr (assoc 3 str-tmp))
						str-04 (cdr (assoc 4 str-tmp))
						str-05 (cdr (assoc 5 str-tmp))
						str-06 (cdr (assoc 6 str-tmp))
						str-99 (cdr (assoc 99 str-tmp))
			);setq
			
			(cond
				((= "Прямая" str-02) (setq str-02-1 "прямая"))
				((= "Угловая" str-02) (setq str-02-1 "угловая"))
  		);cond
 
			(cond
				((= "Ст20" str-06) (setq str-06-2 str-03))
				((= "12Х18Н10Т" str-06) (setq str-06-2 (strcat str-03 " (" str-06 ")")))
  		);cond
			
			(setq nmbr-ln 4);setq
			
			(1000-delete-items-spcf nmbr-ln pnt-ins)
			(1000-delete-items-spcf-crtf nmbr-ln pnt-ins)
			
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 (strcat "Бобышка " str-02-1))
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "- длина " str-04 "мм, резьба внутренняя " str-05))
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 (strcat "- материал " str-06))

			(command "_TEXT" "_MC" (list (+ x-pnt-ins 160) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 str-06-2) ;Тип, марка, обозначение документа, опросного листа
			
			(command "_text" "_MC" (list (+ x-pnt-ins 280) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "шт.")
		);progn
	);if



















	(command "_text" "_MC" (list (+ x-pnt-ins 322.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 str-99);масса
	
	(command "_text" "_MC" (list (+ x-pnt-ins 247.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "ООО \"ПОИНТ\", ")
	(command "_text" "_MC" (list (+ x-pnt-ins 247.5) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 "Беларусь, г.Полоцк")	
		
	(repeat nmbr-ln
  	(command "_insert" "зс-пустая-строка" "_X" 1 "_Y" 1 "_Z" 1 "_R" 0 (list x-pnt-ins y-pnt-ins-1))
  	(setq y-pnt-ins-1 (- y-pnt-ins-1 8));setq
	);repeat
 
	(setq cntr-1 (+ cntr-1 1));setq
);repeat

(princ)
)
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



