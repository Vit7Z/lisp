;/////// ************************************************************ //////////////////////////////////////////////////
;///////                                                              //////////////////////////////////////////////////
;/////// ************************************************************ //////////////////////////////////////////////////
(defun 101-01-prs-sens-owen-pd-100-01-general

( / adoc dcl-id list-01 list-02 list-03 list-04 list-05 list-06 list-07 list-08 list-09 list-901 list-902 str-01 type-list)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(setvar "cmdecho" 0)
(setvar "textstyle" "Standard")

(setq list-01 (list "ПД100И общепром")

      list-901 nil
      list-902 nil
      
      str-01 nil
);setq

(txt-01-101-01-prs-sens-owen-pd-100-01-general str-01)

(if (< (setq dcl-id (load_dialog "dia-101-01-prs-sens-owen-pd-100-01-general.dcl")) 0) ;ищем диалог
		(progn
			(alert "Не найден dcl-файл")
			(exit)
		);progn
);if

(if (not (new_dialog "dia_101_01_press_sens_owen_pd_100_general_01" dcl-id))
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
  (strcat "(txt-010-101-01-prs-sens-owen-pd-100-01-general)");strcat
);action-tile

(action_tile "txt-02"
  (strcat "(txt-02-101-01-prs-sens-owen-pd-100-01-general)");strcat
);action-tile

(action_tile "but1"
  (strcat "(but1-101-01-prs-sens-owen-pd-100-01-general)");srcat
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

(if (= type-list "le") (le-101-01-prs-sens-owen-pd-100-01-general));if

(if (= type-list "spcf") (spcf-101-01-prs-sens-owen-pd-100-01-general));if

(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(vla-endundomark adoc)
(princ)
)
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun txt-01-101-01-prs-sens-owen-pd-100-01-general
(str-01 / )

(if (= nil str-01) 
	(setq str-01 (nth 0 list-01))
	(setq str-01 (nth (atoi (get_tile "txt-01")) list-01));setq
);if

(if (= "ПД100И общепром" str-01)
	(progn
		(setq list-02 (list "ДИ избыточное" "ДА абс.")
					list-03 (list "0,01" "0,016" "0,025" "0,04" "0,06" "0,1" "0,16" "0,25" "0,4" "0,6" "1,0" "1,6" "2,5" "4,0")
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
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun txt-02-101-01-prs-sens-owen-pd-100-01-general

( / str-01 str-02)

(setq str-01 (nth (atoi (get_tile "txt-01")) list-01)
			str-02 (nth (atoi (get_tile "txt-02")) list-02)
);setq

(if (= str-01 "ПД100И общепром")
  (progn
    (if (= str-02 "ДИ избыточное")
      (setq list-03 (list "0,01" "0,016" "0,025" "0,04" "0,06" "0,1" "0,16" "0,25" "0,4" "0,6" "1,0" "1,6" "2,5" "4,0"));setq
    );if
  
    (if (= str-02 "ДА абс.")
	    (setq list-03 (list "0,1" "0,16" "0,25" "0,6" "1,0" "1,6" "2,5"));setq
    );if
  
    (if (= str-02 "ДИВ избыт-вакуум")
	    (setq list-03 (list "0,0125" "0,02" "0,03" "0,05" "0,08" "0,1"));setq
    );if
  );progn
);if

(list-filling "txt-03" list-03)

(set_tile "txt-03" "0")

(princ)
)
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма формирования данных////////////////////////////////////////////////////////////////////////////////////
(defun but1-101-01-prs-sens-owen-pd-100-01-general

( / str-01 str-02 str-0201 str-0202 str-03 str-0301 str-04 str-0401 str-0402 str-05 str-0501 str-0502 str-06 str-07 str-0701 swtch tmp-list-902)

(setq swtch list-901);setq

(if (/= swtch nil) (setq list-902 (reverse list-902)));if

;считываем значения из полей диалога
(setq str-01 (nth (atoi (get_tile "txt-01")) list-01)
      str-02 (nth (atoi (get_tile "txt-02")) list-02)
			str-03 (nth (atoi (get_tile "txt-03")) list-03)
			str-04 (nth (atoi (get_tile "txt-04")) list-04)
			str-05 (nth (atoi (get_tile "txt-05")) list-05)
			str-06 (nth (atoi (get_tile "txt-06")) list-06)	
			str-07 (nth (atoi (get_tile "txt-07")) list-07)
);setq

(cond
  ((= str-02 "ДИ избыточное") 
    (setq str-0201 "ДИ"
          str-0202 "Датчик давления (избыточное давл.)"
    );setq
  );
  
  ((= str-02 "ДА абс.") 
    (setq str-0201 "ДА"
          str-0202 "Датчик давления (абсолютное давл.)"
    );setq
  );
);cond


(setq str-0301 (strcat "верхний предел изм. " str-03 "МПа")

			str-0401 (substr str-04 1 (vl-string-search " " str-04))
			str-0402 (substr str-04 (+ (vl-string-search " " str-04) 2))	
			str-0402 (strcat str-0402 " (наружн.)") 
			
			str-0501 (vl-string-right-trim "%" str-05)
			str-0502 (strcat "кл. точности " str-05)
			
			str-0701 (strcat "вых. сигнал " str-07)
);setq


;;;;;;;/////////////////////////////////////////////////////////////////////////////////////////////
(if (= "ПД100И общепром" str-01)
	(progn
		(setq model (strcat "ПД100И-" str-0201 str-03 "-" str-0401 "-" str-0501)
					list-901 (vl-list* (strcat str-01 "   " model "   " str-0201 "   " str-03 "МПа   Модель " str-04 "   Кл. точн " str-05 "   Индикация " str-06) list-901)
		);setq

		(setq tmp-list-902 (list (cons 1 str-01) (cons 2 str-0202) (cons 3 model) (cons 4 str-0301) (cons 5 str-0502) (cons 6 str-0402) 
		  (cons 7 str-0701) (cons 8 "без индикатора") (cons 99 "0,2"));list
					list-902 (vl-list* tmp-list-902 list-902)
		);setq
	);progn
);if


(setq list-902 (reverse list-902));setq

(list-filling "txt-901" (reverse list-901))

(princ)
)
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в ПЭ                   /////////////////////////////////////////////////////////////////////////
(defun le-101-01-prs-sens-owen-pd-100-01-general

( / cntr-1 pnt-ins str-01 str-02 str-03 str-04 str-05 str-06 str-07 str-08 str-701 str-702 str-tmp)

(setq cntr-1 0
			str-702 nil
);setq

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
	);setq

	(setvar "osmode" 6199)
	
	(setq pnt-ins (getpoint "\nУкажите точку вставки\n"));setq
	
	;;;;;/////////////////////////////////////////////////////////////////////////////////////////////
	(if (= "ПД100И общепром" str-01)
		(setq str-701 (strcat str-02 " ОВЕН " str-03 ", " str-04 ", " str-05 ", " str-06 ", " str-07 ", " str-08));setq
	);if
	
	(split-str-parts-le-01-general str-701 str-702 pnt-ins "**1**");

	(setq cntr-1 (1+ cntr-1));setq
);repeat

(princ)
)
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в СПЦФ                 /////////////////////////////////////////////////////////////////////////
(defun spcf-101-01-prs-sens-owen-pd-100-01-general

( / cntr-1 dlt-y length-str length-str-order-2 length-str-order-3 nmbr-ln nmbr-str pnt-ins str-000 str-001 str-002 str-004 str-006 str-010 str-020 str-021 str-030 str-031 
str-040 str-050 str-060 str-061 str-070 str-080 str-081 str-090 str-091 str-100 str-101 str-110 str-111 str-120 str-121 str-130 str-131 str-140 str-150 str-160 str-170 str-180 
str-190 str-200 str-210 str-220 str-221 str-222 str-320 str-61 str-99 str-order-1 str-order-2 str-order-3 str-tmp x-lft x-pnt-ins x-right y-pnt-ins y-pnt-ins-1)

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
				
				str-99 (cdr (assoc 99 str-tmp))
	);setq

	(setvar "osmode" 6199)
	
	(setq pnt-ins (getpoint "\nУкажите точку вставки\n"));setq
	
	;;;;;;;///////////////////////////////////////////////////////////////////////////////////////////
	(if (= "ПД100И общепром" str-01)
		(setq str-701 str-02
	
				  str-702 (list (cons 1 str-04)
											  (cons 2 str-05)
											  (cons 3 str-06)
											  (cons 4 str-07)
											  (cons 5 str-08)
									);list
	  );setq
	);if

	(setq str-order (list (cons 1 (strcat "ОВЕН " str-03))
									(cons 2 "-")
									(cons 3 nil));list
									
				str-manufact "ОВЕН, г. Москва"
				str-unit "шт."
				str-crtf "№56246-14 в Гос. реестре СИ"
	);setq
	
	(split-str-parts-spcf-01-general str-701 str-702 str-order str-manufact str-unit str-99 str-crtf pnt-ins);
	
	(setq cntr-1 (+ cntr-1 1));setq
);repeat
(princ)
)
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
