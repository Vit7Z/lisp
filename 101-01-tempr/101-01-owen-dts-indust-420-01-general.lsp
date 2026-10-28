;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////                                                              ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun 101-01-owen-dts-indust-420-01-general

( / adoc dcl-id list-01 list-01-read-file list-02 list-02-read-file list-03 list-04 list-05 list-06 list-21 list-22 list-23 list-24 list-25 list-26 list-27 list-801 
list-900 list-91 list-92 list-99 str-01 str-21 str-22 type-list)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(read-file-for-dialog-box-01 "101-01-owen-dts-indust-420-01-general.txt" 2)

(setq list-01 list-01-read-file
			list-801 list-02-read-file
      list-91 nil
      list-92 nil      
      str-01 "0"
);setq

(tmp-101-01-owen-dts-indust-420-01-general)

;для гильзы
(setq list-21 (list "16 МПа" "25 МПа")
			list-22 (list "М20х1,5" "М27х2" "G1/2")
			str-21 nil
			str-22 nil
);setq

(tmp-02-101-01-owen-dts-indust-420-01-general)

(if (< (setq dcl-id (load_dialog "dia-101-01-owen-dts-indust-420-01-general.dcl")) 0) ;ищем диалог
		(progn
			(alert "Не найден dcl-файл")
			(exit)
		);progn
);if

(if (not (new_dialog "dia_101_temp_sensor_owen_02" dcl-id))
		(exit)
);if

(list-filling "txt-01" list-01)
(list-filling "txt-02" list-02)
(list-filling "txt-03" list-03)
(list-filling "txt-04" list-04)
(list-filling "txt-05" list-05)
(list-filling "txt-06" list-06)
(list-filling "txt-99" list-99)
(list-filling "txt-900" list-900)

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
(set_tile "txt-99" "0")

(set_tile "txt-21" "0")
(set_tile "txt-22" "0")
(set_tile "txt-23" "0")
(set_tile "txt-24" "0")
(set_tile "txt-25" "0")
(set_tile "txt-26" "0")
(set_tile "txt-27" "0")

(action_tile "txt-01"
  (strcat "(tmp-101-01-owen-dts-indust-420-01-general)"
  				"(set_tile \"tgl-01\" \"0\")"
  				
  				"(mode_tile \"txt-02\" 0)"
  				"(mode_tile \"txt-03\" 0)"
  				"(mode_tile \"txt-04\" 0)"
  				"(mode_tile \"txt-05\" 0)"
  				"(mode_tile \"txt-06\" 0)"
  				"(mode_tile \"txt-99\" 0)"

  				"(mode_tile \"txt-21\" 1)"
  				"(mode_tile \"txt-22\" 1)"
  				"(mode_tile \"txt-23\" 1)"
  				"(mode_tile \"txt-24\" 1)"
  				"(mode_tile \"txt-25\" 1)"
  				"(mode_tile \"txt-26\" 1)"
  				"(mode_tile \"txt-27\" 1)"
  );srcat
);action_tile

(action_tile "txt-04"
  (strcat "(txt-04-101-01-owen-dts-indust-420-01-general)");srcat
);action_tile

(action_tile "txt-04"
  (strcat "(set_tile \"txt-04\" $value)"
  				"(set_tile \"txt-99\" $value)"
  );srcat
);action_tile


(action_tile "tgl-01"
  (strcat "(tgl-01-101-01-owen-dts-indust-420-01-general)");srcat
);action_tile

(action_tile "txt-21"
  (strcat "(tmp-02-101-01-owen-dts-indust-420-01-general)");srcat
);action_tile

(action_tile "txt-22"
  (strcat "(tmp-02-101-01-owen-dts-indust-420-01-general)");srcat
);action_tile

(action_tile "txt-23"
  (strcat "(set_tile \"txt-23\" $value)"
  				"(set_tile \"txt-24\" $value)"
  );srcat
);action_tile

(action_tile "txt-25"
  (strcat "(set_tile \"txt-25\" $value)"
  				"(set_tile \"txt-26\" $value)"
  );srcat
);action_tile

(action_tile "but1"
  (strcat "(select-101-01-owen-dts-indust-420-01-general)");strcat
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

(if (= type-list "le") (tmp-le-101-01-owen-dts-indust-420-01-general));if

(if (= type-list "spcf") (tmp-spcf-101-01-owen-dts-indust-420-01-general));if

(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(vla-endundomark adoc)
(gc)
(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// конец программы ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun tmp-101-01-owen-dts-indust-420-01-general

(/ list-900-dscr list-902-read-file name-file-1)

(setq name-file-1 (nth (atoi str-01) list-801));setq

(read-file-for-dialog-box-02 name-file-1);

(setq list-02 (cdr (nth 0 list-902-read-file))
			list-03 (cdr (nth 1 list-902-read-file))
			list-04 (cdr (nth 2 list-902-read-file))
			list-05 (cdr (nth 3 list-902-read-file))
			list-06 (cdr (nth 4 list-902-read-file))
			list-99 (cdr (nth 5 list-902-read-file))
			
			list-900 list-900-dscr
);setq

(list-filling "txt-02" list-02)
(list-filling "txt-03" list-03)
(list-filling "txt-04" list-04)
(list-filling "txt-05" list-05)
(list-filling "txt-06" list-06)
(list-filling "txt-99" list-99)
(list-filling "txt-900" list-900)

(set_tile "txt-02" "0")
(set_tile "txt-03" "0")
(set_tile "txt-04" "0")
(set_tile "txt-05" "0")
(set_tile "txt-06" "0")
(set_tile "txt-99" "0")

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun tmp-02-101-01-owen-dts-indust-420-01-general

( / list-902-read-file name-file-1)

(if (= nil str-21) 
	(setq str-21 (nth 0 list-21));setq
	(setq str-21 (nth (atoi (get_tile "txt-21")) list-21));setq
);if

(if (= nil str-22) 
	(setq str-22 (nth 0 list-22));setq
	(setq str-22 (nth (atoi (get_tile "txt-22")) list-22));setq
);if

(cond
	((and (= "16 МПа" str-21) (= "М20х1,5" str-22)) (setq name-file-1 "101-08-sleeve-prtct-owen-gz-161.txt"))
	((and (= "16 МПа" str-21) (= "М27х2" str-22)) (setq name-file-1 "101-08-sleeve-prtct-owen-gz-162.txt"))
	((and (= "16 МПа" str-21) (= "G1/2" str-22)) (setq name-file-1 "101-08-sleeve-prtct-owen-gz-163.txt"))

	((and (= "25 МПа" str-21) (= "М20х1,5" str-22)) (setq name-file-1 "101-08-sleeve-prtct-owen-gz-251.txt"))
	((and (= "25 МПа" str-21) (= "М27х2" str-22)) (setq name-file-1 "101-08-sleeve-prtct-owen-gz-252.txt"))
	((and (= "25 МПа" str-21) (= "G1/2" str-22)) (setq name-file-1 "101-08-sleeve-prtct-owen-gz-253.txt"))
);cond

(read-file-for-dialog-box-02 name-file-1);

(setq list-23 (cdr (nth 0 list-902-read-file))
			list-24 (cdr (nth 1 list-902-read-file))
			list-25 (cdr (nth 2 list-902-read-file))
			list-26 (cdr (nth 3 list-902-read-file))
			list-27 (cdr (nth 4 list-902-read-file))
);setq

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


;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun tgl-01-101-01-owen-dts-indust-420-01-general

( / tgl-01)

(setq tgl-01 (get_tile "tgl-01"));setq

(if (= tgl-01 "1")
  (progn 
  	(mode_tile "txt-01" 1)
  	(mode_tile "txt-02" 1)
  	(mode_tile "txt-03" 1)
  	(mode_tile "txt-04" 1)
  	(mode_tile "txt-05" 1)
  	(mode_tile "txt-06" 1)
  	(mode_tile "txt-99" 1)

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
  	(mode_tile "txt-01" 0)
  	(mode_tile "txt-02" 0)
  	(mode_tile "txt-03" 0)
  	(mode_tile "txt-04" 0)
  	(mode_tile "txt-05" 0)
  	(mode_tile "txt-06" 0)
		(mode_tile "txt-99" 0)
		
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
;;;;подпрограмма формирования данных/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun select-101-01-owen-dts-indust-420-01-general

( / str-01 str-02 str-02-01 str-03 str-04 str-05 str-05-01 str-06 str-06-01 str-06-02 str-21 str-22 str-23 str-24 str-25 str-26 str-92 str-99 tgl-01)

(setq tgl-01 (get_tile "tgl-01"));setq

(if (/= list-91 nil) 
	(setq list-91 (reverse list-91)
				list-92 (reverse list-92)
	);setq
);if


;;;;;;;/////////////////////////////////////////////////////////////////////////////////////////////
(if (= tgl-01 "0")
	(progn
		(setq str-01 (nth (atoi (get_tile "txt-01")) list-01)
					str-02 (nth (atoi (get_tile "txt-02")) list-02)
					str-03 (nth (atoi (get_tile "txt-03")) list-03)
					str-04 (nth (atoi (get_tile "txt-04")) list-04)
					str-05 (nth (atoi (get_tile "txt-05")) list-05)
					str-06 (nth (atoi (get_tile "txt-06")) list-06)
					str-99 (nth (atoi (get_tile "txt-99")) list-99)

					str-02 (vl-string-subst "" "*" str-02)
					str-05 (vl-string-subst "" "*" str-05)
					str-06-01 (substr str-06 1 (vl-string-search " " str-06))
					str-06-02 (substr str-06 (+ (vl-string-search " " str-06) 4))
		);setq
		
		(cond
			((= "PT100" str-02) (setq str-02-01 "Pt100"));=
		);cond
		
		(cond
			((= "Пластмассовая" str-05) (setq str-05-01 ""));=
			((= "Металлическая" str-05) (setq str-05-01 ".МГ"));=
		);cond

		(setq str-01 (strcat str-01 "-" str-02 "." str-03 "." str-04 str-05-01 ".И[" str-06-01 "]")
					
					str-92 (list (cons 1 str-01) 
											 (cons 2 (strcat "НСХ " str-02-01))
											 (cons 3 (strcat "класс точн. " str-03))
											 (cons 4 (strcat "Lпогр. " str-04 "мм"))
											 (cons 5 (strcat "пределы изм. " str-06-02 "°С")) 
											 (cons 6 "вых. сигнал 4..20мА")									 
											 (cons 99 str-99)
								 );str-92
							
					list-91 (vl-list* (strcat str-01 "  НСХ " str-02-01 "  Класс точн. " str-03 "%  Lпогр. " str-04 "мм  " str-06-02 "°С") list-91)
		);setq
	);progn
);if


;;;;;;;/////////////////////////////////////////////////////////////////////////////////////////////
(if (= tgl-01 "1")
	(progn
		(setq str-21 (nth (atoi (get_tile "txt-21")) list-21)
					str-22 (nth (atoi (get_tile "txt-22")) list-22)
					str-23 (nth (atoi (get_tile "txt-23")) list-23)
					str-24 (nth (atoi (get_tile "txt-24")) list-24)
					str-25 (nth (atoi (get_tile "txt-25")) list-25)
					str-26 (nth (atoi (get_tile "txt-26")) list-26)					
					str-24 (strcat str-24 "." str-25)
		);setq

		(setq str-92 (list (cons 1 str-24) (cons 2 str-22) (cons 3 str-23) (cons 4 str-25) (cons 5 str-21) (cons 99 str-26))
					list-91 (vl-list* (strcat "Гильза " str-24 "  К бобышке " str-22 "  К пибору " str-23 "  Длина " str-25 "мм  " str-21) list-91)
		);setq
	);progn
);if

(setq list-92 (vl-list* str-92 list-92)
			list-91 (reverse list-91)
			list-92 (reverse list-92)
);setq

(list-filling "txt-91" list-91)

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в ПЭ                   //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun tmp-le-101-01-owen-dts-indust-420-01-general

( / cntr-1 pnt-ins str-01 str-04 str-05 str-06 str-21 str-22 str-23 str-24 str-25 str-701 str-702 str-tmp)

(setq cntr-1 0);setq

(repeat (length list-92)
	(setq str-tmp (nth cntr-1 list-92)
				str-01 (cdr (assoc 1 str-tmp))
	);setq

	(setvar "osmode" 6199)
	
	(setq pnt-ins (getpoint "\nУкажите точку вставки\n"));setq
	
	;;;;;;;///////////////////////////////////////////////////////////////////////////////////////////
	(if (wcmatch str-01 "ДТС*")
		(setq str-04 (cdr (assoc 4 str-tmp))
					str-05 (cdr (assoc 5 str-tmp))
					str-06 (cdr (assoc 6 str-tmp))
			
					str-701 (strcat "Датчик температуры ОВЕН " str-01 ", " str-05 ", " str-04 ", " str-06)
					str-702 nil
		);setq
	);if
		
	;;;;;;;///////////////////////////////////////////////////////////////////////////////////////////
	(if (wcmatch str-01 "ГЗ.*" )
		(setq str-21 (cdr (assoc 1 str-tmp))
					str-22 (cdr (assoc 2 str-tmp))
					str-23 (cdr (assoc 3 str-tmp))
					str-24 (cdr (assoc 4 str-tmp))
					str-25 (cdr (assoc 5 str-tmp))

					str-701 (strcat "Гильза защитная ОВЕН " str-21 ", резьба внеш. " str-22 ", резьба внутр. " str-23 ", длина " str-24 "мм, давление до " str-25)
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

(defun tmp-spcf-101-01-owen-dts-indust-420-01-general

( / cntr-1 pnt-ins str-01 str-02 str-03 str-04 str-05 str-06 str-07 str-08 str-09 str-11 str-701 str-702 str-99 str-crtf str-manufact str-order str-tmp str-unit)

(setq cntr-1 0);setq

(setvar "textstyle" "Standard")

(repeat (length list-92)
	(setq str-tmp (nth cntr-1 list-92)
				str-01 (cdr (assoc 1 str-tmp))
				str-02 (cdr (assoc 2 str-tmp))
				str-03 (cdr (assoc 3 str-tmp))
				str-04 (cdr (assoc 4 str-tmp))
				str-05 (cdr (assoc 5 str-tmp))
				str-99 (cdr (assoc 99 str-tmp))
	);setq

	(setvar "osmode" 6199)
	
	(setq pnt-ins (getpoint "\nУкажите точку вставки\n"));setq
			
	;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	(if (wcmatch str-01 "ДТС*")
		(progn
			(setq str-06 (cdr (assoc 6 str-tmp)));setq

			(setq str-701 "Датчик температуры"
			
						str-702 (list (cons 1 str-02)
													(cons 2 str-03)
													(cons 3 str-04)													
													(cons 4 str-05)
													(cons 5 str-06)																									
										);list
						
						str-order (list (cons 1 str-01) 
														(cons 2 ".")
														(cons 3 nil))			
						str-crtf "Свидетельство об утв. СИ № 39452/1"																			
			);setq
		);progn
	);if

	;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	(if (wcmatch str-01 "ГЗ.*" )
		(setq str-701 "Гильза защитная"
			
					str-702 (list (cons 1 (strcat "резьба внеш. " str-02))													
												(cons 2 (strcat "резьба внутр. " str-03))
												(cons 3 (strcat "длина монтажной части " str-04 "мм"))	
												(cons 4 (strcat "на давление до " str-05))											
												(cons 5 "сталь 12X18H10T"));list
						
					str-order (list (cons 1 str-01) 
													(cons 2 ".")
													(cons 3 nil))
					str-crtf nil
		);setq
	);if

	(setq str-manufact "ОВЕН, г. Москва"
				str-unit "шт."			
	);setq
		
	(split-str-parts-spcf-01-general str-701 str-702 str-order str-manufact str-unit str-99 str-crtf pnt-ins)
 
	(setq cntr-1 (+ cntr-1 1));setq
);repeat

(princ)
)
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



