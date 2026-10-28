;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////                                                              ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun 101-01-press-sens-wika-general-1

( / adoc dcl-id list-01 list-02 list-03 list-04 list-05 list-06 list-07 list-901 list-902 str-01 type-list)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(setvar "cmdecho" 0)
(setvar "textstyle" "Standard")

(setq list-01 (list "OT-1")

      list-901 nil
      list-902 nil
      
      str-01 nil
);setq

(txt-01-101-01-press-sens-wika-general-1)

(if (< (setq dcl-id (load_dialog "dia-101-01-press-sens-wika-general-1.dcl")) 0) ;ищем диалог
		(progn
			(alert "Не найден dcl-файл")
			(exit)
		);progn
);if

(if (not (new_dialog "dia_101_01_press_sens_wika_general_1" dcl-id))
		(exit)
);if

(list-filling "txt-01" list-01)
(list-filling "txt-02" list-02)
(list-filling "txt-03" list-03)
(list-filling "txt-04" list-04)
(list-filling "txt-05" list-05)
(list-filling "txt-06" list-06)
(list-filling "txt-07" list-07)

(set_tile "txt-01" "0")
(set_tile "txt-02" "0")
(set_tile "txt-03" "0")
(set_tile "txt-04" "0")
(set_tile "txt-05" "0")
(set_tile "txt-06" "0")
(set_tile "txt-07" "0")

(action_tile "txt-01"
  (strcat "(txt-01-101-01-press-sens-wika-general-1)");strcat
);action-tile

(action_tile "txt-02"
  (strcat "(set_tile \"txt-02\" $value)"
					"(set_tile \"txt-03\" $value)"
					"(set_tile \"txt-04\" $value)"
					"(set_tile \"txt-05\" $value)"
					"(set_tile \"txt-06\" $value)"
					"(set_tile \"txt-07\" $value)"
	);strcat
);action-tile

(action_tile "but1"
  (strcat "(but1-101-01-press-sens-wika-general-1)");srcat
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

(if (= type-list "le") (le-101-01-press-sens-wika-general-1));if

(if (= type-list "spcf") (spcf-101-01-press-sens-wika-general-1));if

(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(vla-endundomark adoc)
(princ)
)
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun txt-01-101-01-press-sens-wika-general-1

( / list-01-read-file list-02-read-file list-03-read-file list-04-read-file list-05-read-file list-06-read-file)

(if (= nil str-01) 
	(setq str-01 (nth 0 list-01))
	(setq str-01 (nth (atoi (get_tile "txt-01")) list-01));setq
);if

(if (= "OT-1" str-01)
	(progn
		(read-file-for-dialog-box "101-01-press-sens-wika-ot-1.txt" 6)
	);progn
);if

(setq list-02 list-01-read-file
			list-03 list-02-read-file
			list-04 list-03-read-file
			list-05 list-04-read-file
			list-06 list-05-read-file
			list-07 list-06-read-file
);setq



(list-filling "txt-02" list-02)
(list-filling "txt-03" list-03)
(list-filling "txt-04" list-04)
(list-filling "txt-05" list-05)
(list-filling "txt-06" list-06)
(list-filling "txt-07" list-07)

(set_tile "txt-02" "0")
(set_tile "txt-03" "0")
(set_tile "txt-04" "0")
(set_tile "txt-05" "0")
(set_tile "txt-06" "0")
(set_tile "txt-07" "0")


(princ)
)
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма формирования данных///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun but1-101-01-press-sens-wika-general-1

( / str-01 str-02 str-02-01 str-03 str-04 str-05 str-06 str-07 swtch tmp-list-902)

(setq swtch list-901);setq

(if (/= swtch nil) (setq list-902 (reverse list-902)));if

;считываем значения из полей диалога
(setq str-01 (nth (atoi (get_tile "txt-01")) list-01));setq

;;;;;;;/////////////////////////////////////////////////////////////////////////////////////////////
(if (= "OT-1" str-01)
	(progn
		(setq str-02 (nth (atoi (get_tile "txt-02")) list-02)
					str-02-01 (substr str-02 1 (vl-string-search " " str-02))
					
					str-03 (nth (atoi (get_tile "txt-03")) list-03)
					str-04 (nth (atoi (get_tile "txt-04")) list-04)
					str-05 (nth (atoi (get_tile "txt-05")) list-05)
					str-06 (nth (atoi (get_tile "txt-06")) list-06)	
					str-07 (nth (atoi (get_tile "txt-07")) list-07)
		
					list-901 (vl-list* (strcat str-01 "   " str-02-01 "МПа   " str-03 "   " str-04 "   " str-05 "   Индикация " str-06 "   Артикул " str-07) list-901)
					tmp-list-902 (list (cons 1 str-01) (cons 2 str-02) (cons 3 str-03) (cons 4 str-04) (cons 5 str-05) (cons 6 str-06) (cons 7 str-07) (cons 99 "0,5"));list
		);setq
	);progn
);if




(setq list-902 (vl-list* tmp-list-902 list-902)
			list-902 (reverse list-902)
);setq

(list-filling "txt-901" (reverse list-901))

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в ПЭ                   //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun le-101-01-press-sens-wika-general-1

( / cntr-1 dlt-y nmbr-ln pnt-ins str-01 str-02 str-02-01 str-02-02 str-03 str-04 str-05 str-06 str-07 str-99 str-tmp str-txt str-txt-01 x-pnt-ins y-pnt-ins y-pnt-ins-1)

(setq cntr-1 0);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-01 (cdr (assoc 1 str-tmp))
				str-02 (cdr (assoc 2 str-tmp))
				str-03 (cdr (assoc 3 str-tmp))						
				str-04 (cdr (assoc 4 str-tmp))					
				str-07 (cdr (assoc 7 str-tmp))
	);setq

	(setvar "osmode" 6199)
	
	(setq pnt-ins		(getpoint "\nУкажите точку вставки\n"));setq

	;;;;;/////////////////////////////////////////////////////////////////////////////////////////////
	(if (= "OT-1" str-01)
		(setq str-02-01 (substr str-02 1 (vl-string-search " " str-02))
					str-txt (strcat "Датчик давления WIKA OT-1, артикул " str-07 ", пределы измерений " str-02-01 "МПа, выходной сигнал " str-03 ", присоединение "
													"к процессу " str-04)
					str-txt-01 nil	
		);setq
	);if
	
	(split-str-parts-le-110-01 str-txt str-txt-01 pnt-ins)
	
	(setq cntr-1 (1+ cntr-1));setq
);repeat

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в СПЦФ                 //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun spcf-101-01-press-sens-wika-general-1

( / cntr-1 dlt-y nmbr-ln pnt-ins str-01 str-02 str-02-01 str-02-02 str-03 str-04 str-05 str-06 str-07 str-99 str-tmp x-pnt-ins y-pnt-ins y-pnt-ins-1)

(setq cntr-1 0);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-01 (cdr (assoc 1 str-tmp))
				str-99 (cdr (assoc 99 str-tmp))
	);setq
     
;(princ "\n         str-tmp = ") (princ str-tmp);Erase-DV
;(getstring "\nPress Enter to continue...");Erase-DV
		
	(setvar "osmode" 6199)
	(setq pnt-ins		(getpoint "\nУкажите точку вставки\n")
				x-pnt-ins (nth 0 pnt-ins)
				y-pnt-ins (nth 1 pnt-ins)
				y-pnt-ins-1 y-pnt-ins
				dlt-y 8
	);setq

	(101-empt-lin-spcf)

	;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	(if (= str-01 "OT-1")
		(progn
			(setq str-02 (cdr (assoc 2 str-tmp))
						str-02-01 (substr str-02 1 (vl-string-search " " str-02))
						str-02-02 (vl-string-subst " бар)" ")" (substr str-02 (+ (vl-string-search " " str-02) 1)))
						
						str-03 (cdr (assoc 3 str-tmp))						
						str-04 (cdr (assoc 4 str-tmp))	
						str-05 (vl-string-subst "р" "Р" (cdr (assoc 5 str-tmp)))
						str-06 (cdr (assoc 6 str-tmp))				
						str-07 (cdr (assoc 7 str-tmp))
						nmbr-ln 6
			);setq

			(1000-delete-items-spcf nmbr-ln pnt-ins)
			(1000-delete-items-spcf-crtf nmbr-ln pnt-ins)

			(cond
				((= str-04 "G1/4 А") (setq str-04 (strcat str-04 " (наружн.)")));=
			);cond
			
			
			

			(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "Преобразователь давления")
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "- переделы измерений " str-02-01 "МПа " str-02-02 ", вых. сигнал " str-03))
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 (strcat "- присоединение к процессу " str-04))
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 3)) 4)) 2.5 0 (strcat "- присоединение кабеля " str-05))
			(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 4)) 4)) 2.5 0 (strcat "- индикация " (strcase str-06 1)))
			;
			(command "_text" "_MC" (list (+ x-pnt-ins 160) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 (strcat str-01 ", артикул " str-07))
			;
			(print-number-certificate "№ 34121" pnt-ins)
		);progn
	);if
	
	(command "_text" "_MC" (list (+ x-pnt-ins 247.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "WIKA")
	
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
