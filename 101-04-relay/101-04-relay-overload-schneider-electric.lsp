;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////                                                              ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun 101-04-relay-overload-schneider-electric

( / adoc dcl-id list-00 list-01 list-02 list-03 list-04 list-05 list-06 list-901 list-902 str-00 str-f type-list)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(setq str-f 1;переменные
			str-00 nil
      list-00 (list "LR97"
      							)
      list-901 nil
      list-902 nil
);setq


(txt-00-101-04-relay-overload-schneider-electric)

(if (< (setq dcl-id (load_dialog "dia-101-04-relay-overload-schneider-electric.dcl")) 0) ;ищем диалог
		(progn
			(alert "Не найден dcl-файл")
			(exit)
		);progn
);if

(if (not (new_dialog "dia_101_04_relay_schneider_electric_overload" dcl-id))
		(exit)
);if

(list-filling "txt-00" list-00)
(list-filling "txt-01" list-01)
(list-filling "txt-02" list-02)
(list-filling "txt-03" list-03)
(list-filling "txt-04" list-04)
(list-filling "txt-05" list-05)
(list-filling "txt-06" list-06)

(set_tile "txt-00" "0")
(set_tile "txt-01" "0")
(set_tile "txt-02" "0")
(set_tile "txt-03" "0")
(set_tile "txt-04" "0")
(set_tile "txt-05" "0")
(set_tile "txt-06" "0")

(action_tile "txt-00"
  (strcat "(txt-00-101-04-relay-overload-schneider-electric)");srcat
);action_tile

(action_tile "txt-01"
  (strcat "(txt-01-101-04-relay-overload-schneider-electric)");srcat
);action_tile

(action_tile "txt-02"
  (strcat "(txt-02-101-04-relay-overload-schneider-electric)");srcat
);action_tile

(action_tile "txt-03"
  (strcat "(txt-01-101-04-relay-overload-schneider-electric)");srcat
);action_tile

(action_tile "txt-04"
  (strcat "(txt-04-101-04-relay-overload-schneider-electric)");srcat
);action_tile

(action_tile "but1"
  (strcat "(but1-101-04-relay-overload-schneider-electric)"
  				"(list-filling \"txt-01\" list-01)"
  				"(list-filling \"txt-02\" list-02)"
					"(list-filling \"txt-03\" list-03)"
					"(list-filling \"txt-04\" list-04)"
					"(list-filling \"txt-05\" list-05)"
					"(set_tile \"txt-01\" \"0\")"
					"(set_tile \"txt-02\" \"0\")"
          "(set_tile \"txt-03\" \"0\")"
          "(set_tile \"txt-04\" \"0\")"
          "(set_tile \"txt-05\" \"0\")"
          "(set_tile \"txt-06\" \"0\")"
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

(if (= type-list "le") (le-101-04-relay-overload-schneider-electric));if

(if (= type-list "spcf") (spcf-101-04-relay-overload-schneider-electric));if

(if (= type-list "lecgv") (lecgv-101-04-relay-overload-schneider-electric));if

(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(vla-endundomark adoc)
(gc)
(princ)
)
;/////// конец программы ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun txt-00-101-04-relay-overload-schneider-electric

( / )

(if (= nil str-00) 
	(setq str-00 "LR97");setq
	(setq str-00 (nth (atoi (get_tile "txt-00")) list-00));setq
);if

(if (= str-00 "LR97")
	(progn
		(setq list-01 (list "0,3...1,5" "1,2...7" "5...25" "20...38")
					list-02 (list "LR97 D015M7" "LR97 D015F7" "LR97 D015B")
					list-03 (list "Ручной")
					list-04 (list "~220" "~110" "=24 (~24)")
					list-05 (list "LC1 D09...D38")
					list-06 (list "Контактор" "DIN-рейка")
		);setq
	);progn
);if

(list-filling "txt-01" list-01)
(list-filling "txt-02" list-02)
(list-filling "txt-03" list-03)
(list-filling "txt-04" list-04)
(list-filling "txt-05" list-05)
(list-filling "txt-06" list-06)

(set_tile "txt-01" "0")
(set_tile "txt-02" "0")
(set_tile "txt-03" "0")
(set_tile "txt-04" "0")
(set_tile "txt-05" "0")
(set_tile "txt-06" "0")

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;; txt-01 /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun txt-01-101-04-relay-overload-schneider-electric

( / str-00 str-01)

(setq str-00 (nth (atoi (get_tile "txt-00")) list-00)
			str-01 (nth (atoi (get_tile "txt-01")) list-01)
);setq

(if (and (= str-00 "LR97") (= str-01 "0,3...1,5"))
	(progn
		(setq list-02 (list "LR97 D015M7" "LR97 D015F7" "LR97 D015B")
					list-03 (list "Ручной")
					list-04 (list "220, перем. ток" "110, перем. ток" "24, пост./перем. ток")
					list-05 (list "LC1 D09...D38")
					list-06 (list "Контактор" "DIN-рейка")
		);setq
	);progn
);if

(if (and (= str-00 "LR97") (= str-01 "1,2...7"))
	(progn
		(setq list-02 (list "LR97 D07M7" "LR97 D07F7" "LR97 D07B")
					list-03 (list "Ручной")
					list-04 (list "220, перем. ток" "110, перем. ток" "24, пост./перем. ток")
					list-05 (list "LC1 D09...D38")
					list-06 (list "Контактор" "DIN-рейка")
		);setq
	);progn
);if

(if (and (= str-00 "LR97") (= str-01 "5...25"))
		(progn
			(setq list-02 (list "LR97 D25M7" "LR97 D25F7" "LR97 D25B")
						list-03 (list "Ручной")
						list-04 (list "220, перем. ток" "110, перем. ток" "24, пост./перем. ток")
						list-05 (list "LC1 D09...D38")
						list-06 (list "Контактор" "DIN-рейка")
			);setq
		);progn
);if

(if (and (= str-00 "LR97") (= str-01 "20...38"))
		(progn
			(setq list-02 (list "LR97 D38M7" "LR97 D38F7" "LR97 D38B")
						list-03 (list "Ручной")
						list-04 (list "220, перем. ток" "110, перем. ток" "24, пост./перем. ток")
						list-05 (list "LC1 D25...D38")
						list-06 (list "Контактор" "DIN-рейка")
			);setq
		);progn
);if

(list-filling "txt-02" list-02)
(list-filling "txt-03" list-03)
(list-filling "txt-04" list-04)
(list-filling "txt-05" list-05)
(list-filling "txt-06" list-06)

(set_tile "txt-02" "0")
(set_tile "txt-03" "0")
(set_tile "txt-04" "0")
(set_tile "txt-05" "0")
(set_tile "txt-06" "0")

(princ)
)
;;;;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма для txt-03////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun txt-02-101-04-relay-overload-schneider-electric

( / str-0 str-21 str-3 str-f)

(setq str-0 (nth (atoi (get_tile "txt-00")) list-00)
			str-21 (get_tile "txt-02")
);setq


(if (= str-0 "LR97")
	(progn
		(list-filling "txt-04" list-04)
		(set_tile "txt-04" str-21)
	);progn
);if


(princ)
)
;;;;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрогамма чтения данных из файлов для авт выкл//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun txt-04-101-04-relay-overload-schneider-electric

( / str-0 str-41)

(setq str-0 (nth (atoi (get_tile "txt-00")) list-00)
			str-41 (get_tile "txt-04")
);setq

(if (= str-0 "Выключатель автоматический, Multi 9")
	(progn
		(list-filling "txt-05" list-05)
		(set_tile "txt-05" str-41)
	);progn
);if

(princ)
)
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма формирования данных///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun but1-101-04-relay-overload-schneider-electric

( / cntr-1 str-00 str-01 str-02 str-03 str-04 str-05 str-06 swtch tmp-list-902)

(setq str-00 (nth (atoi (get_tile "txt-00")) list-00)
      swtch list-901
      cntr-1 0
);setq

(if (/= swtch nil) (setq list-902 (reverse list-902)));if


(if (= str-00 "LR97")
	(progn
		(setq str-01 (nth (atoi (get_tile "txt-01")) list-01);считываем выбранные данные
					str-02 (nth (atoi (get_tile "txt-02")) list-02)
					str-03 (nth (atoi (get_tile "txt-03")) list-03)
					str-04 (nth (atoi (get_tile "txt-04")) list-04)
					str-05 (nth (atoi (get_tile "txt-05")) list-05)
					str-06 (nth (atoi (get_tile "txt-06")) list-06)
		);setq

		(setq list-901 (vl-list* (strcat str-02 " Диапазон уставок " str-01 "А Упр. напряжение " str-04 " Для контактора " str-05 " Монтаж " str-06) list-901));setq
  	
		(setq tmp-list-902 (list (cons 0 str-00) (cons 1 str-01) (cons 2 str-02) (cons 3 str-03) (cons 4 str-04) (cons 5 str-05) (cons 6 str-06) (cons 99 "0,2"))
					list-902 (vl-list*  tmp-list-902 list-902)
		);setq
	);progn	
);if = str-00

(setq list-902 (reverse list-902))

(list-filling "txt-901" (reverse list-901))

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в ПЭ                   //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun le-101-04-relay-overload-schneider-electric

( / cntr-1 nmbr-ln pnt-ins str-tmp str-tmp-0 str-tmp-1 str-tmp-11 str-tmp-12 str-tmp-2 str-tmp-3 str-tmp-4 str-tmp-5 str-tmp-6 x-pnt-ins y-pnt-ins)

(setq cntr-1 0);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-tmp-0 (cdr (assoc 0 str-tmp))
	);setq
	
	(setvar "osmode" 6199)
	
	(setq pnt-ins (getpoint "\nУкажите точку вставки\n"));setq
	
	(100-empt-lin-le)

	;;;;////////////////////////////////////////////////////////////////////////
	(if (= str-tmp-0 "LR97")
		(progn
			(setq str-tmp-1 (cdr (assoc 1 str-tmp))
						str-tmp-2 (cdr (assoc 2 str-tmp))
						str-tmp-3 (cdr (assoc 3 str-tmp))
						str-tmp-4 (cdr (assoc 4 str-tmp))
						str-tmp-5 (cdr (assoc 5 str-tmp))
						str-tmp-6 (cdr (assoc 6 str-tmp))
			);setq

			(cond
				((= str-tmp-6 "Контактор") (setq str-tmp-6 "монтаж на контактор"));=
				((= str-tmp-6 "DIN-рейка") (setq str-tmp-6 "монтаж на DIN-рейку"));=
			);cond
			
			(setq str-txt (strcat "Реле перегрузки по току Schneider Electric, артикул " str-tmp-2 ", диапазон уставок " str-tmp-1 "А, Uупр. "
														str-tmp-4 "В, " str-tmp-6)
			);setq
			
			(split-str-parts-le-110-01 str-txt pnt-ins)
			
			(setvar "osmode" 6199)
			
			(setq pnt-ins (getpoint "\nУкажите точку вставки\n"));setq
			
			(cond 
				((and (= str-tmp-6 "монтаж на контактор") (= str-tmp-5 "LC1 D09...D38"))
					(setq str-txt "Комплект для монтажа реле LR97D на контакторе Schneider Electric, артикул LAD 7C1");setq
				);=
				
				((and (= str-tmp-6 "монтаж на контактор") (= str-tmp-5 "LC1 D25...D38"))					
					(setq str-txt "Комплект для монтажа реле LR97D на контакторе Schneider Electric, артикул LAD 7C2");setq
				);=
				
				((= str-tmp-6 "монтаж на DIN-рейку")
					(setq str-txt "Комплект для монтажа реле LR97D на DIN-рейке Schneider Electric, артикул LAD 7B106");setq
				);=
			);cond

			(split-str-parts-le-110-01 str-txt pnt-ins)
		);progn	
	);if = str-00

	(setq cntr-1 (1+ cntr-1));setq
);repeat

(princ)
)
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в спцф                   //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun spcf-101-04-relay-overload-schneider-electric

( / cntr-1 dlt-y nmbr-ln pnt-ins str-0 str-1 str-2 str-3 str-4 str-5 str-6 str-61 str-62 str-99 str-tmp x-pnt-ins y-pnt-ins y-pnt-ins-1)

(setq cntr-1 0);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-0 (cdr (assoc 0 str-tmp))
	);setq
	
	(setvar "osmode" 6199)
	
	(setq pnt-ins		(getpoint "\nУкажите точку вставки\n")
	  		x-pnt-ins (nth 0 pnt-ins)
	 			y-pnt-ins (nth 1 pnt-ins)
	  		y-pnt-ins-1 y-pnt-ins
	  		dlt-y 8
	);setq
	
	(101-empt-lin-spcf)

	;;;;////////////////////////////////////////////////////////////////////////
	(if (= str-0 "LR97")
		(progn
			(setq str-1 (cdr (assoc 1 str-tmp))
						str-2 (cdr (assoc 2 str-tmp))
						str-3 (cdr (assoc 3 str-tmp))
						str-4 (cdr (assoc 4 str-tmp))
						str-5 (cdr (assoc 5 str-tmp))
						str-6 (cdr (assoc 6 str-tmp))
						str-99 (cdr (assoc 99 str-tmp))
						nmbr-ln 4
			);setq
			
			(1000-delete-items-spcf nmbr-ln x-pnt-ins y-pnt-ins)

			(cond
				((= str-6 "Контактор") (setq str-6 "монтаж на контактор"));=
				((= str-6 "DIN-рейка") (setq str-6 "монтаж на DIN-рейку"));=
			);cond
			
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Реле перегрузки по току")
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "- диапазон уставок " str-1 "А, Uупр. " str-4 "В"))
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 (strcat "- применение с контакторами " str-5 ", " str-6))
			
			(command "_TEXT" "_MC" (list (+ x-pnt-ins 160) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 str-2) ;Тип, марка, обозначение документа, опросного листа
			
			(command "_text" "_MC" (list (+ x-pnt-ins 247.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "\"Schneider Electric\",")
			(command "_text" "_MC" (list (+ x-pnt-ins 247.5) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 "г. Москва")
			
			(command "_text" "_MC" (list (+ x-pnt-ins 280) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "шт.")
	
			(command "_text" "_MC" (list (+ x-pnt-ins 322.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 str-99)
			
			(repeat nmbr-ln
  			(command "_insert" "зс-пустая-строка" "_X" 1 "_Y" 1 "_Z" 1 "_R" 0 (list x-pnt-ins y-pnt-ins-1))
  			(setq y-pnt-ins-1 (- y-pnt-ins-1 8));setq
			);repeat
			
			(setvar "osmode" 6199)
			
			(setq pnt-ins (getpoint "\nУкажите точку вставки\n")
						x-pnt-ins (nth 0 pnt-ins)
	 					y-pnt-ins (nth 1 pnt-ins)
 						str-99 "0,1"
 						nmbr-ln 3
			);setq
			
			(setvar "osmode" 0)
			
			(1000-delete-items-spcf nmbr-ln x-pnt-ins y-pnt-ins)
			
			(if (and (= str-6 "монтаж на контактор") (= str-5 "LC1 D09...D38"))
				(setq str-61 (strcat "- монтаж на контакторе типа " str-5)
							str-62 "LAD 7C1"
				);setq
			);if

			(if (and (= str-6 "монтаж на контактор") (= str-5 "LC1 D25...D38"))
				(setq str-61 (strcat "- монтаж на контакторе типа " str-5)
							str-62 "LAD 7C2"
				);setq
			);if
			
			(if (= str-6 "монтаж на DIN-рейку")
				(setq str-61 "- монтаж на DIN-рейке"
							str-62 "LAD 7B106"
				);setq
			);if
			
			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Комплект для монтажа реле LR97D")
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 str-61)
			(command "_text" "_MC" (list (+ x-pnt-ins 160) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 str-62)
		);progn	
	);if = str-00
								
	(command "_text" "_MC" (list (+ x-pnt-ins 247.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "\"Schneider Electric\",")
	(command "_text" "_MC" (list (+ x-pnt-ins 247.5) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 "г. Москва")
			
	(command "_text" "_MC" (list (+ x-pnt-ins 280) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "шт.")
	
	(command "_text" "_MC" (list (+ x-pnt-ins 322.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 str-99)
 
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

;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в овш               ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun lecgv-101-04-relay-overload-schneider-electric

( / cntr-1 dlt-y nmbr-ln pnt-ins str-tmp str-tmp-0 str-tmp-1 str-tmp-2 str-tmp-3 str-tmp-4 str-tmp-5 str-tmp-6 str-tmp-99 x-pnt-ins y-pnt-ins y-pnt-ins-1)

(setq cntr-1 0);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-tmp-0 (cdr (assoc 0 str-tmp))
	);setq
	
	(setvar "osmode" 6199)
	
	(setq pnt-ins		(getpoint "\nУкажите точку вставки\n")
	  		x-pnt-ins (nth 0 pnt-ins)
	 			y-pnt-ins (nth 1 pnt-ins)
	  		y-pnt-ins-1 y-pnt-ins
	  		dlt-y 8
	);setq
	
	(09-empt-lin-le-cgv)

	;обработка данных	
	;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	(if (= str-tmp-0 "LR97")
		(progn
			(setq str-tmp-1 (cdr (assoc 1 str-tmp))
						str-tmp-2 (cdr (assoc 2 str-tmp))
						str-tmp-3 (cdr (assoc 3 str-tmp))
						str-tmp-4 (cdr (assoc 4 str-tmp))
						str-tmp-5 (cdr (assoc 5 str-tmp))
						str-tmp-6 (cdr (assoc 6 str-tmp))
						str-tmp-99 (cdr (assoc 99 str-tmp))
			);setq
			
			(cond
				((= str-tmp-6 "Контактор") (setq str-tmp-6 "монтаж на контактор"));=
				((= str-tmp-6 "DIN-рейка") (setq str-tmp-6 "монтаж на DIN-рейку"));=
			);cond
			
			(setq str-txt (strcat "Реле перегрузки по току Schneider Electric, артикул " str-tmp-2 ", диапазон уставок " str-tmp-1 "А, Uупр. " str-tmp-4 "В, " str-tmp-6));setq
			
			(split-str-parts-lecgv-65-01 str-txt pnt-ins)
			
			(command "_TEXT" "_MC" (list (+ x-pnt-ins 142.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 str-tmp-99)

			(setvar "osmode" 6199)
			
			(setq pnt-ins		(getpoint "\nУкажите точку вставки\n")
  					x-pnt-ins (nth 0 pnt-ins)
 						y-pnt-ins (nth 1 pnt-ins)
			);setq
			
			(setvar "osmode" 0)
			
			(cond
				((and (= str-tmp-6 "монтаж на контактор") (= str-tmp-5 "LC1 D09...D38"))		
					(setq str-txt "Комплект для монтажа реле LR97D на контакторе Schneider Electric, артикул LAD 7C1");setq
				);=

				((and (= str-tmp-6 "монтаж на контактор") (= str-tmp-5 "LC1 D25...D38"))
					(setq str-txt "Комплект для монтажа реле LR97D на контакторе Schneider Electric, артикул LAD 7C2");setq
				);=

				((= str-tmp-6 "монтаж на DIN-рейку")
					(setq str-txt "Комплект для монтажа реле LR97D на DIN-рейке Schneider Electric, артикул LAD 7B106");setq
				);=
			);cond
						
			(split-str-parts-lecgv-65-01 str-txt pnt-ins)
			
			(command "_TEXT" "_MC" (list (+ x-pnt-ins 142.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "0,09")
		);progn	
	);if = str-00

	(setq cntr-1 (+ cntr-1 1));setq
);repeat

(princ)
)
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////