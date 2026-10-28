;/////// ************************************************************ //////////////////////////////////////////////////////////////////
;/////// УЛЬТРАЗВУКОВОЙ РАСХОДОМЕР US-800                                  /////////////////////////////////////////////////////////////
;/////// ************************************************************ //////////////////////////////////////////////////////////////////
(defun 101-01-flow-us800-01-general

( / adoc dcl-id list-01 list-02 list-03 list-04-1 list-04-2 list-05-1 list-05-2 list-06-1 list-06-2 list-07-1 list-07-2 list-16 list-17 list-901 list-902 str-01 type-list)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(setq str-01 nil
      list-01 (list "1 канальный, однолуч." 
      							"1 канальный, двухлуч."
      							"2-х канальный, однолуч.")
      
      list-04-2 nil
      list-05-2 nil
      list-06-2 nil
      list-07-2 nil
      
      list-901 nil
      list-902 nil
);setq

(txt-01-101-01-flow-us800-01-general)

(if (< (setq dcl-id (load_dialog "dia-101-01-flow-us800-01-general.dcl")) 0) ;ищем диалог
		(progn
			(alert "Не найден dcl-файл")
			(exit)
		);progn
);if

(if (not (new_dialog "dia_us_800" dcl-id))
		(exit)
);if

(list-filling "txt-01" list-01)
(list-filling "txt-02" list-02)
(list-filling "txt-03" list-03)

(list-filling "txt-04-1" list-04-1)
(list-filling "txt-05-1" list-05-1)
(list-filling "txt-06-1" list-06-1)
(list-filling "txt-07-1" list-07-1)

(list-filling "txt-16" list-16)
(list-filling "txt-17" list-17)

(set_tile "txt-01" "0")
(set_tile "txt-02" "0")
(set_tile "txt-03" "0")

(set_tile "txt-04-1" "0")
(set_tile "txt-05-1" "0")
(set_tile "txt-06-1" "0")
(set_tile "txt-07-1" "0")

(set_tile "txt-16" "0")
(set_tile "txt-17" "0")

(action_tile "txt-01" 
  (strcat "(txt-01-101-01-flow-us800-01-general)");strcat
);action_tile

(action_tile "txt-04-1" 
  (strcat "(txt-04-1-101-01-flow-us800-01-general)");strcat
);action_tile

(action_tile "txt-04-2" 
  (strcat "(txt-04-2-101-01-flow-us800-01-general)");strcat
);action_tile

(action_tile "but1"
  (strcat "(filling-fields-101-01-flow-us800-01-general)"
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

(if (= type-list "le") (le-101-01-flow-us800-01-general));if

(if (= type-list "spcf") (spcf-101-01-flow-us800-01-general));if

(if (= type-list "lecgv") (lecgv-101-01-flow-us800-01-general));if

(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(vla-endundomark adoc)
(princ)
)
;/////// конец программы ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun txt-01-101-01-flow-us800-01-general

()
      							
(cond
	((= nil str-01) (setq str-01 "1 канальный, однолуч."));=
	((/= nil str-01) (setq str-01 (nth (atoi (get_tile "txt-01")) list-01)));=
);cond

(setq list-04-1 (list "15" "25" "32" "40" "50" "65" "80" "100" "150" "200" "250" "300" "350" "400" "500" "600" "700" "800" "900" "1000"  "1200" "1400")
			
			list-05-1 (list "0,15...5" "0,25...8" "0,3...30" "0,4...45" "0,5...70" "0,65...120" "0,8...180" "1...280" "1,5...640" "2...1100" "2,5...2000" "3...2500" "3,5...3500"
											"4...4500" "5...7000" "6...10000" "7...14000" "8...18000" "9...23000" "10...28000" "24...48960" "28...66640")
			list-06-1 (list "Сталь 20" "Сталь 12Х18Н10Т")
      list-07-1 (list "Фланцевое" "Резьбовое")					 
);setq

;;;;;;;;;////////////////////////////////////////////////////////////////////
(cond
	((= str-01 "1 канальный, однолуч.") 
		(setq list-02 (list "10 Индикация, 0-1000 Гц" 
      									"11 Индикация, 0-1000 Гц, архив, RS-485"
      									"12 Индикация, 0-1000 Гц, 4-20 мА"
      									"13 Индикация, 0-1000 Гц, 4-20 мА, архив, RS-485")
      		list-04-2 nil
      		list-05-2 nil
      		list-06-2 nil
      		list-07-2 nil
		);setq
	);=

	((= str-01 "2-х канальный, однолуч.") 
		(setq list-02 (list "20 Индикация, 0-1000 Гц"
      									"21 Индикация, 0-1000 Гц, архив, RS-485"
      									"22 Индикация, 0-1000 Гц, 4-20 м"
      									"23 Индикация, 4-20 мА, архив, RS-485")			
      										
      		list-04-2 list-04-1
      		list-05-2 list-05-1
      		list-06-2 list-06-1
      		list-07-2 list-07-1
		);setq
	);=

	((= str-01 "1 канальный, двухлуч.") 
		(setq list-02 (list "30 Индикация, 0-1000 Гц"
      									"31 Индикация, 0-1000 Гц, архив, RS-485"
      									"32 Индикация, 0-1000 Гц, 4-20 мА"
      									"33 Индикация, 0-1000 Гц, 4-20 мА, архив, RS-485")
      									
      		list-04-1 (list "50" "65" "80" "100" "150" "200" "250" "300" "350" "400" "500" "600" "700" "800" "900" "1000" "1200" "1400")
					list-05-1 (list "0,5...70" "0,65...120" "0,8...180" "1...280" "1,5...640" "2...1100" "2,5...2000" "3...2500" "3,5...3500"
													"4...4500" "5...7000" "6...10000" "7...14000" "8...18000" "9...23000" "10...28000" "24...48960" "28...66640")   									
      		list-06-1 (list "Сталь 20" "Сталь 12Х18Н10Т")
      		list-07-1 (list "Фланцевое")
      		list-04-2 nil
      		list-05-2 nil
      		list-06-2 nil
      		list-07-2 nil													
		);setq
	);=
);cond


;;;;;;;;;////////////////////////////////////////////////////////////////////
(cond
	( (or (= str-01 "1 канальный, однолуч.") (= str-01 "1 канальный, двухлуч."))
		(mode_tile "ltxt-04-1" 1)
		(mode_tile "ltxt-04-2" 1)
		(mode_tile "ltxt-05-1" 1)
		(mode_tile "ltxt-05-2" 1)
		(mode_tile "ltxt-06-1" 1)
		(mode_tile "ltxt-07-1" 1)
		(mode_tile "ltxt-08-1" 1)
		(mode_tile "ltxt-08-2" 1)
		(mode_tile "ltxt-09-1" 1)
		(mode_tile "ltxt-09-2" 1)
		(mode_tile "ltxt-10-2" 1)
		(mode_tile "ltxt-12-2" 1)
		(mode_tile "ltxt-14-2" 1)
		
		(mode_tile "txt-04-2" 1)
		(mode_tile "txt-05-2" 1)
		(mode_tile "txt-06-2" 1)
		(mode_tile "txt-07-2" 1)
		(mode_tile "txt-08-2" 1)
		(mode_tile "txt-09-2" 1)
		(mode_tile "txt-10-2" 1)
		(mode_tile "txt-11-2" 1)
		(mode_tile "txt-12-2" 1)
		(mode_tile "txt-13-2" 1)
		(mode_tile "txt-14-2" 1)
		(mode_tile "txt-15-2" 1)
		(mode_tile "txt-19" 1)
	);=

	((= str-01 "2-х канальный, однолуч.")		
		(mode_tile "ltxt-04-1" 0)
		(mode_tile "ltxt-04-2" 0)
		(mode_tile "ltxt-05-1" 0)
		(mode_tile "ltxt-05-2" 0)
		(mode_tile "ltxt-06-1" 0)
		(mode_tile "ltxt-07-1" 0)
		(mode_tile "ltxt-08-1" 0)
		(mode_tile "ltxt-08-2" 0)
		(mode_tile "ltxt-09-1" 0)
		(mode_tile "ltxt-09-2" 0)
		(mode_tile "ltxt-10-2" 0)
		(mode_tile "ltxt-12-2" 0)
		(mode_tile "ltxt-14-2" 0)
		
		(mode_tile "txt-04-2" 0)
		(mode_tile "txt-05-2" 0)
		(mode_tile "txt-06-2" 0)
		(mode_tile "txt-07-2" 0)
		(mode_tile "txt-08-2" 0)
		(mode_tile "txt-09-2" 0)
		(mode_tile "txt-10-2" 0)
		(mode_tile "txt-11-2" 0)
		(mode_tile "txt-12-2" 0)
		(mode_tile "txt-13-2" 0)
		(mode_tile "txt-14-2" 0)
		(mode_tile "txt-15-2" 0)
		(mode_tile "txt-19" 1)
	);=
);cond

(setq list-03 (list "~220" "=12" "=24" "=36")
			list-16 (list "Имитационная" "Проливная" "Технологическая")
			list-17 (list "1,6" "2,5" "4" "6" "10" "25")
);setq

(list-filling "txt-02" list-02)
(list-filling "txt-03" list-03)

(list-filling "txt-04-1" list-04-1)
(list-filling "txt-05-1" list-05-1)
(list-filling "txt-06-1" list-06-1)
(list-filling "txt-07-1" list-07-1)

(list-filling "txt-04-2" list-04-2)
(list-filling "txt-05-2" list-05-2)
(list-filling "txt-06-2" list-06-2)
(list-filling "txt-07-2" list-07-2)

(list-filling "txt-16" list-16)
(list-filling "txt-17" list-17)

(set_tile "txt-02" "0")
(set_tile "txt-03" "0")

(set_tile "txt-04-1" "0")
(set_tile "txt-05-1" "0")
(set_tile "txt-06-1" "0")
(set_tile "txt-07-1" "0")

(set_tile "txt-04-2" "0")
(set_tile "txt-05-2" "0")
(set_tile "txt-06-2" "0")
(set_tile "txt-07-2" "0")

(set_tile "txt-16" "0")
(set_tile "txt-17" "0")

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun txt-04-1-101-01-flow-us800-01-general

( / str-01 str-04-1)

(setq str-01 (nth (atoi (get_tile "txt-01")) list-01)
			str-04-1 (nth (atoi (get_tile "txt-04-1")) list-04-1)
			str-04-1 (atoi str-04-1)
);setq

;;;;;;;;;   материал УПР ////////////////////////////////////////////////////
(if (or (= str-01 "1 канальный, однолуч.") (= str-01 "2-х канальный, однолуч."))
	(progn
		(if (<= str-04-1 1000)			 
			(setq list-06-1 (list "Сталь 20" "Сталь 12Х18Н10Т"));setq
		);if
	
		(if (> str-04-1 1000)			 
			(setq list-06-1 (list "Сталь 20"));setq
		);if
	);progn
);if

;;;;;;;;;   материал УПР   ///////////////////////////////////////////////////////////////
(if (= str-01 "1 канальный, двухлуч.")
	(progn
		(if (<= str-04-1 1000)			 
			(setq list-06-1 (list "Сталь 20" "Сталь 12Х18Н10Т"));setq
		);if
	
		(if (> str-04-1 1000)			 
			(setq list-06-1 (list "Сталь 20"));setq
		);if
	);progn
);if


;;;;;;;;;   тип соединения   /////////////////////////////////////////////////////////////
(if (or (= str-01 "1 канальный, однолуч.") (= str-01 "2-х канальный, однолуч."))
	(progn
		(if (<= str-04-1 25)			 
			(setq list-07-1 (list "Фланцевое" "Резьбовое"));setq
		);if
	
		(if (and (> str-04-1 25) (<= str-04-1 100))	 
			(setq list-07-1 (list "Фланцевое"));setq
		);if

		(if (> str-04-1 100) 
			(setq list-07-1 (list "Фланцевое" "Под сварку"));setq
		);if
	);progn
);if


;;;;;;;;;////////////////////////////////////////////////////////////////////
(if (= str-01 "1 канальный, двухлуч.")
	(progn
		(if (<= str-04-1 125)			 
			(setq list-07-1 (list "Фланцевое"));setq
		);if

		(if (> str-04-1 125) 
			(setq list-07-1 (list "Фланцевое" "Под сварку"));setq
		);if
	);progn
);if

(if (< str-04-1 200)
	(progn
		(set_tile "txt-19" "0") 
		(mode_tile "txt-19" 1)
	);progn
);if

(if (>= str-04-1 200) 
	(mode_tile "txt-19" 0)
);if

(list-filling "txt-06-1" list-06-1)
(list-filling "txt-07-1" list-07-1)

(set_tile "txt-05-1" (get_tile "txt-04-1"))
(set_tile "txt-06-1" "0")
(set_tile "txt-07-1" "0")

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun txt-04-2-101-01-flow-us800-01-general

( / str-01 str-04-2)

(setq str-01 (nth (atoi (get_tile "txt-01")) list-01)
			str-04-2 (nth (atoi (get_tile "txt-04-2")) list-04-2)
			str-04-2 (atoi str-04-2)
);setq

;;;;;;;;;////////////////////////////////////////////////////////////////////
(if (= str-01 "2-х канальный, однолуч.")
	(progn
		(if (<= str-04-2 100)			 
			(setq list-06-2 (list "Сталь 12Х18Н10Т") 
						list-07-2 (list "Резьбовое" "Фланцевое")
			);setq
		);if

		(if (and (> str-04-2 100) (< str-04-1 350)) 
			(setq list-06-2 (list "Сталь 12Х18Н10Т" "Сталь 20")
						list-07-2 (list "Фланцевое" "Под сварку")
			);setq
		);if

		(if (> str-04-2 300)
			(setq list-06-2 (list "Сталь 20")
						list-07-2 (list "Фланцевое" "Под сварку")
			);setq
		);if
	);progn
);if

(list-filling "txt-06-2" list-06-2)
(list-filling "txt-07-2" list-07-2)

(set_tile "txt-05-2" (get_tile "txt-04-2"))
(set_tile "txt-06-2" "0")
(set_tile "txt-07-2" "0")

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма формирования данных/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun filling-fields-101-01-flow-us800-01-general

( / str-01 str-02 str-02-2 str-02-ord str-03 str-04-1 str-04-1-tech str-04-2 str-04-2-tech str-05-1 str-05-1-tech str-05-2 str-05-2-tech str-06-1 str-06-1-tech str-06-2 
str-06-2-tech str-06-ord str-07-1 str-07-1-tech str-07-2 str-07-2-tech str-08-1 str-08-1-tech str-08-2 str-08-2-tech str-09-1 str-09-2 str-10-1 str-10-2 str-11-1 str-11-2 
str-12-1 str-12-2 str-13-1 str-13-2 str-14-1 str-14-2 str-15-1 str-15-2 str-16 str-16-ord str-16-tech str-17 str-18 str-19 str-20 str-99 str-99-1 str-99-2 str-ord tmp-list-902)

(if (/= list-901 nil) 
	(setq list-901 (reverse list-901)
				list-902 (reverse list-902)
	);setq
);if

;считываем значения из полей диалога
(setq str-01 (nth (atoi (get_tile "txt-01")) list-01)
			
			str-02 (nth (atoi (get_tile "txt-02")) list-02)
			str-02-ord (substr str-02 1 2)
			str-02-2 (substr str-02 4)
			str-02-2 (vl-string-subst "индикация" "Индикация" str-02-2)
			str-02-2 (strcat "электронный блок исп. " str-02-ord " (" str-02-2 ")")
						
			str-03 (nth (atoi (get_tile "txt-03")) list-03)
			str-03 (strcat "Uпит. " str-03 "В")
			
			str-16 (nth (atoi (get_tile "txt-16")) list-16)
			str-17 (nth (atoi (get_tile "txt-17")) list-17)
			str-18 (get_tile "txt-18")
			str-19 (get_tile "txt-19")
			str-20 (get_tile "txt-20")
			str-99 "1,5"
);setq

;;;;;;;считывам данные из полей диалога//////////////////////////////
(if (or (= str-01 "1 канальный, однолуч.") (= str-01 "1 канальный, двухлуч.") (= str-01 "2-х канальный, однолуч.")) 
	(setq str-04-1 (nth (atoi (get_tile "txt-04-1")) list-04-1)
				str-04-1-tech (strcat "Ду " str-04-1 "мм")
					
				str-05-1 (nth (atoi (get_tile "txt-05-1")) list-05-1)
				str-05-1-tech (strcat "пределы изм. " str-05-1 "м3/ч")
					
				str-06-1 (nth (atoi (get_tile "txt-06-1")) list-06-1)			
				str-06-1-tech (strcat "материал " (vl-string-subst "сталь" "Сталь" str-06-1))
					
				str-07-1 (nth (atoi (get_tile "txt-07-1")) list-07-1)
				str-07-1-tech (strcat "присоединение " (strcase str-07-1 1))
				
				str-08-1 (get_tile "txt-08-1")
				str-08-1-tech (strcat "длина соед. кабеля " str-08-1 "м")
				
				str-09-1 (get_tile "txt-09-1")
				str-10-1 (get_tile "txt-10-1")
				str-11-1 (get_tile "txt-11-1")
				str-12-1 (get_tile "txt-12-1")
				str-13-1 (get_tile "txt-13-1")
				str-14-1 (get_tile "txt-14-1")
				str-15-1 (get_tile "txt-15-1")
	);setq
);if

(if (= str-01 "2-х канальный, однолуч.")
	(setq str-04-2 (nth (atoi (get_tile "txt-04-2")) list-04-2)
				str-04-2-tech (strcat "Ду " str-04-2 "мм")
					
				str-05-2 (nth (atoi (get_tile "txt-05-2")) list-05-2)
				str-05-2-tech (strcat "пределы изм. " str-05-2 "м3/ч")
					
				str-06-2 (nth (atoi (get_tile "txt-06-2")) list-06-2)		
				str-06-2-tech (strcat "материал " (vl-string-subst "сталь" "Сталь" str-06-2))
				
				str-07-2 (nth (atoi (get_tile "txt-07-2")) list-07-2)
				str-07-2-tech (strcat "присоединение " (strcase str-07-2 1))
				
				str-08-2 (get_tile "txt-08-2")
				str-08-2-tech (strcat "длина соед. кабеля " str-08-2 "м")
				
				str-09-2 (get_tile "txt-09-2")
				str-10-2 (get_tile "txt-10-2")
				str-11-2 (get_tile "txt-11-2")
				str-12-2 (get_tile "txt-12-2")
				str-13-2 (get_tile "txt-13-2")
				str-14-2 (get_tile "txt-14-2")
				str-15-2 (get_tile "txt-15-2")
	);setq
);if

;;;;;;;;обрабатываем данные        ///////////////////////////////////
(if (or (= str-01 "1 канальный, однолуч.") (= str-01 "1 канальный, двухлуч."))
	(progn
		;канал 1, температура, давление, расход
		(cond
			((and (/= str-10-1 "") (/= str-11-1 "")) (setq str-10-1 (strcat str-10-1 "..." str-11-1)));=
			((and (= str-10-1 "") (/= str-11-1 "")) (setq str-10-1 str-11-1));=
		);cond
		
		(cond
			((and (/= str-12-1 "") (/= str-13-1 "")) (setq str-11-1 (strcat str-12-1 "..." str-13-1)));=
			((and (= str-12-1 "") (/= str-13-1 "")) (setq str-11-1 str-13-1));=
			((and (/= str-12-1 "") (= str-13-1 "")) (setq str-11-1 str-12-1));=
		);cond
		
		(cond
			((and (/= str-14-1 "") (/= str-15-1 "")) (setq str-12-1 (strcat str-14-1 "..." str-15-1)));=
			((and (= str-14-1 "") (/= str-15-1 "")) (setq str-12-1 str-15-1));=
			((and (/= str-14-1 "") (= str-15-1 "")) (setq str-12-1 str-14-1));=
		);cond
	);progn
);if

(cond
	((= str-04-1 "15") (setq str-99-1 "1,5")); =
	((= str-04-1 "25") (setq str-99-1 "2,8")); =
	((= str-04-1 "32") (setq str-99-1 "4,5")); =
	((= str-04-1 "40") (setq str-99-1 "5,2")); =
	((= str-04-1 "50") (setq str-99-1 "8")); =
	((= str-04-1 "65") (setq str-99-1 "8")); =
	((= str-04-1 "80") (setq str-99-1 "12")); =
	((= str-04-1 "100") (setq str-99-1 "16")); =
	
	((= str-04-1 "150") (setq str-99-1 "29")); =
	((= str-04-1 "200") (setq str-99-1 "36")); =
	((= str-04-1 "250") (setq str-99-1 "38")); =
	((= str-04-1 "300") (setq str-99-1 "45")); =
	
	((= str-04-1 "350") (setq str-99-1 "52")); =
	((= str-04-1 "400") (setq str-99-1 "70")); =
	((= str-04-1 "500") (setq str-99-1 "112")); =
	((= str-04-1 "600") (setq str-99-1 "162")); =
	((= str-04-1 "700") (setq str-99-1 "250")); =
	((= str-04-1 "800") (setq str-99-1 "400")); =
	((= str-04-1 "900") (setq str-99-1 "500")); =
	((= str-04-1 "1000") (setq str-99-1 "700")); =
	((= str-04-1 "1200") (setq str-99-1 "850")); =
	((= str-04-1 "1400") (setq str-99-1 "960")); =
);cond

(if (= str-06-1 "Сталь 20")
	(setq str-06-ord "СТ20");setq
	(setq str-06-ord "G");setq
);if

(cond
	((= str-16 "Имитационная")
		(setq str-16-ord "P"
					str-16-tech (strcase str-16 1)
		);setq
	);

	((= str-16 "Проливная")
		(setq str-16-ord "R"
					str-16-tech (strcase str-16 1)
		);setq
	);
	
	((= str-16 "Технологическая")
		(setq str-16-ord "N"
					str-16-tech (strcase str-16 1)
		);setq
	);
);cond

(if (or (= "1 канальный, однолуч." str-01) (= "1 канальный, двухлуч." str-01))
	(progn
		(setq str-ord (strcat "US800-" str-02-ord "-" str-04-1 "-" str-06-ord "-" str-08-1 "-" str-16-ord)
				
					list-901 (vl-list* (strcat str-01 "  " 
																		 str-02-ord "  "
																		 str-03 "  "
																		 str-04-1-tech "  "
																		 str-06-1 "  "
																		 str-07-1 "  "
																		 "Кабель " str-08-1 " м  "
																		 str-09-1 "  "
																		 str-16 "  "
																		 "УПР до " str-17 "МПа  "
																		 (if (= str-18 "1") (strcat "ПЭП IP68  ") (strcat ""))
																		 (if (= str-19 "1") (strcat "ПЭП с шар. кран.  ") (strcat ""))
																		 (if (= str-20 "1") (strcat "ПЭП-У  ") (strcat ""))
																		 ) list-901)
		);setq
		
		(setq tmp-list-902 (list	(cons 1 str-01) 
															(cons 2 str-02-2) 
															(cons 3 str-03)
															(cons 4 str-ord) 
															
															(cons 41 str-04-1-tech) 
															(cons 51 str-05-1-tech) 
															(cons 61 str-06-1-tech) 
															(cons 71 str-07-1-tech) 
															(cons 81 str-08-1-tech) 
															(cons 91 str-09-1) 
															(cons 101 str-10-1) 
															(cons 111 str-11-1) 
															(cons 121 str-12-1)
															(cons 16 str-16-tech) 
															(cons 17 str-17) 
															(cons 18 str-18) 
															(cons 19 str-19)
															(cons 20 str-20) 
															(cons 99 str-99)
															(cons 991 str-99-1));list
		);setq
	);progn
);if

(if (= str-01 "2-х канальный, однолуч.")
	(progn	
		;канал 2, температура, давление, расход
		(cond
			((and (/= str-10-2 "") (/= str-11-2 "")) (setq str-10-2 (strcat str-10-2 "..." str-11-2)));=
			((and (= str-10-2 "") (/= str-11-2 "")) (setq str-10-2 str-11-2));=
		);cond
		
		(cond
			((and (/= str-12-2 "") (/= str-13-2 "")) (setq str-11-2 (strcat str-12-2 "..." str-13-2)));=
			((and (= str-12-2 "") (/= str-13-2 "")) (setq str-11-2 str-13-2));=
			((and (/= str-12-2 "") (= str-13-2 "")) (setq str-11-2 str-12-2));=
		);cond
		
		(cond
			((and (/= str-14-2 "") (/= str-15-2 "")) (setq str-12-2 (strcat str-14-2 "..." str-15-2)));=
			((and (= str-14-2 "") (/= str-15-2 "")) (setq str-12-2 str-15-2));=
			((and (/= str-14-2 "") (= str-15-2 "")) (setq str-12-2 str-14-2));=
		);cond
	);progn
);if

(cond
	((= str-04-2 "15") (setq str-99-2 "1,5")); =
	((= str-04-2 "25") (setq str-99-2 "2,8")); =
	((= str-04-2 "32") (setq str-99-2 "4,5")); =
	((= str-04-2 "40") (setq str-99-2 "5,2")); =
	((= str-04-2 "50") (setq str-99-2 "8")); =
	((= str-04-2 "65") (setq str-99-2 "8")); =
	((= str-04-2 "80") (setq str-99-2 "12")); =
	((= str-04-2 "100") (setq str-99-2 "16")); =
	
	((= str-04-2 "150") (setq str-99-2 "29")); =
	((= str-04-2 "200") (setq str-99-2 "36")); =
	((= str-04-2 "250") (setq str-99-2 "38")); =
	((= str-04-2 "300") (setq str-99-2 "45")); =
	
	((= str-04-2 "350") (setq str-99-2 "52")); =
	((= str-04-2 "400") (setq str-99-2 "70")); =
	((= str-04-2 "500") (setq str-99-2 "112")); =
	((= str-04-2 "600") (setq str-99-2 "162")); =
	((= str-04-2 "700") (setq str-99-2 "250")); =
	((= str-04-2 "800") (setq str-99-2 "400")); =
	((= str-04-2 "900") (setq str-99-2 "500")); =
	((= str-04-2 "1000") (setq str-99-2 "700")); =
	((= str-04-2 "1200") (setq str-99-2 "850")); =
	((= str-04-2 "1400") (setq str-99-2 "960")); =
);cond


(if (= "2-х канальный, однолуч." str-01)
	(progn
		(setq str-ord (strcat "US800-" str-02-ord "-" str-04-1 "/" str-04-2 "-" str-06-ord "-" str-08-1 "/" str-08-2 "-" str-16-ord)
					list-901 (vl-list* (strcat str-01 "  " 
																		 str-02-ord "  "
																		 str-03 "  "
																		 "Канал 1 " str-04-1-tech "  "
																		 str-07-1 "  "
																		 str-08-1 " м  "
																		 str-09-1 "  "
																																				 
																		 "Канал 2 " str-04-2-tech "  "
																		 str-07-2 "  "
																		 str-08-2 " м  "
																		 str-09-2 "  "
																		 																		 
																		 str-16 "  "
																		 "УПР до " str-17 "МПа  "
																		 (if (= str-18 "1") (strcat "ПЭП IP68  ") (strcat ""))
																		 (if (= str-19 "1") (strcat "ПЭП с шар. кран.  ") (strcat ""))
																		 (if (= str-20 "1") (strcat "ПЭП-У  ") (strcat "")))
																		 list-901)
		);setq
	
		(setq tmp-list-902 (list	(cons 1 str-01) 
															(cons 2 str-02-2) 
															(cons 3 str-03)
															(cons 4 str-ord)
															
															(cons 41 str-04-1-tech) 
															(cons 51 str-05-1-tech) 
															(cons 61 str-06-1-tech) 
															(cons 71 str-07-1-tech) 
															(cons 82 str-08-2-tech) 
															(cons 91 str-09-1) 
															(cons 101 str-10-1) 
															(cons 111 str-11-1) 
															(cons 121 str-12-1)
															
															(cons 42 str-04-2-tech) 
															(cons 52 str-05-2-tech) 
															(cons 62 str-06-2-tech) 
															(cons 72 str-07-2-tech) 
															(cons 82 str-08-2-tech) 
															(cons 92 str-09-2) 
															(cons 102 str-10-2) 
															(cons 112 str-11-2) 
															(cons 122 str-12-2)
															
															(cons 16 str-16) 
															(cons 17 str-17) 
															(cons 18 str-18) 
															(cons 19 str-19)
															(cons 20 str-20) 
															(cons 99 str-99)
															(cons 991 str-99-1)
															(cons 992 str-99-2));list
		);setq
	);progn
);if

(setq list-902 (vl-list* tmp-list-902 list-902)
			list-902 (reverse list-902)
			list-901 (reverse list-901)
);setq

(list-filling "txt-901" list-901)

(princ)
)
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;///////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в ПЭ                   ////////////////////////////////////////////////////
(defun le-101-01-flow-us800-01-general

( / cntr-1 pnt-ins str-01 tmp)

(setq cntr-1 0);setq

(repeat (length list-902)
	(setq tmp (nth cntr-1 list-902)
				str-01 (cdr (assoc 1 tmp))
	);setq

	(setvar "osmode" 6199)

	(setq pnt-ins (getpoint "\nУкажите точку вставки\n"));setq
	
	;///////////////////////////////////////////////////////////////////
	(if (or (= str-01 "1 канальный, однолуч.") (= str-01 "1 канальный, двухлуч."))
		(le-101-01-flow-us800-1-channel tmp pnt-ins)
	);if
	
	;///////////////////////////////////////////////////////////////////
	(if (= str-01 "2-х канальный, однолуч.")
		(le-101-01-flow-us800-2-channel tmp pnt-ins)
	);if
		
	(setq cntr-1 (+ cntr-1 1));setq
);repeat

(princ)
)
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в ПЭ                   /////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun le-101-01-flow-us800-1-channel

(tmp pnt-ins / cntr-1 dlt-y-le pnt-ins str-01 str-02 str-03 str-04 str-41 str-51 str-61 str-701-1 str-701-2 str-701-3 str-702 str-71 str-vol-3 tmp xpnt-ins ypnt-ins)

(setq str-01 (cdr (assoc 1 tmp))
			str-02 (cdr (assoc 2 tmp))
			str-03 (cdr (assoc 3 tmp))
			str-04 (cdr (assoc 4 tmp))
			str-41 (cdr (assoc 41 tmp))
			str-51 (cdr (assoc 51 tmp))
			str-61 (cdr (assoc 61 tmp))
			str-71 (cdr (assoc 71 tmp))
			str-702 nil
			
			xpnt-ins (nth 0 pnt-ins)
			ypnt-ins (nth 1 pnt-ins)
			
			str-701-2 (strcat "- " str-02 ", " str-03)
			str-701-3 (strcat "- ультразвуковой преобразователь расхода (УПР), " str-41 ", " str-51 ", " str-61 ", " str-71)
);setq
	
;///////////////////////////////////////////////////////////////////
(if (= str-01 "1 канальный, однолуч.")
	(setq str-701-1 (strcat "Расходомер ультразвуковой " str-04 " (одноканальный, однолучевой) в составе:"));setq
);if
	
;///////////////////////////////////////////////////////////////////
(if (= str-01 "1 канальный, двухлуч.")
	(setq str-701-1 (strcat "Расходомер ультразвуковой " str-04 " (одноканальный, двухлучевой) в составе:"));setq
);if
	
;печатаем расходомер
(split-str-parts-le-01-general str-701-1 str-702 pnt-ins "**1**");
	
;печатаем электронный блок
(dlt-y-for-le-110 str-701-1)
	
(setq ypnt-ins (- ypnt-ins dlt-y-le)				
			pnt-ins (list xpnt-ins ypnt-ins)
);setq
	
(split-str-parts-le-01-general str-701-2 str-702 pnt-ins "1");
	
;печатаем УПР
(dlt-y-for-le-110 str-701-2)
	
(setq ypnt-ins (- ypnt-ins dlt-y-le)				
			pnt-ins (list xpnt-ins ypnt-ins)
);setq
	
(split-str-parts-le-01-general str-701-3 str-702 pnt-ins "1");

(princ)
)
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в спцф                   ///////////////////////////////////////////////////////////////////////
(defun spcf-101-01-flow-us800-01-general

( / cntr-1 pnt-ins str-01 tmp)

(setq cntr-1 0);setq

(repeat (length list-902)
	(setq tmp (nth cntr-1 list-902)
				str-01 (cdr (assoc 1 tmp))
	);setq
	
	(setvar "osmode" 6199)
	
	(setq pnt-ins (getpoint "\nУкажите точку вставки\n"));setq
	
	(if (or (= str-01 "1 канальный, однолуч.") (= str-01 "1 канальный, двухлуч."))
		(spcf-101-01-flow-us800-1-channel tmp pnt-ins)
	);if

	(setq cntr-1 (+ cntr-1 1));setq
);repeat

(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(princ)
)
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в спцф для 1 канального УПР/////////////////////////////////////////////////////////////////////
(defun spcf-101-01-flow-us800-1-channel

(tmp pnt-ins / str-01 str-01-1 str-02 str-03 str-04 str-101 str-111 str-121 str-16 str-17 str-18 str-19 str-20 str-41 
str-51 str-61 str-701 str-71 str-81 str-91 str-99 str-991 str-dscr str-manufact str-note str-order str-part-1 str-part-2 
str-unit txt-101 txt-111 txt-121 txt-81 txt-91)

;(princ "\n             tmp = ") (princ tmp);Erase_DV
;(getstring "\nPress Enter to continue...");Erase_DV

(setq str-01 (cdr (assoc 1 tmp))
			str-02 (cdr (assoc 2 tmp))
			str-03 (cdr (assoc 3 tmp))
			str-04 (cdr (assoc 4 tmp))
			str-41 (cdr (assoc 41 tmp))
			str-51 (cdr (assoc 51 tmp))
			str-61 (cdr (assoc 61 tmp))
			str-71 (cdr (assoc 71 tmp))
			str-81 (cdr (assoc 81 tmp))
			str-91 (cdr (assoc 91 tmp))
			str-101 (cdr (assoc 101 tmp))
			str-111 (cdr (assoc 111 tmp))
			str-121 (cdr (assoc 121 tmp))
			str-16 (cdr (assoc 16 tmp))
			str-17 (cdr (assoc 17 tmp))
			str-18 (cdr (assoc 18 tmp))
			str-19 (cdr (assoc 19 tmp))
			str-20 (cdr (assoc 20 tmp))
			str-99 (cdr (assoc 99 tmp))
			str-991 (cdr (assoc 991 tmp))
);setq
	
(if (= txt-81 "") (setq txt-81 "*******"));=
	
(if (= txt-91 "") (setq txt-91 "*******"));=
	
(if (= txt-101 "") (setq txt-101 "*******"));=
	
(if (= txt-111 "") (setq txt-111 "*******"));=
	
(if (= txt-121 "") (setq txt-121 "*******"));=

(if (= str-01 "1 канальный, однолуч.")
	(setq str-01-1 "одноканальный, однолучевой");setq
);if
	
(if (= str-01 "1 канальный, двухлуч.")
	(setq str-01-1 "одноканальный, двухлучевой");setq
);if

(setq str-701 (list (cons 1 "Расходомер ультразвуковой")
										(cons 97 "компл.")
										(cons 99 nil)
							 	 );list

			str-dscr (list (cons 1 (strcat "- " str-01-1))
										 (cons 2 "в составе:")
							 );list
			
			str-part-1 (list (cons 1 (strcat "- " str-02))
										   (cons 2 str-03)
										   (cons 97 "шт.")
										   (cons 98 "1")
										   (cons 99 str-99)
							 	 );list
			
			str-part-2 (list (cons 1 "- ультразвуковой преобразователь расхода (УПР)")
										   (cons 2 str-41)
										   (cons 3 str-51)
										   (cons 4 str-61)
										   (cons 5 str-71)
										   (cons 97 "шт.")
										   (cons 98 "1")
										   (cons 99 str-991)
							 	 );list
													
			str-manufact "ENCONT, г. Чебоксары"
			
			str-order (list (cons 1 str-04) 
											(cons 2 "-") 
											(cons 3 "***.ОЛ.**") ;;;  здесь обозначение ТУ или НТД
								);list
				
			str-unit "компл."
			str-note "Документ об утв. типа СИ №21142-11" ;;;;;;; примечание, текстовая строка

);setq

(split-str-parts-spcf-w-elem-2-01-general str-701 str-dscr str-part-1 str-part-2 str-manufact str-order str-note pnt-ins)








		
;			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Ультразвуковой расходомер в составе:");наименование
;			(command "_text" "_ML" (list (+ x-pnt-ins 10) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "- электронный блок (ЭБ) " txt-1))
;			(command "_text" "_ML" (list (+ x-pnt-ins 10) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 (strcat "- " txt-2))
;			(command "_text" "_ML" (list (+ x-pnt-ins 10) (- (- y-pnt-ins (* dlt-y 3)) 4)) 2.5 0 (strcat "- электропитание " txt-3))
;			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 4)) 4)) 2.5 0 (strcat "- ультразвуковой преобразователь расхода (УПР) Ду " txt-41 "мм"))
;			(command "_text" "_ML" (list (+ x-pnt-ins 10) (- (- y-pnt-ins (* dlt-y 5)) 4)) 2.5 0 (strcat "- материал УПР " txt-61 ", присоединение УПР " txt-71))
;			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 6)) 4)) 2.5 0 (strcat "- поверка " txt-16))
;			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 7)) 4)) 2.5 0 (strcat "- кабель РК-50-2-11 (соединение ЭБ и УПР) " txt-81 "м"))
;			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 8)) 4)) 2.5 0 (strcat "- давление УПР до " txt-17 "МПа"))
;			
;			(cond
;				((= txt-18 "1")
;					(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y kol)) 4)) 2.5 0 "- пьезоэлектрические преобразователи с IP68 по ГОСТ 14254-96")
;					(setq kol (1+ kol) nmbr-ln (1+ nmbr-ln));setq
;				);=
;			);cond
;			
;			(cond
;				((= txt-19 "1")
;					(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y kol)) 4)) 2.5 0 "- пьезоэлектрические преобразователи с шаровым краном")
;					(setq kol (1+ kol) nmbr-ln (1+ nmbr-ln));setq
;				);=
;			);cond
;			
;			(cond
;				((= txt-20 "1")
;					(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y kol)) 4)) 2.5 0 "- пьезоэлектрические преобразователи с усиленным сигналом (ПЭП-У)")
;					(setq kol (1+ kol) nmbr-ln (1+ nmbr-ln));setq
;				);=
;			);cond
;			
;			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y kol)) 4)) 2.5 0 (strcat "- измеряемая среда " txt-91))
;			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y (+ kol 1))) 4)) 2.5 0 (strcat "- T=" txt-101 "%%dC, P=" txt-111 "МПа, Q=" txt-121 "м3/ч"))
		
;			(command "_text" "_ML" (list (+ x-pnt-ins 160) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 (strcat "US800-" txt-8-1 "-" txt-5 "-А-" txt-9-1 "-" ))
;			(command "_text" "_ML" (list (+ x-pnt-ins 160) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 "US800.421364.001ТУ")
		
;			(command "_TEXT" "_MC" (list (+ x-pnt-ins 280) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "компл.");количество
;			(command "_TEXT" "_MC" (list (+ x-pnt-ins 280) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 "шт.")
;			(command "_TEXT" "_MC" (list (+ x-pnt-ins 280) (- (- y-pnt-ins (* dlt-y 5)) 4)) 2.5 0 "шт.")
;			;кол
;			(command "_TEXT" "_MC" (list (+ x-pnt-ins 300) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 "1")
;			(command "_TEXT" "_MC" (list (+ x-pnt-ins 300) (- (- y-pnt-ins (* dlt-y 5)) 4)) 2.5 0 "1")
;			;масса
;			(command "_text" "_MC" (list (+ x-pnt-ins 322.5) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 txt-99)
;			(command "_text" "_MC" (list (+ x-pnt-ins 322.5) (- (- y-pnt-ins (* dlt-y 5)) 4)) 2.5 0 txt-991)
;		
;			(command "_TEXT" "_MC" (list (+ x-pnt-ins 247.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "ООО");производитель
;			(command "_TEXT" "_MC" (list (+ x-pnt-ins 247.5) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 
;
;			(command "_text" "_ML" (list (+ x-pnt-ins 336) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Свидетельство")
;			(command "_text" "_ML" (list (+ x-pnt-ins 336) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 "RU.C.29.006.A №43735,")
;			(command "_text" "_ML" (list (+ x-pnt-ins 336) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 "№21142-11 в")
;			(command "_text" "_ML" (list (+ x-pnt-ins 336) (- (- y-pnt-ins (* dlt-y 3)) 4)) 2.5 0 "Госреестре СИ РФ")

	


(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(princ)
)
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в овш               ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun lecgv-101-01-flow-us800-01-general

( / cntr-1 dlt-y nmbr-ln pnt-ins str-tmp txt-10 txt-11 txt-9 txt-99 x-pnt-ins y-pnt-ins y-pnt-ins-1)

(setq cntr-1 0 ;счетчик
);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				txt-9 (cdr (assoc 9 str-tmp))
				txt-10 (cdr (assoc 10 str-tmp))
				txt-11 (cdr (assoc 11 str-tmp))
				txt-99 (cdr (assoc 99 str-tmp))
	);setq
	

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

	(setq nmbr-ln 4
	);setq
			
	(1000-delete-items-le-cgv nmbr-ln x-pnt-ins y-pnt-ins)

	;обработка данных
	(cond 
		((= txt-9 "Индикация, архив, интерфейс") (setq txt-9 ""));=
		((= txt-9 "Индикация, 4-20мА, архив, интерфейс") 
			(setq nmbr-ln 5 
						txt-9 "4-20мА" 
						txt-10 (strcat txt-10 ",")
			);setq
		);=
	);cond
	
	(cond 
		((= txt-11 "~220") (setq txt-11 "220В переменного тока"));=
		((= txt-11 "=12") (setq txt-11 "12В постоянного тока"));=
		((= txt-11 "=24") (setq txt-11 "24В постоянного тока"));=
		((= txt-11 "=36") (setq txt-11 "36В постоянного тока"));=
	);cond
	
	(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 (strcat "Электронный блок из состава"))
	(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "ультразвукового расходомера US-800,"))
	(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 (strcat txt-11 ", " txt-10))
	(command "_text" "_ML" (list (+ x-pnt-ins 61) (- (- y-pnt-ins (* dlt-y 3)) 4)) 2.5 0 (strcat txt-9))
	(command "_TEXT" "_MC" (list (+ x-pnt-ins 142.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 txt-99)

	(repeat nmbr-ln
  	(command "_insert" "овш-пэ-пустая-строка" "_X" 1 "_Y" 1 "_Z" 1 "_R" 0 (list x-pnt-ins y-pnt-ins-1))
  	(setq y-pnt-ins-1 (- y-pnt-ins-1 8));setq
	);repeat
 
	(setq cntr-1 (+ cntr-1 1)
	);setq
);repeat

(princ)
)
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


