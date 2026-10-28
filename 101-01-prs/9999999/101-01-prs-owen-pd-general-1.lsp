;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////                                                              ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun 101-01-press-sens-owen-pd-general-1

( / adoc dcl-id list-01 list-02 list-03 list-04 list-05 list-06 list-07 list-08 list-09 list-901 list-902 str-01 type-list)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(setvar "cmdecho" 0)
(setvar "textstyle" "Standard")

(setq list-01 (list "ПД 100 общепром")

      list-901 nil
      list-902 nil
      
      str-01 nil
);setq

(txt-01-101-01-press-sens-owen-pd-general-1)

(if (< (setq dcl-id (load_dialog "dia-101-01-press-sens-owen-pd-general-1.dcl")) 0) ;ищем диалог
		(progn
			(alert "Не найден dcl-файл")
			(exit)
		);progn
);if

(if (not (new_dialog "dia_101_01_press_sens_owen_pd_general_1" dcl-id))
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

(set_tile "txt-01" "0")
(set_tile "txt-02" "0")
(set_tile "txt-03" "0")
(set_tile "txt-04" "0")
(set_tile "txt-05" "0")
(set_tile "txt-06" "0")
(set_tile "txt-07" "0")
(set_tile "txt-08" "0")
(set_tile "txt-09" "0")

(action_tile "txt-01"
  (strcat "(txt-010-101-01-press-sens-owen-pd-general-1)");strcat
);action-tile

(action_tile "txt-02"
  (strcat "(txt-02-101-01-press-sens-owen-pd-general-1)");strcat
);action-tile

(action_tile "but1"
  (strcat "(but1-101-01-press-sens-owen-pd-general-1)");srcat
);action-tile

(action_tile "but2"
  (strcat "(setq type-list \"le\")"
          "(done_dialog)"
  );strcat
);action-tile

(action_tile "but3"
  (strcat "(setq type-list \"spcf\")"
          "(done_dialog)"
  );strcat
);action-tile

(action_tile "accept"
  (strcat "(done_dialog)"
          "(exit)"
  );strcat
);action-tile

(start_dialog)
(unload_dialog dcl-id)

(if (= type-list "le") (le-101-01-press-sens-owen-pd-general-1));if

(if (= type-list "spcf") (spcf-101-01-press-sens-owen-pd-general-1));if

(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(vla-endundomark adoc)
(princ)
)
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun txt-01-101-01-press-sens-owen-pd-general-1
()

(if (= nil str-01) 
	(setq str-01 (nth 0 list-01))
	(setq str-01 (nth (atoi (get_tile "txt-01")) list-01));setq
);if

(if (= "ПД 100 общепром" str-01)
	(progn
		(setq list-02 (list "ДИ избыточное" "ДИВ избыт-вакуум" "ДВ разрежение")
					list-03 (list "0,01" "0,016" "0,025" "0,04" "0,06" "0,1" "0,16" "0,25" "0,4" "0,6" "1,0" "1,6" "2,5" "4,0" "6,0" "10,0" "16,0")
					list-04 (list "111 штуцер М20х1,5" "171 штуцер G1/2" "181 штуцер G1/4")
					list-05 (list "0,5%" "0,25%" "1,0%")
					list-06 (list "Нет")
					list-07 (list "4-20мА")
					list-08 (list "Нет")
					list-09 (list "Нет")
		);setq
	);progn
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

(set_tile "txt-02" "0")
(set_tile "txt-03" "0")
(set_tile "txt-04" "0")
(set_tile "txt-05" "0")
(set_tile "txt-06" "0")
(set_tile "txt-07" "0")
(set_tile "txt-08" "0")
(set_tile "txt-09" "0")

(princ)
)
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun txt-02-101-01-press-sens-owen-pd-general-1

( / str-01 str-02)

(setq str-01 (nth (atoi (get_tile "txt-01")) list-01)
			str-02 (nth (atoi (get_tile "txt-02")) list-02)
);setq
    
(if (and (= str-01 "ПД 100 общепром") (= str-02 "ДИ избыточное"))
	(setq list-03 (list "0,01" "0,016" "0,025" "0,04" "0,06" "0,1" "0,16" "0,25" "0,4" "0,6" "1,0" "1,6" "2,5" "4,0" "6,0" "10,0" "16,0"));setq
);if

(if (and (= str-01 "ПД 100 общепром") (= str-02 "ДИВ избыт-вакуум"))
	(setq list-03 (list "0,0125" "0,02" "0,03" "0,05" "0,08" "0,1"));setq
);if

(list-filling "txt-03" list-03)

(set_tile "txt-03" "0")

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма формирования данных/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun but1-101-01-press-sens-owen-pd-general-1

( / str-01 str-02 str-02-01 str-03 str-04 str-05 str-06 str-07 swtch tmp-list-902)


(setq swtch list-901);setq

(if (/= swtch nil) (setq list-902 (reverse list-902)));if

;считываем значения из полей диалога
(setq str-01 (nth (atoi (get_tile "txt-01")) list-01));setq

;;;;;;;/////////////////////////////////////////////////////////////////////////////////////////////
(if (= "ПД 100 общепром" str-01)
	(progn
		(setq str-02 (nth (atoi (get_tile "txt-02")) list-02)
					str-02-01 (substr str-02 1 (vl-string-search " " str-02))
					str-03 (nth (atoi (get_tile "txt-03")) list-03)
					str-04 (nth (atoi (get_tile "txt-04")) list-04)
					str-05 (nth (atoi (get_tile "txt-05")) list-05)
					str-06 (nth (atoi (get_tile "txt-06")) list-06)	
					str-07 (nth (atoi (get_tile "txt-07")) list-07)
		);setq
		
		(cond
				((= str-02 "ДИ избыточное") (setq str-02-01 "ДИ"));=
				((= str-02 "ДИВ избыт-вакуум") (setq str-02-01 "ДИВ"));=
				((= str-02 "ДВ разрежение") (setq str-02-01 "ДВ"));=
		);cond
				
		(setq list-901 (vl-list* (strcat str-01 "   " str-02-01 "   " str-03 "МПа   Модель " str-04 "   Кл. точн " str-05 "   Индикация " str-06) list-901));setq
		
		(setq tmp-list-902 (list (cons 1 str-01) (cons 2 str-02) (cons 3 str-03) (cons 4 str-04) (cons 5 str-05) (cons 6 str-06) (cons 99 "0,5"));list
					list-902 (vl-list* tmp-list-902 list-902)
		);setq
	);progn
);if




(setq list-902 (reverse list-902));setq

(list-filling "txt-901" (reverse list-901))

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в ПЭ                   //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun le-101-01-press-sens-owen-pd-general-1

( / cntr-1 dlt-y nmbr-ln pnt-ins str-01 str-02 str-02-01 str-03 str-04 str-04-01 str-04-02 str-05-01 str-tmp x-pnt-ins y-pnt-ins y-pnt-ins-1)

(setq cntr-1 0);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-01 (cdr (assoc 1 str-tmp))
				str-02 (cdr (assoc 2 str-tmp))
				str-03 (cdr (assoc 3 str-tmp))
						
				str-04 (cdr (assoc 4 str-tmp))
				str-04-01 (substr str-04 1 (vl-string-search " " str-04))
				str-04-02 (substr str-04 (+ (vl-string-search " " str-04) 1))					
				str-05-01 (vl-string-right-trim "%" (cdr (assoc 5 str-tmp)))
	);setq

;(princ "\n         str-tmp = ") (princ str-tmp);Erase-DV
;(getstring "\nPress Enter to continue...");Erase-DV

	(setvar "osmode" 6199)
	
	(setq pnt-ins (getpoint "\nУкажите точку вставки\n"));setq
	
	;;;;;/////////////////////////////////////////////////////////////////////////////////////////////
	(if (= "ПД 100 общепром" str-01)
		(progn			  
			(cond
				((= str-02 "ДИ избыточное") (setq str-02-01 "ДИ"));=
				((= str-02 "ДИВ избыт-вакуум") (setq str-02-01 "ДИВ"));=
				((= str-02 "ДВ разрежение") (setq str-02-01 "ДВ"));=
			);cond
			
			(setq str-txt (strcat "Датчик давления ОВЕН ПД100-" str-02-01 str-03 "-" str-04-01 "-" str-05-01 ", верхний предел измерений " str-03 " МПа"))
		);progn
	);if

	(setq cntr-1 (1+ cntr-1));setq
);repeat

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в СПЦФ                 //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun spcf-101-01-press-sens-owen-pd-general-1

( / cntr-1 dlt-y length-str length-str-order-2 length-str-order-3 nmbr-ln nmbr-str pnt-ins str-000 str-001 str-002 str-004 str-006 str-010 str-020 str-021 str-030 str-031 
str-040 str-050 str-060 str-061 str-070 str-080 str-081 str-090 str-091 str-100 str-101 str-110 str-111 str-120 str-121 str-130 str-131 str-140 str-150 str-160 str-170 str-180 
str-190 str-200 str-210 str-220 str-221 str-222 str-320 str-61 str-99 str-order-1 str-order-2 str-order-3 str-tmp x-lft x-pnt-ins x-right y-pnt-ins y-pnt-ins-1)

(setq cntr-1 0);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-000 (cdr (assoc 0 str-tmp))
				str-001 (cdr (assoc 1 str-tmp))
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
     
;(princ "\n         str-tmp = ") (princ str-tmp);Erase-DV
;(getstring "\nPress Enter to continue...");Erase-DV



	(setq cntr-1 (+ cntr-1 1));setq
);repeat

(princ)
)
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
