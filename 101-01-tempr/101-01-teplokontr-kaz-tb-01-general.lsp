;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ТЕРМОМЕТРЫ БИМЕТАЛЛИЧЕСКИЕ                                   ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun 101-01-teplokontr-kaz-tb-01-general

( / adoc cnt-str dcl-id list-01 list-02 list-03 list-04 list-05 list-06 list-07 list-08 list-21 list-22 list-23 list-24 list-25 list-26 list-27 list-901 list-902 str-1 type-list)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object)))); start undo

(setq list-01 (list "ТБ-2Р" "ТБ-3Р" "ТБ-2")
			list-02 nil
			list-03 nil
			list-04 nil
			list-05 nil
			list-06 nil
			list-07 nil
			
			list-08 nil
			list-901 nil
			list-902 nil
			
			str-1 nil
      cnt-str 0

);setq

(tmp-1-101-01-teplokontr-kaz-tb-01-general)

(if (< (setq dcl-id (load_dialog "dia-101-01-teplokontr-kaz-tb-01-general.dcl")) 0) ;ищем диалог
	(progn
		(alert "Не найден dcl-файл")
		(exit)
	);progn
);if

(if (not (new_dialog "dia_101_termo_tb" dcl-id))
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

(list-filling "txt-21" list-21)
(list-filling "txt-22" list-22)
(list-filling "txt-23" list-23)
(list-filling "txt-24" list-24)
(list-filling "txt-25" list-25)
(list-filling "txt-26" list-26)
(list-filling "txt-27" list-27)

(set_tile "txt-01" "0")
(set_tile "txt-02" "0")
(set_tile "txt-03" "0")
(set_tile "txt-04" "0")
(set_tile "txt-05" "0")
(set_tile "txt-06" "0")
(set_tile "txt-07" "0")
(set_tile "txt-08" "0")

(set_tile "txt-21" "0")
(set_tile "txt-22" "0")
(set_tile "txt-23" "0")
(set_tile "txt-24" "0")
(set_tile "txt-25" "0")
(set_tile "txt-26" "0")
(set_tile "txt-27" "0")

(action_tile "txt-01"
  (strcat "(tmp-1-101-01-teplokontr-kaz-tb-01-general)"
  				"(set_tile \"tgl-01\" \"0\")"
  				
  				"(mode_tile \"txt-02\" 0)"
  				"(mode_tile \"txt-03\" 0)"
  				"(mode_tile \"txt-04\" 0)"
  				"(mode_tile \"txt-05\" 0)"
  				"(mode_tile \"txt-06\" 0)"
  				"(mode_tile \"txt-07\" 0)"
  				"(mode_tile \"txt-08\" 0)"

  				"(mode_tile \"txt-21\" 1)"
  				"(mode_tile \"txt-22\" 1)"
  				"(mode_tile \"txt-23\" 1)"
  				"(mode_tile \"txt-24\" 1)"
  				"(mode_tile \"txt-25\" 1)"
  				"(mode_tile \"txt-26\" 1)"
  				"(mode_tile \"txt-27\" 1)"
  );srcat
);action_tile

(action_tile "txt-03"
  (strcat "(tmp-3-101-01-teplokontr-kaz-tb-01-general)");strcat
);action_tile

(action_tile "txt-07"
  (strcat "(tmp-3-101-01-teplokontr-kaz-tb-01-general)");strcat
);action_tile


(action_tile "tgl-01"
  (strcat "(tgl-01-101-01-teplokontr-kaz-tb-01-general)");srcat
);action_tile

(action_tile "txt-22"
  (strcat "(txt-22-101-01-teplokontr-kaz-tb-01-general)");srcat
);action_tile

(action_tile "txt-23"
  (strcat "(txt-23-101-01-teplokontr-kaz-tb-01-general)");srcat
);action_tile

(action_tile "txt-24"
  (strcat "(txt-23-101-01-teplokontr-kaz-tb-01-general)");srcat
);action_tile

(action_tile "but1"
  (strcat "(tmp-filling-fields-101-01-teplokontr-kaz-tb-01-general)");strcat
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

(if (= type-list "le") (le-101-01-teplokontr-kaz-tb-01-general));if

(if (= type-list "spcf") (spcf-101-01-teplokontr-kaz-tb-01-general));if

(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(vla-endundomark adoc)
(princ)
)
;/////// *************************************************************///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// КОНЕЦ ПРОГРАММЫ                                              ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// *************************************************************///////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun tmp-1-101-01-teplokontr-kaz-tb-01-general
( / )

(if (= nil str-1) 
	(setq str-1 (nth 0 list-01));setq
	(setq str-1 (nth (atoi (get_tile "txt-01")) list-01));setq
);if

(if (= str-1 "ТБ-2")
	(progn
		(setq list-02 (list "Осевое")
      		list-03 (list "–60...+40" "–60...+90" "–60...+150" "-50...+50" "-50...+100" "-50...+150" "-30...+60" "-20...+40" "0...+60" "0...+100" "0...+120" "0...+150" "0...+200" "0...+300" "0...+400")
      		list-04 (list "1,5")
      		list-05 (list "100")
      		list-06 (list "80" "100" "125" "160")
     			list-07 (list "10")
      		list-08 (list "М20х1,5")
		);setq
	);progn
);if

(if (= str-1 "ТБ-2Р")
	(progn
		(setq list-02 (list "Радиальное")
      		list-03 (list "–60...+40" "–60...+90" "–60...+150" "-50...+50" "-50...+100" "-50...+150" "-30...+60" "-20...+40" "0...+60" "0...+100" "0...+120" "0...+150" "0...+200" "0...+300" "0...+400")
      		list-04 (list "1,5"  "1")
      		list-05 (list "100")
      		list-06 (list "80" "100" "125" "160" "200" "250" "315" "400" "500")
     			list-07 (list "10")
      		list-08 (list "М20х1,5" "М16х1,5" "М18х1,5")
		);setq
	);progn
);if

(if (= str-1 "ТБ-3Р")
	(progn
		(setq list-02 (list "Радиальное")
      		list-03 (list "–60...+40" "–60...+90" "–60...+150" "-50...+50" "-50...+100" "-50...+150" "-30...+60" "-20...+40" "0...+60" "0...+100" "0...+120" "0...+150" "0...+200" "0...+300" "0...+400")
      		list-04 (list "1,5"  "1")
      		list-05 (list "160")
      		list-06 (list "80" "100" "125" "160" "200" "250" "315" "400" "500")
     			list-07 (list "10")
      		list-08 (list "М20х1,5" "М16х1,5" "М18х1,5")
		);setq
	);progn
);if

(setq list-21 (list "ГЗ-02")
			list-22 (list "10")
			list-23 (list "6,3" "25")
			list-24 (list "М20х1,5" "М27х2")
			list-25 (list "М20х1,5" "М14х1,5" "М16х1,5" "М18х1,5")
			list-26 (list "80" "100" "125" "160" "200" "250" "315" "400" "500")
			list-27 (list "16")
);setq

(list-filling "txt-02" list-02)
(list-filling "txt-03" list-03)
(list-filling "txt-04" list-04)
(list-filling "txt-05" list-05)
(list-filling "txt-06" list-06)
(list-filling "txt-07" list-07)
(list-filling "txt-08" list-08)

(list-filling "txt-21" list-21)
(list-filling "txt-22" list-22)
(list-filling "txt-23" list-23)
(list-filling "txt-24" list-24)
(list-filling "txt-25" list-25)
(list-filling "txt-26" list-26)
(list-filling "txt-27" list-27)

(set_tile "txt-02" "0")
(set_tile "txt-03" "0")
(set_tile "txt-04" "0")
(set_tile "txt-05" "0")
(set_tile "txt-06" "0")
(set_tile "txt-07" "0")
(set_tile "txt-08" "0")

(set_tile "txt-21" "0")
(set_tile "txt-22" "0")
(set_tile "txt-23" "0")
(set_tile "txt-24" "0")
(set_tile "txt-25" "0")
(set_tile "txt-26" "0")
(set_tile "txt-27" "0")

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun tmp-3-101-01-teplokontr-kaz-tb-01-general
( / str-01 str-03 str-07)

(setq str-01 (nth (atoi (get_tile "txt-01")) list-01)
			str-03 (nth (atoi (get_tile "txt-03")) list-03)
			str-07 (nth (atoi (get_tile "txt-07")) list-07)
);setq

;;;;/////////////////////////////////////////////////////
(if (= str-1 "ТБ-2")
	(progn
		(setq list-04 (list "1,5" "1")
					list-05 (list "100")
		);setq
							
  	(if (or (= str-03 "–60...+150")
  					(= str-03 "–60...+90")
  					(= str-03 "–60...+40")
  					(= str-03 "-50...+150")
  					(= str-03 "-50...+100")
  					(= str-03 "-50...+50")
  					(= str-03 "-30...+60")
  					(= str-03 "0...+120")
  					(= str-03 "0...+150")
  					(= str-03 "0...+200")
  					(= str-03 "0...+300")
  					(= str-03 "0...+400")
  					(= str-03 "0...+100"));or
   	 (setq list-06 (list "80" "100" "125" "160"));setq
		);if
		
		(if (or (= str-03 "-20...+40")
						(= str-03 "0...+60"));or
			(setq list-06 (list "125" "160"));setq
		);if
	);progn
);if

;;;;/////////////////////////////////////////////////////
(if (= str-1 "ТБ-2Р")
	(progn
		(setq list-04 (list "1,5" "1")
					list-05 (list "100")
		);setq
							
  	(if (or (= str-03 "–60...+150")
  					(= str-03 "–60...+90")
  					(= str-03 "–60...+40")
  					(= str-03 "-50...+150")
  					(= str-03 "-50...+100")
  					(= str-03 "-50...+50")
  					(= str-03 "-30...+60")
  					(= str-03 "0...+120")
  					(= str-03 "0...+150")
  					(= str-03 "0...+200")
  					(= str-03 "0...+300")
  					(= str-03 "0...+400")
  					(= str-03 "0...+100"));or
   	 (setq list-06 (list "80" "100" "125" "160" "200" "250" "315" "400" "500"));setq
		);if
		
		(if (or (= str-03 "-20...+40")
						(= str-03 "0...+60"));or
			(setq list-06 (list "125" "160" "200" "250" "315"));setq
		);if
	);progn
);if



(list-filling "txt-04" list-04)
(list-filling "txt-05" list-05)
(list-filling "txt-06" list-06)

(set_tile "txt-04" "0")
(set_tile "txt-05" "0")
(set_tile "txt-06" "0")

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun tgl-01-101-01-teplokontr-kaz-tb-01-general

( / tgl-01)

(setq tgl-01 (get_tile "tgl-01"));setq

(if (= tgl-01 "1")
  (progn 
  	(mode_tile "txt-02" 1)
  	(mode_tile "txt-03" 1)
  	(mode_tile "txt-04" 1)
  	(mode_tile "txt-05" 1)
  	(mode_tile "txt-06" 1)
  	(mode_tile "txt-07" 1)
  	(mode_tile "txt-08" 1)

  	(mode_tile "txt-21" 0)
  	(mode_tile "txt-22" 0)
  	(mode_tile "txt-23" 0)
  	(mode_tile "txt-24" 0) 	
  	(mode_tile "txt-25" 0)
  	(mode_tile "txt-26" 0)
  	(mode_tile "txt-27" 0)			 				  				
  );progn
);if

(if (= tgl-01 "0")
  (progn 
  	(mode_tile "txt-02" 0)
  	(mode_tile "txt-03" 0)
  	(mode_tile "txt-04" 0)
  	(mode_tile "txt-05" 0)
  	(mode_tile "txt-06" 0)
  	(mode_tile "txt-07" 0)
  	(mode_tile "txt-08" 0)

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
;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun txt-22-101-01-teplokontr-kaz-tb-01-general
( / str-22)

(setq str-22 (nth (atoi (get_tile "txt-22")) list-22));setq

(if (= str-22 "10")
	(setq list-23 (list "6,3" "25")
				list-24 (list "М20х1,5" "М27х2")
				list-25 (list "М20х1,5" "М18х1,5")
				list-26 (list "80" "100" "125" "160" "200" "250" "315")
				list-27 (list "16")
	);setq
);if

(list-filling "txt-23" list-23)
(list-filling "txt-24" list-24)
(list-filling "txt-25" list-25)
(list-filling "txt-26" list-26)
(list-filling "txt-27" list-27)

(set_tile "txt-23" "0")
(set_tile "txt-24" "0")
(set_tile "txt-25" "0")
(set_tile "txt-26" "0")
(set_tile "txt-27" "0")

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun txt-23-101-01-teplokontr-kaz-tb-01-general
( / str-22 str-23 str-24)

(setq str-22 (nth (atoi (get_tile "txt-22")) list-22)
			str-23 (nth (atoi (get_tile "txt-23")) list-23)
			str-24 (nth (atoi (get_tile "txt-24")) list-24)
);setq

(if (and (= str-22 "6") (= str-23 "6,3") (= str-24 "М20х1,5")) (setq list-27 (list "10")));if

(if (and (= str-22 "6") (= str-23 "25") (= str-24 "М20х1,5")) (setq list-27 (list "12")));if

(if (and (= str-22 "6") (= str-23 "6,3") (= str-24 "М27х2")) (setq list-27 (list "10")));if

(if (and (= str-22 "6") (= str-23 "25") (= str-24 "М27х2")) (setq list-27 (list "12")));if


(if (and (= str-22 "10") (= str-23 "6,3") (= str-24 "М20х1,5")) (setq list-27 (list "16")));if

(if (and (= str-22 "10") (= str-23 "25") (= str-24 "М20х1,5")) (setq list-27 (list "16")));if

(if (and (= str-22 "10") (= str-23 "6,3") (= str-24 "М27х2")) (setq list-27 (list "16")));if

(if (and (= str-22 "10") (= str-23 "25") (= str-24 "М27х2")) (setq list-27 (list "18")));if

(list-filling "txt-27" list-27)

(set_tile "txt-27" "0")

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма формирования данных/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun tmp-filling-fields-101-01-teplokontr-kaz-tb-01-general

( / str-00 str-01 str-02 str-03 str-04 str-05 str-06 str-07 str-08 str-21 str-22 str-23 str-24 str-25 str-26 str-27 str-902 str-99 tgl-01 tmp-902)

(setq tgl-01 (get_tile "tgl-01"));setq

(if (/= list-901 nil) 
	(setq list-901 (reverse list-901)
				list-902 (reverse list-902)
	);setq
);if

;;;;;;; термометр /////////////////////////////////////////////////////////////////////////////////////////////
(if (= tgl-01 "0")
	(progn
		(setq str-01 (nth (atoi (get_tile "txt-01")) list-01)
					str-02 (nth (atoi (get_tile "txt-02")) list-02)
					str-03 (nth (atoi (get_tile "txt-03")) list-03)
					str-04 (nth (atoi (get_tile "txt-04")) list-04)
					str-05 (nth (atoi (get_tile "txt-05")) list-05)
					str-06 (nth (atoi (get_tile "txt-06")) list-06)
					str-07 (nth (atoi (get_tile "txt-07")) list-07)
					str-08 (nth (atoi (get_tile "txt-08")) list-08)
					
					str-01 (strcat str-01 " (" str-03 ")-" str-04 "-" str-06 "-" str-07 "-" str-08)		
					
					list-901 (vl-list* (strcat str-01 "   " str-02 "   Кл. точн. " str-04 "   Lпогр. " str-06 "мм   Термобаллон " str-07 "мм !!!!") list-901)			
		);setq

		(cond	;масса
			((= str-05 "60") (setq str-99 "0,5"));=
			((= str-05 "100") (setq str-99 "0,8"));=
			((= str-05 "160") (setq str-99 "1,0"));=
		);cond

		(if (= str-02 "Осевое") (setq str-02 "осевое располож. термобаллона"));if
		
		(if (= str-02 "Радиальное") (setq str-02 "радиальное располож. термобаллона"));if


		(setq str-00 "Термометр биметаллический"
					
					str-03 (strcat "пределы изм. " str-03 "%%dС")
					
					str-04 (strcat "кл. точности " str-04)
					
					str-05 (strcat "диам. корпуса " str-05 "мм")
					
					str-06 (strcat "Lпогр. " str-06 "мм")
					
					str-07 (strcat "диам. термобаллона " str-07 "мм")
					
					str-08 (strcat "присоединение " str-08 " (наружн.)")
							
					tmp-902 (list (cons 0 str-00) (cons 1 str-01) (cons 2 str-03) (cons 3 str-04) (cons 4 str-06) (cons 5 str-08) (cons 6 str-02) 
												(cons 7 str-07)	(cons 8 str-05) (cons 99 str-99))
		);setq
	);progn
);if


;;;;;;; для гильзы /////////////////////////////////////////////////////////////////////////////////////////////
(if (= tgl-01 "1")
	(progn
		(setq str-21 (nth (atoi (get_tile "txt-21")) list-21)
					str-22 (nth (atoi (get_tile "txt-22")) list-22)
					str-23 (nth (atoi (get_tile "txt-23")) list-23)
					str-24 (nth (atoi (get_tile "txt-24")) list-24)
					str-25 (nth (atoi (get_tile "txt-25")) list-25)
					str-26 (nth (atoi (get_tile "txt-26")) list-26)
					str-27 (nth (atoi (get_tile "txt-27")) list-27)
		);setq

		(if (= str-23 "6,3")
			(cond	
				((= str-26 "80") (setq str-99 "0,12"));
				((= str-26 "100") (setq str-99 "0,12"))
				((= str-26 "125") (setq str-99 "0,13"))
				((= str-26 "160") (setq str-99 "0,15"))
				((= str-26 "200") (setq str-99 "0,17"))
				((= str-26 "250") (setq str-99 "0,21"))
				((= str-26 "315") (setq str-99 "0,24"))
			);cond
		);setq

		
		(if (= str-23 "25")
			(cond	
				((= str-26 "80") (setq str-99 "0,12"));
				((= str-26 "100") (setq str-99 "0,12"))
				((= str-26 "120") (setq str-99 "0,16"))
				((= str-26 "160") (setq str-99 "0,19"))
				((= str-26 "200") (setq str-99 "0,22"))
				((= str-26 "250") (setq str-99 "0,26"))
				((= str-26 "320") (setq str-99 "0,3"))
			);cond
		);setq

		(setq str-21 (strcat str-21 "-" str-24 "-" str-25 "-" str-26 "-" str-27 "-" str-23)
		
					list-901 (vl-list* (strcat str-21 "   Термобаллон " str-22 "мм !!!!   " str-23 " МПа   К бобышке " str-24 "   К термометру " str-25 "  Lпогр. " str-26 "мм") list-901)
		);setq
		
		(setq str-00 "Гильза защитная"
		
					str-22 (strcat "диаметр термобаллона до " str-22 "мм")
					
					str-23 (strcat "Ру до " str-23 "МПа")
					
					str-24 (strcat "к бобышке " str-24 " (наружн.)")
					
					str-25 (strcat "к прибору " str-25 " (внутр.)")
					
					str-26 (strcat "Lпогр. " str-26 "мм")
		
					tmp-902 (list (cons 0 str-00) (cons 1 str-21) (cons 2 str-22) (cons 3 str-23) (cons 4 str-24) (cons 5 str-25) (cons 6 str-26) (cons 99 str-99))
		);setq
		
		
	);progn
);if

;(princ "\n         str-902 = ") (princ str-902);Erase_DV
;(getstring "\nPress Enter to continue...");Erase_DV



(setq list-902 (vl-list* tmp-902 list-902)
			list-902 (reverse list-902)
			list-901 (reverse list-901)
);setq

(list-filling "txt-901" (reverse list-901))

(princ)
)
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в ПЭ                   /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun le-101-01-teplokontr-kaz-tb-01-general

( / cntr-1 pnt-ins str-01 str-02 str-03 str-04 str-05 str-06 str-07 str-701 str-702 str-tmp)

(setq cntr-1 0);setq

(repeat (length list-902)	
	(setvar "osmode" 6199)

	(setq pnt-ins		(getpoint "\nУкажите точку вставки\n")
				str-tmp (nth cntr-1 list-902)
				str-00 (cdr (assoc 0 str-tmp))
				str-01 (cdr (assoc 1 str-tmp))
	);setq

;(princ "\n         str-tmp = ") (princ str-tmp);Erase_DV
;(getstring "\nPress Enter to continue...");Erase_DV
;	

	;;;;;;;///////////////////////////////////////////////////////////////////////////////////////////
	(if (= str-00 "Термометр биметаллический")
		(setq 
					str-04 (cdr (assoc 4 str-tmp))
					str-06 (cdr (assoc 6 str-tmp))
					str-07 (cdr (assoc 7 str-tmp))
				
					str-701 (strcat str-00 " " str-01 ", " str-04 ", " str-06 ", " str-07)
					str-702 nil
		);setq
	);if

	;;;;;;;///////////////////////////////////////////////////////////////////////////////////////////
	(if (= str-00 "Гильза защитная")
		(setq str-02 (cdr (assoc 2 str-tmp))
					str-03 (cdr (assoc 3 str-tmp))
					str-04 (cdr (assoc 4 str-tmp))
					str-05 (cdr (assoc 5 str-tmp))
					str-06 (cdr (assoc 6 str-tmp))
							
					str-701 (strcat str-00 " " str-01 ", " str-06 ", " str-03 ", " str-02)
					str-702 nil
		);setq
	);if

	(split-str-parts-le-01-general str-701 str-702 pnt-ins "**1**");

	(setq cntr-1 (1+ cntr-1));setq
);repeat

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в спцф                   ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

(defun spcf-101-01-teplokontr-kaz-tb-01-general

( / cntr-1 pnt-ins str-00 str-01 str-02 str-03 str-04 str-05 str-06 str-07 str-08 str-701 str-702 str-99 str-crtf str-manufact str-order str-tmp str-unit)

(setq cntr-1 0);setq

(setvar "textstyle" "Standard")

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-00 (cdr (assoc 0 str-tmp))
				str-01 (cdr (assoc 1 str-tmp))
				str-02 (cdr (assoc 2 str-tmp))
				str-03 (cdr (assoc 3 str-tmp))
				str-04 (cdr (assoc 4 str-tmp))
				str-05 (cdr (assoc 5 str-tmp))
				str-06 (cdr (assoc 6 str-tmp))
				str-99 (cdr (assoc 99 str-tmp));масса
	);setq
	
;(princ "\n         str-tmp = ") (princ str-tmp);Erase_DV
;(getstring "\nPress Enter to continue...");Erase_DV
		
	(setvar "osmode" 6199)
	
	(setq pnt-ins (getpoint "\nУкажите точку вставки\n"));setq

	;;;;;;;///////////////////////////////////////////////////////////////////////////////////////////
	(if (= str-00 "Термометр биметаллический")
		(progn
			(setq str-07 (cdr (assoc 7 str-tmp))
						str-08 (cdr (assoc 8 str-tmp))
			
						str-702 (list (cons 1 str-02)
													(cons 2 str-03)
													(cons 3 str-04)
													(cons 4 str-05)
													(cons 5 str-06)
													(cons 6 str-07)
													(cons 7 str-08));list
						
						str-order (list (cons 1 str-01) 
														(cons 2 "-")
														(cons 3 nil))		
															
						str-crtf "Свидетельство об утв. типа СИ №61614/1"																		
			);setq
		);progn
	);if


	;;;;;;;///////////////////////////////////////////////////////////////////////////////////////////
	(if (= str-00 "Гильза защитная")
		(setq str-702 (list (cons 1 str-04)
												(cons 2 str-05)
												(cons 3 str-06)
												(cons 4 str-02)
												(cons 5 str-03));list
	
					str-order (list (cons 1 str-01) 
													(cons 2 "-")
													(cons 3 nil))
					str-crtf nil
		);setq
	);if
	
	(setq str-701 str-00
	
				str-manufact "ОАО \"Теплоконтроль\", г. Казань"
				
				str-unit "шт."			
	);setq
	
	(split-str-parts-spcf-01-general str-701 str-702 str-order str-manufact str-unit str-99 str-crtf pnt-ins)
 
	(setq cntr-1 (+ cntr-1 1));setq
);repeat

(princ)
)
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////