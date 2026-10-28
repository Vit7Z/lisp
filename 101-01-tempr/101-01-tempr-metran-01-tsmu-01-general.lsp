;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////                                                              ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun 101-01-tempr-metran-01-tsmu-01-general

( / adoc counter dcl-id list-01 list-02 list-03 list-04 list-05 list-06 list-07 list-08 list-09 list-10 list-11 list-13 list-14 list-21 list-22 list-23 list-24 list-901 list-902 str-01 str-f type-list)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(setvar "cmdecho" 0)

(setq str-f 1
			str-01 nil
      counter 0
      list-01 (list "ТСМУ Метран-274" "ТСПУ Метран-276")
      list-901 nil
      list-902 nil
);setq

(tmp-start-101-01-tempr-metran-01-tsmu-01-general)

(if (< (setq dcl-id (load_dialog "dia-101-01-tempr-metran-01-tsmu-01-general.dcl")) 0) ;ищем диалог
		(progn
			(alert "Не найден dcl-файл")
			(exit)
		);progn
);if

(if (not (new_dialog "dia_101_tmprt_sens_metran_tsmu" dcl-id))
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

;для диалога выбора длины погружения
(list-filling "txt-21" list-21)
(list-filling "txt-22" list-22)
(list-filling "txt-23" list-23)
(list-filling "txt-24" list-24)

(set_tile "txt-21" "0")
(set_tile "txt-22" "0")
(set_tile "txt-23" "0")
(set_tile "txt-24" "0")

(action_tile "txt-01"
  (strcat "(tmp-start-101-01-tempr-metran-01-tsmu-01-general)");srcat
);action_tile

(action_tile "txt-02"
  (strcat "(tmp-02-101-temp-sensor-metran)");srcat
);action_tile

(action_tile "txt-07"
  (strcat "(tmp-07-101-temp-sensor-metran)");srcat
);action_tile

(action_tile "txt-10"
  (strcat "(tmp-10-101-temp-sensor-metran)");srcat
);action_tile

(action_tile "but1"
  (strcat "(tmp-filling-fields-101-temp-sensor-metran)");strcat
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

;для диалога выбора длины погружения
(action_tile "txt-21"
  (strcat "(tmp-21-101-temp-sensor-telokontr-kaz)");strcat
);action_tile

(action_tile "txt-22"
  (strcat "(tmp-22-101-temp-sensor-telokontr-kaz)");strcat
);action_tile

(action_tile "txt-23"
  (strcat "(tmp-22-101-temp-sensor-telokontr-kaz)"
  				"(tmp-23-101-temp-sensor-telokontr-kaz)"
  );strcat
);action_tile

(start_dialog)
(unload_dialog dcl-id)

(if (= type-list "le") (tmp-le-101-temp-sensor-metran list-902));if
(if (= type-list "spcf") (tmp-spcf-101-temp-sensor-metran list-902));if

(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(vla-endundomark adoc)
(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// конец программы ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun tmp-start-101-01-tempr-metran-01-tsmu-01-general

()

(if (= nil str-01) 
	(setq str-01 (nth 0 list-01));setq
	(setq str-01 (nth (atoi (get_tile "txt-01")) list-01));setq
);if

(if (= "ТСМУ Метран-274" str-01)
	(setq list-02 (list "01 (без штуцера)" "02 (штуцер подвижн.)" "03 (штуцер подвижн.)" "04 (без штуцера)" "05 (штуцер подвижн.)" "06 (штуцер подвижн.)" 
											"07 (без штуцера)" "08 (штуцер неподвижн.)" "09 (штуцер неподвижн.)")
				list-03 (list "Нет")
				list-04 (list "100" "120" "160" "200" "250" "320" "400" "500" "630" "800" "1000" "1250" "1600")
				list-05 (list "0,5" "0,25")
				list-06 (list "12Х18Н10Т" "10Х17Н13М2Т")
				list-07 (list "-50...+100" "-50...+150" "0...+150" "0...+200" "0...+300" "0...+400" "0...+500")
				list-08 (list "4...20" "0...5")
				list-09 (list "Нет")
				list-10 (list "Нет") 
				list-11 (list "У1.1 (-45...+70)" "Т3 (-10...+70)")
				list-13 (list "10")
				list-14 (list "50М" "100М")
	);setq
);if

(if (= "ТСПУ Метран-276" str-01)
	(setq list-02 (list "01 (без штуцера)" "02 (штуцер подвижн.)" "03 (штуцер подвижн.)" "04 (без штуцера)" "05 (штуцер подвижн.)" "06 (штуцер подвижн.)" 
											"07 (без штуцера)" "08 (штуцер неподвижн.)" "09 (штуцер неподвижн.)" "26 (изм. t возд.)")
				list-03 (list "Нет")
				list-04 (list "100" "120" "160" "200" "250" "320" "400" "500" "630" "800" "1000" "1250" "1600")
				list-05 (list "0,5" "0,25")
				list-06 (list "12Х18Н10Т" "10Х17Н13М2Т")
				list-07 (list "-50...+100" "-50...+150" "0...+150" "0...+200" "0...+300" "0...+400" "0...+500")
				list-08 (list "4...20" "0...5")
				list-09 (list "Нет")
				list-10 (list "Нет") 
				list-11 (list "У1.1 (-45...+70)" "Т3 (-10...+70)")
				list-13 (list "8")
				list-14 (list "100П" "Pt100")
	);setq
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

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun tmp-02-101-temp-sensor-metran

( / str-01 str-02)

(setq str-01 (nth (atoi (get_tile "txt-01")) list-01)
			str-02 (nth (atoi (get_tile "txt-02")) list-02)
);setq

(if (= str-01 "ТСМУ Метран-274")
	(cond
		((= "01 (без штуцера)" str-02)
    	(setq list-03 (list "Нет")
    				list-04 (list "100" "120" "160" "200" "250" "320" "400" "500" "630" "800" "1000" "1250" "1600")
    				list-09 (list "Нет")
						list-10 (list "Нет")
						list-11 (list "У1.1 (-45...+70)" "Т3 (-10...+70)")
         		list-13 (list "10")
    	);setq
		);=

		((= "02 (штуцер подвижн.)" str-02)
			(setq list-03 (list "Нет")
						list-04 (list "60" "80" "100" "120" "160" "200" "250" "320" "400" "500" "630" "800" "1000" "1250" "1600")
						list-09 (list "Нет")
						list-10 (list "Нет")
						list-11 (list "У1.1 (-45...+70)" "Т3 (-10...+70)")
    	      list-13 (list "10")
   		);setq
	);=

		((= "03 (штуцер подвижн.)" str-02)
			(setq list-03 (list "Нет")
						list-04 (list "60" "80" "100" "120" "160" "200" "250" "320" "400" "500" "630" "800" "1000" "1250" "1600")
						list-09 (list "Нет")
						list-10 (list "Нет")
						list-11 (list "У1.1 (-45...+70)" "Т3 (-10...+70)")
    		    list-13 (list "8")
   		);setq
		);=
  
		((= "04 (без штуцера)" str-02)
    	(setq list-03 (list "Exia")
    				list-04 (list "100" "120" "160" "200" "250" "320" "400" "500" "630" "800" "1000" "1250" "1600")
    				list-09 (list "Нет")
					 	list-10 (list "Т5 (100)" "Т6 (85)")
					 	list-11 (list "У1.1 (-45...+70)" "Т3 (-10...+70)")
     		    list-13 (list "10")
    	);setq
		);=

		((= "05 (штуцер подвижн.)" str-02)
    	(setq list-03 (list "Exia")
    				list-04 (list "60" "80" "100" "120" "160" "200" "250" "320" "400" "500" "630" "800" "1000" "1250" "1600")
    				list-09 (list "Нет")
					 	list-10 (list "Т5 (100)" "Т6 (85)")
					 	list-11 (list "У1.1 (-45...+70)" "Т3 (-10...+70)")
    	      list-13 (list "10")
    	);setq
		);=

		((= "06 (штуцер подвижн.)" str-02)
    	(setq list-03 (list "Exia")
    				list-04 (list "60" "80" "100" "120" "160" "200" "250" "320" "400" "500" "630" "800" "1000" "1250" "1600")
    				list-09 (list "Нет")
					 	list-10 (list "Т5 (100)" "Т6 (85)")
					 	list-11 (list "У1.1 (-45...+70)" "Т3 (-10...+70)")
         		list-13 (list "8")
    	);setq
		);=
  
		((= "07 (без штуцера)" str-02)
    	(setq list-03 (list "Exd")
    				list-04 (list "60" "80" "100" "120" "160" "200" "250" "320" "400" "500" "630" "800" "1000" "1250" "1600")
    				list-09 (list "БК (бронир. каб.)" "ТБ (трубн. монтаж)")
					 	list-10 (list "Т5 (100)" "Т6 (85)")
					 	list-11 (list "У1.1 (-45...+70)" "Т3 (-10...+70)")
     		    list-13 (list "8")
    	);setq
		);=

		((= "08 (штуцер неподвижн.)" str-02)
    	(setq list-03 (list "Exd")
    				list-04 (list "60" "80" "100" "120" "160" "200" "250" "320" "400" "500" "630" "800" "1000" "1250" "1600")
    				list-09 (list "БК (бронир. каб.)" "ТБ (трубн. монтаж)")
					 	list-10 (list "Т5 (100)" "Т6 (85)")
					 	list-11 (list "У1.1 (-45...+70)" "Т3 (-10...+70)")
     		    list-13 (list "8")
    	);setq
		);=

		((= "09 (штуцер неподвижн.)" str-02)
   		(setq list-03 (list "Exd")
   					list-04 (list "60" "80" "100" "120" "160" "200" "250" "320")
   					list-09 (list "БК (бронир. каб.)" "ТБ (трубн. монтаж)")
					 	list-10 (list "Т5 (100)" "Т6 (85)")
					 	list-11 (list "У1.1 (-45...+70)" "Т3 (-10...+70)")
          	list-13 (list "6")
    	);setq
		);=
	);cond
);if

(if (= str-01 "ТСПУ Метран-276")
	(cond
		((= "01 (без штуцера)" str-02)
    	(setq list-03 (list "Нет")
    				list-04 (list "100" "120" "160" "200" "250" "320" "400" "500" "630" "800" "1000" "1250" "1600")
    				list-09 (list "Нет")
						list-10 (list "Нет")
         		list-13 (list "10")
    	);setq
		);=

		((= "02 (штуцер подвижн.)" str-02)
			(setq list-03 (list "Нет")
						list-04 (list "60" "80" "100" "120" "160" "200" "250" "320" "400" "500" "630" "800" "1000" "1250" "1600")
						list-09 (list "Нет")
						list-10 (list "Нет")
    	      list-13 (list "10")
   		);setq
		);=

		((= "03 (штуцер подвижн.)" str-02)
			(setq list-03 (list "Без взрывозащиты")
						list-04 (list "60" "80" "100" "120" "160" "200" "250" "320" "400" "500" "630" "800" "1000" "1250" "1600")
						list-09 (list "Нет")
						list-10 (list "Нет")
    		    list-13 (list "8")
   		);setq
		);=
  
		((= "04 (без штуцера)" str-02)
    	(setq list-03 (list "Exia")
    				list-04 (list "100" "120" "160" "200" "250" "320" "400" "500" "630" "800" "1000" "1250" "1600")
    				list-09 (list "Нет")
					 	list-10 (list "Т5 (100)" "Т6 (85)")
					 	list-11 (list "У1.1 (-45...+70)" "Т3 (-10...+70)")
     		    list-13 (list "10")
    	);setq
		);=

		((= "05 (штуцер подвижн.)" str-02)
    	(setq list-03 (list "Exia")
    				list-04 (list "60" "80" "100" "120" "160" "200" "250" "320" "400" "500" "630" "800" "1000" "1250" "1600")
    				list-09 (list "Нет")
					 	list-10 (list "Т5 (100)" "Т6 (85)")
					 	list-11 (list "У1.1 (-45...+70)" "Т3 (-10...+70)")
    	      list-13 (list "10")
    	);setq
		);=

		((= "06 (штуцер подвижн.)" str-02)
    	(setq list-03 (list "Exia")
    				list-04 (list "60" "80" "100" "120" "160" "200" "250" "320" "400" "500" "630" "800" "1000" "1250" "1600")
    				list-09 (list "Нет")
					 	list-10 (list "Т5 (100)" "Т6 (85)")
					 	list-11 (list "У1.1 (-45...+70)" "Т3 (-10...+70)")
         		list-13 (list "8")
    	);setq
		);=
  
		((= "07 (без штуцера)" str-02)
    	(setq list-03 (list "Exd")
    				list-04 (list "60" "80" "100" "120" "160" "200" "250" "320" "400" "500" "630" "800" "1000" "1250" "1600")
    				list-09 (list "БК (бронир. каб.)" "ТБ (трубн. монтаж)")
					 	list-10 (list "Т5 (100)" "Т6 (85)")
					 	list-11 (list "У1.1 (-45...+70)" "Т3 (-10...+70)")
     		    list-13 (list "8")
    	);setq
		);=

		((= "08 (штуцер неподвижн.)" str-02)
    	(setq list-03 (list "Exd")
    				list-04 (list "60" "80" "100" "120" "160" "200" "250" "320" "400" "500" "630" "800" "1000" "1250" "1600")
    				list-09 (list "БК (бронир. каб.)" "ТБ (трубн. монтаж)")
					 	list-10 (list "Т5 (100)" "Т6 (85)")
					 	list-11 (list "У1.1 (-45...+70)" "Т3 (-10...+70)")
     		    list-13 (list "8")
    	);setq
		);=

		((= "09 (штуцер неподвижн.)" str-02)
   		(setq list-03 (list "Exd")
   					list-04 (list "60" "80" "100" "120" "160" "200" "250" "320")
   					list-09 (list "БК (бронир. каб.)" "ТБ (трубн. монтаж)")
					 	list-10 (list "Т5 (100)" "Т6 (85)")
					 	list-11 (list "У1.1 (-45...+70)" "Т3 (-10...+70)")
          	list-13 (list "6")
    	);setq
		);=
		
    ((= "26 (изм. t возд.)" str-02)
    	(progn
   			(setq list-03 (list "Нет" "Exia")
   						list-04 (list "100")
   						list-06 (list "12Х18Н10Т")
   						list-07 (list "-20...+50" "-50...+50" "-50...+80" "0...+50" "0...+80")
   						list-08 (list "4...20")
   						list-10 (list "Т5 (100 C)")
   						list-11 (list "У1.1 (-45...+70)" "Т3 (-50...+85)")
          		list-13 (list "8")
          		list-14 (list "Pt100")
    		);setq
				(list-filling "txt-06" list-06)
				(list-filling "txt-07" list-07)
				(list-filling "txt-08" list-08)
				(list-filling "txt-13" list-13)
				(list-filling "txt-14" list-14)

				(set_tile "txt-06" "0")
				(set_tile "txt-07" "0")
				(set_tile "txt-08" "0")
				(set_tile "txt-13" "0")
				(set_tile "txt-14" "0")    		
    	);progn
  	);=
	);cond
);if

(list-filling "txt-03" list-03)
(list-filling "txt-04" list-04)
(list-filling "txt-09" list-09)
(list-filling "txt-10" list-10)
(list-filling "txt-11" list-11)
(list-filling "txt-13" list-13)

(set_tile "txt-03" "0")
(set_tile "txt-04" "0")
(set_tile "txt-09" "0")
(set_tile "txt-10" "0")
(set_tile "txt-11" "0")
(set_tile "txt-13" "0")

(princ)
)
;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun tmp-07-101-temp-sensor-metran

( / str-02 str-03 str-07)

(setq str-02 (nth (atoi (get_tile "txt-02")) list-02)
			str-03 (nth (atoi (get_tile "txt-03")) list-03)
			str-07 (nth (atoi (get_tile "txt-07")) list-07)
);setq

(if (and (= "26 (изм. t возд.)" str-02) (= "Нет" str-03))
	(setq list-11
    	(cond
				((= "-20...+50" str-07) (list "У1.1 (-45...+70)" "Т3 (-50...+85)"))
				((= "-50...+50" str-07) (list "У1.1 (-50...+85)" "Т3 (-50...+85)"))
				((= "-50...+80" str-07) (list "У1.1 (-50...+85)" "Т3 (-50...+85)"))
				((= "0...+50" str-07) (list "У1.1 (-45...+70)" "Т3 (-10...+70)"))
				((= "0...+80" str-07) (list "У1.1 (-50...+85)" "Т3 (-50...+85)"))
    	);cond
	);setq
);if

(if (and (= "26 (изм. t возд.)" str-02) (/= "Нет" str-03))
	(setq list-11
    	(cond
				((= "-20...+50" str-07) (list "У1.1 (-50...+85)" "Т3 (-50...+85)"))
				((= "-50...+50" str-07) (list "У1.1 (-50...+85)" "Т3 (-50...+85)"))
				((= "-50...+80" str-07) (list "У1.1 (-50...+85)" "Т3 (-50...+85)"))
				((= "0...+50" str-07) (list "У1.1 (-50...+85)" "Т3 (-50...+85)"))
				((= "0...+80" str-07) (list "У1.1 (-50...+85)" "Т3 (-50...+85)"))
    	);cond
	);setq
);if

(list-filling "txt-11" list-11)

(set_tile "txt-11" "0")

(princ)
)
;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun tmp-10-101-temp-sensor-metran

( / str-02 str-03 str-10)

(setq str-02 (nth (atoi (get_tile "txt-02")) list-02)
			str-03 (nth (atoi (get_tile "txt-03")) list-03)
			str-10 (nth (atoi (get_tile "txt-10")) list-10)
);setq

(if (and (/= "26 (изм. t возд.)" str-02) (= str-03 "Exia"))
	(setq list-11
		(cond	
			((= str-10 "Т5 (100)") (list "У1.1 (-45...+70)" "Т3 (-10...+70)"))
			((= str-10 "Т6 (85)") (list "У1.1 (-20...+40)" "Т3 (-10...+40)"))
		);cond
	);setq
);if

(if (and (/= "26 (изм. t возд.)" str-02) (= str-03 "Exd"))
	(setq list-11
		(cond	
			((= str-10 "Т5 (100)") (list "У1.1 (-45...+70)" "Т3 (-10...+70)"))
			((= str-10 "Т6 (85)") (list "У1.1 (-20...+40)" "Т3 (-10...+40)"))
		);cond
	);setq
);if

(list-filling "txt-11" list-11)

(set_tile "txt-11" "0")

(princ)
)
;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма формирования данных/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun tmp-filling-fields-101-temp-sensor-metran

( / cntr-1 str-01 str-02 str-03 str-04 str-05 str-06 str-07 str-08 str-09 str-10 str-11 str-12 str-13 str-14 str-15 str-902 swtch)

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
			str-12 (strcat (get_tile "txt-12-1") "..." (get_tile "txt-12-2"))
			str-13 (nth (atoi (get_tile "txt-13")) list-13)
			str-14 (nth (atoi (get_tile "txt-14")) list-14)
      swtch list-901
      cntr-1 0
);setq

(if (/= swtch nil) (setq list-902 (reverse list-902)));if

(if (or (= str-01 "ТСМУ Метран-274") (= str-01 "ТСПУ Метран-276"))
	(if (or (= str-03 "Без взрывозащиты") (= str-03 "Exia"))
		(setq str-15
			(cond	
				((= str-04 "60") "0,52")
				((= str-04 "80") "0,52")
				((= str-04 "100") "0,52");=
				((= str-04 "120") "0,52");=
				((= str-04 "160") "0,65");=
				((= str-04 "200") "0,65");=
				((= str-04 "250") "0,65");=
				((= str-04 "320") "0,65");=
				((= str-04 "400") "0,65");=
				((= str-04 "500") "0,65");=
				((= str-04 "630") "0,65");=
				((= str-04 "800") "0,83");=
				((= str-04 "1000") "0,83");=
				((= str-04 "1250") "1,25");=
				((= str-04 "1600") "1,25");=
			);cond
		);setq
	);if
);if


(if (or (= str-01 "ТСМУ Метран-274") (= str-01 "ТСПУ Метран-276"))
	(if (= str-03 "Exd")
		(setq str-15
			(cond	
				((= str-04 "60") "0,95")
				((= str-04 "80") "0,95")
				((= str-04 "100") "0,95");=
				((= str-04 "120") "0,95");=
				((= str-04 "160") "1,05");=
				((= str-04 "200") "1,05");=
				((= str-04 "250") "1,05");=
				((= str-04 "320") "1,05");=
				((= str-04 "400") "1,05");=
				((= str-04 "500") "1,05");=
				((= str-04 "630") "1,05");=
				((= str-04 "800") "2,7");=
				((= str-04 "1000") "2,7");=
				((= str-04 "1250") "2,7");=
				((= str-04 "1600") "2,7");=
			);cond
		);setq
	);if
);if

(setq str-902 (list (cons 1 str-01) (cons 2 str-02) (cons 3 str-03) (cons 4 str-04) (cons 5 str-05) (cons 6 str-06) (cons 7 str-07)	(cons 8 str-08) (cons 9 str-09) 
										(cons 10 str-10) (cons 11 str-11) (cons 12 str-12) (cons 13 str-13) (cons 14 str-14) (cons 15 str-15))
  		list-902 (vl-list* str-902 list-902);список характеристик для спецификации
  		list-901 (vl-list* (strcat str-01 "  " str-02 "  " str-03 "  " str-04 "мм.  " str-05 "%  " str-06 "  " str-07 "С  " str-08 "мА  " str-09 "  " 
  															 str-10 "  " str-11 "  " str-12 "С  " str-13 "мм.  " str-14) list-901)
);setq

(setq list-902 (reverse list-902));setq

(list-filling "txt-901" (reverse list-901))

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в ПЭ                   //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun tmp-le-101-temp-sensor-metran

(list-902 / cntr-1 pnt-ins str-01 str-02 str-02-1 str-02-2 str-03 str-03-1 str-04 str-05 str-06 str-07 str-08 str-09 str-09-1 str-10 str-10-1 str-11 str-11-1 str-13 str-14 str-701 str-702 str-tmp)

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
				str-13 (cdr (assoc 13 str-tmp))
				str-14 (cdr (assoc 14 str-tmp))
	);setq

	(setvar "osmode" 6199)
	
	(setq pnt-ins (getpoint "\nУкажите точку вставки\n"));setq
	
	;обработка данных
	(cond	
		((/= str-02 "26 (изм. t возд.)") 
			(setq str-02-1 (substr str-02 1 2)
						str-02-2 (substr str-02 4)
			);setq
		);=

		((= str-02 "26 (изм. t возд.)") 
			(setq str-02-1 (substr str-02 1 3)
						str-02-2 (strcat "26")
			);setq
		);=
	);cond
	
	(if (= str-03 "Нет") (setq str-03-1 ""));setq
	(if (/= str-03 "Нет") (setq str-03-1 (strcat str-03 "-")));setq

	(if (= str-09 "Нет") (setq str-09-1 ""));setq
	(if (/= str-09 "Нет") (setq str-09-1 (strcat (substr str-09 1 (vl-string-search " " str-09)) "-")));setq
	
	(if (= str-10 "Нет") (setq str-10-1 ""));setq
	(if (/= str-10 "Нет") (setq str-10-1 (strcat (substr str-10 1 (vl-string-search " " str-10)) "-")));setq

	(setq str-11-1 (substr str-11 1 (vl-string-search " " str-11))
	
				str-701 (strcat "Термопреобразователь " str-01 "-" str-02-1 "-" str-03-1 str-04 "мм-" "(" str-07 ")%%dC-" 
												str-08 "мА-" str-09-1 str-10-1 str-11-1 ", диаметр термобаллона " str-13 "мм, НСХ " str-14)
				str-702 nil;строка примечаний
	);setq
	
	(split-str-parts-le-01-general str-701 str-702 pnt-ins)

	(setq cntr-1 (1+ cntr-1));setq
);repeat

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в спцф                   ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

(defun tmp-spcf-101-temp-sensor-metran

(list-902 / cntr-1 dlt-y nmbr-ln pnt-ins str-01 str-02 str-02-1 str-02-2 str-03 str-03-1 str-04 str-05 str-06 str-06-1 str-07 str-08 str-09 str-09-1 str-09-2 str-10 str-10-1 
str-10-2 str-11 str-11-1 str-12 str-13 str-14 str-15 str-701 str-702 str-99 str-manufact str-note str-order str-tmp str-txt str-unit x-pnt-ins y-pnt-ins)

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
				str-12 (cdr (assoc 12 str-tmp))
				str-13 (cdr (assoc 13 str-tmp))
				str-14 (cdr (assoc 14 str-tmp))
				str-15 (cdr (assoc 15 str-tmp))
	);setq
	
	(setvar "osmode" 6199)
	
	(setq pnt-ins (getpoint "\nУкажите точку вставки\n"));setq

	;обработка данных
	(cond	
		((/= str-02 "26 (изм. t возд.)") 
			(setq str-02-2 (substr str-02 1 2)
						str-02-1 (vl-string-subst "по рис. " "0" str-02)
			);setq
		);=

		((= str-02 "26 (изм. t возд.)") 
			(setq str-02-1 (strcat "по рис. 26 (без штуцера)")
						str-02-2 (substr str-02 1 2)
			);setq
		);=
	);cond

	(setq str-03-1
		(cond	
			((= str-03 "Нет") (strcat "без взрывозащиты"))
			((= str-03 "Exia") (strcat "искробезопасная электрическая цепь"))
			((= str-03 "Exd") (strcat "взрывонепроницаемая оболочка"))
		);cond
	);setq
	
	(setq str-06-1
		(cond	
			((= str-06 "12Х18Н10Т") (strcat "Н10"))
			((= str-06 "10Х17Н13М2Т") (strcat "Н13"))
		);cond
	);setq	
	
	(cond	
		((= str-09 "БК (бронир. каб.)") 
			(setq str-09-2 "БК"
						str-09-1 "бронированный кабель"
			);setq
		);=
		
		((= str-09 "ТБ (трубн. монтаж)") 
			(setq str-09-2 "ТБ"
						str-09-1 "трубный монтаж"
			);setq
		);=
	);cond

	(setq str-10-2 (substr str-10 1 (vl-string-search " " str-10))
				str-10-1 (vl-string-subst "%%dC)" ")" str-10)
				str-11-1 (substr str-11 1 (vl-string-search " " str-11))
	);setq
	
	;;;;;;;;;/////////////////////////////////////////////////////////////////////////////////////////
	(if (= str-03 "Нет")		
		(setq str-701 "Термопреобразователь с унифицированным выходным сигналом"
						
					str-702 (list (cons 1 (strcat "защитн. арматура " str-02-1))
												(cons 2 (strcat "Lпогр. " str-04 "мм"))
												(cons 3 (strcat "предел допускаемой осн. приведенной погрешности " str-05))											
												(cons 4 (strcat "материал защитной арматуры " str-06))
												(cons 5 (strcat "пределы изм. " str-07 "%%dC"))
												(cons 6 (strcat "вых. сигнал " str-08 "мА"))
												(cons 7 (strcat "климатическое исп. " str-11))
												(cons 8 (strcat "диаметр термобаллона " str-13 "мм"))
												(cons 9 (strcat "НСХ " str-14))
									);list
																 
					str-order (list (cons 1 (strcat str-01 "-" str-02-2 "-" str-04 "-" str-05 "-" str-06-1 "-(" str-07 ")%%dC-" str-08 "мА-" str-11-1 "-ГП")) 
													(cons 2 "-") 
													(cons 3 "ТУ 4211-003-12580824-2001"));list
														
					str-unit "шт."
					str-99 str-15
					str-note "Свидетельство об утв. типа СИ №44146"
		);setq
	);if
	
	;;;;;;;;;/////////////////////////////////////////////////////////////////////////////////////////
	(if (= str-03 "Exia")
		(setq str-701 "Термопреобразователь с унифицированным выходным сигналом"
						
					str-702 (list (cons 1 (strcat "защитн. арматура " str-02-1))
												(cons 2 (strcat "маркировка взрывозащиты " str-03-1))
												(cons 3 (strcat "НСХ " str-14))
												(cons 4 (strcat "Lпогр. " str-04 "мм"))
												(cons 5 (strcat "предел допускаемой осн. приведенной погрешности " str-05))	
												(cons 6 (strcat "материал защитной арматуры " str-06))
												(cons 7 (strcat "пределы изм. " str-07 "%%dC"))
												(cons 8 (strcat "вых. сигнал " str-08 "мА"))										
												(cons 9 (strcat "температурный класс " str-10-2))
												(cons 10 (strcat "климатическое исп. " str-11))
												(cons 11 (strcat "диаметр термобаллона " str-13 "мм"))
												(cons 12 (strcat "cвид. об утверждении типа СИ ******"))												
									);list
																 
					str-order (list (cons 1 (strcat str-01 "-" str-02-2 "-" str-03 "-" str-14 "-" str-04 "-" str-05 "-" str-06-1 "-(" str-07 ")%%dC-" str-08 "мА-" str-10-2 "-" str-11-1 "-ГП")) 
													(cons 2 "-") 
													(cons 3 "ТУ ********"));list
														
					str-unit "шт."
					str-99 str-15
					str-note "Свидетельство об утв. типа СИ №44146"
		);setq
	);if
	
	;;;;;;;;;/////////////////////////////////////////////////////////////////////////////////////////
	(if (= str-03 "Exd")
		(progn
			(setq nmbr-ln 9
						str-txt (strcat str-01 "-" str-02-2 "-" str-03 "-" str-04 "-" str-05 "-" str-06-1 "-(" str-07 ")%%dC-" str-08 "мА-" str-09-2 "-" str-10-2 "-" str-11-1 "-ГП")
			);setq
			
			(1000-delete-items-spcf nmbr-ln x-pnt-ins y-pnt-ins)
			(1000-delete-items-spcf-crtf nmbr-ln x-pnt-ins y-pnt-ins)
			
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Термопреобразователь с унифицированным выходным сигналом")
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "- защитная арматура " str-02-1))
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 (strcat "- взрывонепроницаемая оболочка, длина монтажн. части " str-04 "мм"))
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 3)) 4)) 2.5 0 (strcat "- значение предела допускаемой основной приведенной погрешности " str-05))
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 4)) 4)) 2.5 0 (strcat "- материал защитной арматуры " str-06))
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 5)) 4)) 2.5 0 (strcat "- диапазон преобразуемых температур " str-07 "%%dC, вых. сигнал " str-08 "мА"))
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 6)) 4)) 2.5 0 (strcat "- климатическое исп. " str-11 ", диаметр термобаллона " str-13 "мм"))
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 7)) 4)) 2.5 0 (strcat "- НСХ " str-14 ", " str-09-1 ", температурный класс " str-10-1))
			;
			(split-str-parts-spcf-60-01 str-txt "ТУ 4211-003-12580824-2001" pnt-ins)
			;
			(print-number-certificate "№25343" x-pnt-ins y-pnt-ins)
			(command "_text" "_ML" (list (+ x-pnt-ins 336) (- (- y-pnt-ins (* dlt-y 3)) 4)) 2.5 0 "сертификат соответ-")
			(command "_text" "_ML" (list (+ x-pnt-ins 336) (- (- y-pnt-ins (* dlt-y 4)) 4)) 2.5 0 "ствия №РОСС RU.ГБ06.")
			(command "_text" "_ML" (list (+ x-pnt-ins 336) (- (- y-pnt-ins (* dlt-y 5)) 4)) 2.5 0 "В00487, разрешение")
			(command "_text" "_ML" (list (+ x-pnt-ins 336) (- (- y-pnt-ins (* dlt-y 6)) 4)) 2.5 0 "на применение")
			(command "_text" "_ML" (list (+ x-pnt-ins 336) (- (- y-pnt-ins (* dlt-y 7)) 4)) 2.5 0 "№ РРС 00-30587")
		);progn
	);if
	
	(setq str-manufact "ПГ \"Метран\", г. Челябинск");setq
	
	(split-str-parts-spcf-01-general str-701 str-702 str-order str-manufact str-unit str-99 str-note pnt-ins);
 
	(setq cntr-1 (+ cntr-1 1));setq
);repeat

(princ)
)
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



